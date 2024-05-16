from django.shortcuts import render ,redirect
from django.template.loader import render_to_string
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from .essantails import getTable ,getTableRow
from .models import *
from django.template.loader import render_to_string
from django.core import mail 
from django.utils.html import strip_tags
from django.db.models import Q, Count
from django.urls import reverse
from check_in_and_check_out.models import Rooms
from project_guesttech import settings
import json

from django.utils import timezone 
# Create your views here.


def empty_page(request):
    if request.user.is_authenticated:
        return redirect('dashboard')
    return redirect('login')
######LOGIN

def login_page(request):
    context={'rooms':Rooms.objects.filter(active=True)}
    return render(request,'login.html',context)

def validate_login(request):
    
    username=request.POST.get('username')
    password=request.POST.get('password')
    user =authenticate(username=username,password=password)
    
    # login_mode=request.POST.get('login-mode')
    
    if user is not None:
        volunteer_page=False
        
        if user.profile.role.id == 3:
            _url=reverse('volunteer-page')
            volunteer_page=True
        elif user.profile.role.id == 2:
            _url=reverse('admin-page')
        elif user.profile.role.id == 1:
            _url=reverse('dashboard')
        login(request,user)

        return JsonResponse({'success':True,'url':_url,'volunteer':volunteer_page})
    else:
        return JsonResponse({'success':False})
     
def logout_user(request):
    logout(request)
    return redirect('login')

#######PORTAL
@login_required
def dashboard(request):
    

    
    dashboard_data=[]

    event_count=EventRegistrations.objects.filter(active=True).count()
    build_count=BuildRegistrations.objects.filter(active=True).count()
    vapp_count=VappRegistrations.objects.filter(active=True).count()
    total_count=sum([event_count,build_count,vapp_count])

    dashboard_data.append({'event_count':event_count,'build_count':build_count,'vapp_count':vapp_count,'total_loc_count':total_count})
    
    data={'username':request.user.username,'dashboard_data':dashboard_data}
    return render(request,'dashboard.html',data)
@login_required
def registrations(request):
    table=request.GET.get('table-name')
    verification=request.GET.get('verification')
    
    if table == 'build':
        
        registrations=BuildRegistrations.objects.filter(active=True)
        page_path='build-registrations.html'
        cardtyes=BuildCardType.objects.filter(active=True)
    elif table == 'event':
        registrations=EventRegistrations.objects.filter(active=True)
        
        if verification == 'approved':
            registrations=registrations.filter(verification='Approved')
        elif verification == 'rejected':
            registrations=registrations.filter(verification='Rejected')
        elif verification == 'pending':
            registrations=registrations.filter(verification='Pending')
            
        page_path='event-registrations.html'
        cardtyes=EventCardType.objects.filter(active=True)
    elif table == 'vapp':
        registrations=VappRegistrations.objects.filter(active=True)
        if verification == 'approved':
            registrations=registrations.filter(verification='Approved')
        elif verification == 'rejected':
            registrations=registrations.filter(verification='Rejected')
        elif verification == 'pending':
            registrations=registrations.filter(verification='Pending')
        
        
        page_path='vapp-registrations.html'
        cardtyes=VappCardType.objects.filter(active=True)
    else:
        registrations=BuildRegistrations.objects.filter(active=True)
        page_path='build-registrations.html'
        cardtyes=BuildCardType.objects.filter(active=True)
   
    days=daysTable.objects.filter(active=True)
    
    data={'username':request.user.username,'registrations':registrations,'cardtypes':cardtyes,'days':days}
    return render(request,page_path,data)


def submit_add_registrations(request):
    first_name=request.POST.get('first-name')
    last_name=request.POST.get('last-name')
    company=request.POST.get('company')
    email=request.POST.get('email')
    card_type_id=request.POST.get('card-type')
    mobile=request.POST.get('mobile')
    day_selector=json.loads(request.POST.get('day-selector'))
   
    res={'success':False}
    try:
        cardtype_obj=EventCardType.objects.get(id=card_type_id)
        obj=EventRegistrations.objects.create(first_name=first_name,last_name=last_name,company=company,cardtype=cardtype_obj,email=email,mobile=mobile)
        
        days=daysTable.objects.filter(id__in=day_selector)
        
        obj.days.add(*days)
        obj.save()        
        
        
        res['row']=render_to_string('tables/table-rows/build-registrations-row.html',{'r':obj})
        res['success']=True
        res['id']=obj.id
    except Exception as e:
        res['success']=False

        print(e)
   
    return JsonResponse(res)

