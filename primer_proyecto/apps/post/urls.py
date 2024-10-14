from django.urls import path
from .views import ListaArticulos, LeerArticulo, CrearArticulo, ActualizarArticulo, EliminarArticulo, Index, categoria_view, php_view, python_view, java_view, javascript_view

app_name = 'post'

urlpatterns = [
    path('', Index.as_view(), name='index'),
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
]
 