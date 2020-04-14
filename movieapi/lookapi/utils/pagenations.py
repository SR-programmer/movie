from rest_framework.pagination import PageNumberPagination
from settings.const import PAGE_SIZE


class MyPageNumberPagination(PageNumberPagination):
    # ?page=页码
    page_query_param = 'page'
    # ?page=页面 下默认一页显示的条数
    page_size = PAGE_SIZE
    # ?page=页面&page_size=条数 用户自定义一页显示的条数
    page_size_query_param = 'page_size'
    # 用户自定义一页显示的条数最大限制：数值超过5也只显示5条
    max_page_size = 16
