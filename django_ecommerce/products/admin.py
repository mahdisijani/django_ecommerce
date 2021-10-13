from django.contrib import admin
from .models import *
# Register your models here.


admin.site.register(Discount)
admin.site.register(Tag)
admin.site.register(Category)

#product extra images
class ImagesInline(admin.TabularInline):
    model = ProductImage

class ProductAdmin(admin.ModelAdmin):
   inlines = [ImagesInline,]

admin.site.register(Product,ProductAdmin)