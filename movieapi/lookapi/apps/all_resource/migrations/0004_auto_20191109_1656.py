# Generated by Django 2.0.7 on 2019-11-09 16:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('all_resource', '0003_auto_20191109_1431'),
    ]

    operations = [
        migrations.AlterField(
            model_name='all_resource',
            name='name',
            field=models.CharField(max_length=255, verbose_name='电影名'),
        ),
    ]
