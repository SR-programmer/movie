from celery_task import tasks
import datetime


def celery_cancel_vip(user_id, vip_exp):
    vip_exp = vip_exp - datetime.timedelta(hours=8)
    tasks.cancel_vip.apply_async(args=(user_id, ), eta=vip_exp)





