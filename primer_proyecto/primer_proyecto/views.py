# Aqwí se codificarán las vistas del proyecto
from django.views.generic import ListView
from apps.post.models import Articulo

# Vista index
class HomeView(ListView):
    model = Articulo
    template_name = 'index.html'
    context_object_name = 'articulos'