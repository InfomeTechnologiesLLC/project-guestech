# Generated by Django 4.0.4 on 2024-05-14 11:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0007_daystable_eventregistrations_days'),
    ]

    operations = [
        migrations.CreateModel(
            name='userRole',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=10, null=True)),
            ],
        ),
    ]