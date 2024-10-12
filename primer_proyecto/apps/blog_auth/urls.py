from django.urls import path
from django.conf import settings
from .views import SignUpView, SignInView, EditarPerfil
from django.contrib.auth.views import LogoutView


app_name = 'apps.blog_auth'


urlpatterns = [
    path("registrarse/", SignUpView.as_view(), name="registracion"),
    path("iniciar_sesion/", SignInView.as_view(), name="iniciar_sesion"),
    path("cerrar_sesion/", LogoutView.as_view(), name='cerrar_sesion'),
    path("editar_perfil/<int:pk>", EditarPerfil.as_view(), name='editar_perfil')
]