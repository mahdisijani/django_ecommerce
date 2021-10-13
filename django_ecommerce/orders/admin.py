from django.contrib import admin
from .models import *
# Register your models here.

# admin.site.register(Order)
admin.site.register(Cart)
admin.site.register(OrderItem)
admin.site.register(Payment)
admin.site.register(Coupon)

#product extra images
class OrderItemInline(admin.TabularInline):
    model = OrderItem
    exclude=['cart',]

class OrderAdmin(admin.ModelAdmin):
   inlines = [OrderItemInline,]

admin.site.register(Order,OrderAdmin)