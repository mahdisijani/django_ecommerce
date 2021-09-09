# Generated by Django 3.2.7 on 2021-09-09 08:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customers', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='role',
            field=models.PositiveSmallIntegerField(choices=[(1, 'Admin'), (2, 'Staff'), (3, 'Customer')], default=3),
        ),
    ]
