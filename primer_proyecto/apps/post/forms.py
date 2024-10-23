from django import forms
from .models import Comentario

class ComentarioForm(forms.ModelForm):
    class Meta:
        model = Comentario
        fields = ['contenido']
        labels = {
            'contenido': ''
        }
        widgets = {
            'contenido': forms.Textarea(attrs={
                'class': 'form-control comment-box rounded',
                'rows': 2,
                'placeholder': 'Agregar un comentario',
                'style': 'border: 2px solid #85929e;'
            }),
        }