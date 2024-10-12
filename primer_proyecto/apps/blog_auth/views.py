
# Create your views here.
from django.http import HttpResponse, Http404
from django.shortcuts import render, get_object_or_404
from django.views.generic import FormView, UpdateView
from django.contrib.auth.views import LoginView, LogoutView
from django.urls import reverse_lazy
from django.contrib.auth.models import User
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib import messages

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

class EditarPerfil(LoginRequiredMixin ,UpdateView):
    model = User
    form_class = SignUpForm
    template_name = 'users/registrarse.html'
    success_url = reverse_lazy('inicio')  

    def get_object(self, queryset=None):
            return get_object_or_404(User, pk=self.request.user.pk)

    def dispatch(self, request, *args, **kwargs):
        user_id = self.kwargs.get('pk')
        if str(user_id) != str(request.user.pk):
            raise Http404("No tienes permiso para editar este perfil.")
        return super().dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        messages.success(self.request, "Perfil actualizado correctamente.")
        return super().form_valid(form)