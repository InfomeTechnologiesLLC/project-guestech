from django.db import models

# Create your models here.

class Rooms(models.Model):
    name=models.CharField(null=True,max_length=50)
    active=models.BooleanField(default=True)
    
    class Meta:
        db_table='rooms'
        
class EntryLog(models.Model):
    #check in = 1 check out = 2
    entry_status=models.IntegerField(null=False)
    registration=models.ForeignKey('portal.EventRegistrations',on_delete=models.CASCADE)
    #day=models.ForeignKey(daysTable,on_delete=models.CASCADE,null=True,related_name='day')
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(auto_now=True)
    active=models.BooleanField(default=True)
    room=models.ForeignKey(Rooms,on_delete=models.CASCADE)
    
    class Meta:
        db_table='entry_log'
    