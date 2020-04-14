from utils.response import MyResopnse
from rest_framework.views import APIView
from libs.sms import SendMS
from django.core.cache import cache
from . import models
import re
import time
import hashlib
import random
from .serializery import UserModelSerializer, LoginModelSerializer, MobileLoginModelSerializer, MovieCommentsModelSerializer, UserInfoModelSerializer, RecordModelSerializer, ProductModelSerializer
from .throttle import SMSSimpleRateThrottle
from . import serializery
# from rest_framework_jwt.utils import jwt_create_payload, jwt_encode_payload
from rest_framework_jwt.serializers import jwt_payload_handler,jwt_encode_handler
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from utils.update_movie_list import update_movie_list
from all_resource.models import Movie
from rest_framework.generics import ListAPIView
from utils.pagenations import MyPageNumberPagination
from libs.ipay import alipay, pay_url
from django.conf import settings
from utils.logging import logger
import datetime
from utils.cancel_vip import celery_cancel_vip
from utils.set_cache import set_cache


class SMS(APIView):
    # throttle_classes = [SMSSimpleRateThrottle]

    def post(self, request, *args, **kwargs):
        mobile = request.data.get('mobile')
        sms = SendMS(mobile)

        if not mobile or not re.match('^1[3-9]\d{9}$', mobile):
            return MyResopnse(1, '手机号非法')
        result = sms.send_message()

        if result:
            sms.save_code()
            print(cache.get('mobile_%s' % mobile))
            return MyResopnse(0, 'ok')
        return MyResopnse(1, '验证码发送失败')


class MobileAPIView(APIView):
    def get(self, request, *args, **kwargs):
        mobile = request.query_params.get('mobile')
        if not mobile or not re.match('^1[3-9][0-9]{9}$', mobile):
            return MyResopnse(1, '手机号非法')
        try:
            user_obj = models.User.objects.get(mobile=mobile)
            return MyResopnse(2, '手机号已被注册')
        except:
            return MyResopnse(0, '手机号未被注册')


class RegisterAPIView(APIView):
    def post(self, request, *args, **kwargs):
        request_data = request.data

        mobile = request_data.get('mobile')
        if not mobile or not re.match('^1[3-9]\d{9}$', mobile):
            return MyResopnse(1, '手机号非法')
        request_data['username'] = mobile
        user_ser = UserModelSerializer(data=request_data)
        if not user_ser.is_valid():
            return MyResopnse(1, '注册失败', my_results=user_ser.errors)
        user_obj = user_ser.save()
        return MyResopnse(0, '注册成功', my_results=UserModelSerializer(instance=user_obj).data)


class LoginAPIView(APIView):
    def post(self, request, *args, **kwargs):
        request_data = request.data
        # print(request_data)
        user_ser = LoginModelSerializer(data=request_data)
        user_ser.is_valid(raise_exception=True)
        res = MyResopnse(0, '登录成功!!!', my_results={'token': user_ser.token}, **UserModelSerializer(user_ser.user_obj).data)
        print(res)
        return res


class MobileLogin(APIView):
    def post(self, request, *args, **kwargs):
        request_data = request.data
        user_ser = MobileLoginModelSerializer(data=request_data)
        user_ser.is_valid(raise_exception=True)
        payload = jwt_payload_handler(user_ser.user_obj)
        token = jwt_encode_handler(payload)

        return MyResopnse(0, '登录成功!!!', my_results={'token': token}, **UserModelSerializer(user_ser.user_obj).data)


'''
存放用户点赞点踩信息redis数据库设计

{用户id : {电影id:0或1, 电影id:0或1, 电影id:0或1, 电影id:0或1}, 用户id : {电影id:0或1, 电影id:0或1, 电影id:0或1, 电影id:0或1}}
'''


