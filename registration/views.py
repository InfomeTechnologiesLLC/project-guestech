

from django.shortcuts import render , redirect
from portal.models import EventCardType ,BuildCardType , VappCardType ,EventRegistrations ,BuildRegistrations,VappRegistrations ,VehicleType
from registration.forms import EventRegistrationForm
from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from django.http import JsonResponse
from django.core import mail 
from django.utils.html import strip_tags
from project_guesttech import settings
from django.http import HttpResponse
from django.template.loader import render_to_string
def root(request):
    # return render(request,'root-demo.html')
    return redirect('login')

def build_registration_page(request):
    build_types=BuildCardType.objects.filter(active=True,show_in_form=True)
    event_types=EventCardType.objects.filter(active=True,show_in_form=True)
     
    context={'build_cards':build_types,'event_cards':event_types}
    
    return render(request,'build-registration-demo.html',context)

def event_registration_page(request):
    event_types=EventCardType.objects.filter(active=True,show_in_form=True)
    
    context={'event_cards':event_types}
    
    return render(request,'event-registration-demo.html',context)

def vapp_registration_page(request):
    vapp_types=VappCardType.objects.filter(active=True,show_in_form=True)
    vehicle_types=VehicleType.objects.filter(active=True)
    
    context={'vapp_cards':vapp_types,'vehicle_types':vehicle_types}
    
    return render(request,'vapp-registration-demo.html',context)

def registration_success_page(request):
    return render(request,'success-page.html')

def submit_event_registration(request):
    
    first_name=request.POST.get('first-name')
    last_name=request.POST.get('last-name')
    mobile=request.POST.get('mobile')
    email=request.POST.get('email')
    date_of_birth=request.POST.get('date-of-birth')
    
    company=request.POST.get('company')
    nationality=request.POST.get('nationality')
    id_proof_type=request.POST.get('id-proof-type')
    id_proof_number=request.POST.get('id-proof-number')
    id_proof_expiry=request.POST.get('id-expiry-date')

    card_type_id=request.POST.get('card-type')
    
    id_proof_front=request.FILES.get('id-proof-front-file')
    id_proof_back=request.FILES.get('id-proof-back-file')
    badge_photo=request.FILES.get('badge-photo-file')
    
            
    data={'success':False}
    try:


        cardType=EventCardType.objects.get(id=card_type_id)
        obj=EventRegistrations.objects.create(first_name=first_name,last_name=last_name,mobile=mobile,email=email,dob=date_of_birth,id_proof_expiry=id_proof_expiry,
                                        nationality=nationality,id_proof_number=id_proof_number,badge_photo=badge_photo,company=company,id_proof_type=id_proof_type,id_proof_front=id_proof_front,id_proof_back=id_proof_back,cardtype=cardType)
        data['success']=True
        data['id']=obj.id
    except Exception as e:
        data['success']=False
        data['reason']=str(e)

    return JsonResponse(data)

def submit_vapp_registration(request):
    
    first_name=request.POST.get('first-name')
    last_name=request.POST.get('last-name')
    email=request.POST.get('email')
    vehicle_number=request.POST.get('vehicle-plate-number')
    mobile=request.POST.get('mobile')
    company=request.POST.get('company')
    cardtype_id=request.POST.get('card-type')
    vehicletype_id=request.POST.get('vehicle-type')

    
    id_proof_front=request.FILES.get('id-proof-front-file')
    id_proof_back=request.FILES.get('id-proof-back-file')
    vehicle_pass=request.FILES.get('vehicle-pass')
    delivery_date=request.POST.get('delivery-date')

    data={'success':False}
    
    try:
        
        cardtype=VappCardType.objects.get(id=cardtype_id)
        vehicletype=VehicleType.objects.get(id=vehicletype_id)
        
        obj=VappRegistrations.objects.create(first_name=first_name,last_name=last_name,company=company,email=email,vehicletype=vehicletype,mobile=mobile,cardtype=cardtype,id_proof_front=id_proof_front,id_proof_back=id_proof_back,vehicle_pass=vehicle_pass,vehicle_number=vehicle_number,
                                        delivery_to_date=delivery_date,delivery_date=delivery_date)
        data['success']=True
        data['id']=obj.id
    except Exception as e:
        data['success']=False
        data['reason']=str(e)
        
    return JsonResponse(data)