####### EDITS STARTS HERE
def get_registration_details(request):
    edit_id=request.GET.get('edit_id')
    
    data={'success':False}
    
    try:


        if getTable(request) == EventRegistrations:

            obj=EventRegistrations.objects.get(id=edit_id)
            cardtypes=EventCardType.objects.filter(active=True).order_by('name')
            days=daysTable.objects.filter(active=True)
            modal_html=render_to_string('includes/edit-models/event-edit-modal-content.html',{"r":obj,'cardtypes':cardtypes,'days':days})
        elif getTable(request) == BuildRegistrations:
            obj=BuildRegistrations.objects.get(id=edit_id)
            cardtypes=BuildCardType.objects.filter(active=True).order_by('name')
            
            modal_html=render_to_string('includes/edit-models/build-edit-modal-content.html',{"r":obj,'cardtypes':cardtypes})
        elif getTable(request) == VappRegistrations:
            obj=VappRegistrations.objects.get(id=edit_id)
            cardtypes=VappCardType.objects.filter(active=True)
            category=VehicleType.objects.filter(active=True)
        
            modal_html=render_to_string('includes/edit-models/vapp-edit-modal-content.html',{"r":obj,'cardtypes':cardtypes,'category':category})

        data['content_html']=modal_html   
        data['success']=True 
        
    except Exception as e:
        print(e)
        data['success']=False
 
    return JsonResponse(data) 
def submit_edit_registration(request):
    
    # name=request.POST.get('name')
    # company=request.POST.get('company')
    # jobtitle=request.POST.get('job-title')
    # cardtype=request.POST.get('card-type')
    # edit_id=request.POST.get('edit-id')
    # print(edit_id)
    
    data={'success':False}
    try:    
        if getTable(request) == EventRegistrations:
            
            first_name=request.POST.get('first-name')
            last_name=request.POST.get('last-name')
            company=request.POST.get('company')
            
            email=request.POST.get('email')
            mobile=request.POST.get('mobile')
            cardtype=request.POST.get('card-type')
            edit_id=request.POST.get('edit-id')
            
            day_selector=json.loads(request.POST.get('day-selector'))
            
            obj=EventRegistrations.objects.filter(id=edit_id)
            obj.update(first_name=first_name,last_name=last_name,company=company,email=email,cardtype=cardtype,updated_at=timezone.now(),mobile=mobile)
            
            instance_obj=obj.first()
            
            days=daysTable.objects.filter(id__in=day_selector)
            instance_obj.days.clear()
            instance_obj.days.add(*days)
        
            
            instance_obj.save()
            
            row=render_to_string(getTableRow(request),{'r':obj.first()})
            
        if getTable(request) == BuildRegistrations:
            
            first_name=request.POST.get('first-name')
            last_name=request.POST.get('last-name')
            company=request.POST.get('company')
            dob=request.POST.get('dob')
            mobile=request.POST.get('mobile')
            email=request.POST.get('email')
            lanyard_color=request.POST.get('lanyard-color')
            
            id_proof_number=request.POST.get('id-proof-number')
            
            id_proof_front=request.FILES.get('id-front-photo')
            id_proof_back=request.FILES.get('id-back-photo')
            
            edit_id=request.POST.get('edit-id')
            cardtype=request.POST.get('card-type')
            
            
            obj=BuildRegistrations.objects.filter(id=edit_id)
            obj.update(first_name=first_name,last_name=last_name,company=company,dob=dob,email=email,cardtype=cardtype,mobile=mobile,updated_at=timezone.now(),id_proof_number=id_proof_number,lanyard_color=lanyard_color)
            
            instance_obj=obj.first()
            
            if id_proof_front != None:
                instance_obj.id_proof_front=id_proof_front
            if id_proof_back != None:
                instance_obj.id_proof_back=id_proof_back
                
            instance_obj.save()
            
            row=render_to_string(getTableRow(request),{'r':obj.first()})

        if getTable(request) == VappRegistrations:
            first_name=request.POST.get('first-name')
            last_name=request.POST.get('last-name')
            company=request.POST.get('company')
            vehicle_number=request.POST.get('vehicle_number')
            mobile=request.POST.get('mobile')
            email=request.POST.get('email')
            category=request.POST.get('vehicle-type')
            card_type=request.POST.get('card-type')
            vehicle_pass=request.FILES.get('vehicle-pass-photo')
            id_proof_front=request.FILES.get('id-front-photo')
            id_proof_back=request.FILES.get('id-back-photo')
            
            
            
            edit_id=request.POST.get('edit-id')

            delivery_from_date=request.POST.get('from-delivery-date')
            delivery_to_date=request.POST.get('to-delivery-date')
            
            obj=VappRegistrations.objects.filter(id=edit_id)
            obj.update(first_name=first_name,last_name=last_name,company=company,vehicle_number=vehicle_number,mobile=mobile,email=email,cardtype=card_type,vehicletype=category,   updated_at=timezone.now(),delivery_to_date=delivery_to_date,delivery_date=delivery_from_date)
            
            instance_obj=obj.first()
            if vehicle_pass != None:
                instance_obj.vehicle_pass=vehicle_pass
            if id_proof_front!=None:
                instance_obj.id_proof_front=id_proof_front
            if id_proof_back!=None:
                instance_obj.id_proof_back=id_proof_back
            instance_obj.save()
            
            row=render_to_string(getTableRow(request),{'r':obj.first()})
            
        data['success']=True
        data['row']=row
    except Exception as e:
        print(e)
        data['success']=False     

    return JsonResponse(data)

