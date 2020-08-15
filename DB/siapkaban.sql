PGDMP         9                x         	   siapkaban    12.3    12.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    status integer,
    d_perusahaan integer,
    d_pribadi integer
);
    DROP TABLE public.account;
       public         heap    postgres    false            �            1259    16567    data_perusahaan    TABLE       CREATE TABLE public.data_perusahaan (
    id integer NOT NULL,
    nama character varying(255),
    npwp character varying(255),
    alamat character varying(255),
    telepon character varying(255),
    email character varying(255),
    j_perusahaan integer,
    status integer
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
       public          postgres    false    207                        0    0    data_perusahaan_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.data_perusahaan_id_seq OWNED BY public.data_perusahaan.id;
          public          postgres    false    206            �            1259    16551    data_pribadi    TABLE     -  CREATE TABLE public.data_pribadi (
    id integer NOT NULL,
    nama character varying(255),
    n_identitas character varying(255),
    jabatan character varying(255),
    telepon character varying(255),
    email character varying(255),
    j_identitas integer,
    gambar character varying(255)
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
       public          postgres    false    205                       0    0    data_pribadi_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.data_pribadi_id_seq OWNED BY public.data_pribadi.id;
          public          postgres    false    204            �            1259    19097    dokumen    TABLE     �   CREATE TABLE public.dokumen (
    id integer NOT NULL,
    j_perusahaan integer,
    j_dokumen integer,
    s_j_dokumen integer,
    layanan integer
);
    DROP TABLE public.dokumen;
       public         heap    postgres    false            �            1259    19095    dokumen_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dokumen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.dokumen_id_seq;
       public          postgres    false    233                       0    0    dokumen_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.dokumen_id_seq OWNED BY public.dokumen.id;
          public          postgres    false    232            �            1259    19080    jenis_dokumen    TABLE     f   CREATE TABLE public.jenis_dokumen (
    id integer NOT NULL,
    keterangan character varying(255)
);
 !   DROP TABLE public.jenis_dokumen;
       public         heap    postgres    false            �            1259    19078    jenis_dokumen_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_dokumen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_dokumen_id_seq;
       public          postgres    false    229                       0    0    jenis_dokumen_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.jenis_dokumen_id_seq OWNED BY public.jenis_dokumen.id;
          public          postgres    false    228            �            1259    19038    jenis_fasilitas    TABLE     h   CREATE TABLE public.jenis_fasilitas (
    id integer NOT NULL,
    keterangan character varying(255)
);
 #   DROP TABLE public.jenis_fasilitas;
       public         heap    postgres    false            �            1259    18835    jenis_identitas    TABLE     h   CREATE TABLE public.jenis_identitas (
    id integer NOT NULL,
    keterangan character varying(255)
);
 #   DROP TABLE public.jenis_identitas;
       public         heap    postgres    false            �            1259    19025    jenis_layanan    TABLE     f   CREATE TABLE public.jenis_layanan (
    id integer NOT NULL,
    keterangan character varying(255)
);
 !   DROP TABLE public.jenis_layanan;
       public         heap    postgres    false            �            1259    18964    layanan    TABLE     �   CREATE TABLE public.layanan (
    id integer NOT NULL,
    j_perusahaan integer,
    s_j_layanan integer,
    j_layanan integer,
    j_pengelola integer,
    j_fasilitas integer,
    j_penimbunan integer
);
    DROP TABLE public.layanan;
       public         heap    postgres    false            �            1259    18962    jenis_layanan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_layanan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_layanan_id_seq;
       public          postgres    false    217                       0    0    jenis_layanan_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.jenis_layanan_id_seq OWNED BY public.layanan.id;
          public          postgres    false    216            �            1259    19023    jenis_layanan_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.jenis_layanan_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.jenis_layanan_id_seq1;
       public          postgres    false    221                       0    0    jenis_layanan_id_seq1    SEQUENCE OWNED BY     N   ALTER SEQUENCE public.jenis_layanan_id_seq1 OWNED BY public.jenis_layanan.id;
          public          postgres    false    220            �            1259    19044    jenis_pengelola    TABLE     h   CREATE TABLE public.jenis_pengelola (
    id integer NOT NULL,
    keterangan character varying(255)
);
 #   DROP TABLE public.jenis_pengelola;
       public         heap    postgres    false            �            1259    19036    jenis_pengelola_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_pengelola_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.jenis_pengelola_id_seq;
       public          postgres    false    223                       0    0    jenis_pengelola_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.jenis_pengelola_id_seq OWNED BY public.jenis_fasilitas.id;
          public          postgres    false    222            �            1259    19047    jenis_pengelola_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.jenis_pengelola_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_pengelola_id_seq1;
       public          postgres    false    224                       0    0    jenis_pengelola_id_seq1    SEQUENCE OWNED BY     R   ALTER SEQUENCE public.jenis_pengelola_id_seq1 OWNED BY public.jenis_pengelola.id;
          public          postgres    false    225            �            1259    19057    jenis_penimbunan    TABLE     i   CREATE TABLE public.jenis_penimbunan (
    id integer NOT NULL,
    keterangan character varying(255)
);
 $   DROP TABLE public.jenis_penimbunan;
       public         heap    postgres    false            �            1259    19055    jenis_penimbunan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_penimbunan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_penimbunan_id_seq;
       public          postgres    false    227                       0    0    jenis_penimbunan_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.jenis_penimbunan_id_seq OWNED BY public.jenis_penimbunan.id;
          public          postgres    false    226            �            1259    18843    jenis_perusahaan    TABLE     i   CREATE TABLE public.jenis_perusahaan (
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
       public          postgres    false    211            	           0    0    jenis_perusahaan_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.jenis_perusahaan_id_seq OWNED BY public.jenis_perusahaan.id;
          public          postgres    false    210            �            1259    18833    m_identitas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_identitas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.m_identitas_id_seq;
       public          postgres    false    209            
           0    0    m_identitas_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.m_identitas_id_seq OWNED BY public.jenis_identitas.id;
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
       public          postgres    false    213                       0    0    role_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;
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
       public          postgres    false    215                       0    0    status_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;
          public          postgres    false    214            �            1259    19088    sub_jenis_dokumen    TABLE     j   CREATE TABLE public.sub_jenis_dokumen (
    id integer NOT NULL,
    keterangan character varying(255)
);
 %   DROP TABLE public.sub_jenis_dokumen;
       public         heap    postgres    false            �            1259    19086    sub_jenis_dokumen_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_jenis_dokumen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.sub_jenis_dokumen_id_seq;
       public          postgres    false    231                       0    0    sub_jenis_dokumen_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.sub_jenis_dokumen_id_seq OWNED BY public.sub_jenis_dokumen.id;
          public          postgres    false    230            �            1259    18972    sub_jenis_layanan    TABLE     j   CREATE TABLE public.sub_jenis_layanan (
    id integer NOT NULL,
    keterangan character varying(255)
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
       public          postgres    false    219                       0    0    sub_jenis_layanan_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.sub_jenis_layanan_id_seq OWNED BY public.sub_jenis_layanan.id;
          public          postgres    false    218            �            1259    16500    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    203                       0    0    user_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.user_id_seq OWNED BY public.account.id;
          public          postgres    false    202                       2604    16505 
   account id    DEFAULT     e   ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 9   ALTER TABLE public.account ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203                       2604    16570    data_perusahaan id    DEFAULT     x   ALTER TABLE ONLY public.data_perusahaan ALTER COLUMN id SET DEFAULT nextval('public.data_perusahaan_id_seq'::regclass);
 A   ALTER TABLE public.data_perusahaan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207                       2604    16554    data_pribadi id    DEFAULT     r   ALTER TABLE ONLY public.data_pribadi ALTER COLUMN id SET DEFAULT nextval('public.data_pribadi_id_seq'::regclass);
 >   ALTER TABLE public.data_pribadi ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            *           2604    19100 
   dokumen id    DEFAULT     h   ALTER TABLE ONLY public.dokumen ALTER COLUMN id SET DEFAULT nextval('public.dokumen_id_seq'::regclass);
 9   ALTER TABLE public.dokumen ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            (           2604    19083    jenis_dokumen id    DEFAULT     t   ALTER TABLE ONLY public.jenis_dokumen ALTER COLUMN id SET DEFAULT nextval('public.jenis_dokumen_id_seq'::regclass);
 ?   ALTER TABLE public.jenis_dokumen ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            %           2604    19041    jenis_fasilitas id    DEFAULT     x   ALTER TABLE ONLY public.jenis_fasilitas ALTER COLUMN id SET DEFAULT nextval('public.jenis_pengelola_id_seq'::regclass);
 A   ALTER TABLE public.jenis_fasilitas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223                       2604    18838    jenis_identitas id    DEFAULT     t   ALTER TABLE ONLY public.jenis_identitas ALTER COLUMN id SET DEFAULT nextval('public.m_identitas_id_seq'::regclass);
 A   ALTER TABLE public.jenis_identitas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            $           2604    19028    jenis_layanan id    DEFAULT     u   ALTER TABLE ONLY public.jenis_layanan ALTER COLUMN id SET DEFAULT nextval('public.jenis_layanan_id_seq1'::regclass);
 ?   ALTER TABLE public.jenis_layanan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            &           2604    19049    jenis_pengelola id    DEFAULT     y   ALTER TABLE ONLY public.jenis_pengelola ALTER COLUMN id SET DEFAULT nextval('public.jenis_pengelola_id_seq1'::regclass);
 A   ALTER TABLE public.jenis_pengelola ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            '           2604    19060    jenis_penimbunan id    DEFAULT     z   ALTER TABLE ONLY public.jenis_penimbunan ALTER COLUMN id SET DEFAULT nextval('public.jenis_penimbunan_id_seq'::regclass);
 B   ALTER TABLE public.jenis_penimbunan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227                       2604    18846    jenis_perusahaan id    DEFAULT     z   ALTER TABLE ONLY public.jenis_perusahaan ALTER COLUMN id SET DEFAULT nextval('public.jenis_perusahaan_id_seq'::regclass);
 B   ALTER TABLE public.jenis_perusahaan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            "           2604    18967 
   layanan id    DEFAULT     n   ALTER TABLE ONLY public.layanan ALTER COLUMN id SET DEFAULT nextval('public.jenis_layanan_id_seq'::regclass);
 9   ALTER TABLE public.layanan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217                        2604    18864    role id    DEFAULT     b   ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            !           2604    18877 	   status id    DEFAULT     f   ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);
 8   ALTER TABLE public.status ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            )           2604    19091    sub_jenis_dokumen id    DEFAULT     |   ALTER TABLE ONLY public.sub_jenis_dokumen ALTER COLUMN id SET DEFAULT nextval('public.sub_jenis_dokumen_id_seq'::regclass);
 C   ALTER TABLE public.sub_jenis_dokumen ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            #           2604    18975    sub_jenis_layanan id    DEFAULT     |   ALTER TABLE ONLY public.sub_jenis_layanan ALTER COLUMN id SET DEFAULT nextval('public.sub_jenis_layanan_id_seq'::regclass);
 C   ALTER TABLE public.sub_jenis_layanan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �          0    16502    account 
   TABLE DATA           `   COPY public.account (id, username, password, role, status, d_perusahaan, d_pribadi) FROM stdin;
    public          postgres    false    203   j�       �          0    16567    data_perusahaan 
   TABLE DATA           g   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status) FROM stdin;
    public          postgres    false    207   |�       �          0    16551    data_pribadi 
   TABLE DATA           k   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar) FROM stdin;
    public          postgres    false    205   z�       �          0    19097    dokumen 
   TABLE DATA           T   COPY public.dokumen (id, j_perusahaan, j_dokumen, s_j_dokumen, layanan) FROM stdin;
    public          postgres    false    233   z�       �          0    19080    jenis_dokumen 
   TABLE DATA           7   COPY public.jenis_dokumen (id, keterangan) FROM stdin;
    public          postgres    false    229   �       �          0    19038    jenis_fasilitas 
   TABLE DATA           9   COPY public.jenis_fasilitas (id, keterangan) FROM stdin;
    public          postgres    false    223   ]�       �          0    18835    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    209   ��       �          0    19025    jenis_layanan 
   TABLE DATA           7   COPY public.jenis_layanan (id, keterangan) FROM stdin;
    public          postgres    false    221   П       �          0    19044    jenis_pengelola 
   TABLE DATA           9   COPY public.jenis_pengelola (id, keterangan) FROM stdin;
    public          postgres    false    224   �       �          0    19057    jenis_penimbunan 
   TABLE DATA           :   COPY public.jenis_penimbunan (id, keterangan) FROM stdin;
    public          postgres    false    227   ��       �          0    18843    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    211   �       �          0    18964    layanan 
   TABLE DATA           s   COPY public.layanan (id, j_perusahaan, s_j_layanan, j_layanan, j_pengelola, j_fasilitas, j_penimbunan) FROM stdin;
    public          postgres    false    217   ��       �          0    18861    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    213   ��       �          0    18874    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    215   �       �          0    19088    sub_jenis_dokumen 
   TABLE DATA           ;   COPY public.sub_jenis_dokumen (id, keterangan) FROM stdin;
    public          postgres    false    231   W�       �          0    18972    sub_jenis_layanan 
   TABLE DATA           ;   COPY public.sub_jenis_layanan (id, keterangan) FROM stdin;
    public          postgres    false    219   ��                  0    0    data_perusahaan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 26, true);
          public          postgres    false    206                       0    0    data_pribadi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 42, true);
          public          postgres    false    204                       0    0    dokumen_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.dokumen_id_seq', 187, true);
          public          postgres    false    232                       0    0    jenis_dokumen_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 3, true);
          public          postgres    false    228                       0    0    jenis_layanan_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 8, true);
          public          postgres    false    216                       0    0    jenis_layanan_id_seq1    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq1', 3, true);
          public          postgres    false    220                       0    0    jenis_pengelola_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq', 2, true);
          public          postgres    false    222                       0    0    jenis_pengelola_id_seq1    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq1', 6, true);
          public          postgres    false    225                       0    0    jenis_penimbunan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jenis_penimbunan_id_seq', 3, true);
          public          postgres    false    226                       0    0    jenis_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_perusahaan_id_seq', 1, false);
          public          postgres    false    210                       0    0    m_identitas_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.m_identitas_id_seq', 1, false);
          public          postgres    false    208                       0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    212                       0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 1, false);
          public          postgres    false    214                       0    0    sub_jenis_dokumen_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.sub_jenis_dokumen_id_seq', 114, true);
          public          postgres    false    230                       0    0    sub_jenis_layanan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sub_jenis_layanan_id_seq', 24, true);
          public          postgres    false    218                       0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 40, true);
          public          postgres    false    202            0           2606    16575 $   data_perusahaan data_perusahaan_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_pkey;
       public            postgres    false    207            .           2606    16559    data_pribadi data_pribadi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_pkey;
       public            postgres    false    205            J           2606    19102    dokumen dokumen_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_pkey;
       public            postgres    false    233            F           2606    19085     jenis_dokumen jenis_dokumen_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_pkey;
       public            postgres    false    229            :           2606    18969    layanan jenis_layanan_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT jenis_layanan_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.layanan DROP CONSTRAINT jenis_layanan_pkey;
       public            postgres    false    217            >           2606    19030 !   jenis_layanan jenis_layanan_pkey1 
   CONSTRAINT     _   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_pkey1 PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_pkey1;
       public            postgres    false    221            @           2606    19043 $   jenis_fasilitas jenis_pengelola_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_pengelola_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_pengelola_pkey;
       public            postgres    false    223            B           2606    19054 %   jenis_pengelola jenis_pengelola_pkey1 
   CONSTRAINT     c   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_pkey1 PRIMARY KEY (id);
 O   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_pkey1;
       public            postgres    false    224            D           2606    19062 &   jenis_penimbunan jenis_penimbunan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_pkey;
       public            postgres    false    227            4           2606    18848 &   jenis_perusahaan jenis_perusahaan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_perusahaan
    ADD CONSTRAINT jenis_perusahaan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_perusahaan DROP CONSTRAINT jenis_perusahaan_pkey;
       public            postgres    false    211            2           2606    18840     jenis_identitas m_identitas_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_identitas
    ADD CONSTRAINT m_identitas_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_identitas DROP CONSTRAINT m_identitas_pkey;
       public            postgres    false    209            6           2606    18866    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    213            8           2606    18879    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    215            H           2606    19093 (   sub_jenis_dokumen sub_jenis_dokumen_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sub_jenis_dokumen
    ADD CONSTRAINT sub_jenis_dokumen_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sub_jenis_dokumen DROP CONSTRAINT sub_jenis_dokumen_pkey;
       public            postgres    false    231            <           2606    18977 (   sub_jenis_layanan sub_jenis_layanan_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pkey;
       public            postgres    false    219            ,           2606    16510    account user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.account
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.account DROP CONSTRAINT user_pkey;
       public            postgres    false    203            K           2606    18994 !   account account_d_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_perusahaan_fkey FOREIGN KEY (d_perusahaan) REFERENCES public.data_perusahaan(id);
 K   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_perusahaan_fkey;
       public          postgres    false    203    207    3120            L           2606    18999    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_pribadi_fkey FOREIGN KEY (d_pribadi) REFERENCES public.data_pribadi(id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_pribadi_fkey;
       public          postgres    false    205    203    3118            Q           2606    18854 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    3124    211    207            P           2606    18989 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    207    3128    215            O           2606    18849 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    209    3122    205            Y           2606    19108    dokumen dokumen_j_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_j_dokumen_fkey FOREIGN KEY (j_dokumen) REFERENCES public.jenis_dokumen(id);
 H   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_j_dokumen_fkey;
       public          postgres    false    229    3142    233            X           2606    19103 !   dokumen dokumen_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 K   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_j_perusahaan_fkey;
       public          postgres    false    233    3124    211            [           2606    19118    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    217    3130    233            Z           2606    19113     dokumen dokumen_s_j_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_s_j_dokumen_fkey FOREIGN KEY (s_j_dokumen) REFERENCES public.sub_jenis_dokumen(id);
 J   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_s_j_dokumen_fkey;
       public          postgres    false    233    3144    231            R           2606    19013 '   layanan jenis_layanan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT jenis_layanan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 Q   ALTER TABLE ONLY public.layanan DROP CONSTRAINT jenis_layanan_j_perusahaan_fkey;
       public          postgres    false    3124    211    217            S           2606    19018 &   layanan jenis_layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT jenis_layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 P   ALTER TABLE ONLY public.layanan DROP CONSTRAINT jenis_layanan_s_j_layanan_fkey;
       public          postgres    false    3132    219    217            V           2606    19068     layanan layanan_j_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_fasilitas_fkey FOREIGN KEY (j_fasilitas) REFERENCES public.jenis_fasilitas(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_fasilitas_fkey;
       public          postgres    false    217    3136    223            T           2606    19031    layanan layanan_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_layanan_fkey FOREIGN KEY (j_layanan) REFERENCES public.jenis_layanan(id);
 H   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_layanan_fkey;
       public          postgres    false    221    217    3134            U           2606    19063     layanan layanan_j_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_pengelola_fkey FOREIGN KEY (j_pengelola) REFERENCES public.jenis_pengelola(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_pengelola_fkey;
       public          postgres    false    3138    217    224            W           2606    19073 !   layanan layanan_j_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_penimbunan_fkey FOREIGN KEY (j_penimbunan) REFERENCES public.jenis_penimbunan(id);
 K   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_penimbunan_fkey;
       public          postgres    false    227    3140    217            M           2606    18867    account user_role_fkey    FK CONSTRAINT     q   ALTER TABLE ONLY public.account
    ADD CONSTRAINT user_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 @   ALTER TABLE ONLY public.account DROP CONSTRAINT user_role_fkey;
       public          postgres    false    213    203    3126            N           2606    18880    account user_status_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.account
    ADD CONSTRAINT user_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 B   ALTER TABLE ONLY public.account DROP CONSTRAINT user_status_fkey;
       public          postgres    false    215    203    3128            �     x�-�IN1E�߇A�2�8lRR�R��p|2ty���[u�BP �4����נ�=x�#�I#�&�+�2�҄s"�7��aL��P�^��
0!�*ʅK�̬SWO�m�F��񒉋����s��J0#�x<�c�vȆj�Bp�'���V�l��L樿m���X�v1�%2��^#]Sa��ƸK°H�Sr���H�b�8��o�2��<��y�l������<�L�ĵ}nQ��$�--�,�]7w8�����[�      �   �   x�mQ�n�0=;_�a'�ƍ3�.��Xd�����Mb���H�5n��<[/H�+С�[E�0��"h���
K���׿՞��7H��{�|���A����B�Qn�%��a}:�S�w��5ԍYAX
p9����'c
OeVJZ����b;�$=
?�&:��5�:��t��Ks��)[Fϳ-i���K�CNZ�o@'�E�|�YL�oqX���ݼ}�UG��:
�7;��sw ��p      �   �   x��Q�n� =;_�/�lBS�M�v�z莽X]��$�	���_�v`<l!��3��g_*e��H_�� �2R�`�H����g����_�<���@�Z�� ��ǧ=�QM�3V�A"W݃�6'?�M�dH��;px{/��nZ�.�&9:��RP�B�`'�ԄCA��5��y�T���ޤ�������d� _��*"�[R�
"�p�'h?S�=J+Kk�g�X�qSU�7e~�t      �   �  x�]�av� ��ه�Ğ��?�
��z��HS+�L��i������q��& ��<�|E�;�i�1�2���72�v����4��4�yg&^�ɪ���=���H"���,cU�/��H�I�5^�;>#A��ퟃ����o~׬9�f����������э�ϡ�\��i���a٤a~���{���V+��]�5�Iw �at�����*9�6� �ne,6�~Ō$|H�H§Ĭ�c��1�Ǽ�2�e�+6�1.ɼ��k��w��/���7�]���C����߾W��ׅ�_�.|]���u���7�o��!|C�����7�o����������__________��)|S���M��7�o
��)|K���-�[·�o	������ٺ���G���xc��<�S�эڏ����k�U�7,wClW���g6G�%����X=}j�{��4<
WjX����L�S�S��y�<��?���5Y1�.c'+��&7���w�]�̯��c��h�h�%��>J��a����a���[Y�r/� ؁�׳�з�>:n��(�=��IB�زƟN��zN�b�z�<���glH>$8�6�g	��S�o9dc9>��]Y��¦��ĵpL\���n��µ������n��O)�x޼�      �   .   x�3�H-�����K��2q�+�K�<cN��̼��D�=... (^�      �   %   x�3�H�MJMJ,N��2r�ҁ�ĜL 7F��� ��	�      �   .   x�3��	�2����2�H,.�/�2���q�2�\1z\\\ �-	I      �   ,   x�3�H�KNL*-I��2r�J�3�lC�DjIb�����  Y�      �   h   x�3�tJLI�S-N�H�2��I�MJLOTH�M-��+I��2�t
���Ss�sBRsK|3�L��ǡ������b��@�Ҽ�ļt.3�faj����� �@z      �   M   x�3�tJ�K/�K�SHI��O,I,U�I, �%�qq� ٙ
�y��I U\Ɯ�y%��HB
NE�
ΥE�\1z\\\ �G.      �   �   x�M�M
�0FיS�	�z�@)%]���)5��%?���N���}^�L�Z|��P����}�ք�>��vɲઌ�%zQjib�pQΎ���
Z�>L5�0r�X(���8�fQ�u���5'�P������v������}��  F�9      �     x�]�ۭ� �o(�
̣�[��_�ڄI2��Vʉ����&m�������w�G�j�� !ҠB$�ET�曼�i͠N4��(
�E�T�(Z�.Z�.Z�.����5�ox���7h��@���h�8*��#%�9���9ٙ�dÊ���-����K�i��j����.i����(���q����Tb��YB����
ARkD5��Y��=�5 wք�Y�,+d�@�e��d����l���xOg���]3��F�k�h��_��A*��      �   \   x�5�K� �5}
N`�q>��G23 &�?d�e=���zV�#xf��D�6٤��xTE��9I�x�����x1���ϝJ�֎}�}K ;      �   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      �   ,  x��X�r�8=�_�ӄ;B]ڷ�U��rɮf�\1��@&,A�$��i���%�2��%���-�D.�|�2�~p��&U�U���<�����߫A�-O�B�e���B��[)���-~�����/�������H�v���l��<�2c=eUh� ��s��FT����H�(X�ٳ.RYj��deJ�"wz-�r'c�LtD���ĕK�W�NtK�"K�uģJ���YI#0aܖ&���b�Ll�
����
ţ��JQ�'�%�.Hp���"�c8Ff�����Ȕ8l�$"���ufA���?�*��=<�Ee�]��JW�$�\ۈ�p|M��=�)���X�Z��[T��Kzظ���������A�d���y�堑�o���M\q��ZR$8
�pOY��ep���o�l��zI+�kY^8��T���^-I �;;{o����ʎ����՟��-<�j4��7��Q8-��/q�|�"��>/�by�x��ffv��z����p{��Q�=^��|��A�A�ћ�Cn*m�B���Z�Ĥ6!�4��n�JY���D`;���QP�G���O�����gւ��u�cj��R�v�TR�Y𽐚�9�@ �E�(w��H3#�V��w0����Dl�~b�G�6������%~+'����J`nC��%>���Wx�\\���ԡ9��o������g�,97Gx�Zxk�b�;�	�<ɵ�8z�A�U��P�w�r��p���W*R\��ȝE#���%v��O���+_H���diKؖ�Y���d�7��>V4����sZ�8�m�i*i<8�676|㣞��kd��t�;*%�U�x�����a�=:n�����޸��j�fg���#kSj��q�1)���=�����\�C]�o��l<;㺃�����%�;��Ġ!׊p��ä�V�Ƣ����� Tl��`d3��/��t�aeh�_l�� ��S�I�����J�H�@�§�<*��[��� X���RK�x�h������������3���$��|4պ���O�x�7T4�4ʁ�창� ;N�d�E���s�,F7UT��+���߻��U� a����P�3U�'~���n$��L�W��)�7����������y߼fEHndg��v�.ͭ��e�&�o�yp�\�#�MG�hｩǫ���V�v��p浃��ճ��9�x��1S���jc��J��<��*�p�W���7���׍h���l��$劸L�C;J�6�������o�`SD
�0���8�7�'��#y].��2�����U8P9ao��i��l�΄��³��z8(t��B�lw.�x8���ppc)q�u�K0����P�]7_��-��X�����=�]�b��\��"c����e"���X�no D���K-�ݰJ��0����e�K.CӃ�}bY����T�ˌ���S��`�\�g��D|X�9�43�%��^G��A��h5�Iƻ�kԅnC�v��A&�Q��윜�12���VO!�!��
K��gz�����Xٰahǉ�@�<5b�D���T]:�Ì�]\�zt:�����m�����a�g1 ۇ�7d�u��bM{dItkJS2���Vrݷ�%��%��'�ю9����=���ܳx��P�>]�*�{Si�À�u�mbOe���;�b���Q�g��F�t&��N�^��f����Po��;��ɵ��8s�?h�^����Kq����5�t_��m���

�?�$��3J�k:E)7θ��SX!�+U*��K]������9��������q�o�^�YG��`/��^go���Q��Q�T4�0v�2	��Ie6>�{��%|��h��HB;m���]�ȣ��������fe��|'���"��WeT�v�<���!�qU����7���Dָ�Էz����"���F����ގ����)G`��{��X}=����^ h���9�#V2�������-�B�H.��?�_����(�t���e�	�����5���x����fH���n�R*��jX���#�z�3@� x.�;[�G٧w��#\���6���OWWW�4��/      �   �  x��T�n�0<�_�cN(?s
���B�^zY���D	|���w)ɵd'F�$>f��;C��d>�9�P�7P�`�C�P���kU)�آS���� �`B$�qt�����(M�3�J�g"M�c��r� A���ʫ���y����^=X"a��Z���rު"8��"Y_�1����{M�m��wJ:(G{NҫE�
~:�pnݯ�w�6SV]{�o۬/�+	�"(�~���{����M�!Z�p����B���|��55�sկ�R��X��62h�,/��u�jn��k$BU��\��LìK��s�K\����tl4"P�w�6C�[<Mė�B�9zh�_��;(���ɡ,M�͘��q�������j����m�{����4���7ܡDK+�ҧ�gn����T��F�P��#n]�B,z�o��d����]�X&6��^�XOQ`g��ѐ5��1����bIB����O�/���?3��?����     