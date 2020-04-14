from rest_framework import serializers
from . import models


class MovieModelserializers(serializers.ModelSerializer):

    class Meta:
        model = models.Movie
        fields = ('title', 'movie_img', 'pk', 'name')


class TagModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Tag
        fields = '__all__'


class WatchMovieModelSerializer(serializers.ModelSerializer):
    category = serializers.CharField(source='category.name')

    class Meta:
        model = models.Movie
        fields = ('title', 'movie_img', 'pk', 'name', 'brief', 'views', 'comments', 'up_num', 'down_num', 'upload_time',
                  'number', 'is_vip', 'category', 'tag_dic')


class MovieInfoModelSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Movie
        fields = ['pk', 'views', 'up_num', 'down_num', 'comments']


class MovieLinkModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Movie
        fields = ('movie_link', )

