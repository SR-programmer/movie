from django.core.cache import cache


def update_movie_list(movie_pk, is_like):
    movie_info_dic = cache.get('movie_info_dic')
    movie_info = movie_info_dic.get(str(movie_pk))
    if is_like:
        movie_info['up_num'] += 1
    else:
        movie_info['down_num'] += 1

    cache.set('movie_info_dic', movie_info_dic, 86400)




