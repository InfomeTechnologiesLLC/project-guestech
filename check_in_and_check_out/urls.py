
from django.urls import path
from check_in_and_check_out import views 
urlpatterns = [
    path('volunteer',views.volunteer_page,name='volunteer-page'),
    path('admin',views.admin_page,name='admin-page')
]