def submit_build_registration(request):
    first_name=request.POST.get('first-name')
    last_name=request.POST.get('last-name')
    mobile=request.POST.get('mobile')
    email=request.POST.get('email')
    date_of_birth=request.POST.get('date-of-birth')
    company=request.POST.get('company')
    nationality=request.POST.get('nationality')
    id_proof_type=request.POST.get('id-proof-type')
    id_proof_number=request.POST.get('id-proof-number')
    id_proof_expiry=request.POST.get('id-expiry-date')

    card_type_id=request.POST.get('card-type')
    
    id_proof_front=request.FILES.get('id-proof-front-file')
    id_proof_back=request.FILES.get('id-proof-back-file')
    badge_photo=request.FILES.get('badge-photo-file')
    
    event_card_type_id=request.POST.get('event-card-type')

    need_event_pass=request.POST.get('needEventPass')

    data={'success':False}
    try:
        
        buildcardType=BuildCardType.objects.get(id=card_type_id)
            
        obj=BuildRegistrations.objects.create(first_name=first_name,last_name=last_name,mobile=mobile,email=email,company=company,
                                                dob=date_of_birth,cardtype=buildcardType,id_proof_expiry=id_proof_expiry,id_proof_number=id_proof_number,id_proof_type=id_proof_type,id_proof_front=id_proof_front,id_proof_back=id_proof_back)
        
        
        if need_event_pass == 'Yes':
        
      
                
            EventcardType=EventCardType.objects.get(id=event_card_type_id)
            EventRegistrations.objects.create(first_name=first_name,last_name=last_name,mobile=mobile,email=email,dob=date_of_birth,id_proof_expiry=id_proof_expiry,
                                                nationality=nationality,id_proof_number=id_proof_number,badge_photo=badge_photo,company=company,id_proof_type=id_proof_type,id_proof_front=id_proof_front,id_proof_back=id_proof_back,cardtype=EventcardType)
            
        data['success']=True
        data['id']=obj.id
        
    except Exception as e:
        data['success']=False
        data['reason']=str(e)
        
    return JsonResponse(data)

def send_success_mail(request):
    id=request.POST.get('id')
    table=request.POST.get('table-name')

    if table == 'event':
        registration=EventRegistrations.objects.get(id=id)    
        uid='EVP-'+str(registration.id)
        
    if table == 'build':
        registration=BuildRegistrations.objects.get(id=id)    
        uid='BUP-'+str(registration.id)
    
    if table == 'vapp':
        registration=VappRegistrations.objects.get(id=id)    
        uid='VAP-'+str(registration.id)
        
    try:
        validate_email(registration.email)
    except ValidationError as e:
        print("bad email, details:", e)
    else:
        data={"name":registration.first_name+' '+registration.last_name,'uid':uid}
        _html=render_to_string("email/success.html",data)
        
        email_from = settings.EMAIL_HOST_USER
        subject = 'Registration Status – Pending'
        # msg= mail.EmailMultiAlternatives(subject,'From info-events ',email_from,[registration.email])
        # msg.attach_alternative(html_contect,"text/html")
        
        mail.send_mail(subject, strip_tags(_html), email_from, [registration.email], html_message=_html,fail_silently=False)
        # msg.send()
        #print('Succes mail sended')
    return JsonResponse({})

def test_mail(request):
    res=''
    try:
        validate_email('mansoordev000@gmail.com')
        res='good mail'
    except ValidationError as e:
        res=str(e)
        print("bad email, details:", e)
    else:
        data={"name":"mansoor"+' '+'k','uid':'test uid'}
        _html=render_to_string("email/success.html",data)
        
        email_from = settings.EMAIL_HOST_USER
        subject = 'Registration Status – Pending ( TESTING ) '
        # msg= mail.EmailMultiAlternatives(subject,'From info-events ',email_from,[registration.email])
        # msg.attach_alternative(html_contect,"text/html")
        
        mail.send_mail(subject, strip_tags(_html), email_from, ['mansoordev000@gmail.com'], html_message=_html,fail_silently=False)
        # msg.send()
        #print('Succes mail sended')
        res+='n/ success'
    return HttpResponse(res)



def root_demo(request):
    return render(request,'root-demo.html')