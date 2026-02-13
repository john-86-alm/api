from django.db import models

class Contact(models.Model):
    number = models.PositiveIntegerField(unique=True)
    location = models.CharField(max_length=100, blank=True)
    user = models.CharField(max_length=150, blank=True)
    group = models.CharField(max_length=100, blank=True)

    def __str__(self):
        return f"{self.number} - {self.user} - {self.location} - {self.group}"
