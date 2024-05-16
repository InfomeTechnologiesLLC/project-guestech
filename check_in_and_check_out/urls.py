
from django.urls import path
from check_in_and_check_out import views 
urlpatterns = [
    path('volunteer',views.volunteer_page,name='volunteer-page'),
    path('check-in-and-check-out-entry',views.check_in_and_check_out_entry,name='check-in-and-check-out-entry'),
    path('get-latest-data-dashboard',views.get_latest_dashboard_data,name='get-latest-data-dashboard'),
    path('admin',views.admin_page,name='admin-page')
]
