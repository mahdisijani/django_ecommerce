from .views import *
from django.urls import path

app_name = 'products'

urlpatterns = [
    # first argument is the url prefix,
    path('', index, name='index'),
    path('product/<int:product_id>/', product, name='product'),
    path('products_category/<int:category_id>/', products_category, name='products_category'),
    path('products_tag/<int:tag_id>/', products_tag, name='products_tag'),
    path('products/', products, name='products'),
    # path('class_list', ClassView.as_view(), name='class_list'),
    # path('class/<int:class_id>/', class_details, name='class_details'),
    # path('student_list', StudentView.as_view(), name='student_list'),
    # path('create_student/', create_student, name='create_student'),
    
    # path('take_courses/<int:std_id>/', take_courses, name='take_courses'),
    # path('login/', user_login, name='login'),
    # path('user_register/', user_register, name='user_register'),
    
]
