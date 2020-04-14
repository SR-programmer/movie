from rest_framework import serializers
from . import models
from django.core.cache import cache
import re
# from rest_framework_jwt.utils import jwt_create_payload, jwt_encode_payload
from rest_framework_jwt.serializers import jwt_payload_handler,jwt_encode_handler
import datetime


class UserModelSerializer(serializers.ModelSerializer):
    code = serializers.CharField(write_only=True, max_length=4, min_length=4, required=True)

    class Meta:
        model = models.User
        fields = ('username', 'password', 'mobile', 'code', 'pk')
        extra_kwargs = {
            'password': {
                'max_length': 12,
                'min_length': 6,
                'write_only': True
            }
        }

    def validate_mobile(self, value):
        if not value or not re.match('^1[3-9]\d{9}$', value):
            raise serializers.ValidationError('手机号不合法')
        return value

    def validate(self, attrs):
        code = attrs.pop('code')
        mobile = attrs.get('mobile')
        cache_code = cache.get('mobile_%s' % mobile)
        if code != cache_code:
            raise serializers.ValidationError({'code': '验证码错误'})
        cache.set('mobile_%s' % mobile, '', 0)
        try:
            user_obj = models.User.objects.get(mobile=mobile)
            raise serializers.ValidationError({'mobile': '手机号已被注册'})
        except:
            pass
        return attrs

    def create(self, validated_data):
        return models.User.objects.create_user(**validated_data)


class LoginModelSerializer(serializers.ModelSerializer):
    username = serializers.CharField(error_messages={'required': '用户名不能为空'})
    class Meta:

        model = models.User
        fields = ('username', 'password')
        extra_kwargs = {
            'password': {
                'error_messages': {
                    'required': '密码不能为空'
                }
            },
        }

    def validate(self, attrs):
        username = attrs.get('username')
        if re.match(r'^1[3-9]\d{9}$', username):
            self.user_obj = models.User.objects.filter(mobile=username).first()
        else:
            self.user_obj = models.User.objects.filter(username=username).first()
        if not self.user_obj:
            raise serializers.ValidationError({'username': '用户名不存在'})
        is_sure = self.user_obj.check_password(attrs.get('password'))
        if not is_sure:
            raise serializers.ValidationError({'password': '密码错误'})
        payload = jwt_create_payload(self.user_obj)
        self.token = jwt_encode_payload(payload)

        return attrs


class MobileLoginModelSerializer(serializers.ModelSerializer):
    code = serializers.CharField(max_length=4, min_length=4, required=True)
    mobile = serializers.CharField()
    class Meta:
        model = models.User
        fields = ('mobile', 'code')

    def validate_mobile(self, value):
        if not value or not re.match('^1[3-9]\d{9}$', value):
            raise serializers.ValidationError('手机号不合法')
        self.user_obj = models.User.objects.filter(mobile=value).first()
        if not self.user_obj:
            raise serializers.ValidationError({'mobile': '该手机号尚未注册'})
        return value

    def validate(self, attrs):
        mobile = attrs.get('mobile')
        code = cache.get('mobile_%s' % mobile)
        send_code = attrs.get('code')
        if not code == send_code:
            raise serializers.ValidationError({'code': '验证码错误'})
        cache.set('mobile_%s' % mobile, '', 0)
        return attrs


class MovieCommentsModelSerializer(serializers.ModelSerializer):
    user = serializers.CharField(source='user.username')
    movie = serializers.CharField(source='movie.name')

    class Meta:
        model = models.Comment
        fields = ['user', 'movie', 'create_time', 'hot', 'pk', 'content']


class UserInfoModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.User
        fields = ['is_vip', 'vip_exp', 'vip_level', 'avatar', 'username', 'get_gender', 'birthday', 'introduction', 'username']


class RecordModelSerializer(serializers.ModelSerializer):
    movie_img = serializers.ImageField(source='movie.movie_img')

    class Meta:
        model = models.UserRecord
        fields = ['movie', 'movie_img', 'create_time', 'movie_title']


class ProductModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Product
        fields = '__all__'


class ChangeInfoModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.User
        fields = ['username', 'birthday', 'gender', 'introduction']
        extra_kwargs = {
            'username': {
                'max_length': 16,
                'min_length': 4,
                'required': True,
                'error_messages': {
                    'max_length': '用户名最长16位',
                    'min_length': '用户名最短4位',
                    'required': '用户名不能为空'
                }
            }
        }

    def validate_username(self, value):
        if not value or not re.match('^[a-zA-Z0-9]{4,16}$', value):
            raise serializers.ValidationError('用户名不合法')
        query = models.User.objects.filter(username=value)
        if not query:
            return value
        if query.first() == self.instance:
            return value
        else:
            raise serializers.ValidationError('用户名重复')

    # def validate_gender(self, value):
    #     dic = {'男': 1, '女': 2, '未知': 3}
    #     if value not in dic:
    #         raise serializers.ValidationError('你性别有点问题')
    #     return dic.get(value)


