from utils.response import Response
from rest_framework.generics import ListAPIView
from settings.const import NUMBER_TAGS
from . import models
from . import serializery
from utils.response import MyResopnse
from utils.pagenations import MyPageNumberPagination
from django.core.cache import cache
from settings.const import PAGE_SIZE
from rest_framework.filters import SearchFilter
from utils.set_cache import set_cache, set_vip_cache
from .authentication import MyJSONWebTokenAuthentication
from rest_framework.views import APIView


class HotTagAPIView(ListAPIView):
    queryset = models.Tag.objects.all()[:NUMBER_TAGS]
    serializer_class = serializery.TagModelSerializer


class MovieListAPIView(ListAPIView):
    queryset = cache.get('movie_list')
    serializer_class = serializery.MovieModelserializers
    pagination_class = MyPageNumberPagination

    def list(self, request, *args, **kwargs):
        if self.queryset is None:
            self.queryset = set_cache()
        request_data = request.query_params
        category = request_data.get('category')

        name = request_data.get('name')
        if name not in ('views', 'comments', 'up_num', 'upload_time', None):
            return Response(data={'status': 1, 'msg': '未找到资源'}, status=404)
        if name is None:
            self.queryset = self.queryset.filter(category__name=category).all().order_by('-upload_time')
        else:
            self.queryset = self.queryset.filter(category__name=category).all().order_by(f'-{name}')
        response = super().list(request, *args, **kwargs)
        return response


class MovieCount(APIView):
    def get(self, request, *args, **kwargs):
        category = request.query_params.get('category')
        movie_count = cache.get(f'{category}_count')
        if not movie_count:
            page_size = PAGE_SIZE
            total = cache.get('movie_list').filter(category__name=category, is_delete=False).all().count()
            cache.set(f'{category}_count', [page_size, total])
        else:
            page_size, total = movie_count
        return MyResopnse(my_results={'page_size': page_size, 'total': total})


class TagMovieListAPIView(ListAPIView):
    def list(self, request, *args, **kwargs):
        request_params = request.query_params
        tag_id = request_params.get('pk')
        self.queryset = models.Movie.objects.filter(tag=tag_id, is_delete=False).all()
        self.serializer_class = serializery.MovieModelserializers
        self.pagination_class = MyPageNumberPagination
        response = super().list(request, *args, **kwargs)
        return response


class TagCountAPIView(APIView):
    def get(self, request, *args, **kwargs):
        pk = request.query_params.get('pk')
        tag_count = cache.get(f'tag_{pk}_count')

        if not tag_count:

            page_size = PAGE_SIZE
            total = models.Movie.objects.filter(tag=pk, is_delete=False).all().count()
            cache.set(f'tag_{pk}_count', [page_size, total])
        else:
            page_size, total = tag_count
        return MyResopnse(my_results={'page_size': page_size, 'total': total})


class SearchMovie(ListAPIView):
    serializer_class = serializery.MovieModelserializers
    filter_backends = [SearchFilter]
    pagination_class = MyPageNumberPagination
    search_fields = ['name', 'title']
    queryset = cache.get('movie_list')

    def list(self, request, *args, **kwargs):
        if self.queryset is None:
            self.queryset = models.Movie.objects.filter(is_delete=False)
        response = super().list(request, *args, **kwargs)
        return response


class WatchMovie(APIView):
    def get(self, request, *args, **kwargs):
        request_query = request.query_params
        movie_pk = request_query.get('movie')
        queryset = cache.get('movie_list')
        if not queryset:
            queryset = set_cache()
        movie_obj = queryset.filter(pk=movie_pk).all().first()
        data = serializery.WatchMovieModelSerializer(instance=movie_obj, context={'request': request}).data
        return MyResopnse(my_results=data)


class MovieInfo(APIView):
    def get(self, request, *args, **kwargs):
        movie_pk = request.query_params.get('pk')
        if not movie_pk:
            return MyResopnse(http_status=404, my_msg='请求资源不存在')
        queryset = cache.get('movie_list')
        if not queryset:
            queryset = set_cache()
        movie_query = queryset.filter(pk=movie_pk).all()
        if not movie_query:
            return MyResopnse(my_status=404, my_msg='没资源')
        info_dic = {}
        movie_info_dic = cache.get('movie_info_dic')
        if movie_info_dic:
            movie_info = movie_info_dic.get(movie_pk)
            if movie_info:
                movie_info['views'] += 1
                movie_info_dic[movie_pk] = movie_info
                cache.set('movie_info_dic', movie_info_dic, 86400)
                return MyResopnse(my_results=movie_info)
            else:

                movie_obj = movie_query.first()
                data = serializery.MovieInfoModelSerializer(instance=movie_obj).data
                data.pop('pk')
                data['views'] += 1
                movie_info_dic[movie_pk] = data
                cache.set('movie_info_dic', movie_info_dic, 86400)
                return MyResopnse(my_results=data)
        else:
            movie_obj = movie_query.first()
            data = serializery.MovieInfoModelSerializer(instance=movie_obj).data
            data.pop('pk')
            data['views'] += 1
            info_dic[movie_pk] = data
            cache.set('movie_info_dic', info_dic, 86400)
            return MyResopnse(my_results=data)




class VipMovieListAPIView(ListAPIView):
    queryset = cache.get('vip_list')
    serializer_class = serializery.MovieModelserializers
    pagination_class = MyPageNumberPagination

    def list(self, request, *args, **kwargs):
        if self.queryset is None:
            self.queryset = set_vip_cache()
        request_data = request.query_params

        name = request_data.get('name')
        if name not in ('views', 'comments', 'up_num', 'upload_time', None):
            return Response(data={'status': 1, 'msg': '未找到资源'}, status=404)
        if name is None:
            self.queryset = self.queryset.all().order_by('-upload_time')
        else:
            self.queryset = self.queryset.all().order_by(f'-{name}')
        response = super().list(request, *args, **kwargs)
        return response


class MovieLinkAPIView(APIView):
    authentication_classes = [MyJSONWebTokenAuthentication]

    def get(self, request, *args, **kwargs):
        # print(request.user)
        movie_pk = request.query_params.get('movie')
        if not movie_pk:
            return MyResopnse(my_status=1, my_msg='请求资源不存在')
        queryset = cache.get('movie_list')
        if not queryset:
            queryset = set_cache()
        movie_query = queryset.filter(pk=movie_pk).all()
        if not movie_query:
            return MyResopnse(my_status=1, my_msg='请求资源不存在')
        movie_obj = movie_query.first()
        if movie_obj.is_vip:
            if not(request.user and request.user.is_vip):
                return MyResopnse(my_status=2, my_msg='非会员无法观看')
        data = serializery.MovieLinkModelSerializer(instance=movie_obj, context={'request': request}).data
        return MyResopnse(my_results=data)










