# Generated by Django 3.2.7 on 2021-09-10 16:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customers', '0003_auto_20210910_1610'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='user/'),
        ),
    ]
