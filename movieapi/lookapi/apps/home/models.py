from django.db import models
from all_resource import models as m_model


class Banner(models.Model):
    image = models.ImageField(upload_to='banner', verbose_name='轮播图', null=True, blank=True)
    name = models.CharField(max_length=150, verbose_name='轮播图名称')
    note = models.CharField(max_length=150, verbose_name='备注信息')
    link = models.CharField(max_length=150, verbose_name='轮播图广告地址')
    orders = models.IntegerField(verbose_name='显示顺序')
    is_show = models.BooleanField(verbose_name="是否上架", default=False)
    is_delete = models.BooleanField(verbose_name="逻辑删除", default=False)

    class Meta:
        db_table = 'luffy_banner'
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Gif(models.Model):
    gif = models.ImageField(upload_to='gif', verbose_name='动图')
    name = models.CharField(max_length=20, verbose_name='动图名称')
    category = models.ForeignKey(m_model.Category, db_constraint=False, on_delete=models.DO_NOTHING, null=True, blank=True)

    def __str__(self):
        return self.name


