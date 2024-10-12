from django.contrib import admin
from .models import Articulo

# Personalizar la administración para el modelo `Articulo`
class ArticuloAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'fecha_publicacion')  # Mostrar estos campos en la lista
    search_fields = ('titulo',)  # Habilitar búsqueda por título

# Registrar el modelo `Articulo` con la personalización
admin.site.register(Articulo, ArticuloAdmin)
