from django.urls import path, re_path
from . import views
urlpatterns = [
    path('sms/', views.SMS.as_view()),
    path('mobile/', views.MobileAPIView.as_view()),
    path('register/', views.RegisterAPIView.as_view()),
    path('login/', views.LoginAPIView.as_view()),
    path('login/mobile/', views.MobileLogin.as_view()),
    path('upordown/', views.UserUpAndDown.as_view()),
    path('online/number/', views.OnlineNumber.as_view()),
    path('all/comments/', views.ALLComments.as_view()),
    path('commit/comment/', views.AddComment.as_view()),
    path('site/', views.SiteAPIView.as_view()),
    path('watch/record/', views.WatchRecord.as_view()),
    path('history/', views.HistoryAPIView.as_view()),
    path('pay/', views.PayAPIView.as_view()),
    path('pay/success/', views.SuccessAPIView.as_view()),
    path('vip/product/', views.VipProductListAPIView.as_view()),
    path('change/info/', views.ChangeInfoAPIView.as_view()),
    path('user_info/', views.ShowUserInfoAPIView.as_view()),
]
