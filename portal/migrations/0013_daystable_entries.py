# Generated by Django 4.0.4 on 2024-05-20 07:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('check_in_and_check_out', '0006_remove_entrylog_day'),
        ('portal', '0012_daystable_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='daystable',
            name='entries',
            field=models.ManyToManyField(null=True, to='check_in_and_check_out.entrylog'),
        ),
    ]
