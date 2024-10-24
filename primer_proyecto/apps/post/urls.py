from django.urls import path
from .views import EditarComentario, EliminarComentario, ListaArticulos, LeerArticulo, CrearArticulo, ActualizarArticulo, EliminarArticulo, categoria_view, listar_comentarios, php_view, python_view, java_view, javascript_view, RequestDeContacto

app_name = 'post'

urlpatterns = [
    path('articulos/', ListaArticulos.as_view(), name='lista_articulos'),
    path('<int:pk>/', LeerArticulo.as_view(), name='leer_articulo'),
    path('crear/', CrearArticulo.as_view(), name='crear_articulo'),
    path('<int:pk>/editar/', ActualizarArticulo.as_view(), name='actualizar_articulo'),
    path('<int:pk>/eliminar/', EliminarArticulo.as_view(), name='eliminar_articulo'),
    path('categoria/', categoria_view, name='categoria_view'),
    path('php/', php_view, name='php_view'),
    path('python/', python_view, name='python_view'),
    path('java/', java_view, name='java_view'),
    path('javascript/', javascript_view, name='javascript_view'),
    path('comentarios/editar/<int:pk>/', EditarComentario.as_view(), name='editar_comentario'),
    path('comentarios/eliminar/<int:pk>/', EliminarComentario.as_view(), name='eliminar_comentario'),
    path('comentarios/listar/', listar_comentarios, name='listar_comentarios'),
    path('contacto/', RequestDeContacto.as_view(), name='contacto')
]