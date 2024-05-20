from django.shortcuts import render
from django.http import JsonResponse
from check_in_and_check_out.models import *
from portal.models import EventRegistrations 
import json
from django.contrib.auth.decorators import login_required
from itertools import groupby
from operator import attrgetter
from portal.models import daysTable
from django.utils import timezone 
from check_in_and_check_out.urlites import check_key_array_dic_exists
# Create your views here.
@login_required
def volunteer_page(request):

    return render(request,'volunteer-page.html')
def check_in_and_check_out_entry(request):
    evp_id=request.POST.get('evp-id')
    entry_status=int(request.POST.get('check-status'))
    room_id=request.POST.get('room-id')
    
    evp_id=str(evp_id).replace('EVP-','')
    res={}
    try:
        
        
        registration=EventRegistrations.objects.get(id=evp_id)
        
        #checking the card have the permission to enter in today ( checking in days column in registration )
        if not registration.days.filter(date=timezone.now().date()).exists() and entry_status == 1:
            res['status']=False
            res['reason']='Card is not permitted to check in today.'
            return JsonResponse(res)
   
            
        room=Rooms.objects.get(id=room_id)
        new_entry=EntryLog.objects.create(registration=registration,entry_status=entry_status,room=room)
        if daysTable.objects.filter(date=timezone.now().date()).exists():
            
            day=daysTable.objects.get(date=timezone.now().date())
            day.entries.add(new_entry)
        
        day.save()
        
        res['registration']={"name":registration.first_name + registration.last_name}
        res['room']={"name":room.name}
        res['status']=True
    except Exception as e:
        res['status']=False
        res['reason']=''
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

##admin page


def get_admin_dashboard_data():
    rooms=Rooms.objects.filter(active=True)
    total_entries=EntryLog.objects.filter(active=True)
    res={'rooms':[]}
    for room in rooms:
        room_entries=total_entries.filter(room=room)

        res['rooms'].append({
            'id':room.id,
            'name':room.name,
            'total_check_in':room_entries.filter(entry_status=1).count(),
            'total_check_out':room_entries.filter(entry_status=2).count(),
            
        })

    res['total_entry']={'check_in':total_entries.filter(entry_status=1).count(),'check_out':total_entries.filter(entry_status=2).count()}    
    return res

def get_admin_dashboard_latest_data(request):
    res={'success':False}
    try:
        
        res=get_admin_dashboard_data()
        res['success']=True
    except Exception as e:
        print(e)
        res['success']=False
        
    return JsonResponse(res)
@login_required
def admin_dashboards_page(request):
    res=get_admin_dashboard_data()
    return render(request,'admin-page.html',res)
def add_room(request):
    name=request.POST.get('room-name')
    
    res={'success':False}
    try:
        Rooms.objects.create(name=name)
        res['success']=True
        
    except Exception as e:
        print(e)
        res['success']=False
    return JsonResponse(res)

@login_required
def check_in_out_list_page(request,room_id):
    
    filter_status=request.GET.get('filter-check')
    
    entry_logs=EntryLog.objects.filter(active=True)
    
    room=None
    if room_id:
        room=Rooms.objects.get(id=room_id)
        entry_logs=entry_logs.filter(room=room)
    
    
    # if filter_status == 'in':
    #     entry_logs=entry_logs.filter(entry_status=1)
    # if filter_status == 'out':
    #     entry_logs=entry_logs.filter(entry_status=2)

    data={}
    for entry in entry_logs:
        _date=str(entry.created_at.date())
        _entry_log=entry_logs.filter(registration__id=entry.registration.id,created_at__date=entry.created_at.date())
        _entry_data={}
        _entry_data['in']=_entry_log.filter(entry_status=1).order_by('created_at').first().created_at if  _entry_log.filter(entry_status=1).exists() else None
        _entry_data['out']=_entry_log.filter(entry_status=2).order_by('-created_at').first().created_at if  _entry_log.filter(entry_status=2).exists() else None
        _entry_data['reg_id']=entry.registration.id
        _entry_data['reg']=entry.registration
        
        if filter_status == 'out' and _entry_data['out'] == None :
            continue
        if filter_status == 'in' and _entry_data['out'] != None and _entry_data['in'] == None:
            continue
        
        if _date in data:
            if check_key_array_dic_exists(data[_date],'reg_id',entry.registration.id):
                pass
            else:
                data[_date].append(_entry_data)
            # if (d.get('reg_id') == entry.registration.id for d in data[_date]):
            #     print('date in reg_id' ,entry.registration.id)
            #     for d in data[_date]:
            #         print(d.get('reg_id'))
                    # if d.get('reg_id') == entry.registration.id:
                    #     print('replace with 0')
                    #     data[_date][0]=_entry_data
                    #     break
        else:
            data[_date]=[]
            data[_date].append(_entry_data)
    _final_report_data=[]

    for key in data:
        _final_report_data.extend(data[key])

    context={'room':room,'entry_logs':entry_logs,'entry_report':_final_report_data}
    
    return render(request,'check-in-out-list.html',context)