
from django.urls import path
from check_in_and_check_out import views 
urlpatterns = [
    path('volunteer',views.volunteer_page,name='volunteer-page'),
    path('check-in-and-check-out-entry',views.check_in_and_check_out_entry,name='check-in-and-check-out-entry'),
    path('get-latest-data-dashboard',views.get_latest_dashboard_data,name='get-latest-data-dashboard'),
    
    path('admin-dashboard',views.admin_dashboards_page,name='admin-dashboard-page'),
    path('get-latest-admin-dashboard',views.get_admin_dashboard_latest_data,name='get-latest-admin-dashboard-page'),
    path('add-room-in-dashboard',views.add_room,name='add-room-in-dashboard'),
    
    path('report/<int:room_id>',views.check_in_out_list_page,name='check-in-and-out-report-page')
]
