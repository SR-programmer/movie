# Generated by Django 2.0.7 on 2019-11-10 14:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Gif',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gif', models.ImageField(upload_to='gif', verbose_name='动图')),
                ('name', models.CharField(max_length=20, verbose_name='动图名称')),
            ],
        ),
    ]
