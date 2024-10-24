from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.views import View
from .forms import RegistroForm

class InicioSesion(View):
    def get(self, request):
        return render(request, 'users/iniciar_sesion.html')
    def post(self, request):
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        
        if user is not None:
            login(request, user)
            return redirect('index')
        else:
            messages.error(request, 'Usuario o contraseña incorrectos.')
            return render(request, 'users/iniciar_sesion.html')  

class CerrarSesion(View):
    def get(self, request):
        logout(request)
        return redirect('index')

class Registro(View):
    def get(self, request):
        form = RegistroForm()
        return render(request, 'users/registrarse.html', {'form': form})

    def post(self, request):
        form = RegistroForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            messages.success(request, 'Registro exitoso. ¡Bienvenido!')
            return redirect('index')
        else:
            messages.error(request, 'Error en el registro. Por favor corrige los errores.')
            return render(request, 'users/registrarse.html', {'form': form}) 