def submit_copy_location(request):

    if getTable(request) == EventRegistrations:
        
        reg_id=request.POST.get('reg-id')

        
        res={'success':False}
        
        try:
            
            instance_obj=EventRegistrations.objects.get(id=reg_id)
            instance_obj.id=None

            instance_obj.collected=False
            instance_obj.verification='Pending'
            instance_obj.print_count=0
            instance_obj.save()

            res['success']=True
        except Exception as e:
            res['success']=False
            res['reason']=str(e)
       
        
        
        return JsonResponse(res)
    
    if getTable(request) == VappRegistrations:
        
        reg_id=request.POST.get('reg-id')

        
        res={'success':False}
        
        try:
            
            instance_obj=VappRegistrations.objects.get(id=reg_id)
            instance_obj.id=None

            instance_obj.collected=False
            instance_obj.verification='Pending'
            instance_obj.print_count=0
            instance_obj.save()

            res['success']=True
        except Exception as e:
            res['success']=False
            res['reason']=str(e)
       
        
        
        return JsonResponse(res)
    
def submit_bulk_edit_registration(request):
    
    data={'success':False}
    
    try:
        ids=json.loads(request.POST.get('edit-ids'))
        cardtype_id=request.POST.get('card-type')
        company=request.POST.get('company')
        if getTable(request) == EventRegistrations:
            
            
            registrations=EventRegistrations.objects.filter(id__in=ids)
            if cardtype_id != '0':
                
                cardtype=EventCardType.objects.get(id=cardtype_id)
            
                registrations.update(cardtype=cardtype,updated_at=timezone.now())
            if company != '':
                registrations.update(company=company,updated_at=timezone.now())
        if getTable(request) == BuildRegistrations:
            
            
            registrations=BuildRegistrations.objects.filter(id__in=ids)
            if cardtype_id != '0':
                
                cardtype=BuildCardType.objects.get(id=cardtype_id)
            
                registrations.update(cardtype=cardtype,updated_at=timezone.now())
            if company != '':
                registrations.update(company=company,updated_at=timezone.now())
                
        if getTable(request) == VappRegistrations:
            
            
            registrations=VappRegistrations.objects.filter(id__in=ids)
            if cardtype_id != '0':
                
                cardtype=VappCardType.objects.get(id=cardtype_id)
            
                registrations.update(cardtype=cardtype,updated_at=timezone.now())
            if company != '':
                registrations.update(company=company,updated_at=timezone.now())
                  
        data['success']=True
    except Exception as e:
        print(e)
        data['reason']=str(e)
        data['success']=False    

    return JsonResponse(data)
