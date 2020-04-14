from django.db import models
# Create your models here.


class Category(models.Model):
    name = models.CharField(max_length=10)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '分类'
        verbose_name_plural = verbose_name
        db_table = 'lookapi_category'


class Tag(models.Model):
    name = models.CharField(max_length=255)
    weight = models.IntegerField(default=0)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '标签'
        verbose_name_plural = verbose_name
        db_table = 'lookapi_tag'


class Movie(models.Model):
    name = models.CharField(max_length=255, verbose_name='电影名')
    title = models.CharField(max_length=255, verbose_name='电影标题')
    movie_img = models.ImageField(upload_to='movie', verbose_name='电影封面')
    brief = models.TextField(max_length=1024, verbose_name='电影简介')
    views = models.IntegerField(default=0, verbose_name='观影人数')
    comments = models.IntegerField(default=0, verbose_name='评论数')
    up_num = models.IntegerField(default=0, verbose_name='点赞数')
    down_num = models.IntegerField(default=0, verbose_name='点踩数')
    upload_time = models.DateTimeField(auto_now_add=True, verbose_name='上传时间')

    number = models.IntegerField(default=1, verbose_name='电影集数')
    is_tv = models.BooleanField(default=False, verbose_name='是否为电视剧')
    is_delete = models.BooleanField(default=False, verbose_name='是否删除')
    category = models.ForeignKey(to='Category', on_delete=models.SET_NULL, null=True, related_name='category', db_constraint=False)
    tag = models.ManyToManyField(to='Tag', related_name='movie', db_constraint=False)
    is_vip = models.BooleanField(default=False, verbose_name='是否需要会员')

    def __str__(self):
        return self.name

    @property
    def movie_link(self):
        link_dic = {}
        for addres in self.link_set.all():
            link_dic[addres.number] = str(addres.link)
        return link_dic

    @property
    def tag_dic(self):
        tag_dic = {}
        for tag_obj in self.tag.all():
            tag_dic[tag_obj.pk] = tag_obj.name
        return tag_dic

    class Meta:
        verbose_name = '电影'
        verbose_name_plural = verbose_name
        db_table = 'lookapi_movie'


class Link(models.Model):
    number = models.IntegerField(verbose_name='对应的集数', default=1)
    link = models.FileField(upload_to='movie', verbose_name='电影地址')
    movie = models.ForeignKey(to='Movie', verbose_name='电影', on_delete=models.CASCADE)

    class Meta:
        verbose_name = '电影地址'
        verbose_name_plural = verbose_name
        db_table = 'lookapi_tv_link'

    def __str__(self):
        return self.movie.name
