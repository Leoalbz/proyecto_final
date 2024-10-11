from django.urls import path
from django.conf import settings
from .views import SignUpView, SignInView


app_name = 'apps.blog_auth'


urlpatterns = [
    path("registrarse/", SignUpView.as_view(), name="registracion"),
    path("iniciar_sesion/", SignInView.as_view(), name="iniciar_sesion")
]