###### EDITS ENDS HERE

def delete_registrtion(request):
    id=request.POST.get('id')
    
    data={'success':False}
    table=getTable(request)
    
    try:
        
        table.objects.filter(id=id).update(active=False)
        
        data['success']=True
        
    except Exception as e:
        data['success']=False
    
    return JsonResponse(data)
        
def collect_registration(request):
    id=request.POST.get('id')
    
    data={'success':False}
    
    table=getTable(request)
    try:
        obj=table.objects.filter(id=id)

        obj.update(collected=True)
        
        
        row=render_to_string(getTableRow(request),{'r':obj.first()})
        
        
        data['row']=row
        data['success']=True
        
    except Exception as e:
        data['success']=False
    
    return JsonResponse(data)

def change_remark(request):
    id=request.POST.get('id')
    content=request.POST.get('content')
    table=getTable(request)
    table.objects.filter(id=id).update(remark=content,updated_at=timezone.now())
    
    return JsonResponse({})

#changing - print count
def on_change_print_count(request):
    id=request.POST.get('id')
    method=request.POST.get('method')
    
    data={'success':False}
    table=getTable(request)
    try:
        obj=table.objects.get(id=id)
        
        if method=='plus':
            obj.print_count=obj.print_count+1
        if method =='minus':
            # print(obj.print_count)
            if obj.print_count != 0 and obj.print_count != None  and not obj.print_count < 0:
                obj.print_count=obj.print_count-1
            
        obj.save()
        # if table == BuildRegistrations
        row=render_to_string(getTableRow(request),{'r':obj})
        
        data['success']=True
        data['row']=row
    
    except Exception as e:
        
        data['success']=False
        
    return JsonResponse(data)
def on_change_bulk_print_count(request):
    ids=json.loads(request.POST.get('ids'))
    
    table=table=getTable(request)
    objs=table.objects.filter(id__in=ids)
    
    for obj in objs:
        obj.print_count=obj.print_count+1
        obj.save()
        
        
    return JsonResponse({})           
def registration_print_page(request):
    id=request.GET.get('reg-id')
    table=getTable(request)
    
    obj=table.objects.get(id=id)
    
    return render(request,f"print/{obj.cardtype.name}.html",{'registration':obj})

def submit_excel_data(request):
    list_data=json.loads(request.POST.get('data'))
    table=getTable(request)
    # print(list_data)
    instaces=[]
    for i in list_data:
        if len(i) < 4:
            print(i)
            
        try:
            
            company=i[1] if i[1] !=None else '' 
            jobtitle=i[2] if i[2] !=None else '' 
            name=i[0] if i[0] !=None else '' 
            _type=i[3] if i[3] !=None else '' 
            type=EventCardType.objects.filter(name=_type).first()
            
            
            instaces.append(table(name=i[0],company=company,jobtitle=jobtitle,cardtype=type))
        except Exception as e:
            print(i)
            print(e)
            
        
    table.objects.bulk_create(instaces)
    return JsonResponse({})

def get_profile_data(request):
    id=request.GET.get('id')
    table=getTable(request)
    
    obj=table.objects.get(id=id)

    if table == BuildRegistrations:
        profile_view_template='includes/profiles/build-profile-view.html'
    elif table == EventRegistrations:
        profile_view_template='includes/profiles/event-profile-view.html'
    elif table == VappRegistrations:
        profile_view_template='includes/profiles/vapp-profile-view.html'
    html=render_to_string(profile_view_template,{'registration':obj})

    data={'html':html}
    return JsonResponse(data) 
def change_verifcation(request):
    method=request.POST.get('method')
    id=request.POST.get('id')
    data={'success':False}
    table=getTable(request)
    try:
        obj=table.objects.get(id=id)
        obj.verification=method
        
        if table == VappRegistrations:
            obj.delivery_to_date =timezone.now() + timezone.timedelta(days=10)
        
        obj.save()
        
        
        row=render_to_string(getTableRow(request),{'r':obj})
        data['row']=row
        data['success']=True
    except Exception as e:
        data['success']=False
        data['reason']=str(e)
    return JsonResponse(data)


