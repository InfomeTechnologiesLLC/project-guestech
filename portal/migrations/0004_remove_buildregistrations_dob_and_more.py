# Generated by Django 4.0.4 on 2024-04-18 10:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0003_buildcardtype_show_in_form_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='buildregistrations',
            name='dob',
        ),
        migrations.RemoveField(
            model_name='buildregistrations',
            name='mobile',
        ),
    ]
