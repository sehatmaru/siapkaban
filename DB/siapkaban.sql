PGDMP     8    :                x         	   siapkaban    12.3    12.3 S    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16412 	   siapkaban    DATABASE     g   CREATE DATABASE siapkaban WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE siapkaban;
                postgres    false            �            1259    16502    account    TABLE     �   CREATE TABLE public.account (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255),
    role integer,
    status integer
);
    DROP TABLE public.account;
       public         heap    postgres    false            �            1259    16567    data_perusahaan    TABLE     8  CREATE TABLE public.data_perusahaan (
    id integer NOT NULL,
    nama character varying(255),
    npwp character varying(255),
    alamat character varying(255),
    telepon character varying(255),
    email character varying(255),
    j_perusahaan integer,
    account integer NOT NULL,
    status integer
);
 #   DROP TABLE public.data_perusahaan;
       public         heap    postgres    false            �            1259    18928    data_perusahaan_account_seq    SEQUENCE     �   CREATE SEQUENCE public.data_perusahaan_account_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.data_perusahaan_account_seq;
       public          postgres    false    207            �           0    0    data_perusahaan_account_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.data_perusahaan_account_seq OWNED BY public.data_perusahaan.account;
          public          postgres    false    216            �            1259    16565    data_perusahaan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.data_perusahaan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.data_perusahaan_id_seq;
       public          postgres    false    207            �           0    0    data_perusahaan_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.data_perusahaan_id_seq OWNED BY public.data_perusahaan.id;
          public          postgres    false    206            �            1259    16551    data_pribadi    TABLE     K  CREATE TABLE public.data_pribadi (
    id integer NOT NULL,
    nama character varying(255),
    n_identitas character varying(255),
    jabatan character varying(255),
    telepon character varying(255),
    email character varying(255),
    j_identitas integer,
    account integer NOT NULL,
    gambar character varying(255)
);
     DROP TABLE public.data_pribadi;
       public         heap    postgres    false            �            1259    18938    data_pribadi_account_seq    SEQUENCE     �   CREATE SEQUENCE public.data_pribadi_account_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.data_pribadi_account_seq;
       public          postgres    false    205            �           0    0    data_pribadi_account_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.data_pribadi_account_seq OWNED BY public.data_pribadi.account;
          public          postgres    false    217            �            1259    16549    data_pribadi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.data_pribadi_id_seq
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
       public         heap    postgres    false            �            1259    18964    jenis_layanan    TABLE     f   CREATE TABLE public.jenis_layanan (
    id integer NOT NULL,
    keterangan character varying(255)
);
 !   DROP TABLE public.jenis_layanan;
       public         heap    postgres    false            �            1259    18962    jenis_layanan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_layanan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_layanan_id_seq;
       public          postgres    false    219            �           0    0    jenis_layanan_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.jenis_layanan_id_seq OWNED BY public.jenis_layanan.id;
          public          postgres    false    218            �            1259    18843    jenis_perusahaan    TABLE     i   CREATE TABLE public.jenis_perusahaan (
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
          public          postgres    false    212            �            1259    18874    status    TABLE     _   CREATE TABLE public.status (
    id integer NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.status;
       public         heap    postgres    false            �            1259    18872    status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public          postgres    false    215            �           0    0    status_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;
          public          postgres    false    214            �            1259    18972    sub_jenis_layanan    TABLE     }   CREATE TABLE public.sub_jenis_layanan (
    id integer NOT NULL,
    keterangan character varying(255),
    jenis integer
);
 %   DROP TABLE public.sub_jenis_layanan;
       public         heap    postgres    false            �            1259    18970    sub_jenis_layanan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_jenis_layanan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.sub_jenis_layanan_id_seq;
       public          postgres    false    221            �           0    0    sub_jenis_layanan_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.sub_jenis_layanan_id_seq OWNED BY public.sub_jenis_layanan.id;
          public          postgres    false    220            �            1259    16500    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    203            �           0    0    user_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.user_id_seq OWNED BY public.account.id;
          public          postgres    false    202            �           2604    16505 
   account id    DEFAULT     e   ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 9   ALTER TABLE public.account ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �           2604    16570    data_perusahaan id    DEFAULT     x   ALTER TABLE ONLY public.data_perusahaan ALTER COLUMN id SET DEFAULT nextval('public.data_perusahaan_id_seq'::regclass);
 A   ALTER TABLE public.data_perusahaan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            �           2604    18930    data_perusahaan account    DEFAULT     �   ALTER TABLE ONLY public.data_perusahaan ALTER COLUMN account SET DEFAULT nextval('public.data_perusahaan_account_seq'::regclass);
 F   ALTER TABLE public.data_perusahaan ALTER COLUMN account DROP DEFAULT;
       public          postgres    false    216    207            �           2604    16554    data_pribadi id    DEFAULT     r   ALTER TABLE ONLY public.data_pribadi ALTER COLUMN id SET DEFAULT nextval('public.data_pribadi_id_seq'::regclass);
 >   ALTER TABLE public.data_pribadi ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            �           2604    18940    data_pribadi account    DEFAULT     |   ALTER TABLE ONLY public.data_pribadi ALTER COLUMN account SET DEFAULT nextval('public.data_pribadi_account_seq'::regclass);
 C   ALTER TABLE public.data_pribadi ALTER COLUMN account DROP DEFAULT;
       public          postgres    false    217    205            �           2604    18838    jenis_identitas id    DEFAULT     t   ALTER TABLE ONLY public.jenis_identitas ALTER COLUMN id SET DEFAULT nextval('public.m_identitas_id_seq'::regclass);
 A   ALTER TABLE public.jenis_identitas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            �           2604    18967    jenis_layanan id    DEFAULT     t   ALTER TABLE ONLY public.jenis_layanan ALTER COLUMN id SET DEFAULT nextval('public.jenis_layanan_id_seq'::regclass);
 ?   ALTER TABLE public.jenis_layanan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    18846    jenis_perusahaan id    DEFAULT     z   ALTER TABLE ONLY public.jenis_perusahaan ALTER COLUMN id SET DEFAULT nextval('public.jenis_perusahaan_id_seq'::regclass);
 B   ALTER TABLE public.jenis_perusahaan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �           2604    18864    role id    DEFAULT     b   ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            �           2604    18877 	   status id    DEFAULT     f   ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);
 8   ALTER TABLE public.status ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    18975    sub_jenis_layanan id    DEFAULT     |   ALTER TABLE ONLY public.sub_jenis_layanan ALTER COLUMN id SET DEFAULT nextval('public.sub_jenis_layanan_id_seq'::regclass);
 C   ALTER TABLE public.sub_jenis_layanan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �          0    16502    account 
   TABLE DATA           G   COPY public.account (id, username, password, role, status) FROM stdin;
    public          postgres    false    203   �^       �          0    16567    data_perusahaan 
   TABLE DATA           p   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, account, status) FROM stdin;
    public          postgres    false    207   _       �          0    16551    data_pribadi 
   TABLE DATA           t   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, account, gambar) FROM stdin;
    public          postgres    false    205   K_       �          0    18835    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    209   �_       �          0    18964    jenis_layanan 
   TABLE DATA           7   COPY public.jenis_layanan (id, keterangan) FROM stdin;
    public          postgres    false    219   �_       �          0    18843    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    211   #`       �          0    18861    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    213   �`       �          0    18874    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    215   a       �          0    18972    sub_jenis_layanan 
   TABLE DATA           B   COPY public.sub_jenis_layanan (id, keterangan, jenis) FROM stdin;
    public          postgres    false    221   Ya       �           0    0    data_perusahaan_account_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.data_perusahaan_account_seq', 1, false);
          public          postgres    false    216            �           0    0    data_perusahaan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 8, true);
          public          postgres    false    206            �           0    0    data_pribadi_account_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.data_pribadi_account_seq', 1, false);
          public          postgres    false    217            �           0    0    data_pribadi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 15, true);
          public          postgres    false    204            �           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 1, false);
          public          postgres    false    218            �           0    0    jenis_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_perusahaan_id_seq', 1, false);
          public          postgres    false    210            �           0    0    m_identitas_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.m_identitas_id_seq', 1, false);
          public          postgres    false    208            �           0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    212            �           0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 1, false);
          public          postgres    false    214            �           0    0    sub_jenis_layanan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sub_jenis_layanan_id_seq', 1, false);
          public          postgres    false    220            �           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 22, true);
          public          postgres    false    202                       2606    16575 $   data_perusahaan data_perusahaan_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_pkey;
       public            postgres    false    207                       2606    16559    data_pribadi data_pribadi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_pkey;
       public            postgres    false    205                       2606    18969     jenis_layanan jenis_layanan_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_pkey;
       public            postgres    false    219            	           2606    18848 &   jenis_perusahaan jenis_perusahaan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_perusahaan
    ADD CONSTRAINT jenis_perusahaan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_perusahaan DROP CONSTRAINT jenis_perusahaan_pkey;
       public            postgres    false    211                       2606    18840     jenis_identitas m_identitas_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_identitas
    ADD CONSTRAINT m_identitas_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_identitas DROP CONSTRAINT m_identitas_pkey;
       public            postgres    false    209                       2606    18866    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    213                       2606    18879    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    215                       2606    18977 (   sub_jenis_layanan sub_jenis_layanan_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pkey;
       public            postgres    false    221                       2606    16510    account user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.account
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.account DROP CONSTRAINT user_pkey;
       public            postgres    false    203                       2606    18854 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    3081    207    211                       2606    18989 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    207    215    3085                       2606    18849 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    205    3079    209                       2606    18948 +   data_perusahaan fk4hh1h8ls33p8oe94u7rml6xxt    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT fk4hh1h8ls33p8oe94u7rml6xxt FOREIGN KEY (account) REFERENCES public.account(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT fk4hh1h8ls33p8oe94u7rml6xxt;
       public          postgres    false    207    3073    203                       2606    18953 (   data_pribadi fkcay55lcv48fgc2cxq4b5xnh50    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT fkcay55lcv48fgc2cxq4b5xnh50 FOREIGN KEY (account) REFERENCES public.account(id);
 R   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT fkcay55lcv48fgc2cxq4b5xnh50;
       public          postgres    false    3073    205    203                       2606    18984 .   sub_jenis_layanan sub_jenis_layanan_jenis_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_jenis_fkey FOREIGN KEY (jenis) REFERENCES public.jenis_layanan(id);
 X   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_jenis_fkey;
       public          postgres    false    3087    221    219                       2606    18867    account user_role_fkey    FK CONSTRAINT     q   ALTER TABLE ONLY public.account
    ADD CONSTRAINT user_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 @   ALTER TABLE ONLY public.account DROP CONSTRAINT user_role_fkey;
       public          postgres    false    203    3083    213                       2606    18880    account user_status_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.account
    ADD CONSTRAINT user_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 B   ALTER TABLE ONLY public.account DROP CONSTRAINT user_status_fkey;
       public          postgres    false    215    3085    203            �   H   x�%�9�0��Ǡ���(�xi�����K[�[�p�m��Z#7�����)s��r�W
L�2]��3����8      �   3   x�3�L�b0e�id�i�e����`h�id�i�eQ�@%�&\1z\\\ w
�      �   E   x�34�LLL�4 ��b�D 4�42����24����·HU�����՘r��!P�$���� a[M      �   .   x�3��	�2����2�H,.�/�2���q�2�\1z\\\ �-	I      �   5   x�3�H-ʬ��K�SpJ,*�2	�&%f <��\�@���Ĥ��H� �      �   y   x�=�K
�0D��)|�B�(�R���Yv�P��FJ�-z�j��̛��a�U�p�25<��ޤK/��R㺤�R���o?n?d[K��kn�z�3L,���5�l����ڨ^�s��I�C�?�^/�      �   \   x�5�K� �5}
N`�q>��G23 &�?d�e=���zV�#xf��D�6٤��xTE��9I�x�����x1���ϝJ�֎}�}K ;      �   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      �   !   x�3�H�K-I,H��4�2��"�=... g�e     