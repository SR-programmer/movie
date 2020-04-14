from django.middleware.common import CommonMiddleware


# 拿到这个中间件，这个中间件继承MiddlewareMixin
class CORSMiddleware(CommonMiddleware):

    def process_response(self, request, response):
        response["Access-Control-Allow-Origin"] = "*"

        response["Access-Control-Allow-Headers"] = "Content-Type"

        response['Access-Control-Allow-Methods'] = "DELETE,PUT"

        return response
