from .celery import app
from home.models import Banner
from home.serializery import BannerModelSerializer
from settings.const import BANNER_COUNTS
from django.core.cache import cache
from all_resource import models
import datetime
from user.models import User


@app.task
def update_banner_list():
    banner_queryset = Banner.objects.filter(is_delete=False, is_show=True).order_by('-orders')[:BANNER_COUNTS]
    banner_data = BannerModelSerializer(banner_queryset, many=True).data
    for banner in banner_data:
        banner['image'] = 'http://127.0.0.1:8000' + banner['image']
    cache.set('banner_list', banner_data)
    return True


# @app.task
# def update_re


@app.task
def update_movie():
    movie_all_list = models.Movie.objects.filter(is_delete=False).all()
    cache.set('movie_list', movie_all_list, 86400)


@app.task
def update_movie_info():
    movie_info_dic = cache.get('movie_info_dic')
    for movie_pk in movie_info_dic:
        # print(1)
        try:
            models.Movie.objects.filter(id=movie_pk).update(**movie_info_dic.get(movie_pk))
        except:
            continue


@app.task
def update_online_number():
    online_ips = cache.get('online_ips')
    new_online_ips = []
    if online_ips is None:
        return
    for ip in online_ips:
        online_ip = cache.get(ip)
        if online_ip:
            new_online_ips.append(online_ip)
    cache.set('online_ips', new_online_ips, 60)


@app.task
def cancel_vip(user_id):
    query = User.objects.filter(pk=user_id, is_active=True)
    if not query:
        return
    user_obj = query.first()
    now_time = datetime.datetime.now()
    if user_obj.vip_exp > now_time:
        return
    user_obj.is_vip = 0
    user_obj.save()



