from django.forms import ModelForm
from django import forms
from .models import *

class ChatMessageCreateForm(ModelForm):
    class Meta:
        model = GroupMessage
        fields = ['body']
        widgets = {
            'body':forms.TextInput(attrs={'placeholder':'Add message','class':'p-4 text-black', 'maxlength':'300','autofocus':True})
        }

class NewGroupForm(ModelForm):
    class Meta:
        model = ChatGroup  # Replace with your actual model name
        fields = ['group_name']  # Replace with actual fields
        