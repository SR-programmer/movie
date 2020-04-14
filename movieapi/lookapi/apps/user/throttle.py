from rest_framework.throttling import SimpleRateThrottle


class SMSSimpleRateThrottle(SimpleRateThrottle):
    scope = 'sms'

    def get_cache_key(self, request, view):
        mobile = request.get('mobile')
        if not mobile:
            return None
        return self.cache_format % {
            'scope': self.scope,
            'ident': mobile
        }










