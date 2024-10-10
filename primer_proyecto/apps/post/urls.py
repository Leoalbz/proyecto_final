from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.urls import path
from .views import Crear_articulo, Actualizar_articulo, Borrar_articulo, mostrar_registros, mostrar_registro_by_id

app_name = 'apps.post'

urlpatterns = [
    path('crear_articulo/', Crear_articulo.as_view(), name='crear_articulo'),
    path('actualizar_articulo/<int:pk>', Actualizar_articulo.as_view(), name='actualizar_articulo'),
    path('eliminar_articulo/<int:pk>', Borrar_articulo.as_view(), name='eliminar_articulo'),
    path('listar_articulo/', mostrar_registros, name='mostrar_articulos'),
    path('mostrar_articulo/<int:pk>', mostrar_registro_by_id, name='mostrar_articulo')
] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)

urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.STATIC_URL, document_root = settings.STATIC_ROOT)
