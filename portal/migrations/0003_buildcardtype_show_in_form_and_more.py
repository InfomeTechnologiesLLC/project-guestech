# Generated by Django 4.0.4 on 2024-03-20 11:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0002_remove_buildcardtype_show_in_form_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='buildcardtype',
            name='show_in_form',
            field=models.BooleanField(default=True),
        ),
        migrations.AddField(
            model_name='eventcardtype',
            name='show_in_form',
            field=models.BooleanField(default=True),
        ),
        migrations.AddField(
            model_name='vappcardtype',
            name='show_in_form',
            field=models.BooleanField(default=True),
        ),
    ]
