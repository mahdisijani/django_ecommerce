PGDMP         $            	    y            mydb    13.1    13.1 ?               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    98652    mydb    DATABASE     h   CREATE DATABASE mydb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1256';
    DROP DATABASE mydb;
                postgres    false            ?            1259    98653 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            ?            1259    98656    auth_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    200                        0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    201            ?            1259    98658    auth_group_permissions    TABLE     ?   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            ?            1259    98661    auth_group_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    202            !           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    203            ?            1259    98663    auth_permission    TABLE     ?   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            ?            1259    98666    auth_permission_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    204            "           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    205            ?            1259    98668    customers_address    TABLE     ?   CREATE TABLE public.customers_address (
    id bigint NOT NULL,
    city character varying(50) NOT NULL,
    address character varying(1000) NOT NULL,
    postalcode character varying(10) NOT NULL,
    user_id bigint
);
 %   DROP TABLE public.customers_address;
       public         heap    postgres    false            ?            1259    98674    customers_address_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.customers_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.customers_address_id_seq;
       public          postgres    false    206            #           0    0    customers_address_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.customers_address_id_seq OWNED BY public.customers_address.id;
          public          postgres    false    207            ?            1259    98676    customers_user    TABLE       CREATE TABLE public.customers_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    mobile character varying(20)
);
 "   DROP TABLE public.customers_user;
       public         heap    postgres    false            ?            1259    98682    customers_user_groups    TABLE     ?   CREATE TABLE public.customers_user_groups (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);
 )   DROP TABLE public.customers_user_groups;
       public         heap    postgres    false            ?            1259    98685    customers_user_groups_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.customers_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.customers_user_groups_id_seq;
       public          postgres    false    209            $           0    0    customers_user_groups_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.customers_user_groups_id_seq OWNED BY public.customers_user_groups.id;
          public          postgres    false    210            ?            1259    98687    customers_user_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.customers_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.customers_user_id_seq;
       public          postgres    false    208            %           0    0    customers_user_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.customers_user_id_seq OWNED BY public.customers_user.id;
          public          postgres    false    211            ?            1259    98689    customers_user_user_permissions    TABLE     ?   CREATE TABLE public.customers_user_user_permissions (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);
 3   DROP TABLE public.customers_user_user_permissions;
       public         heap    postgres    false            ?            1259    98692 &   customers_user_user_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.customers_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.customers_user_user_permissions_id_seq;
       public          postgres    false    212            &           0    0 &   customers_user_user_permissions_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.customers_user_user_permissions_id_seq OWNED BY public.customers_user_user_permissions.id;
          public          postgres    false    213            ?            1259    98694    django_admin_log    TABLE     ?  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            ?            1259    98701    django_admin_log_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    214            '           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    215            ?            1259    98703    django_content_type    TABLE     ?   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            ?            1259    98706    django_content_type_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    216            (           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    217            ?            1259    98708    django_migrations    TABLE     ?   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            ?            1259    98714    django_migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    218            )           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    219            ?            1259    98716 ,   django_rest_passwordreset_resetpasswordtoken    TABLE       CREATE TABLE public.django_rest_passwordreset_resetpasswordtoken (
    created_at timestamp with time zone NOT NULL,
    key character varying(64) NOT NULL,
    ip_address inet,
    user_agent character varying(256) NOT NULL,
    user_id bigint NOT NULL,
    id integer NOT NULL
);
 @   DROP TABLE public.django_rest_passwordreset_resetpasswordtoken;
       public         heap    postgres    false            ?            1259    98722 3   django_rest_passwordreset_resetpasswordtoken_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_rest_passwordreset_resetpasswordtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.django_rest_passwordreset_resetpasswordtoken_id_seq;
       public          postgres    false    220            *           0    0 3   django_rest_passwordreset_resetpasswordtoken_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.django_rest_passwordreset_resetpasswordtoken_id_seq OWNED BY public.django_rest_passwordreset_resetpasswordtoken.id;
          public          postgres    false    221            ?            1259    98724    django_session    TABLE     ?   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            ?            1259    98730    orders_cart    TABLE     ?   CREATE TABLE public.orders_cart (
    id bigint NOT NULL,
    device character varying(200),
    coupon_id bigint,
    user_id bigint
);
    DROP TABLE public.orders_cart;
       public         heap    postgres    false            ?            1259    98733    orders_cart_id_seq    SEQUENCE     {   CREATE SEQUENCE public.orders_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.orders_cart_id_seq;
       public          postgres    false    223            +           0    0    orders_cart_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.orders_cart_id_seq OWNED BY public.orders_cart.id;
          public          postgres    false    224            ?            1259    98735    orders_coupon    TABLE     _  CREATE TABLE public.orders_coupon (
    id bigint NOT NULL,
    code character varying(50) NOT NULL,
    percentage smallint NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    status character varying(50) NOT NULL,
    CONSTRAINT orders_coupon_percentage_check CHECK ((percentage >= 0))
);
 !   DROP TABLE public.orders_coupon;
       public         heap    postgres    false            ?            1259    98739    orders_coupon_id_seq    SEQUENCE     }   CREATE SEQUENCE public.orders_coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.orders_coupon_id_seq;
       public          postgres    false    225            ,           0    0    orders_coupon_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.orders_coupon_id_seq OWNED BY public.orders_coupon.id;
          public          postgres    false    226            ?            1259    98741    orders_coupon_user    TABLE     ?   CREATE TABLE public.orders_coupon_user (
    id integer NOT NULL,
    coupon_id bigint NOT NULL,
    user_id bigint NOT NULL
);
 &   DROP TABLE public.orders_coupon_user;
       public         heap    postgres    false            ?            1259    98744    orders_coupon_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.orders_coupon_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.orders_coupon_user_id_seq;
       public          postgres    false    227            -           0    0    orders_coupon_user_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.orders_coupon_user_id_seq OWNED BY public.orders_coupon_user.id;
          public          postgres    false    228            ?            1259    98746    orders_order    TABLE     ?   CREATE TABLE public.orders_order (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    status character varying(20) NOT NULL,
    address_id bigint,
    coupon_id bigint,
    user_id bigint
);
     DROP TABLE public.orders_order;
       public         heap    postgres    false            ?            1259    98749    orders_order_id_seq    SEQUENCE     |   CREATE SEQUENCE public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    229            .           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders_order.id;
          public          postgres    false    230            ?            1259    98751    orders_orderitem    TABLE     ?   CREATE TABLE public.orders_orderitem (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    cart_id bigint,
    order_id bigint,
    product_id bigint NOT NULL,
    CONSTRAINT orders_orderitem_quantity_check CHECK ((quantity >= 0))
);
 $   DROP TABLE public.orders_orderitem;
       public         heap    postgres    false            ?            1259    98755    orders_orderitem_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.orders_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.orders_orderitem_id_seq;
       public          postgres    false    231            /           0    0    orders_orderitem_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.orders_orderitem_id_seq OWNED BY public.orders_orderitem.id;
          public          postgres    false    232            ?            1259    98757    orders_payment    TABLE     ?   CREATE TABLE public.orders_payment (
    id bigint NOT NULL,
    payment_info character varying(50) NOT NULL,
    order_id bigint NOT NULL
);
 "   DROP TABLE public.orders_payment;
       public         heap    postgres    false            ?            1259    98760    orders_payment_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.orders_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.orders_payment_id_seq;
       public          postgres    false    233            0           0    0    orders_payment_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.orders_payment_id_seq OWNED BY public.orders_payment.id;
          public          postgres    false    234            ?            1259    98762    products_category    TABLE     l   CREATE TABLE public.products_category (
    id bigint NOT NULL,
    name character varying(250) NOT NULL
);
 %   DROP TABLE public.products_category;
       public         heap    postgres    false            ?            1259    98765    products_category_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.products_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.products_category_id_seq;
       public          postgres    false    235            1           0    0    products_category_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.products_category_id_seq OWNED BY public.products_category.id;
          public          postgres    false    236            ?            1259    98767    products_discount    TABLE     >  CREATE TABLE public.products_discount (
    id bigint NOT NULL,
    percentage smallint NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    status character varying(50) NOT NULL,
    CONSTRAINT products_discount_percentage_check CHECK ((percentage >= 0))
);
 %   DROP TABLE public.products_discount;
       public         heap    postgres    false            ?            1259    98771    products_discount_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.products_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.products_discount_id_seq;
       public          postgres    false    237            2           0    0    products_discount_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.products_discount_id_seq OWNED BY public.products_discount.id;
          public          postgres    false    238            ?            1259    98773    products_discount_products    TABLE     ?   CREATE TABLE public.products_discount_products (
    id integer NOT NULL,
    discount_id bigint NOT NULL,
    product_id bigint NOT NULL
);
 .   DROP TABLE public.products_discount_products;
       public         heap    postgres    false            ?            1259    98776     products_discount_product_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.products_discount_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.products_discount_product_id_seq;
       public          postgres    false    239            3           0    0     products_discount_product_id_seq    SEQUENCE OWNED BY     f   ALTER SEQUENCE public.products_discount_product_id_seq OWNED BY public.products_discount_products.id;
          public          postgres    false    240            ?            1259    98778    products_product    TABLE     ?  CREATE TABLE public.products_product (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    description text NOT NULL,
    image character varying(100) NOT NULL,
    price integer NOT NULL,
    stock integer NOT NULL,
    is_active boolean NOT NULL,
    create_date date NOT NULL,
    category_id bigint NOT NULL,
    CONSTRAINT products_product_stock_check CHECK ((stock >= 0))
);
 $   DROP TABLE public.products_product;
       public         heap    postgres    false            ?            1259    98785    products_product_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public          postgres    false    241            4           0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;
          public          postgres    false    242            ?            1259    98787    products_product_tags    TABLE     ?   CREATE TABLE public.products_product_tags (
    id integer NOT NULL,
    product_id bigint NOT NULL,
    tag_id bigint NOT NULL
);
 )   DROP TABLE public.products_product_tags;
       public         heap    postgres    false            ?            1259    98790    products_product_tags_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.products_product_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.products_product_tags_id_seq;
       public          postgres    false    243            5           0    0    products_product_tags_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.products_product_tags_id_seq OWNED BY public.products_product_tags.id;
          public          postgres    false    244            ?            1259    98792    products_productimage    TABLE     ?   CREATE TABLE public.products_productimage (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    product_id bigint NOT NULL
);
 )   DROP TABLE public.products_productimage;
       public         heap    postgres    false            ?            1259    98795    products_productimage_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.products_productimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.products_productimage_id_seq;
       public          postgres    false    245            6           0    0    products_productimage_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.products_productimage_id_seq OWNED BY public.products_productimage.id;
          public          postgres    false    246            ?            1259    98797    products_tag    TABLE     g   CREATE TABLE public.products_tag (
    id bigint NOT NULL,
    name character varying(200) NOT NULL
);
     DROP TABLE public.products_tag;
       public         heap    postgres    false            ?            1259    98800    products_tag_id_seq    SEQUENCE     |   CREATE SEQUENCE public.products_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.products_tag_id_seq;
       public          postgres    false    247            7           0    0    products_tag_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.products_tag_id_seq OWNED BY public.products_tag.id;
          public          postgres    false    248            ?           2604    98802    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200            ?           2604    98803    auth_group_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            ?           2604    98804    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            ?           2604    98805    customers_address id    DEFAULT     |   ALTER TABLE ONLY public.customers_address ALTER COLUMN id SET DEFAULT nextval('public.customers_address_id_seq'::regclass);
 C   ALTER TABLE public.customers_address ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            ?           2604    98806    customers_user id    DEFAULT     v   ALTER TABLE ONLY public.customers_user ALTER COLUMN id SET DEFAULT nextval('public.customers_user_id_seq'::regclass);
 @   ALTER TABLE public.customers_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    208            ?           2604    98807    customers_user_groups id    DEFAULT     ?   ALTER TABLE ONLY public.customers_user_groups ALTER COLUMN id SET DEFAULT nextval('public.customers_user_groups_id_seq'::regclass);
 G   ALTER TABLE public.customers_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            ?           2604    98808 "   customers_user_user_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.customers_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.customers_user_user_permissions_id_seq'::regclass);
 Q   ALTER TABLE public.customers_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212            ?           2604    98809    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            ?           2604    98810    django_content_type id    DEFAULT     ?   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            ?           2604    98811    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            ?           2604    98812 /   django_rest_passwordreset_resetpasswordtoken id    DEFAULT     ?   ALTER TABLE ONLY public.django_rest_passwordreset_resetpasswordtoken ALTER COLUMN id SET DEFAULT nextval('public.django_rest_passwordreset_resetpasswordtoken_id_seq'::regclass);
 ^   ALTER TABLE public.django_rest_passwordreset_resetpasswordtoken ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            ?           2604    98813    orders_cart id    DEFAULT     p   ALTER TABLE ONLY public.orders_cart ALTER COLUMN id SET DEFAULT nextval('public.orders_cart_id_seq'::regclass);
 =   ALTER TABLE public.orders_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            ?           2604    98814    orders_coupon id    DEFAULT     t   ALTER TABLE ONLY public.orders_coupon ALTER COLUMN id SET DEFAULT nextval('public.orders_coupon_id_seq'::regclass);
 ?   ALTER TABLE public.orders_coupon ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            ?           2604    98815    orders_coupon_user id    DEFAULT     ~   ALTER TABLE ONLY public.orders_coupon_user ALTER COLUMN id SET DEFAULT nextval('public.orders_coupon_user_id_seq'::regclass);
 D   ALTER TABLE public.orders_coupon_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227            ?           2604    98816    orders_order id    DEFAULT     r   ALTER TABLE ONLY public.orders_order ALTER COLUMN id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders_order ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229            ?           2604    98817    orders_orderitem id    DEFAULT     z   ALTER TABLE ONLY public.orders_orderitem ALTER COLUMN id SET DEFAULT nextval('public.orders_orderitem_id_seq'::regclass);
 B   ALTER TABLE public.orders_orderitem ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231            ?           2604    98818    orders_payment id    DEFAULT     v   ALTER TABLE ONLY public.orders_payment ALTER COLUMN id SET DEFAULT nextval('public.orders_payment_id_seq'::regclass);
 @   ALTER TABLE public.orders_payment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233            ?           2604    98819    products_category id    DEFAULT     |   ALTER TABLE ONLY public.products_category ALTER COLUMN id SET DEFAULT nextval('public.products_category_id_seq'::regclass);
 C   ALTER TABLE public.products_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235            ?           2604    98820    products_discount id    DEFAULT     |   ALTER TABLE ONLY public.products_discount ALTER COLUMN id SET DEFAULT nextval('public.products_discount_id_seq'::regclass);
 C   ALTER TABLE public.products_discount ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237            ?           2604    98821    products_discount_products id    DEFAULT     ?   ALTER TABLE ONLY public.products_discount_products ALTER COLUMN id SET DEFAULT nextval('public.products_discount_product_id_seq'::regclass);
 L   ALTER TABLE public.products_discount_products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239            ?           2604    98822    products_product id    DEFAULT     z   ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241            ?           2604    98823    products_product_tags id    DEFAULT     ?   ALTER TABLE ONLY public.products_product_tags ALTER COLUMN id SET DEFAULT nextval('public.products_product_tags_id_seq'::regclass);
 G   ALTER TABLE public.products_product_tags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243            ?           2604    98824    products_productimage id    DEFAULT     ?   ALTER TABLE ONLY public.products_productimage ALTER COLUMN id SET DEFAULT nextval('public.products_productimage_id_seq'::regclass);
 G   ALTER TABLE public.products_productimage ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245            ?           2604    98825    products_tag id    DEFAULT     r   ALTER TABLE ONLY public.products_tag ALTER COLUMN id SET DEFAULT nextval('public.products_tag_id_seq'::regclass);
 >   ALTER TABLE public.products_tag ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247            ?          0    98653 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    200   ?Y      ?          0    98658    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    202   7Z      ?          0    98663    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    204   0[      ?          0    98668    customers_address 
   TABLE DATA           S   COPY public.customers_address (id, city, address, postalcode, user_id) FROM stdin;
    public          postgres    false    206   ^      ?          0    98676    customers_user 
   TABLE DATA           ?   COPY public.customers_user (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email, mobile) FROM stdin;
    public          postgres    false    208   ?^      ?          0    98682    customers_user_groups 
   TABLE DATA           F   COPY public.customers_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    209   ?a      ?          0    98689    customers_user_user_permissions 
   TABLE DATA           U   COPY public.customers_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    212   ?a      ?          0    98694    django_admin_log 
   TABLE DATA           ?   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    214   ?a      ?          0    98703    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    216   ?i      ?          0    98708    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    218   wj      ?          0    98716 ,   django_rest_passwordreset_resetpasswordtoken 
   TABLE DATA           |   COPY public.django_rest_passwordreset_resetpasswordtoken (created_at, key, ip_address, user_agent, user_id, id) FROM stdin;
    public          postgres    false    220   ?m      ?          0    98724    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    222   ?m                 0    98730    orders_cart 
   TABLE DATA           E   COPY public.orders_cart (id, device, coupon_id, user_id) FROM stdin;
    public          postgres    false    223   ?q                0    98735    orders_coupon 
   TABLE DATA           [   COPY public.orders_coupon (id, code, percentage, start_date, end_date, status) FROM stdin;
    public          postgres    false    225   Jr                0    98741    orders_coupon_user 
   TABLE DATA           D   COPY public.orders_coupon_user (id, coupon_id, user_id) FROM stdin;
    public          postgres    false    227   ?r                0    98746    orders_order 
   TABLE DATA           X   COPY public.orders_order (id, date, status, address_id, coupon_id, user_id) FROM stdin;
    public          postgres    false    229   ?r                0    98751    orders_orderitem 
   TABLE DATA           W   COPY public.orders_orderitem (id, quantity, cart_id, order_id, product_id) FROM stdin;
    public          postgres    false    231   As      
          0    98757    orders_payment 
   TABLE DATA           D   COPY public.orders_payment (id, payment_info, order_id) FROM stdin;
    public          postgres    false    233   ?s                0    98762    products_category 
   TABLE DATA           5   COPY public.products_category (id, name) FROM stdin;
    public          postgres    false    235   ?s                0    98767    products_discount 
   TABLE DATA           Y   COPY public.products_discount (id, percentage, start_date, end_date, status) FROM stdin;
    public          postgres    false    237   t                0    98773    products_discount_products 
   TABLE DATA           Q   COPY public.products_discount_products (id, discount_id, product_id) FROM stdin;
    public          postgres    false    239   dt                0    98778    products_product 
   TABLE DATA           {   COPY public.products_product (id, name, description, image, price, stock, is_active, create_date, category_id) FROM stdin;
    public          postgres    false    241   ?t                0    98787    products_product_tags 
   TABLE DATA           G   COPY public.products_product_tags (id, product_id, tag_id) FROM stdin;
    public          postgres    false    243   J?                0    98792    products_productimage 
   TABLE DATA           F   COPY public.products_productimage (id, image, product_id) FROM stdin;
    public          postgres    false    245   ??                0    98797    products_tag 
   TABLE DATA           0   COPY public.products_tag (id, name) FROM stdin;
    public          postgres    false    247   ??      8           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);
          public          postgres    false    201            9           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 67, true);
          public          postgres    false    203            :           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);
          public          postgres    false    205            ;           0    0    customers_address_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.customers_address_id_seq', 4, true);
          public          postgres    false    207            <           0    0    customers_user_groups_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.customers_user_groups_id_seq', 2, true);
          public          postgres    false    210            =           0    0    customers_user_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.customers_user_id_seq', 12, true);
          public          postgres    false    211            >           0    0 &   customers_user_user_permissions_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.customers_user_user_permissions_id_seq', 1, false);
          public          postgres    false    213            ?           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 75, true);
          public          postgres    false    215            @           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);
          public          postgres    false    217            A           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 37, true);
          public          postgres    false    219            B           0    0 3   django_rest_passwordreset_resetpasswordtoken_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.django_rest_passwordreset_resetpasswordtoken_id_seq', 6, true);
          public          postgres    false    221            C           0    0    orders_cart_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orders_cart_id_seq', 11, true);
          public          postgres    false    224            D           0    0    orders_coupon_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_coupon_id_seq', 1, true);
          public          postgres    false    226            E           0    0    orders_coupon_user_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.orders_coupon_user_id_seq', 2, true);
          public          postgres    false    228            F           0    0    orders_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orders_order_id_seq', 4, true);
          public          postgres    false    230            G           0    0    orders_orderitem_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.orders_orderitem_id_seq', 9, true);
          public          postgres    false    232            H           0    0    orders_payment_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.orders_payment_id_seq', 4, true);
          public          postgres    false    234            I           0    0    products_category_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_category_id_seq', 5, true);
          public          postgres    false    236            J           0    0    products_discount_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_discount_id_seq', 1, true);
          public          postgres    false    238            K           0    0     products_discount_product_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.products_discount_product_id_seq', 3, true);
          public          postgres    false    240            L           0    0    products_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_product_id_seq', 5, true);
          public          postgres    false    242            M           0    0    products_product_tags_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.products_product_tags_id_seq', 13, true);
          public          postgres    false    244            N           0    0    products_productimage_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.products_productimage_id_seq', 4, true);
          public          postgres    false    246            O           0    0    products_tag_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.products_tag_id_seq', 8, true);
          public          postgres    false    248            ?           2606    98827    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    200            ?           2606    98829 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    202    202            ?           2606    98831 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    202            ?           2606    98833    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    200            ?           2606    98835 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    204    204            ?           2606    98837 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    204            ?           2606    98839 (   customers_address customers_address_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.customers_address
    ADD CONSTRAINT customers_address_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.customers_address DROP CONSTRAINT customers_address_pkey;
       public            postgres    false    206            ?           2606    98841 '   customers_user customers_user_email_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.customers_user
    ADD CONSTRAINT customers_user_email_key UNIQUE (email);
 Q   ALTER TABLE ONLY public.customers_user DROP CONSTRAINT customers_user_email_key;
       public            postgres    false    208            ?           2606    98843 0   customers_user_groups customers_user_groups_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.customers_user_groups
    ADD CONSTRAINT customers_user_groups_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.customers_user_groups DROP CONSTRAINT customers_user_groups_pkey;
       public            postgres    false    209            ?           2606    98845 J   customers_user_groups customers_user_groups_user_id_group_id_c6dc71d5_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.customers_user_groups
    ADD CONSTRAINT customers_user_groups_user_id_group_id_c6dc71d5_uniq UNIQUE (user_id, group_id);
 t   ALTER TABLE ONLY public.customers_user_groups DROP CONSTRAINT customers_user_groups_user_id_group_id_c6dc71d5_uniq;
       public            postgres    false    209    209            ?           2606    99533 2   customers_user customers_user_mobile_ba2dbbf5_uniq 
   CONSTRAINT     o   ALTER TABLE ONLY public.customers_user
    ADD CONSTRAINT customers_user_mobile_ba2dbbf5_uniq UNIQUE (mobile);
 \   ALTER TABLE ONLY public.customers_user DROP CONSTRAINT customers_user_mobile_ba2dbbf5_uniq;
       public            postgres    false    208            ?           2606    98847 "   customers_user customers_user_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.customers_user
    ADD CONSTRAINT customers_user_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.customers_user DROP CONSTRAINT customers_user_pkey;
       public            postgres    false    208            ?           2606    98849 \   customers_user_user_permissions customers_user_user_perm_user_id_permission_id_7405b3bb_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.customers_user_user_permissions
    ADD CONSTRAINT customers_user_user_perm_user_id_permission_id_7405b3bb_uniq UNIQUE (user_id, permission_id);
 ?   ALTER TABLE ONLY public.customers_user_user_permissions DROP CONSTRAINT customers_user_user_perm_user_id_permission_id_7405b3bb_uniq;
       public            postgres    false    212    212            ?           2606    98851 D   customers_user_user_permissions customers_user_user_permissions_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.customers_user_user_permissions
    ADD CONSTRAINT customers_user_user_permissions_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.customers_user_user_permissions DROP CONSTRAINT customers_user_user_permissions_pkey;
       public            postgres    false    212            ?           2606    98853 *   customers_user customers_user_username_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.customers_user
    ADD CONSTRAINT customers_user_username_key UNIQUE (username);
 T   ALTER TABLE ONLY public.customers_user DROP CONSTRAINT customers_user_username_key;
       public            postgres    false    208                        2606    98855 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    214                       2606    98857 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    216    216                       2606    98859 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    216                       2606    98861 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    218            
           2606    98863 k   django_rest_passwordreset_resetpasswordtoken django_rest_passwordreset_resetpasswordtoken_key_f1b65873_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.django_rest_passwordreset_resetpasswordtoken
    ADD CONSTRAINT django_rest_passwordreset_resetpasswordtoken_key_f1b65873_uniq UNIQUE (key);
 ?   ALTER TABLE ONLY public.django_rest_passwordreset_resetpasswordtoken DROP CONSTRAINT django_rest_passwordreset_resetpasswordtoken_key_f1b65873_uniq;
       public            postgres    false    220                       2606    98865 ^   django_rest_passwordreset_resetpasswordtoken django_rest_passwordreset_resetpasswordtoken_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.django_rest_passwordreset_resetpasswordtoken
    ADD CONSTRAINT django_rest_passwordreset_resetpasswordtoken_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.django_rest_passwordreset_resetpasswordtoken DROP CONSTRAINT django_rest_passwordreset_resetpasswordtoken_pkey;
       public            postgres    false    220                       2606    98867 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    222                       2606    98869    orders_cart orders_cart_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.orders_cart
    ADD CONSTRAINT orders_cart_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.orders_cart DROP CONSTRAINT orders_cart_pkey;
       public            postgres    false    223                       2606    98871 #   orders_cart orders_cart_user_id_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.orders_cart
    ADD CONSTRAINT orders_cart_user_id_key UNIQUE (user_id);
 M   ALTER TABLE ONLY public.orders_cart DROP CONSTRAINT orders_cart_user_id_key;
       public            postgres    false    223                       2606    98873     orders_coupon orders_coupon_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.orders_coupon
    ADD CONSTRAINT orders_coupon_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.orders_coupon DROP CONSTRAINT orders_coupon_pkey;
       public            postgres    false    225                       2606    98875 E   orders_coupon_user orders_coupon_user_coupon_id_user_id_c823a9a3_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.orders_coupon_user
    ADD CONSTRAINT orders_coupon_user_coupon_id_user_id_c823a9a3_uniq UNIQUE (coupon_id, user_id);
 o   ALTER TABLE ONLY public.orders_coupon_user DROP CONSTRAINT orders_coupon_user_coupon_id_user_id_c823a9a3_uniq;
       public            postgres    false    227    227                       2606    98877 *   orders_coupon_user orders_coupon_user_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.orders_coupon_user
    ADD CONSTRAINT orders_coupon_user_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.orders_coupon_user DROP CONSTRAINT orders_coupon_user_pkey;
       public            postgres    false    227            "           2606    98879    orders_order orders_order_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_pkey;
       public            postgres    false    229            '           2606    98881 &   orders_orderitem orders_orderitem_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.orders_orderitem DROP CONSTRAINT orders_orderitem_pkey;
       public            postgres    false    231            *           2606    98883 *   orders_payment orders_payment_order_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.orders_payment
    ADD CONSTRAINT orders_payment_order_id_key UNIQUE (order_id);
 T   ALTER TABLE ONLY public.orders_payment DROP CONSTRAINT orders_payment_order_id_key;
       public            postgres    false    233            ,           2606    98885 "   orders_payment orders_payment_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.orders_payment
    ADD CONSTRAINT orders_payment_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.orders_payment DROP CONSTRAINT orders_payment_pkey;
       public            postgres    false    233            .           2606    98887 (   products_category products_category_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.products_category DROP CONSTRAINT products_category_pkey;
       public            postgres    false    235            0           2606    98889 (   products_discount products_discount_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.products_discount
    ADD CONSTRAINT products_discount_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.products_discount DROP CONSTRAINT products_discount_pkey;
       public            postgres    false    237            3           2606    98891 Y   products_discount_products products_discount_product_discount_id_product_id_1674c0cf_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.products_discount_products
    ADD CONSTRAINT products_discount_product_discount_id_product_id_1674c0cf_uniq UNIQUE (discount_id, product_id);
 ?   ALTER TABLE ONLY public.products_discount_products DROP CONSTRAINT products_discount_product_discount_id_product_id_1674c0cf_uniq;
       public            postgres    false    239    239            5           2606    98893 9   products_discount_products products_discount_product_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.products_discount_products
    ADD CONSTRAINT products_discount_product_pkey PRIMARY KEY (id);
 c   ALTER TABLE ONLY public.products_discount_products DROP CONSTRAINT products_discount_product_pkey;
       public            postgres    false    239            :           2606    98895 *   products_product products_product_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_name_key UNIQUE (name);
 T   ALTER TABLE ONLY public.products_product DROP CONSTRAINT products_product_name_key;
       public            postgres    false    241            <           2606    98897 &   products_product products_product_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.products_product DROP CONSTRAINT products_product_pkey;
       public            postgres    false    241            >           2606    98899 0   products_product_tags products_product_tags_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.products_product_tags
    ADD CONSTRAINT products_product_tags_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.products_product_tags DROP CONSTRAINT products_product_tags_pkey;
       public            postgres    false    243            A           2606    98901 K   products_product_tags products_product_tags_product_id_tag_id_a36d84e8_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.products_product_tags
    ADD CONSTRAINT products_product_tags_product_id_tag_id_a36d84e8_uniq UNIQUE (product_id, tag_id);
 u   ALTER TABLE ONLY public.products_product_tags DROP CONSTRAINT products_product_tags_product_id_tag_id_a36d84e8_uniq;
       public            postgres    false    243    243            D           2606    98903 0   products_productimage products_productimage_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.products_productimage
    ADD CONSTRAINT products_productimage_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.products_productimage DROP CONSTRAINT products_productimage_pkey;
       public            postgres    false    245            H           2606    98905 "   products_tag products_tag_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.products_tag
    ADD CONSTRAINT products_tag_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.products_tag DROP CONSTRAINT products_tag_name_key;
       public            postgres    false    247            J           2606    98907    products_tag products_tag_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products_tag
    ADD CONSTRAINT products_tag_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.products_tag DROP CONSTRAINT products_tag_pkey;
       public            postgres    false    247            ?           1259    98908    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    200            ?           1259    98909 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    202            ?           1259    98910 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    202            ?           1259    98911 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    204            ?           1259    98912 "   customers_address_user_id_8fee2cf6    INDEX     c   CREATE INDEX customers_address_user_id_8fee2cf6 ON public.customers_address USING btree (user_id);
 6   DROP INDEX public.customers_address_user_id_8fee2cf6;
       public            postgres    false    206            ?           1259    98913 "   customers_user_email_b33f680d_like    INDEX     r   CREATE INDEX customers_user_email_b33f680d_like ON public.customers_user USING btree (email varchar_pattern_ops);
 6   DROP INDEX public.customers_user_email_b33f680d_like;
       public            postgres    false    208            ?           1259    98914 '   customers_user_groups_group_id_f2d1006b    INDEX     m   CREATE INDEX customers_user_groups_group_id_f2d1006b ON public.customers_user_groups USING btree (group_id);
 ;   DROP INDEX public.customers_user_groups_group_id_f2d1006b;
       public            postgres    false    209            ?           1259    98915 &   customers_user_groups_user_id_5d6dd108    INDEX     k   CREATE INDEX customers_user_groups_user_id_5d6dd108 ON public.customers_user_groups USING btree (user_id);
 :   DROP INDEX public.customers_user_groups_user_id_5d6dd108;
       public            postgres    false    209            ?           1259    99534 #   customers_user_mobile_ba2dbbf5_like    INDEX     t   CREATE INDEX customers_user_mobile_ba2dbbf5_like ON public.customers_user USING btree (mobile varchar_pattern_ops);
 7   DROP INDEX public.customers_user_mobile_ba2dbbf5_like;
       public            postgres    false    208            ?           1259    98916 6   customers_user_user_permissions_permission_id_2da795e4    INDEX     ?   CREATE INDEX customers_user_user_permissions_permission_id_2da795e4 ON public.customers_user_user_permissions USING btree (permission_id);
 J   DROP INDEX public.customers_user_user_permissions_permission_id_2da795e4;
       public            postgres    false    212            ?           1259    98917 0   customers_user_user_permissions_user_id_f91e86da    INDEX        CREATE INDEX customers_user_user_permissions_user_id_f91e86da ON public.customers_user_user_permissions USING btree (user_id);
 D   DROP INDEX public.customers_user_user_permissions_user_id_f91e86da;
       public            postgres    false    212            ?           1259    98918 %   customers_user_username_43e992e8_like    INDEX     x   CREATE INDEX customers_user_username_43e992e8_like ON public.customers_user USING btree (username varchar_pattern_ops);
 9   DROP INDEX public.customers_user_username_43e992e8_like;
       public            postgres    false    208            ?           1259    98919 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    214                       1259    98920 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    214                       1259    98921 >   django_rest_passwordreset_resetpasswordtoken_key_f1b65873_like    INDEX     ?   CREATE INDEX django_rest_passwordreset_resetpasswordtoken_key_f1b65873_like ON public.django_rest_passwordreset_resetpasswordtoken USING btree (key varchar_pattern_ops);
 R   DROP INDEX public.django_rest_passwordreset_resetpasswordtoken_key_f1b65873_like;
       public            postgres    false    220                       1259    98922 =   django_rest_passwordreset_resetpasswordtoken_user_id_e8015b11    INDEX     ?   CREATE INDEX django_rest_passwordreset_resetpasswordtoken_user_id_e8015b11 ON public.django_rest_passwordreset_resetpasswordtoken USING btree (user_id);
 Q   DROP INDEX public.django_rest_passwordreset_resetpasswordtoken_user_id_e8015b11;
       public            postgres    false    220                       1259    98923 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    222                       1259    98924 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    222                       1259    98925    orders_cart_coupon_id_1516a12b    INDEX     [   CREATE INDEX orders_cart_coupon_id_1516a12b ON public.orders_cart USING btree (coupon_id);
 2   DROP INDEX public.orders_cart_coupon_id_1516a12b;
       public            postgres    false    223                       1259    98926 %   orders_coupon_user_coupon_id_31afa221    INDEX     i   CREATE INDEX orders_coupon_user_coupon_id_31afa221 ON public.orders_coupon_user USING btree (coupon_id);
 9   DROP INDEX public.orders_coupon_user_coupon_id_31afa221;
       public            postgres    false    227                       1259    98927 #   orders_coupon_user_user_id_bfdfafc8    INDEX     e   CREATE INDEX orders_coupon_user_user_id_bfdfafc8 ON public.orders_coupon_user USING btree (user_id);
 7   DROP INDEX public.orders_coupon_user_user_id_bfdfafc8;
       public            postgres    false    227                       1259    98928     orders_order_address_id_0daf897b    INDEX     _   CREATE INDEX orders_order_address_id_0daf897b ON public.orders_order USING btree (address_id);
 4   DROP INDEX public.orders_order_address_id_0daf897b;
       public            postgres    false    229                        1259    98929    orders_order_coupon_id_5bddb887    INDEX     ]   CREATE INDEX orders_order_coupon_id_5bddb887 ON public.orders_order USING btree (coupon_id);
 3   DROP INDEX public.orders_order_coupon_id_5bddb887;
       public            postgres    false    229            #           1259    98930    orders_order_user_id_e9b59eb1    INDEX     Y   CREATE INDEX orders_order_user_id_e9b59eb1 ON public.orders_order USING btree (user_id);
 1   DROP INDEX public.orders_order_user_id_e9b59eb1;
       public            postgres    false    229            $           1259    98931 !   orders_orderitem_cart_id_c53beaa0    INDEX     a   CREATE INDEX orders_orderitem_cart_id_c53beaa0 ON public.orders_orderitem USING btree (cart_id);
 5   DROP INDEX public.orders_orderitem_cart_id_c53beaa0;
       public            postgres    false    231            %           1259    98932 "   orders_orderitem_order_id_fe61a34d    INDEX     c   CREATE INDEX orders_orderitem_order_id_fe61a34d ON public.orders_orderitem USING btree (order_id);
 6   DROP INDEX public.orders_orderitem_order_id_fe61a34d;
       public            postgres    false    231            (           1259    98933 $   orders_orderitem_product_id_afe4254a    INDEX     g   CREATE INDEX orders_orderitem_product_id_afe4254a ON public.orders_orderitem USING btree (product_id);
 8   DROP INDEX public.orders_orderitem_product_id_afe4254a;
       public            postgres    false    231            1           1259    98934 .   products_discount_product_discount_id_9007f697    INDEX     |   CREATE INDEX products_discount_product_discount_id_9007f697 ON public.products_discount_products USING btree (discount_id);
 B   DROP INDEX public.products_discount_product_discount_id_9007f697;
       public            postgres    false    239            6           1259    98935 -   products_discount_product_product_id_d692aa84    INDEX     z   CREATE INDEX products_discount_product_product_id_d692aa84 ON public.products_discount_products USING btree (product_id);
 A   DROP INDEX public.products_discount_product_product_id_d692aa84;
       public            postgres    false    239            7           1259    98936 %   products_product_category_id_9b594869    INDEX     i   CREATE INDEX products_product_category_id_9b594869 ON public.products_product USING btree (category_id);
 9   DROP INDEX public.products_product_category_id_9b594869;
       public            postgres    false    241            8           1259    98937 #   products_product_name_fa23bcd2_like    INDEX     t   CREATE INDEX products_product_name_fa23bcd2_like ON public.products_product USING btree (name varchar_pattern_ops);
 7   DROP INDEX public.products_product_name_fa23bcd2_like;
       public            postgres    false    241            ?           1259    98938 )   products_product_tags_product_id_f82cb4be    INDEX     q   CREATE INDEX products_product_tags_product_id_f82cb4be ON public.products_product_tags USING btree (product_id);
 =   DROP INDEX public.products_product_tags_product_id_f82cb4be;
       public            postgres    false    243            B           1259    98939 %   products_product_tags_tag_id_f2d7d0b4    INDEX     i   CREATE INDEX products_product_tags_tag_id_f2d7d0b4 ON public.products_product_tags USING btree (tag_id);
 9   DROP INDEX public.products_product_tags_tag_id_f2d7d0b4;
       public            postgres    false    243            E           1259    98940 )   products_productimage_product_id_e747596a    INDEX     q   CREATE INDEX products_productimage_product_id_e747596a ON public.products_productimage USING btree (product_id);
 =   DROP INDEX public.products_productimage_product_id_e747596a;
       public            postgres    false    245            F           1259    98941    products_tag_name_df2d816e_like    INDEX     l   CREATE INDEX products_tag_name_df2d816e_like ON public.products_tag USING btree (name varchar_pattern_ops);
 3   DROP INDEX public.products_tag_name_df2d816e_like;
       public            postgres    false    247            K           2606    98942 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    202    204    3043            L           2606    98947 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    3032    200    202            M           2606    98952 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    204    3077    216            N           2606    98957 I   customers_address customers_address_user_id_8fee2cf6_fk_customers_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.customers_address
    ADD CONSTRAINT customers_address_user_id_8fee2cf6_fk_customers_user_id FOREIGN KEY (user_id) REFERENCES public.customers_user(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.customers_address DROP CONSTRAINT customers_address_user_id_8fee2cf6_fk_customers_user_id;
       public          postgres    false    208    3054    206            O           2606    98962 N   customers_user_groups customers_user_groups_group_id_f2d1006b_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.customers_user_groups
    ADD CONSTRAINT customers_user_groups_group_id_f2d1006b_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.customers_user_groups DROP CONSTRAINT customers_user_groups_group_id_f2d1006b_fk_auth_group_id;
       public          postgres    false    200    3032    209            P           2606    98967 Q   customers_user_groups customers_user_groups_user_id_5d6dd108_fk_customers_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.customers_user_groups
    ADD CONSTRAINT customers_user_groups_user_id_5d6dd108_fk_customers_user_id FOREIGN KEY (user_id) REFERENCES public.customers_user(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.customers_user_groups DROP CONSTRAINT customers_user_groups_user_id_5d6dd108_fk_customers_user_id;
       public          postgres    false    209    3054    208            Q           2606    98972 X   customers_user_user_permissions customers_user_user__permission_id_2da795e4_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.customers_user_user_permissions
    ADD CONSTRAINT customers_user_user__permission_id_2da795e4_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.customers_user_user_permissions DROP CONSTRAINT customers_user_user__permission_id_2da795e4_fk_auth_perm;
       public          postgres    false    212    3043    204            R           2606    98977 R   customers_user_user_permissions customers_user_user__user_id_f91e86da_fk_customers    FK CONSTRAINT     ?   ALTER TABLE ONLY public.customers_user_user_permissions
    ADD CONSTRAINT customers_user_user__user_id_f91e86da_fk_customers FOREIGN KEY (user_id) REFERENCES public.customers_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.customers_user_user_permissions DROP CONSTRAINT customers_user_user__user_id_f91e86da_fk_customers;
       public          postgres    false    3054    212    208            S           2606    98982 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    3077    214    216            T           2606    98987 G   django_admin_log django_admin_log_user_id_c564eba6_fk_customers_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_customers_user_id FOREIGN KEY (user_id) REFERENCES public.customers_user(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_customers_user_id;
       public          postgres    false    214    208    3054            U           2606    98992 _   django_rest_passwordreset_resetpasswordtoken django_rest_password_user_id_e8015b11_fk_customers    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_rest_passwordreset_resetpasswordtoken
    ADD CONSTRAINT django_rest_password_user_id_e8015b11_fk_customers FOREIGN KEY (user_id) REFERENCES public.customers_user(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.django_rest_passwordreset_resetpasswordtoken DROP CONSTRAINT django_rest_password_user_id_e8015b11_fk_customers;
       public          postgres    false    3054    208    220            V           2606    98997 >   orders_cart orders_cart_coupon_id_1516a12b_fk_orders_coupon_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders_cart
    ADD CONSTRAINT orders_cart_coupon_id_1516a12b_fk_orders_coupon_id FOREIGN KEY (coupon_id) REFERENCES public.orders_coupon(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.orders_cart DROP CONSTRAINT orders_cart_coupon_id_1516a12b_fk_orders_coupon_id;
       public          postgres    false    223    3096    225            W           2606    99002 =   orders_cart orders_cart_user_id_121a069e_fk_customers_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders_cart
    ADD CONSTRAINT orders_cart_user_id_121a069e_fk_customers_user_id FOREIGN KEY (user_id) REFERENCES public.customers_user(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.orders_cart DROP CONSTRAINT orders_cart_user_id_121a069e_fk_customers_user_id;
       public          postgres    false    223    3054    208            X           2606    99007 L   orders_coupon_user orders_coupon_user_coupon_id_31afa221_fk_orders_coupon_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders_coupon_user
    ADD CONSTRAINT orders_coupon_user_coupon_id_31afa221_fk_orders_coupon_id FOREIGN KEY (coupon_id) REFERENCES public.orders_coupon(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.orders_coupon_user DROP CONSTRAINT orders_coupon_user_coupon_id_31afa221_fk_orders_coupon_id;
       public          postgres    false    227    225    3096            Y           2606    99012 K   orders_coupon_user orders_coupon_user_user_id_bfdfafc8_fk_customers_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders_coupon_user
    ADD CONSTRAINT orders_coupon_user_user_id_bfdfafc8_fk_customers_user_id FOREIGN KEY (user_id) REFERENCES public.customers_user(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.orders_coupon_user DROP CONSTRAINT orders_coupon_user_user_id_bfdfafc8_fk_customers_user_id;
       public          postgres    false    3054    208    227            Z           2606    99017 E   orders_order orders_order_address_id_0daf897b_fk_customers_address_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_address_id_0daf897b_fk_customers_address_id FOREIGN KEY (address_id) REFERENCES public.customers_address(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_address_id_0daf897b_fk_customers_address_id;
       public          postgres    false    3045    206    229            [           2606    99022 @   orders_order orders_order_coupon_id_5bddb887_fk_orders_coupon_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_coupon_id_5bddb887_fk_orders_coupon_id FOREIGN KEY (coupon_id) REFERENCES public.orders_coupon(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_coupon_id_5bddb887_fk_orders_coupon_id;
       public          postgres    false    225    229    3096            \           2606    99027 ?   orders_order orders_order_user_id_e9b59eb1_fk_customers_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_user_id_e9b59eb1_fk_customers_user_id FOREIGN KEY (user_id) REFERENCES public.customers_user(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_user_id_e9b59eb1_fk_customers_user_id;
       public          postgres    false    3054    229    208            ]           2606    99032 D   orders_orderitem orders_orderitem_cart_id_c53beaa0_fk_orders_cart_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_cart_id_c53beaa0_fk_orders_cart_id FOREIGN KEY (cart_id) REFERENCES public.orders_cart(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.orders_orderitem DROP CONSTRAINT orders_orderitem_cart_id_c53beaa0_fk_orders_cart_id;
       public          postgres    false    3092    231    223            ^           2606    99037 F   orders_orderitem orders_orderitem_order_id_fe61a34d_fk_orders_order_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_order_id_fe61a34d_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.orders_orderitem DROP CONSTRAINT orders_orderitem_order_id_fe61a34d_fk_orders_order_id;
       public          postgres    false    3106    229    231            _           2606    99042 L   orders_orderitem orders_orderitem_product_id_afe4254a_fk_products_product_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_product_id_afe4254a_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.orders_orderitem DROP CONSTRAINT orders_orderitem_product_id_afe4254a_fk_products_product_id;
       public          postgres    false    241    231    3132            `           2606    99047 B   orders_payment orders_payment_order_id_bdccf250_fk_orders_order_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders_payment
    ADD CONSTRAINT orders_payment_order_id_bdccf250_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.orders_payment DROP CONSTRAINT orders_payment_order_id_bdccf250_fk_orders_order_id;
       public          postgres    false    229    3106    233            a           2606    99052 Q   products_discount_products products_discount_pr_discount_id_9007f697_fk_products_    FK CONSTRAINT     ?   ALTER TABLE ONLY public.products_discount_products
    ADD CONSTRAINT products_discount_pr_discount_id_9007f697_fk_products_ FOREIGN KEY (discount_id) REFERENCES public.products_discount(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.products_discount_products DROP CONSTRAINT products_discount_pr_discount_id_9007f697_fk_products_;
       public          postgres    false    239    3120    237            b           2606    99057 P   products_discount_products products_discount_pr_product_id_d692aa84_fk_products_    FK CONSTRAINT     ?   ALTER TABLE ONLY public.products_discount_products
    ADD CONSTRAINT products_discount_pr_product_id_d692aa84_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.products_discount_products DROP CONSTRAINT products_discount_pr_product_id_d692aa84_fk_products_;
       public          postgres    false    241    239    3132            c           2606    99062 N   products_product products_product_category_id_9b594869_fk_products_category_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_category_id_9b594869_fk_products_category_id FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.products_product DROP CONSTRAINT products_product_category_id_9b594869_fk_products_category_id;
       public          postgres    false    241    3118    235            d           2606    99067 K   products_product_tags products_product_tag_product_id_f82cb4be_fk_products_    FK CONSTRAINT     ?   ALTER TABLE ONLY public.products_product_tags
    ADD CONSTRAINT products_product_tag_product_id_f82cb4be_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.products_product_tags DROP CONSTRAINT products_product_tag_product_id_f82cb4be_fk_products_;
       public          postgres    false    243    241    3132            e           2606    99072 N   products_product_tags products_product_tags_tag_id_f2d7d0b4_fk_products_tag_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.products_product_tags
    ADD CONSTRAINT products_product_tags_tag_id_f2d7d0b4_fk_products_tag_id FOREIGN KEY (tag_id) REFERENCES public.products_tag(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.products_product_tags DROP CONSTRAINT products_product_tags_tag_id_f2d7d0b4_fk_products_tag_id;
       public          postgres    false    247    3146    243            f           2606    99077 K   products_productimage products_productimag_product_id_e747596a_fk_products_    FK CONSTRAINT     ?   ALTER TABLE ONLY public.products_productimage
    ADD CONSTRAINT products_productimag_product_id_e747596a_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.products_productimage DROP CONSTRAINT products_productimag_product_id_e747596a_fk_products_;
       public          postgres    false    241    245    3132            ?   *   x? ??1	مدیر
2	کارمند
\.


??      ?   ?   x??ˍ?0ѳ???????ǲN<Xxpu<??(??b??S?aZˬst??????_E?? ?R u+?zX}`??h??p??x?J?????*??(??*??S?????P?m*???x?*?ޮ
o??W???
??*?*????$?????ˮ:أN?+?S????a[????{Ͻ????s???w??;x?<??{Ͻ????s???w?ܻx?]<?.?{Ͻ????s?????'?=_I?      ?   ?  x?u??n?0E??W?
SO{Y???Y(?P?Ē!??????y?????G???3?f?5m??????n?	??aK?r???WT?b0??~?`?b? ?_???n0T???O?~??q0?񆭤??N???S,

????G?ɲ????? ???K?TG/D?tJ? ??J??9??a	??-??7??ֺc]!u60Z)??n_???_??d=????qe?A?2????#c???l?j?!??^?y??v???~ٽ??~0?M????Z????gQ??q??/???<;.???ax?gG9a??O??'\?L?
??PYB -# ?e??EN???j?9??7qes?fP?0??P?0? ?@?Nѩ?s??	?m?b?? TNH? @?1P?$?B??`?k#Fw]?\?
l?T???U?0??????Ԇ????`\?P?N ? ???AF-???Rd?~	??qx?ǥ-*:?ҭ??Z???t?'? cDT??sԽyY?Ÿ??Ӈ[?z?@٧Ⱥ?^%V?+?٦g???ENN???q???? ׶܌4c4׉??6?4??TC?Nz?x?_????C????K[?yPz??S/??f????*????Կ5?q??_??Vjⱈ&PWӎu4???t???C??????t޸Z6?_?lU=?
??5x?~?:???'?"^?iNÏ~?ǚ?x?????ʂ?ИI?I?)?"?C?~???Ay?G      ?   ?   x?????0Ek{?? Œ?e? I?)?8A?!s?s??NH4ir?O??;?;w(H?<׈?Q?0`?"E??L?3!?=???#,(k䋸D-xI ?>??7??{u⾶?~ݚ???N??R/??t?????Mc??;>l?$q>Xk???      ?   ?  x?m??n?@???)?????)\??m??D?*????`¾?&??M?.?2Dy?:F???????cn?=#???]D	 _????0?%??w????h?AkM7?40???y?<RO6Ј?U?i??_?jӏ/9????oPPQ?X?Hb`n??K??Q?@??O??H?P?H???}????#w?X???2D?c??r?iuR??}V?g8 Қ??=????̨C4Z10????ěe?e??&*?r@.G??`?;??HD|b????;? ?'v??Y?ُ?Ԟ-j?M;n?v???b?_ϱN܆.?X???A?u;?2k?aOu??G??uv??~`19??7:?
'ޒc@?<?f#??[+?ڠ?<??9?cl򪩕a??W?:?I?Vs??⮐?+?LS{?X1?,??nMfg??X?;?߫???y.?j?'-?֬???W?n5??-X? /?Z????]WRTݘ?aȺV?=??j5YM??~y䑘]?b?HX? ӽY?{???k??????{}????~??ү?tj5>c?	?<??w?V_??v?Y?k?U8????YM??????dma?H?%Kb???O^sb?c_܄U?˫TAt/?-?a?darǇ ?w???<??΃3?Ɠ?B?#\ɪ?
????ݤ.?EF??&B???t????d?bW/??????x??%???D??????)(AYB?4z,??T(??q?      ?      x?3?4?4?2?4?4?????? ?      ?      x?????? ? ?      ?   ?  x??Y?n?>/??A ?????????B	??(?`???])?E??]?@?z ?u0%?	A?????Y??$???ߞ?%_Db8?S_U]??l???	??K?I??̯?L%???p6??M` 3?I	H?$Ns?D!?*)I??9??p??d???o6??N??g??盏?çO?l>??6?a??_Lg??r??o??"L*?I??y -d9)??g@?o8/g???jC? ??+D?*??p?? ? 
?0??t??d?Ub?B?z?MG_--`M?R?g??????>Z?T6?G?O?Na%W?c?Z ??bL??N??????EU?[?:??U?Am+???W9q???hDmn??O?g?&-т?))7?q??ҹ? ??O?7?هW??J???D?#턂*?????????4???j%??b	L??Z??9???????H?E?"??:^?Mo?????ǲs"?#???C+au,?&J?3??=a??<Y?]?f?h?|???Kv??g?~%??qd
?p#??\쪵?	\?I?rȱ???????"	I)W	?+????????:??>^a??????? ?
KQY?vܜ?P$`??:??Dׅ??{?"z??U??V????????O?TfT3??S?x?J?H(ج??渦N??݄NY^?f?h?t????R? 	Z?5d??)???????7"q??2 ?@p?ߋ?;?e?g?w>)0???%??9?$?O?펒??պP?pw2쾘?N???????0?5=???@\UD? CZqQ?[F
>??Y?x?_?A^??????o?ӯ؟٣?){pg???[?ݹ????m?;?ZG:QA?)@???n??n?ddX
?;p?;?{	??EB????+??69ͻ?????J?q>:#
Sg??kF?!0?Oh??|??cF??˲7?Ko?c=???'?O4?"?j?GKU?e??6??~??'??????%??0?敗L???d4??<yrȵxʆ?????m4Z??Y??bT?Zo???,%?Rb?Z????E@5??$?L??iJ?DM?՜H??~M?R'U?????ě??Ѩ??l?2??- ??8?]??N????????< ?ދ?T?(??kYvS	j?d^?|???$rA0??5թ?j
H??ݮt?4???{???? ?~??y8? ?I)e0??~C?,w??2??UXÚT?Q
݁-eLWF??? ?/?bcX?
H?F??/??[1~??o	%y??????/??P/??H-5/?}???3??6?쒜???+????9???HȷN|???.N??_?ǵX??C-??F??=??????{???UFb?$?6?????-???Z?â???C??eQ??R??$PFD?Z??1?t?ti?H???uNܨ?????٥o?%(?}G_???ϗ?_=?????*?^Ξ???o?>̔
a??)׉??B?sk#y{z???]?	 ?~???? h?+??vZi??w????l???????????X??>??'l?ws暖-?h?V???_e?9?E??b8i?Nަ???Z???AQ?????? ?q?e8Jrͣ???=E^z?PA&?R;????e?;N??U@?	$H0???7(?Esڨ?ب??L?U"???,=??۔????y??R.? .??ɝ???~??FC<?ȩᰢ>???=k???>?/Nw??w?7f?,@?P??xi3??v?WDv@$?4??aɎ?*Ƶ??ħ??j??56F???R?͑L?G-ky}ߝ?m}EV?:f??Rs!?2+X????'?0??ΫDB!@}u??k}?*u	?_???T?Zu??????u&?iG????;
'?%?ꢆ?k?>'T?wa?	?S??>?bz?????ֵ??V?+???(?R?(????????]?-??
?Adİ*?????J??:????1?@??2hDL?O??????[6t      ?   ?   x?e?]n!????Tu?{?JZ,JR0?F?޾?&?M??|??Χ??Wg?#n?5???5E?(?w???;$[??XX??Ay?Х????AΕ??ũޤ?.?`>dr??G??$?
M???	8?5*~A?O`pՐ>?e??W-`??6?.nL=+?????J????_A?>
???????'&??>??=]_?????$??      ?   ,  x???ے?8???????P?֙g?*?b? ?C?y?m$??????̡??~????O????K???o?Ʒ2?/??0???b???dLK???	g/??n]??z?-w\??pL!-?4^?y??D
R?5D?t????.a??qlb?W???????:d)?6?d???6?t?o??A?J??T?-h9\???i<?hf?Y):S????qrm<7?¹}G"??X1&cm?Ϲ??\??-??C1V?ݱ??l~????????va???0???Y?A?S^?2?????F[?? ???XO?,ߤ??l???8_?"9J'P?4??/?Vp?!?y???X*`v?O?9?vuߚ?????X?8???0<Q?`??@֮???<?2E?[.?%?o?U?????c?R?߀?q????ϟ??濵??N?cszǂe?????GJ????q???N???
???V?}LBw????<?%?c??R%?>?-???????????k/ C??>^8?6??D,Ȇ?|??0 7z???)?H?&?(ư???H???)?έ?h?I??Z	w?+?@j??Q?V?̩kݬ]݌?8???Oe?}E??P???91?C????'*?s?2?t??BSj?Ry??h??a	???Aq???J!miB???"?!BRi??gD?[?+?????(?D?%Z?$l rY?ޮ?-[1[?-???*7???!??%*???0?ZU?r'??;R?!???????{{e?I?'S?+?%!KK????w޽t?kӆ;g?Ң2W{?|xE?1TŰBNsD(???{???!?&a?ao#????????ʆ      ?      x?????? ? ?      ?   ?  x???ێ?H???駘???NP?[m??lb8????8<??$N???lR??????j??2?9?)??+q*&/
???ѷ ?-?h-?X7{{??|??77.??ی-w}K?V?????4?!???	"??$?!4??????K%H)??QҠ!nDT+C??~pD??nZ$??????p?h!?`c??cÌV?drƏw??V4I?R$S??p??4咄?Gc]?yHȑ?ZO????`?\A?`lM]6й=?Gz???B?I+?E?V?թ2??wX? ?BD?L?p]9?:Т,+%G?O?G??@
???n??W?91ZI?%'F?by?͝C???d}?#?+Fu;?	C0?????=i?)??,??L?(?p????Tz????f??dؕԷY??a??ٸ??m:???uq@?Q0????P?xP? !P????B?K3?b?euٖ=Ϣ?` ?}??W^|<??)????Q?CF΅u??	#?N??-?&?!"K???ki<??7x?Z&?r|Z&?W?C????5wV?$vtH?????؞??CR+???I?-??a?A8%*?ʯ?Z??B@??Ƶ#xF?ȨHä??d(?M?mo?&?t?~<??U?cm?p浭?????Z??`cr?;?.|?x;??????e?x?8?ڮL-J??+{??a???ev???:?6??[
f$??\F?;???y>?)?D?\???u?-??r_?p?C?????=??u(#??G???!?????@su_W.3??\jv?\??^Mv?t⯝w3?fo?~6t_3????(???D???)d?Ґ8???Ԣ??D(`???Dn??3??B??R?{]?ꤘĲ:^??s???ʉ???|??$??<?????,HCʔ???I?ȃ!??ǟ???,??&?X8}?<3v?Y??Y?}'???r?.??,I?ݺ?EV?x?hee????w(iD?$4?P??3v0?U?1Q???a????QO?G?Ox?4A???켲?lJ?????au߽??HP??ab?????? ?????=}yy?Cs7          `   x?-???0??a?@??%:A>!??#?R#Y??dd??2ct??kO?)?S{>?????ðge??}x??eeh????w?S?NC? ????         C   x?3?L?OIU02?!#C]C]#+c+Kmc+c???!X????*??\?Y?????? `??            x?3?4?4?2?&\1z\\\ 7         m   x?e?;?@E?zf?Q,??y>^+H??4?_""?۞⢘V??c1MFjH?t򦞮?y<??3V????.??????'??-?I?S??o?7???D????e?Z?*%H         >   x?5??? ߾a*??.???.??|r???BAs]??#?J???{H??c??X*?l??#      
   )   x?3?4426153???4?2B?q#???L?x&\1z\\\ Bh
!         B   x?3漱?fǍ?7V?????e?ysߍ? ?vk%?)????* w?!??V?,P???+F??? e?&h         :   x?3?44?4202?54?5?T02?26?24?60?2F?@e??2??%?e?\1z\\\ ???            x?3?4?4?2??\1z\\\ /         ?  x??Z?n?>SO?G? ?C??Z??:?`?r??H:Jdɐ???D?@? ?FL?????,???hR?}??W????!??"g??뿾?f659??*?????e?;w?Isڼk??ɤ?O'-|l???XmT?־??????zz??6VV?_]???????jY???Ԕ>?C?/?Gzp????????orL?X???ɡ??U???ߵ?????&???O??~B$??}0=?=??t?`?W?X??]Z??????{??EK:????O?~?qZ?X@^?PF?Hty?????DxH???H?i??????????s??d3JH?&m"???O?3bz?3????!?=!??Hʣ}m????V?!=???`__Ӌ??0G?
?8җ?C??`#=?2??NX]?????=?g!hU?????Kg϶??q2x???????5?ǑxK???d.??????Y?c>D?pxG?;?ʤ?O|d?????f
ݜ@?XZ??«W?h?? ??)pJzn??IC?{???	??0S}	??]J? ????E?)?c?u(??ľ%r??G(u???ڄ-p?gQ??CV??5?#???u?,sr???G<?ׇ?d?;?????N"nX?"??v?B???????5?S4?#??H??`??N{?)(???A???????+ˎ?8?V?N?M??^?W?~? ??W?[?R=S?U?? ?????r?Z)T?Rek;
Š?נ?-???r9???뗩0#?R???p?d?3?T~)L?-??q@??N?F ??0ɤ?l*?Z?&?op??@?Mxii9?g???q??U??ѣ??L.?irb?ʞ????{qJ?M???"J?k???9????E?t1?q??@tڗ'??:??Yj?f?fnZ???"??%;?:???'R7?ِ=˲?z{8?Lct?\?2??J?0??pj?'??g??ڮzN?;?P??????yhy$>-?o
?? G?B?[`???3uo?	C?"??)?J?A?ӟ?'?ӬEh?gN????TZ?8ʑ&U???)?94?|??(???d????3???8?I9??????A%Y`?y?ϒ@?H)??*f?3?=SLؚl9R?x??Nq??	?????H???4d??ɓ&m?ǮV????m/???????0/?.8??慦V??"??O???9A???#?5'?|?`?X:E??J?p?	?q"fA????#,4 ??I?`??PNM?
\y???j??g21?%?+?8 r??쎦?Ywe%?*x?(?r???????{\;RK?v	ta?N?H8??/?}?o??Odfq??i??$?9R3;cd??}?J?????p??;_z?L"?C[]???Gbb`ܜv	?94??'LV?x??
?jh{3/n,????6PPx??*ٍ?DV]?? G??=vl2PW?Y#?n?????e??p??I7?V?֓?O?u????g޾?D56??? ᱵ???B?u;I?;!??l?3Qq???_??????k`???B?
?????????D?	o??n??׋?NY۩?.R??	???T_f?ȂV?=x????	?XO?@D&?\???9~?	lC????.?????z???????(3??-?4?H?\d??i??,?4׿1m????t?$?:?E???82?;?/?W????f??;FhalB\?????m??Yß???_?T,t?{	*&???????8??L8_?N	O?C??? ??eâ@?r????Ǒ~n)HM?Ș??X?@?	?@ȴ??LvT??l&??]W?u??HI???JME??<?(%????G?8x?-**?F]??W??%X??E?Y?J?R?:?\X?Ԫ??l???ުR?V*?zX+grŭ|???*?a?\b}g?2uY?
/???|
@?????J,?1?	ze-<?0??ofK1?иE-?>?J??7???9E?	n???&plO????\????xQ??L-?ꎭ?n0?}??|??y#??D???c?1????Z?몗7M?g??=6? ?w}E4?b?-??.????H??:ᨹ_aH??????͕?+#?%0u?a1o?`??udFؚB???,vJ0??x?L?J-????C<Vk?z?m?????'DJ????%?-T7??<?????c??0?*3~sC\?$%??{:yf?X??T??b?yY??`Ɵ?ٓ?hd??9???v?*?*??|??}????? !?Y^?s0??i?I?e?????-??MS?L??^?ӵx<???.?0o~??=??Ϲ?b?"-e??;?p? ?h3u??Ƀ/??tl蓠6?O?*???f?B?HS?K3;?$?R?y??,???cns?<?%J?'v??Ph?`/}~??PKD??D|??õD?Q??.?????Ԁ???ZP??a.??
?zX??.??|.???VX/2A??L?
z???Qi!Y?˩p)??a??OV???????????Z `??d?(?k|?Cwilln6c???H??*H??d?5?l&ec?$%????N?^|?7?u8?oa͘SY7???2?SB?/C??????|?}?h????iI??_?%?TB??C.R??oY!<??dx?W ?P7????QC-?yC??{/8'?C?C"??+b?B?L??ʣ???D?l{?
?|N?_=?At?@?3?SM?e?\??:q?jo?&?ޫ??z????x???>?8D~?m7?"SM??Sn&f?۾vFX?\oy???@???X??m?h(??]?????{???vvw+j}?????9d??bs-??,p%M???c?c?Fp????iL???Ӿ??????????"?7de?r)ꛙ?ylȽ>??Vg?M7?`wqCK?4?rĨ? ???ߍ??܌??-???輩?/\FG?Ќ??f|n??F?L?L??m?9?9a?? ?'>?W	??awW}?fp?G#ب??ӵ???Ŀ???`.R
-????????Ev?R?Q?$???`_똯A?S??ؖ??MC???????y??(??? ??0???4????W??$?L?????&*{???j?jojj?o?????>?i`4??MR?zߛ?{???[Y?us?]y??t.?E????/?$a'??????ѻ?1?????ssw?7?:sX???$^GSdqv?]W?|1x?!??\?̀k?c?T?Q?%%?%.c%??q?}3?rCc.(????Ў	?ǝ??f???}5,Ջ?j!??K?L9[???r?f*[?L?k?B??b^G@?,e????2S?8??^??????V??         ?   x???? Cѳ?0I ?]??5?gYv*???L?,?m???z???M?F?[j?(??{???
         7   x?3?,(?O)M.?7656627??*H?4?2B7????[B?MP?-???1z\\\ ???         f   x?%??	?0D??)?@PD?qj?G簭E??s\?2??q$w?n"<?#?'{?<ӛ? T?!+?Tg?x!)?8܈z??x%16^x$ٕƶ??@?Y???g?R?B?     