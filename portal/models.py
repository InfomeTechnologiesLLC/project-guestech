from django.db import models
from django.contrib.auth.models import User
from check_in_and_check_out.models import *
# Create your models here.

class userRole(models.Model):
    name=models.CharField(max_length=100,null=True)
    class Meta:
        db_table='user_profile_role'
class Profile(models.Model):
    user=models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    role=models.ForeignKey(userRole,on_delete=models.CASCADE)
    
    class Meta:
        db_table='user_profile'
         

        
class EventCardType(models.Model):
    name=models.CharField(max_length=100)
    active=models.BooleanField(default=True)
    show_in_form=models.BooleanField(default=True)
    class Meta:
        db_table='event_cardtype'

class BuildCardType(models.Model):
    name=models.CharField(max_length=100)
    active=models.BooleanField(default=True)
    show_in_form=models.BooleanField(default=True)
    class Meta:
        db_table='build_cardtype'

class VappCardType(models.Model):
    name=models.CharField(max_length=100)
    active=models.BooleanField(default=True)
    show_in_form=models.BooleanField(default=True)
    class Meta:
        db_table='vapp_cardtype'

class VehicleType(models.Model):
    name=models.CharField(max_length=100)
    active=models.BooleanField(default=True)
    class Meta:
        db_table='vehicle_type'        
   
class BuildRegistrations(models.Model):
    first_name=models.TextField()
    last_name=models.TextField()
    mobile=models.TextField(null=True)
    email=models.TextField(null=True)
    company=models.TextField(null=True)
    
    dob=models.DateField(null=True)
    cardtype=models.ForeignKey(BuildCardType, on_delete=models.CASCADE)
    #locaiton
    # location=models.ForeignKey(Locations,on_delete=models.CASCADE)
    
    lanyard_color=models.CharField(null=True,max_length=100)
    
    id_proof_expiry=models.DateField(null=True)
    id_proof_type=models.CharField(max_length=50,choices=(("Passport-Id",'Passport-Id'),("Emirates-Id","Emirates-Id")),default="Emirates-Id")
    id_proof_number=models.TextField(null=True)
    id_proof_front=models.FileField(upload_to='id-proof-front/',null=True)
    id_proof_back=models.FileField(upload_to='id-proof-back/',null=True)
    
    
    remark=models.TextField(default='',null=True)
    collected=models.BooleanField(default=False)
    print_count=models.IntegerField(default=0)
    
    verification=models.CharField(max_length=50,choices=(("Approved",'Approved'),("Rejected","Rejected"),("Pending","Pending")),default="Pending")
    
    active=models.BooleanField(default=True)
    
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(auto_now=True)
    
    class Meta:
        db_table='build_registrations'
  
class VappRegistrations(models.Model):
    first_name=models.TextField()
    last_name=models.TextField()
    company=models.TextField(null=True)
    # jobtitle=models.TextField(null=True)
    mobile=models.TextField(null=True)
    email=models.TextField(null=True)
    
    cardtype=models.ForeignKey(VappCardType, on_delete=models.CASCADE)
    vehicletype=models.ForeignKey(VehicleType, on_delete=models.CASCADE)
    vehicle_number=models.TextField(null=True)
    #location
    # location=models.ForeignKey(Locations,on_delete=models.CASCADE)
    
    id_proof_front=models.FileField(upload_to='id-proof-front/',null=True)
    id_proof_back=models.FileField(upload_to='id-proof-back/',null=True)
    vehicle_pass=models.FileField(upload_to='vehicle_pass/',null=True)
    
    delivery_date=models.DateField(null=True)
    remark=models.TextField(default='',null=True)
    collected=models.BooleanField(default=False)
    print_count=models.IntegerField(default=0)
    
    delivery_to_date=models.DateField(null=True)
    
    
    verification=models.CharField(max_length=50,choices=(("Approved",'Approved'),("Rejected","Rejected"),("Pending","Pending")),default="Pending")
    
    active=models.BooleanField(default=True)
    
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(auto_now=True)
    
    class Meta:
        db_table='vapp_registrations'

    
class EventRegistrations(models.Model):
    first_name=models.TextField()
    last_name=models.TextField()
    company=models.TextField(null=True)
    # jobtitle=models.TextField(null=True)
    cardtype=models.ForeignKey(EventCardType , on_delete=models.CASCADE)
    dob=models.DateField(null=True)
    nationality=models.TextField(null=True)
    mobile=models.TextField(null=True)
    email=models.TextField(null=True)
    
    # #locations
    # location=models.ForeignKey(Locations,on_delete=models.CASCADE)
    
    days=models.ManyToManyField('portal.daysTable')
    
    id_proof_expiry=models.DateField(null=True)
    id_proof_type=models.CharField(max_length=50,choices=(("Passport-Id",'Passport-Id'),("Emirates-Id","Emirates-Id")),default="Emirates-Id")
    id_proof_number=models.TextField(null=True)
    id_proof_front=models.FileField(upload_to='id-proof-front/',null=True)
    id_proof_back=models.FileField(upload_to='id-proof-back/',null=True)
    
    badge_photo=models.FileField(upload_to='badge-images/',null=True)
    
    remark=models.TextField(default='',null=True)
    collected=models.BooleanField(default=False)
    print_count=models.IntegerField(default=0)
    
    verification=models.CharField(max_length=50,choices=(("Approved",'Approved'),("Rejected","Rejected"),("Pending","Pending")),default="Pending")
    
    active=models.BooleanField(default=True)
    
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(auto_now=True)

    def get_name(self):

        return f"{self.first_name} {self.last_name}"
    class Meta:
        db_table='event_registrations'

class daysTable(models.Model):
    name=models.CharField(max_length=50)
    date=models.DateField(null=True)
    entries=models.ManyToManyField(EntryLog,null=True)
    active=models.BooleanField(default=True)
    
    class Meta:
        db_table='event_days'