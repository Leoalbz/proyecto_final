from django.db import models

# Create your models here.


class php(models.Model):
    nombre_articulo = models.CharField(max_length=30, null = False, unique=True)
    descripcion_articulo = models.TextField() 
    articulo = models.TextField()
    imagen = models.ImageField(null=False, blank= True, upload_to='php')
    fecha_agregado = models.DateTimeField(auto_now_add = True)
    
    def __str__(self):
        return self.nombre_articulo
    
    class Meta:
        ordering = ('fecha_agregado',)