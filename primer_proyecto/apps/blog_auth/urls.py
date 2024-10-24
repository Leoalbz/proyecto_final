from django.urls import path
from .views import InicioSesion, CerrarSesion, Registro

app_name = 'blog_auth'

urlpatterns = [
    path('login/', InicioSesion.as_view(), name='iniciar_sesion'),
    path('logout/', CerrarSesion.as_view(), name='cerrar_sesion'),
    path('register/', Registro.as_view(), name='registrarse'),
]
