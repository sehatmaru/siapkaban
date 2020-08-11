PGDMP     &    9                x         	   siapkaban    12.3    12.3 3    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16412 	   siapkaban    DATABASE     g   CREATE DATABASE siapkaban WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE siapkaban;
                postgres    false            �            1259    16567    data_perusahaan    TABLE       CREATE TABLE public.data_perusahaan (
    id integer NOT NULL,
    nama character varying(255),
    npwp character varying(255),
    alamat character varying(255),
    telepon character varying(255),
    email character varying(255),
    "user" integer,
    j_perusahaan integer
);
 #   DROP TABLE public.data_perusahaan;
       public         heap    postgres    false            �            1259    16565    data_perusahaan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.data_perusahaan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.data_perusahaan_id_seq;
       public          postgres    false    207            �           0    0    data_perusahaan_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.data_perusahaan_id_seq OWNED BY public.data_perusahaan.id;
          public          postgres    false    206            �            1259    16551    data_pribadi    TABLE       CREATE TABLE public.data_pribadi (
    id integer NOT NULL,
    nama character varying(255),
    n_identitas character varying(255),
    jabatan character varying(255),
    telepon character varying(255),
    email character varying(255),
    "user" integer,
    j_identitas integer
);
     DROP TABLE public.data_pribadi;
       public         heap    postgres    false            �            1259    16549    data_pribadi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.data_pribadi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.data_pribadi_id_seq;
       public          postgres    false    205            �           0    0    data_pribadi_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.data_pribadi_id_seq OWNED BY public.data_pribadi.id;
          public          postgres    false    204            �            1259    18835    jenis_identitas    TABLE     h   CREATE TABLE public.jenis_identitas (
    id integer NOT NULL,
    keterangan character varying(255)
);
 #   DROP TABLE public.jenis_identitas;
       public         heap    postgres    false            �            1259    18843    jenis_perusahaan    TABLE     i   CREATE TABLE public.jenis_perusahaan (
    id integer NOT NULL,
    keterangan character varying(255)
);
 $   DROP TABLE public.jenis_perusahaan;
       public         heap    postgres    false            �            1259    18841    jenis_perusahaan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_perusahaan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_perusahaan_id_seq;
       public          postgres    false    211            �           0    0    jenis_perusahaan_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.jenis_perusahaan_id_seq OWNED BY public.jenis_perusahaan.id;
          public          postgres    false    210            �            1259    18833    m_identitas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_identitas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.m_identitas_id_seq;
       public          postgres    false    209            �           0    0    m_identitas_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.m_identitas_id_seq OWNED BY public.jenis_identitas.id;
          public          postgres    false    208            �            1259    18861    role    TABLE     ]   CREATE TABLE public.role (
    id integer NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    18859    role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false    213            �           0    0    role_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;
          public          postgres    false    212            �            1259    16502    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255),
    status boolean,
    role integer
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    16500    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    203            �           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    202            �           2604    16570    data_perusahaan id    DEFAULT     x   ALTER TABLE ONLY public.data_perusahaan ALTER COLUMN id SET DEFAULT nextval('public.data_perusahaan_id_seq'::regclass);
 A   ALTER TABLE public.data_perusahaan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            �           2604    16554    data_pribadi id    DEFAULT     r   ALTER TABLE ONLY public.data_pribadi ALTER COLUMN id SET DEFAULT nextval('public.data_pribadi_id_seq'::regclass);
 >   ALTER TABLE public.data_pribadi ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            �           2604    18838    jenis_identitas id    DEFAULT     t   ALTER TABLE ONLY public.jenis_identitas ALTER COLUMN id SET DEFAULT nextval('public.m_identitas_id_seq'::regclass);
 A   ALTER TABLE public.jenis_identitas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            �           2604    18846    jenis_perusahaan id    DEFAULT     z   ALTER TABLE ONLY public.jenis_perusahaan ALTER COLUMN id SET DEFAULT nextval('public.jenis_perusahaan_id_seq'::regclass);
 B   ALTER TABLE public.jenis_perusahaan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �           2604    18864    role id    DEFAULT     b   ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �           2604    16505    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            y          0    16567    data_perusahaan 
   TABLE DATA           g   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, "user", j_perusahaan) FROM stdin;
    public          postgres    false    207   g9       w          0    16551    data_pribadi 
   TABLE DATA           k   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, "user", j_identitas) FROM stdin;
    public          postgres    false    205   �9       {          0    18835    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    209   �9       }          0    18843    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    211   �9                 0    18861    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    213   h:       u          0    16502    user 
   TABLE DATA           F   COPY public."user" (id, username, password, status, role) FROM stdin;
    public          postgres    false    203   �:       �           0    0    data_perusahaan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 1, false);
          public          postgres    false    206            �           0    0    data_pribadi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 1, false);
          public          postgres    false    204            �           0    0    jenis_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_perusahaan_id_seq', 1, false);
          public          postgres    false    210            �           0    0    m_identitas_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.m_identitas_id_seq', 1, false);
          public          postgres    false    208            �           0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    212            �           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
          public          postgres    false    202            �           2606    16575 $   data_perusahaan data_perusahaan_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_pkey;
       public            postgres    false    207            �           2606    16559    data_pribadi data_pribadi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_pkey;
       public            postgres    false    205            �           2606    18848 &   jenis_perusahaan jenis_perusahaan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_perusahaan
    ADD CONSTRAINT jenis_perusahaan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_perusahaan DROP CONSTRAINT jenis_perusahaan_pkey;
       public            postgres    false    211            �           2606    18840     jenis_identitas m_identitas_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_identitas
    ADD CONSTRAINT m_identitas_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_identitas DROP CONSTRAINT m_identitas_pkey;
       public            postgres    false    209            �           2606    18866    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    213            �           2606    16510    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    203            �           2606    18854 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    211    3054    207            �           2606    18849 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    3052    209    205            �           2606    16576 "   data_perusahaan fk_perusahaan_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT fk_perusahaan_user FOREIGN KEY ("user") REFERENCES public."user"(id);
 L   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT fk_perusahaan_user;
       public          postgres    false    203    207    3046            �           2606    16560    data_pribadi fk_pribadi_user    FK CONSTRAINT     {   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT fk_pribadi_user FOREIGN KEY ("user") REFERENCES public."user"(id);
 F   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT fk_pribadi_user;
       public          postgres    false    3046    203    205            �           2606    18867    user user_role_fkey    FK CONSTRAINT     p   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 ?   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_role_fkey;
       public          postgres    false    203    3056    213            y      x������ � �      w      x������ � �      {   .   x�3��	�2����2�H,.�/�2���q�2�\1z\\\ �-	I      }   y   x�=�K
�0D��)|�B�(�R���Yv�P��FJ�-z�j��̛��a�U�p�25<��ޤK/��R㺤�R���o?n?d[K��kn�z�3L,���5�l����ڨ^�s��I�C�?�^/�         \   x�5�K� �5}
N`�q>��G23 &�?d�e=���zV�#xf��D�6٤��xTE��9I�x�����x1���ϝJ�֎}�}K ;      u      x������ � �     