def print_page(request):
    table=request.GET.get('table-name')
    id=request.GET.get('reg-id')
    if table == 'build':
        
        registration=BuildRegistrations.objects.get(id=id)
        return render(request,f"print/build_print/{registration.cardtype.name.replace('|','Or')}.html",{'registration':registration})
    elif table == 'event':
        registration=EventRegistrations.objects.get(id=id)
        
        return render(request,f"print/event_print/{registration.cardtype.name.replace('/','OR')}.html",{'registration':registration})
    elif table == 'vapp':
        registration=VappRegistrations.objects.get(id=id)
        
        # cardtyes=VappCardType.objects.filter(active=True)
        return render(request,f"print/vapp_print/{registration.cardtype.name}.html",{'registration':registration})
    else:
        registration=BuildRegistrations.objects.get(id=id)
        return render(request,f"print/build_print/{registration.cardtype.name}.html",{'registration':registration})

def registration_bulk_print_page(request):
    ids=json.loads(request.GET.get('reg-ids'))
    table=request.GET.get('table-name')
    
    objs=getTable(request).objects.filter(id__in=ids)
    
    if table =='build':
        return render(request,f'print/build_print/bulk_print.html',{'registrations':objs})

    if table =='event':
        return render(request,f'print/event_print/bulk_print.html',{'registrations':objs})
    
    
    if table =='vapp':
        return render(request,f'print/vapp_print/bulk_print.html',{'registrations':objs})

def bulk_collect(request):
    ids=json.loads(request.POST.get('ids'))  
    
    data={'success':False}
    
    try:

        getTable(request).objects.filter(id__in=ids).update(collected=True,updated_at=timezone.now())
        
        data['success']=True
    except Exception as e:
        data['reason']=str(e)
        data['success']=False
           
    return JsonResponse(data)

def send_mail(request):
    method=request.POST.get('method')
    id=request.POST.get('id')
   
    
    if getTable(request) == EventRegistrations:
        registration=EventRegistrations.objects.get(id=id)
        uid='EVP-'+str(registration.id)
    if getTable(request) == BuildRegistrations:
        registration=BuildRegistrations.objects.get(id=id)
        uid='BUP-'+str(registration.id)
    if getTable(request) == VappRegistrations:
        registration=VappRegistrations.objects.get(id=id)
        uid='VAP-'+str(registration.id)

    return JsonResponse({})

    if method == 'Approved':

      
        data={"name":registration.first_name+' '+registration.last_name,'uid':uid,}
        
        html_contect=render_to_string("email/approved.html",data)
        
            
        email_from = settings.EMAIL_HOST_USER
        subject = 'Registration Status – Approved'
        # msg= mail.EmailMultiAlternatives(subject,'From info-events ',email_from,[registration.email])
        # msg.attach_alternative(html_contect,"text/html")
        
        mail.send_mail(subject, strip_tags(html_contect), email_from, [registration.email], html_message=html_contect,fail_silently=False)
    
    if method == 'Rejected':

        reason=request.POST.get('reason')
        print(reason)
        data={"name":registration.first_name+' '+registration.last_name,'reason':reason,'uid':uid}
        html_contect=render_to_string("email/rejected.html",data)
        email_from = settings.EMAIL_HOST_USER
        subject = 'Registration Status – Rejected'
        # msg= mail.EmailMultiAlternatives(subject,'From info-events ',email_from,[registration.email])
        # msg.attach_alternative(html_contect,"text/html")
        
        mail.send_mail(subject, strip_tags(html_contect), email_from, [registration.email], html_message=html_contect,fail_silently=False)
    
    
    return JsonResponse({})
    ids=json.loads(request.GET.get('reg-ids'))


def submit_bulk_upload(request):

    data=json.loads(request.POST.get('data'))
    upload_proof_type=request.POST.get('proof-type')
    table=getTable(request)

    error_ids=[]

    res={'success':True}
    for i in data:

        try:
            if table == EventRegistrations:
                cardtype=EventCardType.objects.get(name=i['card-type'.lower()])
                
            if table == EventRegistrations:
                
                if i['checked']:
                    obj=EventRegistrations(first_name=i['first-name'],
                            last_name=i['last-name'],
                            company=i['company'],
                            cardtype=cardtype,
                            email=i['email'],
                            mobile=i['mobile'])

                    _day_selector=[]
                    for key , value in i['days'].items():
                        if value:
                            _day_selector.append(key)
                        
                    _days=daysTable.objects.filter(name__in=_day_selector)
                    obj.save()
                    obj.days.add(*_days)

                    # bulk_data.append(obj)
         
        except Exception as e:
            print(e)
            res['success']=False
            error_ids.append(i['row-id'])
            
    # table.objects.bulk_create(bulk_data)
    
    res['error_ids']=error_ids
    
    return JsonResponse(res)

