# Generated by Django 4.0.4 on 2024-05-14 11:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0009_alter_userrole_table_userprofile'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userrole',
            name='name',
            field=models.CharField(max_length=100, null=True),
        ),
    ]
