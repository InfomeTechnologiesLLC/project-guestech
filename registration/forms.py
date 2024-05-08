from django.forms import ModelForm
from portal.models import EventRegistrations

class EventRegistrationForm(ModelForm):
    class Meta:
        model=EventRegistrations
        fields=['first_name',
                'last_name',
                'company',
                'email',
                'mobile',
                'dob',
                'cardtype',
                'nationality',
                'id_proof_expiry',
                'id_proof_type',
                'id_proof_number',
                'id_proof_front',
                'id_proof_back',
                'badge_photo']