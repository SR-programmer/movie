from django.urls import path, include,  re_path
from . import views


urlpatterns = [
    path('hot_tag/', views.HotTagAPIView.as_view()),
    path('', views.MovieListAPIView.as_view()),
    path('movie_count/', views.MovieCount.as_view()),
    path('tag/', views.TagMovieListAPIView.as_view()),
    path('tag_count/', views.TagCountAPIView.as_view()),
    path('movie/search/', views.SearchMovie.as_view()),
    path('movie/show/', views.WatchMovie.as_view()),
    path('movie_info/', views.MovieInfo.as_view()),
    path('vip/movie/', views.VipMovieListAPIView.as_view()),
    path('movie/link/', views.MovieLinkAPIView.as_view()),
]