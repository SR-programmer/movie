
from django.contrib import admin
from django.urls import path, include, re_path
from django.views.static import serve
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('user/', include('user.urls')),

    path('home/', include('home.urls')),
    path('all/', include('all_resource.urls')),

    re_path(r'media/(?P<path>.*)', serve, {'document_root': settings.MEDIA_ROOT}),
]
