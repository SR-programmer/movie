from .settings import *
import random
from qcloudsms_py import SmsSingleSender
from utils import logging
from lookapi.settings import const
from django.core.cache import cache
from utils.logging import logger


def get_random():
    return str(random.randint(1000, 9999))


sender = SmsSingleSender(appid, appkey)
# params = ["5678"]  # 当模板没有参数时，`params = []`




class SendMS:
    def __init__(self, phone_numbers):
        self.params = get_random()
        self.phone_numbers = phone_numbers
        self.exp = const.SMS_CODE_EXP // 60

    def send_message(self):
        try:
            result = sender.send_with_param(86, self.phone_numbers,
                                             template_id, (self.params, 500), sign=sms_sign, extend="", ext="")
        except Exception as e:
            logging.logger.error('sms error %s' % e)
            return False
        print(result)
        if result and result['result'] == 0:
            return True
        return False

    def save_code(self):
        cache.set('mobile_%s' % self.phone_numbers, self.params, self.exp * 60)







