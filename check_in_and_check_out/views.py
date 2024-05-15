from django.shortcuts import render

# Create your views here.

def volunteer_page(request):
    return render(request,'volunteer-page.html')
def admin_page(request):
    return render(request,'admin-page.html')