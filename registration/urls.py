from django.urls import path
from . import views
urlpatterns = [
path('',views.root,name='registration-root-page'),
path('build-registration',views.build_registration_page,name='build-registration'),
path('event-registration',views.event_registration_page,name='event-registration'),
path('vapp-registration',views.vapp_registration_page,name='vapp-registration'),
path('root-demo',views.root_demo,name='root-demo'),
path('registration-success',views.registration_success_page,name='success-page'),


path('event-registration-submission',views.submit_event_registration,name='event-registration-submission'),
path('build-registration-submission',views.submit_build_registration,name='build-registration-submission'),
path('vapp-registration-submission',views.submit_vapp_registration,name='vapp-registration-submission'),



path('email-success-ajax',views.send_success_mail,name='email-success-ajax'),

path('mail-testing',views.test_mail)
]
