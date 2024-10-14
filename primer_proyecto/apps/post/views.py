from django.urls import reverse, reverse_lazy
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from .models import Articulo
from django.shortcuts import render
from .forms import ComentarioForm
from django.http import HttpResponseForbidden, JsonResponse


# Listar artículos
class ListaArticulos(ListView):
    model = Articulo
    template_name = 'genericos/lista_articulos.html'
    context_object_name = 'articulos'

# Detalles de un artículo
class LeerArticulo(DetailView):
    model = Articulo
    template_name = 'genericos/leer_articulo.html'
    context_object_name = 'articulo'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form'] = ComentarioForm()
        context['comentarios'] = self.object.comentarios.all()
        return context

    def post(self, request, *args, **kwargs):
        self.object = self.get_object()
        form = ComentarioForm(request.POST)

        if form.is_valid():
            comentario = form.save(commit=False)
            comentario.articulo = self.object
            comentario.usuario = request.user
            comentario.save()

            comentarios = self.object.comentarios.all()
            return JsonResponse({
                'success': True,
                'comentarios': [{
                    'contenido': c.contenido,
                    'usuario': c.usuario.username,
                    'fecha_publicacion': c.fecha_publicacion.strftime("%Y-%m-%d %H:%M:%S"),
                } for c in comentarios],
            })

        return JsonResponse({'success': False, 'errors': form.errors})

# Crear un nuevo artículo
class CrearArticulo(CreateView):
    model = Articulo
    template_name = 'genericos/crear_articulo.html'
    fields = ['titulo', 'contenido', 'imagen', 'lenguaje']
    success_url = reverse_lazy('post:lista_articulos')

    def form_valid(self, form):
        form.instance.autor = self.request.user
        return super().form_valid(form)

# Actualizar un artículo existente
class ActualizarArticulo(UpdateView):
    model = Articulo
    template_name = 'genericos/actualizar_articulo.html'
    fields = ['titulo', 'contenido', 'imagen', 'lenguaje']

    def dispatch(self, request, *args, **kwargs):
        # Verifica si el usuario es el creador del artículo
        articulo = self.get_object()
        if articulo.autor != self.request.user:
            return HttpResponseForbidden("No tienes permiso para editar este artículo.")
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse('post:leer_articulo', kwargs={'pk': self.object.pk})
# Eliminar un artículo
class EliminarArticulo(DeleteView):
    model = Articulo
    template_name = 'genericos/eliminar_articulo.html'
    success_url = reverse_lazy('post:lista_articulos')

    def dispatch(self, request, *args, **kwargs):
        # Verifica si el usuario es el creador del artículo
        articulo = self.get_object()
        if articulo.autor != self.request.user:
            return HttpResponseForbidden("No tienes permiso para eliminar este artículo.")
        return super().dispatch(request, *args, **kwargs)

# Filtrar categorias
def categoria_view(request):
    lenguaje = request.GET.get('lenguaje')
    articulos = Articulo.objects.filter(lenguaje=lenguaje) if lenguaje else Articulo.objects.all()
    return render(request, 'post/nav_bar.html', {'articulos': articulos})

# Vista index
class Index(ListView):
    model = Articulo
    template_name = 'index.html'
    context_object_name = 'articulos'

# Vistas de lenguajes
def php_view(request):
    articulos = Articulo.objects.filter(lenguaje='PHP')
    return render(request, 'post/php.html', {'articulos': articulos})

def python_view(request):
    articulos = Articulo.objects.filter(lenguaje='Python')
    return render(request, 'post/python.html', {'articulos': articulos})

def java_view(request):
    articulos = Articulo.objects.filter(lenguaje='Java')
    return render(request, 'post/java.html', {'articulos': articulos})

def javascript_view(request):
    articulos = Articulo.objects.filter(lenguaje='JavaScript')
    return render(request, 'post/javascript.html', {'articulos': articulos})

          