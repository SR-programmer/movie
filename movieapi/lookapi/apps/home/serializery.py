from . import models
from rest_framework import serializers
from all_resource.models import Movie


class BannerModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Banner
        fields = ('image', 'note', 'link')


class MovieModelserializers(serializers.ModelSerializer):

    class Meta:
        model = Movie
        fields = ('title', 'movie_img', 'pk', 'name')


class GifModelSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Gif
        fields = '__all__'


