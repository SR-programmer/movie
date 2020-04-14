import os
import django
from celery import Celery
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'lookapi.settings.dev')
django.setup()

broker = 'redis://127.0.0.1:6379/14'
backend = 'redis://127.0.0.1:6379/15'


app = Celery(broker=broker, backend=backend, include=['celery_task.tasks'])


# 时区
app.conf.timezone = 'Asia/Shanghai'
# 是否使用UTC
app.conf.enable_utc = False


from datetime import timedelta
from celery.schedules import crontab
# app.conf.beat_schedule = {
#     'django-task': {
#         'task': 'celery_task.tasks.update_banner_list',
#         'schedule': timedelta(seconds=10),
#         'args': (),
#     }
# }

# app.conf.beat_schedule = {
#     'django-task': {
#         'task': 'celery_task.tasks.update_movie',
#         'schedule': timedelta(hours=1),
#         'args': (),
#     }
# }

# app.conf.beat_schedule = {
#     'django-task': {
#         'task': 'celery_task.tasks.update_movie_info',
#         'schedule': timedelta(seconds=60),
#         'args': (),
#     }
# }


app.conf.beat_schedule = {
    'django-task': {
        'task': 'celery_task.tasks.update_online_number',
        'schedule': 30.0,
        'args': (),
    },
    'django-task1': {
        'task': 'celery_task.tasks.update_movie_info',
        'schedule': timedelta(minutes=60),
        'args': (),
    },
    'django-task2': {
        'task': 'celery_task.tasks.update_movie',
        'schedule': timedelta(hours=1),
        'args': (),
    },
    'django-task3': {
        'task': 'celery_task.tasks.update_banner_list',
        'schedule': crontab(minute='*/15'),
        'args': (),
    }

}


