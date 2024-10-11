from django.contrib.auth.mixins import UserPassesTestMixin
from django.contrib import messages
from django.shortcuts import redirect

class CustomTestMixin(UserPassesTestMixin):
    def test_func(self):
        return self.request.user.is_staff
    
    def handle_no_permission(self) :
        messages.error(self.request, "No tenes permiso para acceder a esta vista")
        return redirect('index')