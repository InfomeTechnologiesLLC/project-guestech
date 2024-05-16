from django.shortcuts import render
from django.http import JsonResponse
from check_in_and_check_out.models import *
from portal.models import EventRegistrations 
import json
# Create your views here.

def volunteer_page(request):

    return render(request,'volunteer-page.html')
def check_in_and_check_out_entry(request):
    evp_id=request.POST.get('evp-id')
    entry_status=request.POST.get('check-status')
    room_id=request.POST.get('room-id')
    
    evp_id=str(evp_id).replace('EVP-','')
    print(evp_id,room_id)
    res={}
    try:
        
        registration=EventRegistrations.objects.get(id=evp_id)
        room=Rooms.objects.get(id=room_id)
        EntryLog.objects.create(registration=registration,entry_status=entry_status,room=room)
        res['registration']={"name":registration.first_name + registration.last_name}
        res['room']={"name":room.name}
        res['status']=True
    except Exception as e:
        res['status']=False
        print(e)
    return JsonResponse(res)

def get_latest_dashboard_data(request):
    
    room_id=request.GET.get('room-id')
    loading_first=json.loads(request.GET.get('loading-first'))
    
    res={}
    try:
        if loading_first:
            res['room']={'name':Rooms.objects.get(id=room_id).name}
            
        entries=EntryLog.objects.filter(active=True,room__id=room_id)
        res['success']=True
        res['entries']={"total-check-in":entries.filter(entry_status=1).count(),"total-check-out":entries.filter(entry_status=2).count()}
        
    except Exception as e:
        res['success']=False    

    return JsonResponse(res)


def admin_page(request):
    return render(request,'admin-page.html')

def checkinout(request):
    return render(request,'checkinout.html')