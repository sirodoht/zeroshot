from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils.translation import gettext_lazy as _


class User(AbstractUser):
    first_name = None
    last_name = None
    email = models.EmailField(_("email address"), blank=True, unique=True)
    about = models.CharField(max_length=1000, blank=True, null=True)

    def __str__(self):
        return self.username
