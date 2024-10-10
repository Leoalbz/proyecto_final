# Aqwí se codificarán las vistas del proyecto
from django.views.generic import TemplateView

class HomeView(TemplateView):
    template_name = 'index.html'
    