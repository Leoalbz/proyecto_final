
# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic import FormView
from django.contrib.auth.views import LoginView
from django.urls import reverse_lazy

from .forms import SignUpForm

class SignUpView(FormView):
    template_name = "users/registrarse.html"
    form_class = SignUpForm
    success_url = reverse_lazy("apps.blog_auth:login")

    def form_valid(self, form):
        form.save()
        return super().form_valid(form)
    


class SignInView(LoginView):
    template_name = 'users/iniciar_sesion.html'

