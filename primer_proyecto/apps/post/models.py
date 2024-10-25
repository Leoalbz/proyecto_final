from django.db import models
from django.contrib.auth.models import User

class Articulo(models.Model):
    titulo = models.CharField(max_length=100)
    imagen = models.ImageField(upload_to='articulos', null=True, blank=True)
    contenido = models.TextField()
    lenguaje = models.CharField(max_length=20)
    autor = models.ForeignKey(User, on_delete=models.CASCADE)
    fecha_publicacion = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.titulo
    class Meta:
        ordering = ('fecha_publicacion',)

class Comentario(models.Model):
    articulo = models.ForeignKey(Articulo, related_name='comentarios', on_delete=models.CASCADE)  # Asegúrate de que 'Articulo' sea el modelo correcto
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    contenido = models.TextField()
    fecha_publicacion = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.usuario.username}: {self.contenido}"

class Contacto(models.Model):
    nombre = models.CharField(max_length = 30)
    apellido = models.CharField(max_length = 50)
    email = models.EmailField(max_length=100)
    mensaje = models.TextField()
    fecha_contacto = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f'Mensaje de {self.nombre} {self.apellido}'