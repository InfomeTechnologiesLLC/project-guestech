
from django import template 
import os
register = template.Library() 
  
  
@register.filter() 
def check_is_pdf(file):
    
    _name , extension  = os.path.splitext(file.name)
    
    if extension == '.pdf':
        return True
    else:
        return False

@register.filter()
def check_day_attended(day,registration):

    if day.entries.filter(registration = registration).exists():
        return True
    else:
        return False
