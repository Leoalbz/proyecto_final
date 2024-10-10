from django.shortcuts import render
from django.urls import reverse_lazy
from .models import php
from django.views.generic.edit import CreateView, UpdateView, DeleteView

# Create your views here.

def mostrar_articulos(request):
 articulo = php.objects.all()
 context = {
  'articulo' : articulo
 }
 template_name = 'php/listar_articulos.html'
 return render(request, template_name=template_name, context=context)

def mostrar_articulos_by_id(request, id):
  articulo = php.objects.get(id = id)
  context = {
  'articulo' : articulo
 }
  template_name = 'php/detalle_articulo.html'
  return render(request, template_name=template_name, context=context)


class Crear_articulo(CreateView):
   model = php
   fields = ['nombre_articulo' , 'descripcion_articulo', 'articulo', 'imagen']
   template_name = 'php/agregar_articulo.html'
   success_url = reverse_lazy('inicio')

class Actualizar_articulo(UpdateView):
  model = php
  fields = ['nombre_articulo' , 'descripcion_articulo', 'articulo', 'imagen']
  template_name = 'php/agregar_articulo.html'
  success_url = reverse_lazy('inicio')

class Borrar_articulo(DeleteView):
  model = php
  template_name = 'php/eliminar_articulo.html'
  success_url = reverse_lazy('inicio')

