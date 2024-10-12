from django.db import models

class Articulo(models.Model):
    titulo = models.CharField(max_length=100)
    contenido = models.TextField()
    fecha_publicacion = models.DateTimeField(auto_now_add=True)
    imagen = models.ImageField(upload_to='articulos/', blank=True, null=True)

    def __str__(self):
        return self.titulo
    
    class Meta:
        ordering = ('fecha_publicacion',)

 