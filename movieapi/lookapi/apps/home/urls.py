from django.urls import path, re_path
from . import views
urlpatterns = [
    path('banners/', views.BannerListAPIView.as_view()),
    path('recommend/', views.RecommendListAPIView.as_view()),
    path('gif/<name>/', views.GifAPIView.as_view()),
    path('show/<name>/', views.ShowAPIView.as_view()),
]
