from django.db.models.query import QuerySet
from django.urls import reverse_lazy
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from .models import Articulo
from django.shortcuts import render

# Listar artículos
class ListaArticulos(ListView):
    model = Articulo
    template_name = 'genericos/lista_articulos.html'
    context_object_name = 'articulos'

    def get_queryset(self) -> QuerySet[any]:
        return super().get_queryset()

# Detalles de un artículo
class LeerArticulo(DetailView):
    model = Articulo
    template_name = 'genericos/leer_articulo.html'
    context_object_name = 'articulo'

# Crear un nuevo artículo
class CrearArticulo(CreateView):
    model = Articulo
    template_name = 'genericos/crear_articulo.html'
    fields = ['titulo', 'contenido', 'imagen', 'lenguaje']
    success_url = reverse_lazy('post:lista_articulos')

# Actualizar un artículo existente
class ActualizarArticulo(UpdateView):
    model = Articulo
    template_name = 'genericos/actualizar_articulo.html'
    fields = ['titulo', 'contenido']
    success_url = reverse_lazy('post:lista_articulos')

# Eliminar un artículo
class EliminarArticulo(DeleteView):
    model = Articulo
    template_name = 'genericos/eliminar_articulo.html'
    success_url = reverse_lazy('post:lista_articulos')

# Filtrar categorias
def categoria_view(request):
    categoria = request.GET.get('categoria')
    articulos = Articulo.objects.filter(categoria=categoria) if categoria else Articulo.objects.all()
    return render(request, 'post/categoria.html', {'articulos': articulos})

# Vistas de lenguajes
def php_view(request):
    # Lógica para PHP
    return render(request, 'post/php.html')

def python_view(request):
    # Lógica para Python
    return render(request, 'post/python.html')

def java_view(request):
    # Lógica para Java
    return render(request, 'post/java.html')

def javascript_view(request):
    # Lógica para JavaScript
    return render(request, 'post/javascript.html')