class UserUpAndDown(APIView):
    authentication_classes = [JSONWebTokenAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        # 用户点赞点踩信息
        is_like = request.data.get('isLike')
        if is_like not in (0, 1):
            return MyResopnse(my_status=1, my_msg='请求参数有误')
        # 电影pk
        movie_pk = request.data.get('movie_pk')
        # 缓存中存放所有用户点赞点踩的信息
        movie_up_down = cache.get('movie_up_down')
        if not movie_up_down:
            # 如果没有用户点赞点踩信息 我们就存放一个空字典
            movie_up_down = {}
            cache.set('movie_up_down', {}, 86400)
        # 获取用户id对应的字典
        user_down_dic = movie_up_down.get(request.user.pk)
        # 获取成功
        if user_down_dic:
            # 获取电影id对应的点赞点踩信息  0或1
            movie_up = user_down_dic.get(movie_pk)
            if movie_up is not None:
                # movie_up不为None说明用户已经对这部电影进行了点赞点踩
                # print(movie_up, type(movie_up))
                response_dic = {1: '你已经点过赞了', 0: '你已经点过踩了'}
                return MyResopnse(my_status=1, my_msg=response_dic.get(movie_up))
            else:
                user_down_dic[movie_pk] = is_like
                movie_up_down[request.user.pk] = user_down_dic
                cache.set('movie_up_down', movie_up_down, 86400)
                # 还要去修改movie_info_list内存数据库
                update_movie_list(movie_pk, is_like)
                response_dic = {1: '点赞成功', 0: '点踩成功'}
                return MyResopnse(my_status=0, my_msg=response_dic.get(is_like))
        # 没有获取到内存中用户id对应的字典
        else:
            user_down_dic = {}
            user_down_dic[movie_pk] = is_like
            print(user_down_dic)
            movie_up_down[request.user.pk] = user_down_dic
            cache.set('movie_up_down', movie_up_down, 86400)
            update_movie_list(movie_pk, is_like)
            response_dic = {1: '点赞成功', 0: '点踩成功'}
            return MyResopnse(my_status=0, my_msg=response_dic.get(is_like))


class OnlineNumber(APIView):
    def post(self, request, *args, **kwargs):
        if request.META.get("HTTP_X_FORWARDED_FOR"):
            host_ip = request.META["HTTP_X_FROWARDED_FOR"]
        else:
            host_ip = request.META["REMOTE_ADDR"]
        online_ips = cache.get('online_ips', [])  # type:list
        cache.set(host_ip, 0, 60)
        if host_ip not in online_ips:
            online_ips.append(host_ip)
        cache.set('online_ips', online_ips, 60)
        return MyResopnse(my_results={'online_number': len(online_ips)})


class ALLComments(APIView):
    def get(self, request, *args, **kwargs):

        movie_pk = request.query_params.get('movie_pk')
        movie_obj = Movie.objects.filter(pk=movie_pk).first()
        if movie_obj is None:
            return Response(data={'msg': '请求资源不存在'}, status=404)
        else:
            comments_obj = models.Comment.objects.filter(movie=movie_obj).order_by('-hot')
        comments_info = MovieCommentsModelSerializer(instance=comments_obj, many=True).data
        return MyResopnse(my_results=comments_info)


class AddComment(APIView):
    authentication_classes = [JSONWebTokenAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        request_data = request.data
        movie_pk = request_data.get('movie_pk')
        movie_obj = Movie.objects.filter(pk=movie_pk)
        if not movie_obj:
            return MyResopnse(status=404, my_msg='评论失败')
        content = request_data.get('content')
        models.Comment.objects.create(user=request.user, movie_id=movie_pk,
                                      content=content)
        movie_info_list = cache.get('movie_info_dic')
        movie_info = movie_info_list.get(str(movie_pk))
        movie_info['comments'] += 1
        cache.set('movie_info_dic', movie_info_list, 86400)
        return MyResopnse(my_msg='评论成功')


class SiteAPIView(APIView):
    authentication_classes = [JSONWebTokenAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        user = request.user
        data = UserInfoModelSerializer(instance=user, context={'request': request}).data
        return MyResopnse(my_results=data)


class WatchRecord(APIView):
    authentication_classes = [JSONWebTokenAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        user = request.user
        movie_pk = request.data.get('movie_pk')
        queryset = cache.get('movie_list')
        if not queryset:
            queryset = set_cache()
        movie_query = queryset.filter(id=movie_pk)
        if not movie_query:
            return MyResopnse(my_status=1, my_msg='不存在')
        movie_query = models.UserRecord.objects.filter(user=user, movie_id=movie_pk)
        if not movie_query:
            models.UserRecord.objects.create(user=user, movie_id=movie_pk)
        else:
            movie_obj = movie_query.first()
            movie_obj.save()
        return MyResopnse(my_msg='ok')


class HistoryAPIView(APIView):
    authentication_classes = [JSONWebTokenAuthentication]
    permission_classes = [IsAuthenticated]
    day7_time = 604800
    day3_time = 259200

    def get(self, request, *args, **kwargs):
        recent_list = []
        before_day3_list = []
        before_day7_list = []
        now_time = int(time.time())
        user = request.user
        record_queryset = models.UserRecord.objects.filter(user=user).order_by('-create_time')

        for obj in record_queryset:
            record_time = obj.create_time

            watch_time = int(time.mktime(record_time.timetuple()))
            if now_time - watch_time < 259200:
                recent_list.append(obj)
            elif now_time - watch_time < 604800:
                before_day3_list.append(obj)
            else:
                before_day7_list.append(obj)
        recent_data = RecordModelSerializer(instance=recent_list, many=True, context={'request': request}).data
        before_day3_data = RecordModelSerializer(instance=before_day3_list, many=True, context={'request': request}).data
        before_day7_data = RecordModelSerializer(instance=before_day7_list, many=True, context={'request': request}).data
        return Response(data={
            'recent_list': recent_data,
            'before_day3_list': before_day3_data,
            'before_day7_list': before_day7_data
        })


class VipProductListAPIView(ListAPIView):
    queryset = models.Product.objects.all()
    serializer_class = ProductModelSerializer


class PayAPIView(APIView):
    authentication_classes = [JSONWebTokenAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        request_data = request.data
        product_id = request_data.get('product')
        pay_app = request_data.get('pay_app')

        if not (product_id and pay_app):
            return MyResopnse(my_msg='缺少参数', http_status=403)
        try:
            product_obj = models.Product.objects.filter(id=product_id).first()
        except:
            return MyResopnse(my_msg='缺少参数', http_status=403)
        order_total = product_obj.real_price
        now_time = str(time.time())
        random_str = 'asdfghjkqwertyuopmbnvxczx'
        Additional_fee = ''.join(random.sample(random_str, 4))
        md5 = hashlib.md5()
        md5.update((now_time+Additional_fee).encode('utf8'))
        order_id = md5.hexdigest()
        try:
            models.Order.objects.create(order_id=order_id, order_total=order_total, pay_app=pay_app, user=request.user, product=product_obj)
        except:
            return MyResopnse(my_msg='订单创建失败', my_status=1)

        order_string = alipay.api_alipay_trade_page_pay(
            out_trade_no=order_id,
            total_amount=str(product_obj.real_price),
            subject=product_obj.name,
            return_url=settings.RETURN_URL,
            notify_url=settings.NOTIFY_URL
        )
        order_url = pay_url + order_string
        return MyResopnse(order_url=order_url)


# 支付成功的回调不需要登录认证 - 支付宝回调不会携带jwt-token，但是支付回调参数需要自己做校验
class SuccessAPIView(APIView):
    # 同步回调
    def patch(self, request, *args, **kwargs):
        # request.query_params是QueryDict类型，不能调用pop方法
        request_data = request.query_params.dict()
        signature = request_data.pop("sign")
        # print(request_data)
        success = alipay.verify(request_data, signature)
        if success:  # 校验通过
            # 一般不在该处修改订单状态
            # print(request_data)
            order_id = request_data.get('out_trade_no')
            order_obj = models.Order.objects.filter(order_id=order_id).first()
            order_obj.pay_status = 1
            order_obj.status = 'finish'
            order_obj.save()
            user_obj = order_obj.user
            product_obj = order_obj.product
            vip_months = product_obj.months
            if (user_obj.vip_exp is None) or (user_obj.vip_exp < datetime.datetime.now()):
                user_obj.is_vip = 1
                user_obj.vip_level = 1
                user_obj.vip_exp = datetime.datetime.now() + datetime.timedelta(days=vip_months * 30)
            else:
                user_obj.vip_exp += datetime.timedelta(days=vip_months*30)
            user_obj.save()
            celery_cancel_vip(user_obj.id, user_obj.vip_exp)
            return MyResopnse()
        return MyResopnse(1, '校验失败')

    # 支付宝异步回调
    def post(self, request, *args, **kwargs):
        # 默认是QueryDict类型，不能使用pop方法
        request_data = request.data.dict()
        # 必须将 sign、sign_type(内部有安全处理) 从数据中取出，拿sign与剩下的数据进行校验
        sign = request_data.pop('sign')
        result = alipay.verify(request_data, sign)
        # 异步回调：修改订单状态
        if result and request_data["trade_status"] in ("TRADE_SUCCESS", "TRADE_FINISHED"):
            out_trade_no = request_data.get('out_trade_no')
            logger.critical('%s支付成功' % out_trade_no)
            try:
                order = models.Order.objects.get(out_trade_no=out_trade_no)
                if order.order_status != 1:
                    order.order_status = 1
                    order.save()
                    return Response('success')  # 必须返回success字符串，8次异步回调机制
            except:
                pass
        return Response('failed')


class ChangeInfoAPIView(APIView):
    authentication_classes = [JSONWebTokenAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        request_data = request.data
        print(request_data)
        user_ser = serializery.ChangeInfoModelSerializer(instance=request.user, data=request_data)
        user_ser.is_valid(raise_exception=True)
        # print(user_ser.errors)
        user_ser.save()
        return MyResopnse(my_msg='修改成功')


class ShowUserInfoAPIView(APIView):
    authentication_classes = [JSONWebTokenAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        user_obj = request.user
        data = UserInfoModelSerializer(instance=user_obj, context={'request': request}).data
        return MyResopnse(my_results=data)


