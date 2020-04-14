from . import models
from rest_framework.generics import ListAPIView
from . import serializery
from settings.const import BANNER_COUNTS
from django.core.cache import cache
from rest_framework.response import Response
from all_resource.models import Movie
from rest_framework.views import APIView
from utils.response import MyResopnse
from settings.const import Number_of_presentations


class BannerListAPIView(ListAPIView):
    queryset = models.Banner.objects.filter(is_delete=False, is_show=True).order_by('-orders')[:BANNER_COUNTS]
    serializer_class = serializery.BannerModelSerializer

    def list(self, request, *args, **kwargs):

        banner_data = cache.get('banner_list')
        if not banner_data:
            response = super().list(request, *args, **kwargs)
            banner_data = response.data
            cache.set('banner_list', banner_data)
        return Response(banner_data)


class RecommendListAPIView(ListAPIView):
    queryset = Movie.objects.filter(is_delete=False).order_by('-views')
    serializer_class = serializery.MovieModelserializers

    def list(self, request, *args, **kwargs):
        recommend_list = cache.get('recommend_list')
        if not recommend_list:
            response = super().list(request, *args, **kwargs)
            res = response.data
            recommend_list = []
            for recommend in res:
                recommend_dict = dict(recommend)  # type:dict
                recommend_dict['name'] = recommend_dict.get('name')[:Number_of_presentations] + '...'
                recommend_list.append(recommend_dict)
            cache.set('recommend_list', recommend_list)
        return Response(recommend_list)


class GifAPIView(APIView):
    def get(self, request, *args, **kwargs):
        gif_name = kwargs.get('name')
        gif_obj = models.Gif.objects.filter(name=gif_name).first()
        data = serializery.GifModelSerializer(instance=gif_obj, context={'request': request}).data
        return Response(data={'data': data})


class ShowAPIView(APIView):
    def get(self, request, *args, **kwargs):
        category_name = kwargs.get('name')
        movie_list = cache.get('movie_list')
        if not movie_list:
            movie_list = Movie.objects.filter(category__name=category_name)[:Number_of_presentations]
        else:
            movie_list = movie_list.filter(category__name=category_name)[:Number_of_presentations]
        data = serializery.MovieModelserializers(instance=movie_list, many=True, context={'request': request}).data
        return MyResopnse(my_results=data)