#Get latest update 
def get_latest_data(request):
    checktime_range=[timezone.now()-timezone.timedelta(seconds=5),timezone.now()]
    # print(checktime_range)

    updatedQuery=getTable(request).objects.filter(updated_at__range=checktime_range)

    if updatedQuery.exists():
        try:
            updated_ids=updatedQuery.filter(updated_at__range=checktime_range).values_list('id',flat=True)
            updated_rows=[]
            for i in updatedQuery:
                html=render_to_string(getTableRow(request),{'r':i})
                updated_rows.append(html)
        
            data={'ids':list(updated_ids),'rows':updated_rows,'new_data':True} 
        except Exception as e:
            data={'error':str(e),'new_data':False}
        
        return JsonResponse(data)
    
    return JsonResponse({'new_data':False})




# REPORT 
def report(request):

    report_data={}
    
    event=EventRegistrations.objects.filter(active=True)
    build=BuildRegistrations.objects.filter(active=True)
    vapp=VappRegistrations.objects.filter(active=True)
    
    extra_cards_printed=165
    
    report_data['event']={'total_entries':event.count(),'total_accepted':event.filter(verification='Approved').count(),'total_rejected':event.filter(verification='Rejected').count(),'total_printed_count':event.filter(print_count__gt=0).count()}
    
    report_data['build']={'total_entries':build.count(),'total_accepted':build.filter(verification='Approved').count(),'total_rejected':build.filter(verification='Rejected').count(),'total_printed_count':build.filter(print_count__gt=0).count()+extra_cards_printed}
    
    report_data['vapp']={'total_entries':vapp.count(),'total_accepted':vapp.filter(verification='Approved').count(),'total_rejected':vapp.filter(verification='Rejected').count(),'total_printed_count':vapp.filter(print_count__gt=0).count()}
    
    event_categorys=[]
    for evc in EventCardType.objects.filter(active=True):
        event_categorys.append({'name':evc.name,'total_entries':event.filter(cardtype=evc).count(),'total_accepted':event.filter(cardtype=evc).filter(verification='Approved').count(),'total_rejected':event.filter(cardtype=evc).filter(verification='Rejected').count(),'total_printed_count':event.filter(cardtype=evc).filter(print_count__gt=0).count()})
    
    build_categorys=[]
    for buc in BuildCardType.objects.filter(active=True):
        print(buc.id)
        if buc.id == 2:
            print('printed --')
            total_printed=build.filter(cardtype=buc).filter(print_count__gt=0).count()+83
        elif buc.id == 3:
            
            total_printed=build.filter(cardtype=buc).filter(print_count__gt=0).count()+82
        else:    
            total_printed=build.filter(cardtype=buc).filter(print_count__gt=0).count()
        
        
        build_categorys.append({'name':buc.name,'total_entries':build.filter(cardtype=buc).count(),'total_accepted':build.filter(cardtype=buc).filter(verification='Approved').count(),'total_rejected':build.filter(cardtype=buc).filter(verification='Rejected').count(),'total_printed_count':total_printed})
        
    vapp_categorys=[]
    for vac in VappCardType.objects.filter(active=True):
        vapp_categorys.append({'name':vac.name,'total_entries':vapp.filter(cardtype=vac).count(),'total_accepted':vapp.filter(cardtype=vac).filter(verification='Approved').count(),'total_rejected':vapp.filter(cardtype=vac).filter(verification='Rejected').count(),'total_printed_count':vapp.filter(cardtype=vac).filter(print_count__gt=0).count()})
        
        
    report_data['event']['categorys']=event_categorys
    report_data['vapp']['categorys']=vapp_categorys
    report_data['build']['categorys']=build_categorys
    
    data={'report_data':report_data,}
    return render(request,'report.html',data)

    