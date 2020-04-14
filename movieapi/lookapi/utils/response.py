from rest_framework.response import Response


class MyResopnse(Response):
    def __init__(self, my_status=0, my_msg='ok', my_results=None, http_status=None, **kwargs):
        data = {
            'status': my_status,
            'msg': my_msg,
            'results': {}
        }
        if my_results:
            data['results'] = my_results
        if kwargs:
            data.update(kwargs)
        # print(data)
        super().__init__(data, http_status)








