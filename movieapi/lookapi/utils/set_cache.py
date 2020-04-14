from django.core.cache import cache
from all_resource import models


def set_cache():
    queryset = models.Movie.objects.filter(is_delete=False).all()
    cache.set('movie_list', queryset, 86400)
    return queryset


def set_vip_cache():
    query = models.Movie.objects.filter(is_delete=False, is_vip=True).all()
    cache.set('vip_list', query, 86400)
    return query



