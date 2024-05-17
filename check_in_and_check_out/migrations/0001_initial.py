# Generated by Django 4.0.4 on 2024-05-15 07:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('portal', '0011_rename_userprofile_profile'),
    ]

    operations = [
        migrations.CreateModel(
            name='rooms',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, null=True)),
                ('activate', models.BooleanField(default=True)),
            ],
            options={
                'db_table': 'rooms',
            },
        ),
        migrations.CreateModel(
            name='EntryLog',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('entry_status', models.IntegerField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('active', models.BooleanField(default=True)),
                ('registration', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='portal.eventregistrations')),
            ],
            options={
                'db_table': 'entry_log',
            },
        ),
    ]