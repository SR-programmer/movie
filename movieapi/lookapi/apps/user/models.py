from django.db import models
from django.contrib.auth.models import AbstractUser
from all_resource import models as m_models


class User(AbstractUser):
    mobile = models.CharField(max_length=11, unique=True)
    is_vip = models.BooleanField(default=False)
    vip_exp = models.DateTimeField(null=True)
    vip_level = models.IntegerField(null=True)
    avatar = models.ImageField(upload_to='avatar', verbose_name='用户头像', null=True, blank=True,
                               help_text="头像图片的大小规格：256x256，或者对应的比例的图片", default='avatar/tank大帅比.png')
    gender_choices = ((1, '男'), (2, '女'), (3, '未知'))
    gender = models.SmallIntegerField(choices=gender_choices, default=3, verbose_name='性别')
    birthday = models.DateTimeField(null=True, verbose_name='生日')
    introduction = models.TextField(null=True, verbose_name='个人简介', default='这人很懒,什么都没留下.')

    def __str__(self):
        return self.username

    class Meta:
        verbose_name = '用户表'
        verbose_name_plural = verbose_name

    @property
    def get_gender(self):
        return self.get_gender_display()


class UserRecord(models.Model):
    user = models.ForeignKey(to=User, db_constraint=False, on_delete=models.CASCADE)
    movie = models.ForeignKey(to=m_models.Movie, db_constraint=False, on_delete=models.CASCADE)
    create_time = models.DateTimeField(auto_now=True)

    @property
    def movie_title(self):
        return self.movie.title

    class Meta:
        db_table = 'user_record'
        verbose_name = '观看历史记录'
        verbose_name_plural = verbose_name


class UpAndDown(models.Model):
    user = models.ForeignKey(to='User', on_delete=models.CASCADE, db_constraint=False)
    movie = models.ForeignKey(m_models.Movie, on_delete=models.CASCADE, db_constraint=False)
    is_up = models.BooleanField()
    is_delete = models.BooleanField(default=False)

    class Meta:
        verbose_name = '点赞点踩表'
        verbose_name_plural = verbose_name
        db_table = 'lookapi_up_down'


class Comment(models.Model):
    user = models.ForeignKey(to='User', on_delete=models.CASCADE, db_constraint=False)
    movie = models.ForeignKey(m_models.Movie, on_delete=models.CASCADE, db_constraint=False)
    create_time = models.DateTimeField(auto_now_add=True)
    hot = models.IntegerField(default=0)
    content = models.CharField(max_length=255)

    class Meta:
        verbose_name = '评论表'
        verbose_name_plural = verbose_name
        db_table = 'lookapi_comment'


class Product(models.Model):
    name = models.CharField(max_length=255, verbose_name='会员名称')
    months = models.SmallIntegerField(verbose_name='会员月数')
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='会员原始价格')
    real_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='会员现在的价格')

    class Meta:
        db_table = 'vip_product'
        verbose_name = '会员价格'
        verbose_name_plural = verbose_name


class Order(models.Model):
    order_id = models.CharField(max_length=50, unique=True, primary_key=True)
    status_choices = (("active", '活动订单'), ("dead", '作废订单'), ("finish", '已完成订单'))
    status = models.CharField(choices=status_choices, default="active", max_length=50)
    pay_status_choices = ((0, '未付款'), (1, '已付款'))
    pay_status = models.SmallIntegerField(choices=pay_status_choices, default=0)
    payed = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    order_total = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    pay_app = models.CharField(max_length=100)
    user = models.ForeignKey(User, to_field="id", related_name="Order", db_constraint=False,
                               on_delete=models.CASCADE)
    creat_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)
    product = models.OneToOneField(Product, on_delete=models.DO_NOTHING, db_constraint=False)

    def __str__(self):
        return self.order_id

    class Meta:
        db_table = 'user_order'
        verbose_name = '订单详情'
        verbose_name_plural = verbose_name
