from django.contrib import admin
from .models import Articulo, Comentario, Contacto

# Personalizar la administración para el modelo `Articulo`
class ArticuloAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'fecha_publicacion')  # Mostrar estos campos en la lista
    search_fields = ('titulo',)  # Habilitar búsqueda por título

# Registrar el modelo `Articulo` con la personalización
admin.site.register(Articulo, ArticuloAdmin)
admin.site.register(Contacto)

@admin.register(Comentario)
class ComentarioAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'contenido', 'fecha_publicacion', 'articulo')
    search_fields = ('usuario__username', 'contenido')