PGDMP                 	        x         
   siapkaban7    12.3    12.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18352 
   siapkaban7    DATABASE     �   CREATE DATABASE siapkaban7 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE siapkaban7;
                postgres    false            �            1259    18353    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false            �            1259    18355    account    TABLE        CREATE TABLE public.account (
    id integer DEFAULT nextval('public.user_id_seq'::regclass) NOT NULL,
    username character varying(255),
    password character varying(255),
    role integer,
    status integer,
    d_perusahaan integer,
    d_pribadi integer,
    j_lokasi integer
);
    DROP TABLE public.account;
       public         heap    postgres    false    202            �            1259    18362    data_perusahaan_id_seq    SEQUENCE        CREATE SEQUENCE public.data_perusahaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.data_perusahaan_id_seq;
       public          postgres    false            �            1259    18364    data_perusahaan    TABLE     $  CREATE TABLE public.data_perusahaan (
    id integer DEFAULT nextval('public.data_perusahaan_id_seq'::regclass) NOT NULL,
    nama character varying(255),
    npwp character varying(255),
    alamat character varying(255),
    telepon character varying(255),
    email character varying(255),
    j_perusahaan integer,
    status integer,
    komoditi_utama character varying(255),
    no_skep character varying(255),
    tgl_skep character varying(255),
    penanggung_jawab character varying(255),
    kecamatan integer,
    kabupaten integer
);
 #   DROP TABLE public.data_perusahaan;
       public         heap    postgres    false    204            �            1259    18371    data_pribadi_id_seq    SEQUENCE     |   CREATE SEQUENCE public.data_pribadi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.data_pribadi_id_seq;
       public          postgres    false            �            1259    18373    data_pribadi    TABLE     �  CREATE TABLE public.data_pribadi (
    id integer DEFAULT nextval('public.data_pribadi_id_seq'::regclass) NOT NULL,
    nama character varying(255),
    n_identitas character varying(255),
    jabatan character varying(255),
    telepon character varying(255),
    email character varying(255),
    j_identitas integer,
    gambar character varying(255),
    eselon_2 character varying(255),
    eselon_3 character varying(255),
    eselon_4 character varying(255)
);
     DROP TABLE public.data_pribadi;
       public         heap    postgres    false    206            �            1259    18380    dokumen_proses_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.dokumen_proses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.dokumen_proses_id_seq;
       public          postgres    false            �            1259    18382    dokumen    TABLE       CREATE TABLE public.dokumen (
    id integer DEFAULT nextval('public.dokumen_proses_id_seq'::regclass) NOT NULL,
    nama_dokumen character varying(255),
    path character varying(255),
    jenis_dokumen integer,
    pemohon integer,
    status integer,
    layanan integer
);
    DROP TABLE public.dokumen;
       public         heap    postgres    false    208            �            1259    18389    jenis_dokumen_id_seq    SEQUENCE     }   CREATE SEQUENCE public.jenis_dokumen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_dokumen_id_seq;
       public          postgres    false            �            1259    18391    jenis_dokumen    TABLE     $  CREATE TABLE public.jenis_dokumen (
    id integer DEFAULT nextval('public.jenis_dokumen_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_sub_jenis_layanan integer,
    deskripsi_dokumen character varying(255),
    role integer,
    status character varying(255)
);
 !   DROP TABLE public.jenis_dokumen;
       public         heap    postgres    false    210            �            1259    18398    jenis_pengelola_id_seq    SEQUENCE        CREATE SEQUENCE public.jenis_pengelola_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.jenis_pengelola_id_seq;
       public          postgres    false            �            1259    18400    jenis_fasilitas    TABLE     �   CREATE TABLE public.jenis_fasilitas (
    id integer DEFAULT nextval('public.jenis_pengelola_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 #   DROP TABLE public.jenis_fasilitas;
       public         heap    postgres    false    212            �            1259    18404    m_identitas_id_seq    SEQUENCE     {   CREATE SEQUENCE public.m_identitas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.m_identitas_id_seq;
       public          postgres    false            �            1259    18406    jenis_identitas    TABLE     �   CREATE TABLE public.jenis_identitas (
    id integer DEFAULT nextval('public.m_identitas_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 #   DROP TABLE public.jenis_identitas;
       public         heap    postgres    false    214            �            1259    18410    jenis_layanan_id_seq1    SEQUENCE     ~   CREATE SEQUENCE public.jenis_layanan_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.jenis_layanan_id_seq1;
       public          postgres    false            �            1259    18412    jenis_layanan    TABLE     "  CREATE TABLE public.jenis_layanan (
    id integer DEFAULT nextval('public.jenis_layanan_id_seq1'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer,
    id_jenis_fasilitas integer,
    id_jenis_pengelola integer,
    id_jenis_penimbunan integer
);
 !   DROP TABLE public.jenis_layanan;
       public         heap    postgres    false    216            �            1259    18416    jenis_layanan_id_seq    SEQUENCE     }   CREATE SEQUENCE public.jenis_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_layanan_id_seq;
       public          postgres    false            �            1259    18418    jenis_lokasi_id_seq    SEQUENCE     |   CREATE SEQUENCE public.jenis_lokasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.jenis_lokasi_id_seq;
       public          postgres    false            �            1259    18420    jenis_lokasi    TABLE     �   CREATE TABLE public.jenis_lokasi (
    id integer DEFAULT nextval('public.jenis_lokasi_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
     DROP TABLE public.jenis_lokasi;
       public         heap    postgres    false    219            �            1259    18424    jenis_pengawas    TABLE     g   CREATE TABLE public.jenis_pengawas (
    id integer NOT NULL,
    keterangan character varying(255)
);
 "   DROP TABLE public.jenis_pengawas;
       public         heap    postgres    false            �            1259    18427    jenis_pengawas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_pengawas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.jenis_pengawas_id_seq;
       public          postgres    false    221            �           0    0    jenis_pengawas_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.jenis_pengawas_id_seq OWNED BY public.jenis_pengawas.id;
          public          postgres    false    222            �            1259    18429    jenis_pengelola_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.jenis_pengelola_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_pengelola_id_seq1;
       public          postgres    false            �            1259    18431    jenis_pengelola    TABLE     �   CREATE TABLE public.jenis_pengelola (
    id integer DEFAULT nextval('public.jenis_pengelola_id_seq1'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 #   DROP TABLE public.jenis_pengelola;
       public         heap    postgres    false    223            �            1259    18435    jenis_penimbunan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_penimbunan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_penimbunan_id_seq;
       public          postgres    false            �            1259    18437    jenis_penimbunan    TABLE     �   CREATE TABLE public.jenis_penimbunan (
    id integer DEFAULT nextval('public.jenis_penimbunan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 $   DROP TABLE public.jenis_penimbunan;
       public         heap    postgres    false    225            �            1259    18441    jenis_perusahaan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_perusahaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_perusahaan_id_seq;
       public          postgres    false            �            1259    18443    jenis_perusahaan    TABLE     �   CREATE TABLE public.jenis_perusahaan (
    id integer DEFAULT nextval('public.jenis_perusahaan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 $   DROP TABLE public.jenis_perusahaan;
       public         heap    postgres    false    227            �            1259    18447    kabupaten_id_seq    SEQUENCE     y   CREATE SEQUENCE public.kabupaten_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kabupaten_id_seq;
       public          postgres    false            �            1259    18449 	   kabupaten    TABLE     �   CREATE TABLE public.kabupaten (
    id integer DEFAULT nextval('public.kabupaten_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    j_lokasi integer
);
    DROP TABLE public.kabupaten;
       public         heap    postgres    false    229            �            1259    18453    kecamatan_id_seq    SEQUENCE     y   CREATE SEQUENCE public.kecamatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kecamatan_id_seq;
       public          postgres    false            �            1259    18455 	   kecamatan    TABLE     �   CREATE TABLE public.kecamatan (
    id integer DEFAULT nextval('public.kecamatan_id_seq'::regclass) NOT NULL,
    keterangan character varying(225),
    kabupaten integer
);
    DROP TABLE public.kecamatan;
       public         heap    postgres    false    231            �            1259    18459    layanan    TABLE       CREATE TABLE public.layanan (
    id integer DEFAULT nextval('public.jenis_layanan_id_seq'::regclass) NOT NULL,
    pemohon integer,
    s_j_layanan integer,
    penerima character varying(255),
    pemeriksa_p2 character varying(255),
    pemeriksa_perbend character varying(255),
    pemeriksa_pkc character varying(255),
    k_seksi_p2 character varying(255),
    k_seksi_perbend character varying(255),
    k_seksi_pkc character varying(255),
    k_s_seksi_p2 character varying(255),
    k_s_seksi_perbend character varying(255),
    k_s_seksi_pkc character varying(255),
    k_kantor character varying(255),
    status integer,
    nomor character varying(6),
    j_lokasi integer,
    tanggal date,
    kw_k_kantor character varying(255),
    kw_penerima character varying(255),
    kw_pemeriksa_p2 character varying(255),
    kw_k_s_intelijen character varying(255),
    kw_k_b_fasilitas character varying(255),
    kw_k_b_p2 character varying(255),
    kw_k_s_pf character varying(255),
    kw_pemeriksa_dokumen character varying(255)
);
    DROP TABLE public.layanan;
       public         heap    postgres    false    218            �            1259    18466    role_id_seq    SEQUENCE     t   CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false            �            1259    18468    role    TABLE     �   CREATE TABLE public.role (
    id integer DEFAULT nextval('public.role_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.role;
       public         heap    postgres    false    234            �            1259    18472    status_id_seq    SEQUENCE     v   CREATE SEQUENCE public.status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public          postgres    false            �            1259    18474    status    TABLE     �   CREATE TABLE public.status (
    id integer DEFAULT nextval('public.status_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.status;
       public         heap    postgres    false    236            �            1259    18478    status_layanan_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.status_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.status_layanan_id_seq;
       public          postgres    false            �            1259    18480    status_layanan    TABLE     �   CREATE TABLE public.status_layanan (
    id integer DEFAULT nextval('public.status_layanan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 "   DROP TABLE public.status_layanan;
       public         heap    postgres    false    238            �            1259    18484    sub_jenis_layanan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_jenis_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.sub_jenis_layanan_id_seq;
       public          postgres    false            �            1259    18486    sub_jenis_layanan    TABLE     �   CREATE TABLE public.sub_jenis_layanan (
    id integer DEFAULT nextval('public.sub_jenis_layanan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_layanan integer,
    pengawas integer
);
 %   DROP TABLE public.sub_jenis_layanan;
       public         heap    postgres    false    240                        2604    18490    jenis_pengawas id    DEFAULT     v   ALTER TABLE ONLY public.jenis_pengawas ALTER COLUMN id SET DEFAULT nextval('public.jenis_pengawas_id_seq'::regclass);
 @   ALTER TABLE public.jenis_pengawas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            �          0    18355    account 
   TABLE DATA           j   COPY public.account (id, username, password, role, status, d_perusahaan, d_pribadi, j_lokasi) FROM stdin;
    public          postgres    false    203   ��       �          0    18364    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab, kecamatan, kabupaten) FROM stdin;
    public          postgres    false    205   ��       �          0    18373    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    207   �       �          0    18382    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    209   �      �          0    18391    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    211   Y      �          0    18400    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    213    !      �          0    18406    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    215   W!      �          0    18412    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    217   �!      �          0    18420    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    220   �"      �          0    18424    jenis_pengawas 
   TABLE DATA           8   COPY public.jenis_pengawas (id, keterangan) FROM stdin;
    public          postgres    false    221   �"      �          0    18431    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    224   #      �          0    18437    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    226   �#      �          0    18443    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    228   �#      �          0    18449 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    230   �$      �          0    18455 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    232   �$      �          0    18459    layanan 
   TABLE DATA           v  COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal, kw_k_kantor, kw_penerima, kw_pemeriksa_p2, kw_k_s_intelijen, kw_k_b_fasilitas, kw_k_b_p2, kw_k_s_pf, kw_pemeriksa_dokumen) FROM stdin;
    public          postgres    false    233   i)      �          0    18468    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    235   x*      �          0    18474    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    237   <+      �          0    18480    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    239   }+      �          0    18486    sub_jenis_layanan 
   TABLE DATA           W   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan, pengawas) FROM stdin;
    public          postgres    false    241   �+      �           0    0    data_perusahaan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 1, false);
          public          postgres    false    204            �           0    0    data_pribadi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 14, true);
          public          postgres    false    206            �           0    0    dokumen_proses_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 1, false);
          public          postgres    false    208            �           0    0    jenis_dokumen_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 1, false);
          public          postgres    false    210            �           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 1, false);
          public          postgres    false    218                        0    0    jenis_layanan_id_seq1    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq1', 1, true);
          public          postgres    false    216                       0    0    jenis_lokasi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_lokasi_id_seq', 1, false);
          public          postgres    false    219                       0    0    jenis_pengawas_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_pengawas_id_seq', 2, true);
          public          postgres    false    222                       0    0    jenis_pengelola_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq', 1, false);
          public          postgres    false    212                       0    0    jenis_pengelola_id_seq1    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq1', 1, false);
          public          postgres    false    223                       0    0    jenis_penimbunan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_penimbunan_id_seq', 1, false);
          public          postgres    false    225                       0    0    jenis_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_perusahaan_id_seq', 1, false);
          public          postgres    false    227                       0    0    kabupaten_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kabupaten_id_seq', 1, false);
          public          postgres    false    229                       0    0    kecamatan_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kecamatan_id_seq', 1, false);
          public          postgres    false    231            	           0    0    m_identitas_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.m_identitas_id_seq', 1, false);
          public          postgres    false    214            
           0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    234                       0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 1, false);
          public          postgres    false    236                       0    0    status_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.status_layanan_id_seq', 1, true);
          public          postgres    false    238                       0    0    sub_jenis_layanan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sub_jenis_layanan_id_seq', 1, false);
          public          postgres    false    240                       0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 14, true);
          public          postgres    false    202                       2606    18492    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    203                       2606    18494 $   data_perusahaan data_perusahaan_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_pkey;
       public            postgres    false    205                       2606    18496    data_pribadi data_pribadi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_pkey;
       public            postgres    false    207                       2606    18498     jenis_dokumen jenis_dokumen_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_pkey;
       public            postgres    false    211                       2606    18500 $   jenis_fasilitas jenis_fasilitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_pkey;
       public            postgres    false    213                       2606    18502 $   jenis_identitas jenis_identitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_identitas
    ADD CONSTRAINT jenis_identitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_identitas DROP CONSTRAINT jenis_identitas_pkey;
       public            postgres    false    215                       2606    18504     jenis_layanan jenis_layanan_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_pkey;
       public            postgres    false    217                       2606    18506    jenis_lokasi jenis_lokasi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.jenis_lokasi
    ADD CONSTRAINT jenis_lokasi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.jenis_lokasi DROP CONSTRAINT jenis_lokasi_pkey;
       public            postgres    false    220                       2606    18508 "   jenis_pengawas jenis_pengawas_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.jenis_pengawas
    ADD CONSTRAINT jenis_pengawas_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.jenis_pengawas DROP CONSTRAINT jenis_pengawas_pkey;
       public            postgres    false    221                       2606    18510 $   jenis_pengelola jenis_pengelola_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_pkey;
       public            postgres    false    224                        2606    18512 &   jenis_penimbunan jenis_penimbunan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_pkey;
       public            postgres    false    226            "           2606    18514 &   jenis_perusahaan jenis_perusahaan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_perusahaan
    ADD CONSTRAINT jenis_perusahaan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_perusahaan DROP CONSTRAINT jenis_perusahaan_pkey;
       public            postgres    false    228            $           2606    18516    kabupaten kabupaten_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_pkey;
       public            postgres    false    230            &           2606    18518    kecamatan kecamatan_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_pkey;
       public            postgres    false    232            (           2606    18520    layanan layanan_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pkey;
       public            postgres    false    233            *           2606    18522    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    235            .           2606    18524 "   status_layanan status_layanan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.status_layanan
    ADD CONSTRAINT status_layanan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.status_layanan DROP CONSTRAINT status_layanan_pkey;
       public            postgres    false    239            ,           2606    18526    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    237            0           2606    18528 (   sub_jenis_layanan sub_jenis_layanan_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pkey;
       public            postgres    false    241            1           2606    18529 !   account account_d_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_perusahaan_fkey FOREIGN KEY (d_perusahaan) REFERENCES public.data_perusahaan(id);
 K   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_perusahaan_fkey;
       public          postgres    false    205    203    2830            2           2606    18534    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_pribadi_fkey FOREIGN KEY (d_pribadi) REFERENCES public.data_pribadi(id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_pribadi_fkey;
       public          postgres    false    203    207    2832            3           2606    18539    account account_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.account DROP CONSTRAINT account_j_lokasi_fkey;
       public          postgres    false    2842    203    220            4           2606    18544    account account_role_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 C   ALTER TABLE ONLY public.account DROP CONSTRAINT account_role_fkey;
       public          postgres    false    235    203    2858            5           2606    18549    account account_status_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT account_status_fkey;
       public          postgres    false    203    237    2860            6           2606    18554 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    205    228    2850            7           2606    18559 .   data_perusahaan data_perusahaan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kabupaten_fkey;
       public          postgres    false    230    2852    205            8           2606    18564 .   data_perusahaan data_perusahaan_kecamatan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kecamatan_fkey FOREIGN KEY (kecamatan) REFERENCES public.kecamatan(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kecamatan_fkey;
       public          postgres    false    2854    232    205            9           2606    18569 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    205    2860    237            :           2606    18574 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    215    2838    207            ;           2606    18579 "   dokumen dokumen_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 L   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_jenis_dokumen_fkey;
       public          postgres    false    209    211    2834            <           2606    18584    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    233    209    2856            =           2606    18589    dokumen dokumen_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_pemohon_fkey;
       public          postgres    false    209    2828    203            >           2606    18594 %   jenis_dokumen jenis_dokumen_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_role_fkey;
       public          postgres    false    2858    235    211            ?           2606    18599 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    228    2850    213            @           2606    18604 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    2836    213    217            A           2606    18609 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    224    2846    217            B           2606    18614 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    217    2848    226            C           2606    18619 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    2850    217    228            D           2606    18624 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    2850    224    228            E           2606    18629 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    228    2850    226            F           2606    18634 !   kabupaten kabupaten_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 K   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_j_lokasi_fkey;
       public          postgres    false    230    2842    220            G           2606    18639 "   kecamatan kecamatan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 L   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_kabupaten_fkey;
       public          postgres    false    230    2852    232            H           2606    18644    layanan layanan_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_lokasi_fkey;
       public          postgres    false    220    2842    233            I           2606    18649    layanan layanan_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemohon_fkey;
       public          postgres    false    203    2828    233            J           2606    18654     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    233    2864    241            K           2606    18659    layanan layanan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_status_fkey FOREIGN KEY (status) REFERENCES public.status_layanan(id);
 E   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_status_fkey;
       public          postgres    false    239    2862    233            L           2606    18664 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    2840    241    217            M           2606    18669 .   sub_jenis_layanan sub_jenis_layanan_kppbc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_kppbc_fkey FOREIGN KEY (pengawas) REFERENCES public.jenis_pengawas(id);
 X   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_kppbc_fkey;
       public          postgres    false    2844    221    241            �   ~  x���Ke���w�J �[�7�ؐ�&��I�IƱ����tUK:��=}���#}ju�tK{}���?����>�������?��:��g/}�+���%j{iҔf*�Ͽ�����?�����,?�����w����^�����j*:d��DR�7�l�/�j�0m��eʜz��K��N;�5iJ9&��? �ٳ}f6i��Z HK꩘�$5��K+�ʀ%�@���Q�ٿu�MӘQi�� ��*�5<��
��)*��6�EĦi����K;pj�ISKͤ�n]E�8��;?Y��<!�ٛcl�@!p�<lDƬ1-�B��N��fj�u�@�)��Q׾��h�T'S�����6�P%7��hAUw�lTP�+"kjO�\!phK�h�h�U�U�Ռ�� W�\Md�s`��LT�>ar���Le
5�fk����d���Ђ�A�2�8<G�W|�a�[�"S0fp5ȕ�*�����+>�J�5��W�N�st}'����3�a�\��Z��f29��Lk\E#:W\M���9�W|�j{a>Y�	�8�є�8΢��&�8�<�����Zp��� W���02.����L��c�#�W,;��CL��+��ϖ�TY�#$Zs��h�,�$���q8]��4�j�>B��.��	�6��%5��G.ڞ�j��T�p��!!iP]���I*��OusV*��#�D5I�6��b�_�X������MU�1�ir��Ə�Y$��"5Y����ma��V�R�Xk�ґY�_���	�gs��dM�.e�#R��	Z[G��"dM�[��M�d%5sl���I�YS�G�+Y�50*����5!k<|��M�t�Cb������xB�#��ɚ����b��ɚ��R�CϷc�V�5-~h+��z[�5Yӕ�r�'3�;����i[���ɶę���$���}�$�{[V���#&h:=��A��,�%�NZ32r@L̲w����-�{1)��{�i'����U�7����e���y��3�KE�<:Ya���IXv�|q`�B�r�~ŷ�F!)$,{.��P�L�2	C%;#�����|�
����($��[�(T���#��IX�Ov�}�w�$��<��QOa���N����#&a��:�c���$�4��Fr�Ӎe�H?���+	C�Tv^��ToN�#&a[�2��K���!�i�x���t�p1	�$̢&a���0��T�},q$l��!�W�@L�����A%a�ī�uqd�H���&͓	�{��Q�9۷E��0��=�����I|�܊�^rxdF�}���$�.��G�m����]���L#��C<Ѫ,q�0Z��W>9��$�n>�(!�F3	�|����LC��C<� �#��g�:�˃�I=}�t}s ��g�3��G&at�M<ҳo&a��M��3.&a��gCMr�H��3x������ٷ��b?�h2�����=�������-����.6a��<:2e�uq`�i�3x�ڛu�FF&a���E������[�)������`����|���0&Y�ܚMGLHƂD�Z�7�|Ą�>��);������<
�Q_�1!�SoM��$GLHh��)�Q�ޟ�GLHf�K�#'����:�#�䈙���O�cז��I�\ih尰��ѯ�!w��0F�޶���q�1	�co�TAH��=��ؗ*ʶҰg��ۛG#���i�$��0?ٍ=�S��3x�����\)f��ӭ����7���UB�_�9܏�S\<L��rk��؋u�M5R>񤸭�,��&��t�<���vc�P<�X��X)^�9��<b&�0���-y�$La��	;b&�0����0�[�^�������ɎJ���)���}���m:R�B�'���N���qX�olv)�;	ݶ���c��b�u����;�����n��9˽x�3���H��R��A�'=z��Z��{Gh�<��:��j�f��3 Ur������3����<�z�ݷ��4��<y����Ѡ�����wg�F�~�6�����wA̅�f-�5�����%�&k4�m���Y�:�KM�����w"��;�dm������癬ѧ�̒�ݘj&k4��T�
�M�r��ԅ��U��Q��V��5z���ڣ�T��z���o#O[M���x/�{�&ke=�Av�<�9j�V�{
e^�_�&k˰O�O��e��&kt��r������Z��1�,-D��=f�z���J�h�7�+������e��7��L���3�'eV��+1�e�'~AbM�G GL�ܲ��(��	-����������e_x�ǽ2�D����Fi޵GL�h�[̾/kx�IX]��'.�6F�~�>����+m$��]ӶH�r�$��.�����IXۗBLE�.1	s�>���u�6�}���-6	k������j$���@���=n$��K!�%�#&an�өz�Xi'am���3��������w�A�&���Fg�v�� ����^��-iGҽ���e?$�o&a�<�H�B��Iض�qE�ʴ�0����u�$�#&an��`D�����S��x�$��=;=�0�߭0��zG�$�-{̶>��A�ܲ���$ی$�O�������y�TGL����-]�M�$̂��������7�n�&?"vś1��,���1<鼵h�s(��DXV���C����'!pK�/G�M٠�>��ʦ��UJr�^�LΥ�P���J��'{5f�Z�MD�N�ԍ�uw�����;��1ʱ�R���W��n�/����o�%򓔥�)Q�~hQ���>���B�.�5t^j���:���ϥ-�v������^�u�z=V�z2p�+պ��е¥nT�U�Iȸ�ԝ�/S����zP]ם�ߦ�Փ���d�ޡ6�T�堲�kaRE��h����U/�R=_O�]j�F���g��=ֶ����~�ޫ�V�57�6X��c�ɚ���/���{n5Y�n�j�������xt��oV�R�5����ϩ�N�V�f��I���~�˷o��l(�5[xܼ~��.����lO����]���G�����~�����#�.��W�[	&�o��~����� �E	�f,��4���n������9]����8�B����ZG��dPf:�\�Q[K�Y	�� IV��jo�ģK�:��S�@<Z���/?|��_��P|      �      x��}�v�H��3�+�m�EQ��}���ؖ%�jQiW֪��)�p@�N������|ɜK���^S]��%�R����s��'���,-�]�\�g�:��������h��HD�(8��h���:��n�5~]�ݕ�s]���U��t�\nw�.s��e6/�C��r�\����s��p��й���_�r߮������.]��r�Y��`��O�;�59���ԩֻj�,�5��j��׷'N������T�"�/'nr"#����<?˶λ������<<1�pɐ�$���z�ܧϩ3�JX��G����9�;t.�-|�n�oS�</�t;�>���#�$ۤ����L��t��ħ��}\}��N���جާ���GQ���9\9ra�a G����b���Q�8W_�O��	ǿ�g���q�s�/��,CݨW=^l�mQ�[��"���DQ-�@m�k� �*��>9��c�H1�[B#�^�Z��=�D�u��J���A�i�J{>�?�%n�u�8j�=/布��E�6[;3���I�ժZ����vu |���i�@���ڶ�l�75+��(q�Qx�>�&�7��r���������9[g|�J?�����}�/�+Dߦ�|��ҹ�A��b�7H���A	J������$�VY	�<wn�u�-���4��	\)��:��n�!��h���(R���G�)������Y�Gx"�I�b�'RB�$�*�]�X��tW��.=tG"HFI-�>���$Cd��i����pSf�:�q9��N���a�@ӎh���x�����E�\TO��?qM�$kQ����i.P�d$D8r����z�Y����YI7SHO���Z�u�T����M؄K�=�Yh�Nkg��@��38��X��n�l�KcH���	/K�$�3��t΋eQ�����(	��(���D�Ή�cw�a��K����؀����=6o�y-�S��]�����]�$��Z�3�w����e�L�����O3C>0:"�G��G�^wF�D��[�Ҩ?w���K��!e7�=��`�=Ѷ�5�X��E� UyȦO��2q�ڃa0����aK��ʹ�>s����*Vp����~�L�QB=�eL/Je�3��8�t�&'A蝞���x >�� M�/�3ؘi�#��@٦����z#	R�$���޳c��g�r��]Q=V �2[���Δ�"�L���nM�w� �g�� \Z0갎�w�*�C8�ċA�܈e�5�f`�����6��y+�����;���)��yV�J�z�.�!Xf{�	I| �8}����w.�cҦ��sA��~�]��2��
�.+K����l7 -f��$���	���>�L׭{�����8�qg'}�m�0�Oq�o%xn�Q ��O�&�9����?¶��#��"��?{�rĠ�~ �d���8ڸ�a�	���?�"NU`����2/�[�~��M�������K9� ��&�i�2Bש�G��m0.o���S�H���S�7�:JB
��:+w�Թ+~������V���:K_D��4���s�=�Z���M2���9��x�pP݁����#�3���{ƭ�����O?�
T���=e���uF�$�b��O����O\��10s�,�ݧ�4�	K%;_�Dh
'��;6��n�	Q��xr������?ژ%��Z�`u�N�;uĥi�Ki��TG}v���Q�x.�F��"��m=G1�D������������G��?��GZ�8 tCH���ވ��]����`�VE��G٫�}2oD�J�`���q�����<��G�1�R?�����>��hqE���8�yލ*gՁͿ�{����j�0=�7�`D��n4�UU���G~�e�IĠ�'1�~��Ft��%��I�BHB�'4π�9��t|�|-��̐Ch����GѾ��W�SQ������p�1��Zptp����o � ����^��jl�I+t7ni$�`#�R-yۻ�B��f�.��p�����{��;D������p��M�m��	Hv�P�|^�������2nGoݔX�zO`)9���B�Ȁ�E�H����{�^��'���jV��C��l���(v1*ҷ�:]m�u�T��O��j�J:��ë�N7�_��Z�\�Ƴ���b��J�bn҃0��H����'N�
w(��7��6n���N;�8��-&_<���2�n��|�u̬��.1��&��D�����3�w'}�m�_\�Tl�a!�8^�6�3
9h�����LW�Jf��yO*D(��[��`Q�P� �]L�*-�� �o�j9#��w3
F}"&_N��� ��HF��`�^�� t�jƻxrp��w*��pޗżX�'��*���S�ț? �`bs(�u8�����;���hl]����ɖ�0�\N'mu������p�qC��p���f��8d�@>�/��k�
w�e9!�?�z"�Dr�m�����`��;R�	|͗��E1c����=�[X1�����$�����b��=�.L�x�/�c.���鶢8������ zoɋ�_�/9G+O`����j�x�o�vBT�I��c����~�K<�X�^��G_s���u��׻�t�;[�G�=�E�
xWƍ�	9��|^B���L�s�/�[�Y�nh�1%��n��FY�h"�;WJ]���L���I��WY�N�Gd�\���=�F��s� ���W�z�c�G��܁��9W�]]�%SKp�ei�N?Rmbx�Mc��#�� �T���ey��'�P�D���}˜�l�<�����X��A��E�L�8�������_�����%�p`�N��o�8��B_X�9�_���{�l(}�@�	���N��	r��9b���TS
�K��>�;qvA���X ��N��d�3~Lgy����)�ۮC�E��g�����d-$��l���ʀ�k2ԉ�{L M
��e]�3�bB�}\�����s�G � !QJ�C�>42;,9KL���u�o�����l!��k�Q,ȷ+C�>z�T�l�<�K 
6��
ݥ���D<�l�o��ju��w�bM B�U)1%��1	y��tQf�D�:[��r���Е����{�Ռ�:p��&E�Hb=���1��j��j��/�\�o������}�B)z���zB}��0-68�t���"%�y������eVQ\��*��K��+����cO�Q�I��ra�w����gN�&B�$BLB���8}C�]I'EsvN�5��󱺏���΅�_>u�OY�x^��D�u1����۴��H@<���j���@Ȧ��	�/��ИG����ifBI��ۃP�S^b���>-���l�\����)���9/e���u�+�{r�=	��SfEc�I��T�Wm̂���rM)B�b>ʙ��\�P�N�eh�V]f���4f�*@a�k�K��;��1_<+��[l�,\2 g�z�割���0�H��e`����A�Qm\A��U+�{�Щj� �~V��{����	��7��a��!S�6+C�#k`�E>9w~���d�\���b�&�q�"^�u"\=G=��L���.��I�[D���{���VWpY�2[!��K ��]�^�^cHH6L�ǥJ�P�	�+�����@!�-D��E��C�f���c����+Lz� �5��&�1%����ܡ0�y�3���vں��+Ty�4}u<֭y�m�$}��f����i�aS`�÷l�eɦ����f�"�~U�Z�"-�wl����ds��w7w����U��,}����~u[.=�*aqdKf|Q�@�l�~_)$�M���0�5,
Ɣ��k�{��ۭ�ʄ�����k��Z�!p6�~O��IZ)!�z�7�n�1"C�('Ꮒ�%�b�`�,3��c��Q�r2u�D�����ep%�&]�0lA{�r-pLe�8o�U�:�U��R���(Y鷰��)P�Vn@_��    [�(t�:*c50E��nx
��eL?�򹚡�o�����;½*�M��+�'!ed��4�^2H�L��uS���&��x	� N������Cg�p|�z��h�M2���>�|������y�V�4]�]OaH*D`�V�����ꏍ��ܼe�HlLv�ԁ���o�n���<_>O1_9�"ُ,������'DV�A�>A��V4]{����f�zV1q�j�AiM��厎ѲG��\��I�I�a;���'8pl[�p�U\���1un��瓮�䶜�d���̤Z �X�.��ˏ���e +
&g�+����V���ہ��$�������u��q땈	 M,f�!A�=ݹ���h���x�/���Z>�"�_��v���{�$�:�D,!ݎp���m+�	�?���$�)�#��;@O�q��A
J���!#F{5�[���{����X׋M|*��;n�T`2Lx��J���:x�nm�i��.�Wֳ���Gp�/0S�	���t��.�)�~���uQff":��fL ���kX;�>{l���U�	�f�cx�~��"v{R�v�_HB���[���\�MF���8��p~Ŋ�I��IJS���kv*�j<��X!��ft��ߪ��SK�2�7�#1�	јp�շ5�.[�RúRP쫠��0��6ݕ��<
{jy���2س~�%����F�a���O��ʯԟbi�T\9$���KOC�z'�~WJ��r�w����*�]���ԣ��� �}�[x�1[*[
^pU��o�Ћ��$줰�O����c:˴���. [�O鈖�&�p)���.��ڔ�^Nznw֫�J���/�����`S }_zu^s���i�������F�ϑ>J�"%J�]� }o�sH^@��P�A ��q>�--���a����>�#O|y7i���r��	�� ��aI�tE!��tv�?�ĺG��sY|+��rw�%��.����s4�Һ��Y�-��p��`��R�#�l��c������d��*!�1��b�΃�mp���#��+DKM!�,[���|���϶�ÌA"�n�[��hأ+�������6}Q��$2��]���UY����Vo8�YZvQ���6���Qd�p��>�k8�m���l������TX���������EU�X�70h��q�Ըw���.��xWfٮ�s��������<�������²BS������-���(�ײ<^����h��n�{��!�q�v��y�"x�(��!����}���׎pH.�%���>�?����z$"�ۚY�)�K�} ��'���U}�ȥ���M~m�FMz4�]��pd�S�v,��W·��t�ua�����b�P4�� �V����G�߲e�ؕ�:Ǵ��$:4X%Z:�� .p�q�̬�_�)�kSQ]�]�D
&�!QFgX�?`^��Z��V^�@����i	&�t��b�����!�_R-p�xA�u�.I`Ȣ�X<�L�����������m��6
���v��!��wR�!w�z^��$��G�g4��XmQ=ox�Q��E��`��	�/S�,��"�8��-@��{�'O|�L��뼮[�@5�tߕ�8���\*#`j�[�FSJu�/Ŷ<X2N��x��c���in��1u��v#����jL����c���r[�����d����U�l�c��z��t��$�U��������V����%*N
� Hj�K��>���9'g�._��HYܾ�I켼OH.|�JB5@Eq{��L�]�ѫ��_(G�D8��MΛ���:�e����{���'J�E�z?	�E���Ǯ1oN�SRmqp\����}N�[���,2N�v�����Rj�(��4��u[�Pe���̪��؊I��:¥��l���Yf%i�2�iQ���K�[j��=!����/p{����V#)�F���0�R~��*��e	��dH�h�'�k5�8o��P�|�@�"��KAf�)ɧtLռz���O�T�ey��{��s�*$��g�/�i^b6�D�������y���*@a�3f�����\�n����&��잝��	.� <"+����t���`�7�B>X�hR�UV�&M�Y�V�
7`�S��XMkZ�М<L�����7�����A��f���>&#�w�J�RvR�������N�J���&1,G2	)�������i��߾m�/
7�����H���+vvI��3����������D4
���8�su�L�ά��+CJg
���B������F�A0χ�;�?�Y��m=j!x��M�.¾#/.��)΂l�r����" 6xB����������Ĕ<����v l1��!c��ܽg��]S	o�E�W#��ֹ��!�P,�K�,�=�<�wO7B���ID�M;F3n�ϓ�ێ~�{��H�D-�Qܓ�[�3�?[�ϕ�	��v���C�8@խ���͂�����b�;Q��k�|gڮ��~ܱ{�}̕s��Y�䷳�Ƹ@��z�x�?�F�-�*�W�@�0�m,�h/Ȁ��`�v�%3�|�I�K����]�@P�@�� �0�4Թ�)�vG{��zϟ��bZ�d�84� M[�>2�]�t5 ��m%����\S~7m� V~]�ؗU	�qk��*G�Y1Rq2�)���E�%N]r�J��卥?
�b��/W&<�cs_ޟ��T��@Z0�	,�3�L�s��R���e�������k@���{ ��a�=y]� ����Js�5�o�	��C���	u�����4������ɱ��u ���h=^�����O���Jt��+6�3�t��H�	%t�M"�[�U'�&��e�3J�O�{�.�έ���r����S6U�z.́;��^Os2� �� L�<j�y��ZG���Q�ʭH�G\n2�Tx�._g��#nX�Oh��7<A�/I9�߼ҥ>�4�U�Uv ߦ�9Q�ܤ�cǡ�S���ߠ�E��,���ܼǄ��ٴM�`ңB�U'��>x��g�7�
/9^�M�N+D.)��ݏ���ߊĢ����m:��ߐ����F3U��UIQ1M�u��J�\�b�07-�����?��y������'��#؞� �=d�x&�剘[8\􅰏��*3=���!����=����[�X.W�i�L69/��h�C�8�952��Sl�� �D��NK�	�bc���{F'��T��x�ZTOpQ�j)�fKn�W@���#���YU ��Hd��.;�o(5д��iz)>zyV�<4|�$�$��$*�\kj@G���3�:�z��p�9xF�7{!���p��ӢX`ry����~G�Y���)�u @/����D�]B�G�`�����.TK�~�X�݄��r~���z����U_I�h�g��0	:J�YuK�K%�&�,k�}�-�!�8�M%��}U˂�o�j��F�~l|�����߷b9�����u��
s�a�vؙ���%@�)�ٗ�T
b���e���ٲ4p�P��ܹ9n,�0h��כ��ٔ�Wd�B���C�Q�v�d��&�М�l �10`�ҡZ,����H�dED�8;�3�M��b���.����G�>�]�����O� �˚�����Y��j�|e<N�E�2���t��2�9|��S�T��J��6k(�ѹ�	���7����#��!筨�G������Gg(�<	^���}d�)�cA�?�ԏ��m1}22<�mZ-l����^���l��i�ߤ#��W�\Q}l��~	^V�*�p݇p�7}�/��q�3ڊ�1k����%f�{m*ɳywTB������"ᵧm:����G<ܿ2��i7�<@��K��g��y�.�(��&N�ִ	(�$�g�������!��u����]y�u⌗v?	z���U��<��L��Q���T_�3O�S#�!/^*&���v�B ��@� %�ams�N���M��ꊶ�Ǡ�V��ϫ-H������OI�0��>����:�.u��	�'�Yq���~�@��]?YF#!_H��d�PU���:    TmQi�)���+�0�#�Q��iUK�j��T�P|j�����I�`'n��~q�k�p
 y	~�������rǿ�p���|��O���7��x���:����xv>䳔i��(��Q�/��dXW�v�W��\cZ������r��e�j̩�9�Ԑ�HՓt=�aD�� ���� I!�)���y��V��n��Zs���X| �p0�p�~,>*��	�P���ę}C���9���C[ ,<T��G/�tN
\OA��[0��P琙�_�V��5_h�sD��,(�׼�pr�h�O��@� l6��ٙ��F���)݁70��Y���!������XuW&�6�N�XJc|��&"r�l;t��C�6M!Vu��&<�%,r�vFaG8ߎ�x>o��[����f�T��ڑ�v�k8O�J�}Q�!��b�K���3��vQ!ۛkT�a $�M2|	D�`�#�HB�p�i���Q�k�y9Ccb���40��!��|�oMJ�śdZ�}�;�?�ģQ���j+J�D�T��g`�ʡU|9���jj:��ʯ]��R�nR��Gox���7��S3����W�7����NՖNXE.��v��|�T8��{�z^D�܋��7���`��A���NɃr�/���d�h�[n2ҟ������Z��k�+�{(5�)�gxW�j�۶� JF�K7ww��C1l�դ��h��glx��h�h=H��s+�꣐<�7y"|G}e�ߎt�/70�8=)O��#Z͎ll�ƣZq��ey^O�����u��P ZT� �6Һv/�b�2�/�K��H�u\�uk v*k"�Q���3I=wof(n��w0�5"�� fu[b�����_�x5RJ�M��r�nߣo��J��%�������M�����?�	�(�	���h� P��q��I���G��`�c��2�M� (��g�Dd$bxX�ߢ@|����4�񯋡���ּ�V�\7�$V������z4�ph���gl�']�(�ާ;@���D�����?q~U��1�,�"�
Q��5�L=��Ȩ�2�/A��k���5��tM&����;�Ͼ͇��J=�<��>{$��j�q#�DDuIv.��*]ψ�!�)�N�I%����Tb<�%]�ā1B��/��� �hس�Ez�R
�ŷO���Z�N��dv8��m2���!�������mڒ��
~�g�`b|I�u�v<�i&�.0��5��̭f���53n�����x��c�MҠ�A�g����63ؚJO_�J�^������\{�?��^_�~l������珠������F�{ݑ�+^�+Q[���cg��4g�X��6����O?rf�*F!xJ��(� ���hŖ�M5�����������.�>�.?���0��6�+��6+����q�T�U��<��%������ji�SI��'��.�)�2�Ω����q]�Ud��ja�H/�F�6������"��k;�O�g��I�9+��1ӽ��ὢ�i�� ���D4<��5T�#)e�~~�A8�CL{zG^"�Y5"�����Y��DspA�B��Oj�dNd�P1�,�������1ǎ p_4���{�q�tۙ��Q'C/bMx���R���A<e���	�=3������a�X�d�M�&���ԩ]7A��N����MZf����~Q����u�W���&��e������8"�B��ڮkf��{���p�+=f�zĴgaFĺo��
,]��t��5�R©w/�df���`�<�����������v՜F�J֏˄=�=�"y�����rM���K�.=Zӥ~������q��h��^;de�x��O���V��G�p��0����	��p7�p��r��"���׶X·�ŷjg���&>��a��K�`�N����=�XՓ|�̘���2S�-�9G֕�_�?��Vz8x`$�(�=�'y�y�l��3{�0pծ/{���^|�[`!��[�C�gX�|Rm8Mw�A}�c��h-�~@u��C滂Ƌ8���oJ�*�<mL���Y�<��+�X*Dq���|����Ytf=fr�;&���HQ��H�%S;&5�PO_�	,|���b��������yI&�MYe�[���@���NT��m&}Up��{"�F�	�*>�e?Yo�����1&�P���U5�6-ĥd��1��i���U��s�Τ� Z�jL��>�I��|���v*�����)=��H�[J�������K�=��լ�s����Jߧߨ�N�
H9$�����7o��:>ب�^�0Ji:����Z���^G��ֹn�a8F�/	G���eM������	�`rOo�({s��_��8���Z�'�ֽ�0�v���*(A��^?��zp]�йY�1�48N�k~������#�*�>	�B^$����1���X
����5�l(���Y���Nqf�F�eVІ�+�-�G�A9��4��u�(���-��߷���1�]W�(���G�ͤ�sxG���`�<ے�O|(��S
�j� ���\�zz^�����I��aM'dx1$n�|�-o�-�����|s%&��~�j bl����2�e��q<������kޞC͍�����߃�4�,�Vo8P~��6��rxS�J�3��vi�X�.�Y�Q$�g9��9����[��>h����^�T���ģHA�>��-]1��K�^��H��yY�is�!@Z�Q�F�ǀDUi!^� ��P�7�� 
��H:���/�XͤE��Zk��`�W}������L�_��U�R3�qG �~s����)�<'K��	�+������v���{@E/����"5��������6��I�íM�L�|Q��L�C�˯AԎ;u�����6#����L��{;�Ń�G�3�<@C��	$?��y���o�,NS��oٽ��
a4�6o/����
��Y�`����)c�#��\8_$J$��~�!2c��/Mz^b��3�ɑޤ�zh�x )x=i<o���:=��eT���[-����M�t�rD�6Z���}�;�Y: ,�
���	��:�����<\\ie��_�]с<de�S4��j�wL�p��T��߮9���2�I�WQK���|�L���lE�~tB���a������kM�d�=�����x�	�U]S%��ʋ�Y?�MU�K�����:iL��uM��嫞�	�z���a'���������H�]�}�V��r���G��E��4a�R�4�ܑ��#�({^$���A��ْ���z��m���r��ܯ�ӳ"z�%_ў� ����*Jw4Ι.�-��Ӄ�2�(_ۜ��VrgC
�ߒ�yǦ!���W��V�Z`�_�,?ၹf{q��T�mK��d���Ϊ�]f�yB���
��@���,-��s�����5�)�p۪�j�Rr�g���)�vK�O���Y��Cp�m�SKc����y��d�W|����`��y2� w������kg��Ot���n�n�gd�����i�X��
���[����H��C�oƟ���c���~|M��b�˛������/�/o�3����~�����7\�\���ix6��p�	h^l/\��;��՘a5mW����2���`\,��yabN���r?'�w�-
�\d�b眽�x�>�ύ����<�jH���,�ŲΥ�$L�ΥD~{�8Rd�5y��E���؍b�\�"K�����.�7�����OM�������?�?�3��`�y[?���3��cPό����gM��+�U�!vZ)/;�V�~�9H�i^\���n`�ż�~�`V�v��c�����1֘ٛ�b�Ҋڀ�H')��آ����XQ' o�gdIs&�;L����xz��N���5��t���dZK���-�1o)m��#ə���o^u����}�3�LA,#����35.�V I���U9)���Z���D�T�hN��aO���.:�Q��.��*������x��m�S=�@�`ZX�ꎱÜ��֫�w'~7ڮ��&�-���8���5dNq� s  {Oe |?耰�zzBƉ��>�8M���j����/�����������oQ���زZcV`�g��qMAmG�U�z�u<��@��f|�;:��O�?]N��������~ry��-�����K?}F6���O�O�KsاL���agK�i�r�_���|���I���6{�n�a���-C屔��/`���E���7.dB>v<ω"��~��^�Tl���0�k��iz:	{r+H�l��ۻV8̋�����k�K޲5�~;����ɞ:T,�-h WE�Ї���f�z"�S6_�lء\�ac�~�h���|'���I�8��>�#�~�o#�-��t@-�g�S&|��M1ω�x�-�D�ܙ��yP��_o���n�	POc>z.�p3SK�g���%��f;�K=28�f�c;���/|���F6Tc��_Te��6ݺ�w�8�i�@�)���'�P��߱Y�,�w�B�}C���pļnpv�n�\��#P��4�0��p�=���[O�y��9���g�Y��U���/�s��]���n�IT�5]o���|i�,�0��F�towX� �0�]���9,�l&��䰓����t{O({��0Q�ǜkc�5��{�Q�Lt	&wW�s�8��������X����H�n����U��{m����\�`�2ϋr���0�ŀǭ6�`�8�׷��sOP%¸na���,�1���V��I�#�U��7m���P���l��5�3��Y^��l�aH�_4yF�*@�$����>P5F����#j��)-5j$��� �`dJ�n~�>Q�Ҍ����͂�K�R����S&�<�㖾�O�J]�	�[�X�FӜ�1�3�����Ad��ȳ���mšƩ�i�C���?�@�����=x�����v
�n��C���wi"ch\5��,.2��]�zLQv�a�=��b����6� �COYb"�YTO�Ҟ�y��#è#D�;�-�̆�4di�xV��>9��Ts�9����I�&�r輹��<�0n�_�"����B^��&D�>6ςhƩ$�@���Z��9�.���	0�;����9�~�^ͳ���Y�3Q {�ZӮi>L�%��@ܨ��;���Ax^w� �����G�X=�T�?ZV/{��{H밙����6�m���<�up��#�QH��0_'�#xN0�34�F��)�E���ُ8y�'��(w���pBd�L������4E�S��V����r�Z���@�T�Kg����<�S����jO����-��Sl�|x\��z�$�ꁰ�����O������60M�N!ۭ��q����^q�~89iw��)�\�"��{��*��+�=�vσ�<al���q^�"x��<z7ܼl�[CԹ1rB�����dxA/zYO��t�����D�s�C�xW-7`��!�a�0��iX�r���6���/�r,z=��4�nE�o�O�����2�E�E�#S������z1����C04����Wci���v����N�6i;I�;�r�gw7�G±����I ��y>/�NoS�3(�z��zg{��>���3��V�Dbz춹-(�PҲ_�A�=z��7/d�����&�� �W3vG�&���䤚 �LH�%)[W)��7s)��Ǿ���`Xs��F�@+����{�y���cj�z1<�������H?�����b��%�q�.E���9z|��iFR��[V"�X���d���{m�9+�1ٖ�E x
���[ �W/���m;�xq�M��U���]x+\�k����i�n�碹�`G5K
DP��p��6}�-ҚHC���eLg�V��3I�o��V1�c-�O:�.+uX&	�����>Z�3.�jꏓ8:����bǶ�a�+\⓪�PS9D�
���&�>Ǯ�[�z^�ψ�[�
�58�g���\����:���J�|��
R��tԏHjp��Ù����/{̯�2q�Vu�S�����ʉ���X�U��]X�*��Q��tKi<	RV������0�H�U�
��U�y���'��K�I���Þ.��{�@2�L.T��	�E�=�B��{ײ��i��>2�u���xD��u��B�/� 6��)��������I?���O���_H4�.�2� i|���d!����-"E=�kC�Y
�����/�D0�?�ͣ��= �EV'�<��cJ
�sc*e�y�6�/S$�GAb�C��{:��#�v{os�c�)n�?Î�l�k�Y�	�wA? �F�¯�r��4F_?�QQ)��%�t��:Z�}_�;t=(�LE�$���c����n�ź�f�\ju�BT-~H=��V?b�6��aL��A����]��
_oa�?�4�W�����has��t��3���?"��'�Lc�$PXy��Þ�X�Tk�]�b��V���زx����aN�I>M��/8�(�"�~$�a�����-���Q���*9�x��6Q��vV�韘=�\�	O(K>��+K�U5���\�T��G���}��|O�	�Ov��.7�)�ֻM>M6�z�/�*`�Ca��z��Pe\֝o������A��K�o��{=q};��#Vܷ��Г��@�@�����s�C7�i\��!�f��ᅖ��
Y�^3=�?��A�Uƈ���p�H'�
�=������"�c�h�W$��2eO�-��[���.�zOr��>�[]�	\|u��h�xAOb}Ey�Ξ�*�ƒ�\՜C�� s� l�~| ��\M� �n���O\���|cj�����v��p_ù�I�f�6�av%���:�'->0����6��aY�&�'p�[P�y�o.�K�~?i��|y\�#L�8[�j�c���"ǧ���.zU-���n���Q���)J�ꨞ�2��}Fŵ!=�"=@\����1[j=o%&v����<�����tuwyo�s`ר���̶�t��Pff� �T�fʶZ7O��SV���ٓ�o�2��l�Z�y�`�?r�]����P��mz��9c[�����+iύ�QH���=&z�쾩�{g��@�E5V�p��ʧ�1���f> X����z!��_���d�t�R�_��f,��6M������
Qd�A$d�#i[�����5K��W����T-���/"Ʊwln�I��������j#yy���>��U�X��3�s�!�����z(��˖��o����Me�2��������.�����@2�}��Ҥ��D���+������{���{�1��>�Ѫ�0u������U"aM�|�o|ܘ2�A :������p1���x쇒=���뇚0�hՄ��z�;�Jb��D����RQ%��A�?�^�:[!�^�O��ߎ�����F���	����_8h�|����V��	����,F�Bt�>�V�,�}Z�\pp�5��6{Jw�������r4-VįV���bQ����o���o��͹�      �      x��]�r�8ҾF��ws�	��V�|Jl'%e3���ڂLJ�E�^ƥ<����bw�dO���mA�ٙ�N��������п�j�eb���l!d~tS.�����N���}��o�4������w����n.&�x;I�Ne���1K��?y9+�������M`�D�����~�M�6�ళ�h��z'�ei}j��\�̉��x��Q`;�m;�Cz'ra}ESV�	�K}��]�b)2k����u�K��G��b&�E-
+��J�O��T�w޵s!��W����Y����7g��X�5N�eY���dYN��A	C��؉c�P�q:���K�ۓ�~�~����)��	\6E����,��:u�����3���$X�؎xm�����ŅA�=6�*�S%�f)p5]��8vwY�/a���6�V2M��iZa]�_wmn��(䝨�g��x=�^��I�7`We&"�����?8����N����;lV���l0��M���FtN� �$T��}�D������GM��yi}ms�/Ck�I�<�e��h��.@B�`�����f�&7g�8��(���,d���J�b)	_�*�-2�	6j�eI$h�j�q;� �=�x����ãg���hSA��X���ԍ\�u��]���� �4�օ.�*�{tPɥ�]�q��w��!���O*YH�#X0ڏ��?LZ5��$�a�<c.a�=0}1J%켭E�P����ui��}�P��R�6B�Լ����$�*��U;o��� ЌUZD�Z�sx��3+�	c@x+�#p�}t<��2Qd3P����%(�����m�X�v�>��,r�ஒ�lkkx/_UHxY� z��w�Q����X�և
�_��q�*qoeiR%r�*��^ �-�({�3�Yl��̓?��EڀYk��f��պ4K]F>�nCQ-&��e��B`��9��� �ڛ{��5*��ea�D�N ����x��}<0� �l\a��U��0m�ʵ�zF�=̕dR���9��Zv}b��a����`ƧֹL��S>(lh�އ���Jl���&'Gb*!
/Pǈ[
^�O�&��k��щ1s�8(��t7��W�G����Z�EZI��I�����@t@p/�DPk����5�Fm@�F�^�QY�3P#��\'�� � p.;���5HY����ϰ�Ѵ�T04l��t,M�ݱJ$�[%ZA��R�>%%���[6�*��*P�Vr#u �C �f�LJ"�!�َ��vЬSY%��U�;�N��$�1��kJ����X�g�)FU����z��LZ���`��dڥ^#r� ��J�*o�r�,l����k�.o��P�%�@�8�/��+�1Je�b�s	�|a�`�bY�ͅ�Zr0S@�O���P�'Ӵ@��H):���A��ɱ�r��l�.�Y���U���F¨���*D�6��W��EA�Xd��f�g�Ǵ�"76�$mn]���;��K�V0`'��U��x��|��u^�1@L����*)1t��kዱ,�L�쒵5�0F`q!�ZC�ְ��4�,�R��rw�e�0,$�����e�-��m�)Xwz�.�r@�ao�>�Ӵ*���.���"2a�$�Q�8vE������/BP>�G���>[;���ٍ���Y%2X�b�,E�b$�qFXƨ�4	��E��RP�$�s�4��bs�G]�B@���g����-zd�e	v�Me�@�qO�m�V֨����0��b��������T�cf}����l�EI���n��Q;4b��c�u,1��R0��V��k^���D1�/��4�c5B�j٭���
�/ʟ%�y l��p�H,J�E=��؞���E��NA�Hx'��m�U T�|�]j��9�3�X~UY�3g������]6*1�:iu�2�$�n�g�%�N2��F�X��H�<���E�G�����F�i�Qrd��٬�_b@��b����cD6��6�o����`�븜L�]B���u~��\����MM����ӬMY�1
�t��� Y����p�����^��࿯�I�I
�2�0(b�2O�u2���A���^K{ѓ`�Wqi�ҢVM����*���T�cDb&�������\�^��juS�Z�L7���V�}���X��;M�X�+y�N&�� Y$�Q�+ш�\dݜ���]�1\v�fT��Y��/�&��Ls(��c�2������Crt\L��.��NӪZZ��B��G�j��2A�F)����/U/��㍉ å_J@�&�G���@���[�G�}ǡc���XWϲr�Vj�ʡ1?�߳ٱȪv��)A|WO����6�}gv#���0]g���~6�H��|�.�>�����*ޘ.1\t��l%nt�9���}0ޚ�1NO��נ�)�c��Ţ�vl�tb� �b��>�jZ�p�Cv.�s/��>˪�]z8J쯺f���lJ�q*�'w��@����5�KQܶ�(�^	�[7c̆)8Gc�J*��Y�jH��0�/�o�묥��Ķ^�h8��F�f>��'��88nsd�{Yl��} =�zF����m�M��8N�R¾���b!=��u������[���N��Q���^b�blsl�n8�A���5�������u~f�?�d�������g1��2���v����,;|���o�%��LU�9y��e{��?Y�7z�N��v�f4��0����`���r*�n��["X�0=d�1��)I�O�l�\�)�+��f��a��k��O(4R~(��	И�l��RU|�,�I�U�K���_O!�����
sE���A�1j7��|��e�R�ˬ�[>�9�a����L�b톺���������i`G9�%��SW�{?���~�.�dn� }X���]t퀼p� LJ����!�I��
�"p#W&b'�"O��x���9|���
�lgc����+9�D�[�E�R�Qq+d�6���� ���fC�B���?�3��f�`)<�,d
U�[��Y' I���CY���9F1��cjx8K�b��ܼi���6l�Lnd� �g�ϋ�:!��V����F�恬��.�|i86M[��� Gdб	����|��#�#K����с��@�]\���q��Ε����a�À��n(��]�T�#�Á�c�붲NE-o2�v��>$>���?��,��Uy�x���+}ؑ�WLOhD��>`]d��Y_�DbN���Hb?����9�8;ǆH2��|�K����(��a��\����!`F���U0<l]�5�W�c�2o3ϒ�,[p���'�m�v�,�!�p`KTp8�Ž\L��)�ۑkR���V�(d�E�� B�(��6��Y��|6Dt�o+ ���|�9�Z!	�f����c��؎#�VOl?�N��$�\)��*v�c+����Hն�!+s�_�8ݎ2�HlG�ِj@4o��}����շ:���K���wƘ��v�=6H�.b��7UQv*)|��3��>��=�7��������0����Oԅ"z�,�!���j2��� �|�=�^���K�-^@4m�?��3MM���&��!n*jkp+���t�i�SA�'�NE� �:�&�QYk�Q@����f�#G��	`�A�ZuQƑ֣��>���/a�)R�����j�R5����Z�S��l85+񩂭t��Ħgd�J�O.�	7��Xq��SpۇX�.��:M'7w��{����u2��C ��6~������)�1�z��7�[��f�klIl�#���G�Gl�}�ע���4�{���m��z$q̆���z�f�u��kH��C���1���jر�Evl]t3��y$�Æ��FiS��ܫ�
?_���G2s"��.��Z�vB�/g��.�m�X`��t�e����y=�cX�8/s�dF���,֚����>�����<��D��c��#��u�nT��]J�<��Q"���W ꜁T!������F��/���{]�<\���1��OJrs'���љ��� �
  �=&է`z9��^�b�U�5y�U�D$tAș���Ь���=��'�� �Ms�-��,V,x%�=��y�x���i�?̝�~��E��Q �n���봩>^	�C��tb	�}�����X6fh~B���W/I:�kcu���.� �$ߠx2���H��Ә>���nl�IZ�k:W�.�z������gx�Lw *����Fl��h/��R��2ŭ����|�U��d���		5�u�g��xd?K����!;T��I_}UQګ��Y��	3�|��Fg&��P�{�_�ڿ$�$�Ȳ2$�W����Ʀ�h�M7�~��R
<�$K���y/I%�%�+�f�m�ly��d�Ir9{/���B�J"�ͣ>�&���d�*a��[{OךD�5�E;�c��B�������3�Ϩ27L�ي� tT^߳�n<c�U��u��u	�ώ ��Ni�0R�O��6.��"-j�hm�|p��ZEa���ˢ�L�n��67�!�<�ۣ�E�������P�f���l���L��@���*H���q��� ��wjf>�$�-� 1r�Lx��4{�r��(òyZ5��BŚ�n�}�D;��d���nD����A��t���	�(��7�Tl��-�,��Ts�G6F�ۯ�}y������Kahs�|l3>}򡢧�M�w�k��X���s��D7�&�Kb׋؟BR�Rw>BD��@qm��y�}�~���]&�MUb_7W����G��6f�5j�\*�����\҈�v9�GqI��h
]=���2Vr�N��>p�
�TZk:(5�j�'�vC��/J��?I���h��o���������(�8�9x�����?���N*��jTN�'8ޞ�(z�ཇ�՞�V��ZǑ���X�K�ۍ�K���/���)�0�l���\�%~/X��I]
�O�c�=���<^q\Y_K��XU�����w5�l��o��j7l�Iy�7Q��k��
g=���6�j류N�\���I�^wH�ή�{3M)U��)p�C'���t�z'q�j���l�v�R5ϳ�>�^0<6�3�3a'5�=�\έ�I%�Q�l�s�{h���(H���U*�T���� m��Ċ��!����J��B��\�6�GYcM%a�|����F�a�������=��}�筩� f�#��Y^V)2G�m�l7�u����T�\O%�?�ي���*�L^Ǭ�<]%/'4��_�Ʉ����]vm��j����ɲ�[�2��5��O��ރ��rC�Y��Һl���8qW6h�D�V�G<
���_��{�C�0$��kXBl�&��M�ڱ��g4���!��
���j|�@ qMQ/��MT����1Q�p����4� �i���p?�O1��m"�!885�������e'����e;��A�Zj�t���l�!�V�#[���G���,�>z� �{"���:[7gx��[Y3e�[�&��}���v!�A��PZާ���`.�*�%+�t	�n�^_u�ge~��r��z6�kDT���a�Np���'��wԮ�b�V���ԋ����� .K�*���	�}n�G��.疣�lJ��.��׿���s`	�ʇs<����e���Ӊ�}�r;lp������w�1��̱ߐ:q"lS����G��.��.��L�ƭ��B�G7�9	��k"�A%�)�v�]���n�W�WJ$���#��-ݸ��j�y����F��.�����d������]5i5��o;+��g�x�=FW��q�ҵ��ZO9�bԯǟO$�hoi�����Ƶ�kG��Re�yj��-t����|w���}�+L�6�h8���:����q��Ly����o���4�1F:#e��'��)�K|-�y�!Ԧ���Եm��ҳ���	�˟�5��=�q6;��Lr}c��L�;�!��\�"S��E��9�c�_I� ��@1����L�,���1W�_�w?� ����[a�tߚV=ҡ�k��M�B6L�u�"a/HE�"��.�9��x��p����T4mU����ڶ�zz}�b6�yi�����a�p�86���5�;���v"k��b*Ǽ�k��r���6�ށ���}��#M�J���T�5'��6V4:��=w�}�ww�cge��1�]fxu1qj�����a|
�m���6L�mޒ:I�H��>������t�y0?���ф8��)�M���(�"�WA, ���;M�@��ñF-2^���,�w�^��,0bT��#��\�t�wFݺ�U���)��?u��ir��] 6���)D�E�k�R.&%�Ȱ��+ޟ�q�ly�B �ޘ���_T�����ῲ�(<e�($��r�.�Su/s�]�_l��a�a�g�;e>A�����IT��k���׻i�����|H'):�]N,l��O5|�=o\�gZ�_ɕ�����B�-N]��D���o<6IZ�R5���mx��L�Cu4c4k����29�&tP%=L�%t}��S�h�O��,�@N78/ ����y庑]��BoCi�NV��[5dxqP�q.�[uA��<�e��2G��-M�����bv��Z��<b!�R�:��D2�z��N��f>���q&�]�w�e��5�u��(��>��9�L79�����ru��ܨ!/��y��Ro�!�;4?��.*"���c���ϛ[�-῏޼y��v�u�      �   R  x��ӿN�0��y
�EBu��I<Ru@����ri\b%�#;Qac�-y�D��T��l7D�O���$k�7�2t�\i3k�����)żʠf�r_�gU	�(�ׅb��y���K.e�'X(gB��<�V��#"�p�〇!yT������2;H�M�iz��A��螸��}'�)0�TN���U�r��J�(�G��jj(@
�l5ί�k�j�ZM�\_Q\�
[�?�E؇�H��u���9jnv������oD��=-Ƀ���5��N6�bĸ�hAgR:Ϡ�h�yj�4��iE3<�(�.�����K��<�{�_�j���d���e�7�5�.      �   �  x��\�r�F]�_ѫ)�J�� �5+1�I�+�k6޴L�� �,<�Ҭf??1�2�2_2� @�4�$U�e��Ͼ�s����*��QƦQ�\-V��>�2�;�Χ���|X-W9��fU�&Q^b!�ه�ɹ~�x�(7�s��8c�c��L���d[g�(]�Bd�qQ�y �ǳ�欌�D�%�;���K�/E��R�U�������œH�o"�g�r�L����m���q'�­�*
�]��h����+6!%*��&p�+����J�q��Nٌ~�O؃XHRVʟ��,�r
�R�t��-���sebAl�v�y΄�z?�������W�*Y��Z����EY���j�udޜ�L�?Bz>�f��	I�"k��-�㤐�К{ ��a�w��R�J�(�'��{�2Pd�d��&�:��О/64�%yy�)����Xj�g���J�$k�ɺ��LIJ�R\�Y���;
W��a"�=`��<ݲ�C:��f��">�E�i#�eg��K6�z�_�ۛ���s����x�	^�	.GN�Ai�L.�$*��t@�HU����T<���N]Y�(JVD�QZ-u8DE5��7����`��#�@�^0�^�o��	vN�;��+���#- �^}&���&�j��=Cd��xs�xS����	Ʀ��%+0��t&r����%��y���Jl�(�WWy0j���<W7݇b�=� M=�c.b�K����?�����-2iT��b%)��v��'����Cdx�׌�Y!!���)3
�T���<�un����Xd;>ޑ�ya�y� 9o�w��wd�!�����9J��\�(u]H�25���R� C�Q���R�Jti�hר��*�-R�0+B?W[�e�*.��C�c{e�d���9K6�Z�Y<V��$���J¥ӈ\,6,�z���T��m��fQN:
+�m���ΩL*�<^H�X7��`�\	�{�`��0k���.ح�� ��C��~�Y�!�K@7d�B�yu�7|����:��ǉ�v|0zF�����5�Ө@�A'��o��)�A�6�vh ��`���[�|L�z�O|;v���8�`��	%xڇ���}�zB\����1�r9XB�Ѐ�GSÏ�{�yG���S�Ekoc�'�m��X�Y���*Q�o��Z1r@w0�8n�_�(�(($+O+ěnyf�x��KI��\�(���mR�,��S���T��*�s)w�A#�9��F�9N���ݗ1���t������w�u~�~�_�h5P��h4
���.ϐ4Dѷ�`�B�t���L^��qH���g�_ Eyw��/Ģ}N�w��i�;nn	{jD��H���c$�<g��k󰽸4j�E�qg;8����A���|Y�_E>����=�����B�e��>��M�(�����
�^�X�ij��2�E�1��6t���{J�h�ß(�XmV�lg���ȎS�Y�Y��� W�}����e<#s�]�TcdC��t*�9��{�}{�4�����¢��
��6���(/�/��^��K��7eI�.(Ī�J�:I�E����K�ؘ��y]H��1�-�"��jN�'$��=5�*�m�=���s*��&U>0�O��=E��|`���3��/�|pi����랥S�dL��$棺�7�֝X� I��������E�'|���|L�c��_���/���m��mUqO�a?e7#a�ks7!]SK��"f	�e���Eڳaj���L��ᅋNl(Y:�H����aOɱ�d'�d�T/�%[����
���>�p��V�IdO�ZKY�$$fz����y{�c�ٗ&j�M�}=���weO��?�o�ф��T�`6�np���ĥ���c�}�|�iv���8J$�0�{F�����Ö�Hբ$���G�U@��*�U�7藎��>GC����iX��d�Qjw'	�Pm0Jp�{���s���}��X\����]���UQ��'?\��!����إ99io�( yv�3���`?���~�[��s������eo_�`�(OER�|�*��b˘T��Ӱ�&�i�vHO\��֏�ٝ9�����K�,O'q�Ņ
H���֩�7���H̳��.X v�-\�#.zXX� �=H���>ض�a�yf;c΃�'�1gy��1g�򪘳�<6�,l��9�cb��Ŝ׃��!1�P��M7Q���΃��vys�ڥ����wH��ݝ�=C4� �uOs<4ǅ>�!�ɖ`��	��ۼ�B�zf��\B4hT�i(���h��+������`��}8�xX�h�꒩�PFʤ8��C���cze+S��l�D����0b���j`�:P�(�
z���sd���Vi��E����;�WD�b.������NT�<,&���L\/�6�_�Xoɬk��mq�o)�����A�vAn#,4�,�>W�F�C�G$�*��ܦ\о��7�6������М��}3�;J��J����LI���\�ZFi��ʸޮ�x\e����i�4�"�CO�-���l�
3t��Xc�Xh 7�E�Z��yI�N�ra�4%'������f���u�N_��RS���������N-�g
���.�/=����nS�6�Z�'������bM���#�K�o���JҺx��Uؠ�:�_(-x���g�:�G���]���v�fw����`��56�Z��`r�[)�!s�����%u�&�̧z?ʚ�6��?FO��_ٓ0��!��"�g��8��V��������.��i���+X�X%�5,m��i�	NL�w����+�xN�xЖ���5��un#�i����RV����U�&�{�����ct���������9<0=N�=�z�?cA�f������`��IB���F� K��>��"Ã�ӏP��`��%��������I�WǿE,?E�[x��&�-Ҽ7��"���o���p|�j�?:5��I���w6^�0��@s6��ϙ���i�~��x��K�лlE\}��k�/���ʝ6�z��H�^��,\��d+_lD��b+��,.M�|����>*d�N�<�ټ��NU�d�ؤ$�h���꺹�s�yE��=��"���G�ॾC����P�K��^d�᫙�����c��D'+Ό�zz��U��^p�]�n�7UW��o��T֎���ބ�iu�_�7-�~����.��;yUB��n���*a��U%�=8qU�R�7�JX��U	s�J�H�៴*a)����9�oP��d����{r���}��4&�*�k��t���M��m�5SYK��;V�K����K��lr��-�p���%wt��.�?0#~�j�9�'����w�j���;�9U5��_y�b��=s�TSL���b)�#�)�0~�j
%�oPM�d�ͫ!��\1}�%ѷ����;4M�S�����@ͮ)c��/�E�.m��<���aNd]kXy�ܸ%���W���>q����|����}M�f5T�ܽ�������޽�?���.      �   '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
]      �   4   x�3��	�2����2�H,.�/�2���q�2Ӿ\f�~�\1z\\\ �
v      �   �   x�m���@D��c��.������1F�_�*�:$�ޔig64�i���}��М������2�jl0��08-����z�<��m��=� ��C�WJh�y@�6���h���h��А�y�F(��E�c%���%nΫ���J?D�F<9�ĳ�TW��L�K�n��(^2���EXK܋�@܋0%�y͈{^��uqb�l�,��ew�BY>��FN��FN��FN��F��h'vqډ�V烈�B%8      �   '   x�3�I�KO-\F��@F6�1�wb^yfW� ��	e      �      x�3��pr�2��N�+������� <0      �   m   x�3�tJLI�S-N�H�4�2��I�MJLOTH�M-��+I� 
s:�E��Ss�sBRsK|3�&X��Tl�j�wbyb1�~�Hi^Vb^:P�~�i����� rA�      �   Q   x�3�tJ�K/�K�SHI��O,I,U�I, �%�q�rq� �ٙ
�y��I u@Qc�м��l$A��t�Ң��t� ��      �   �   x�M�=
�0�g�>A�m�B� ��.
���Х�������{:+��6��DA��J.���/O
�A�
Ǌ�$�z���[�s��`�jc/×��oQ��.�5I���8I˲�E���K��ĞC�HpW��B��<N ���9      �   g   x�3���/ITI�KO-
��9�%�y��\FhR@!cN�Ĥ҂Ē�<q��`߈�I\���93'5=?(`��* 1/%5=��I�'5)1(���� ��5`      �   \  x�M��n�8���S�	��^�P���f6L,��ElA�~��r:��G�E������&�I��>��x2�&S�w�ܼ;����zpa��r�u�|�ǿ7Y�
�-���w�����b�Cc�[�
���.s++!��A�^����ͅ{𺘛g����N�B=w�:Ri^t]<�2�n�U]�͛]\h7��yѠ�ɜa�e�9��ҋ�)��M��* ;�=�/̏� {��y
�2��pT8�t�4k���7Gh̳�&ǟ�1�xrײ�<�+�RH��bW�M�����vn^l7��0�1��4�v��"K V��ζ� `T@��!�FF���Z~�R�Xɉ�Kz�C�)��&[�.{�.�r��<w9��@�hEW!�0HϖWJ�U��6g;��K�ؘ��P�a%'�������H�R�Dad��`Vz��s��� �R�߸NO&���Dbš�pѾ�� P��A"@���+���?	i���-S$C�~�W)l�Z�1ذ�H�BTn��V��I4~{	Ѯw�ߩX8(��=��B�ũI��fZT�t�O��d������E��ol̀��2�.q�-6k��2�d�1�es�Tհ���Y��q>~�n�g��O,H����V�̜��y���Փ�6�e���{�Y����_�C]�,�fO`q���Fb��Fj̓]�n�Rs2����I����)x�C H��J�:4��	�u�������\ܶS�ߨH̥�aD����\L��t;A�_��WVaTH��nE���G��'�.LZw��E\4���Jg�����Z^��lN�0i�p_�1l_�⇉
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�      �   �   x�uQ�q� �v���gˀ���	��sԄwMB�;�eYH�\F��Y^�^`��Ө���?4ο����BB�o��<�7�Qըŝ:�&���t�E{�)���K���N]ZWB�� @p��QJ\b;�y�wHs='&pm��a��_P�
"#s�X5��'}�TϹڟb�32����9j��*/��gޡ�(�K�!YSh�	�j�yj�n��e�J7%jB�jv�]Po�����1mqS ���|��۶���      �   �   x�U��� D��c�����G���3�/��M�:�n�ր�䲓�6�X]�����!�QJuN�}���J�NiGqa�"��L��(���iE	�V�����K]#��x+)�Lƫ�>��,v�h)�G0�k��6��]��V�X���{�
�3������ދ�j ��ĐD      �   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      �   L   x�3�LLNN-(IM�2���SHJ,I�P0T�N�+���2F�)d$%%s�(+( 
�����4�,J�JM���� �[�      �   �  x��UMo�0=ۿB�(�X���؊�v酮UG�G�������g�[������{�h�'���`P;1ɶ��ujm����&�.m�݀0=�D@��� :@_���s� ���`h��  �,D�x�H���<�Q���WqP����x�:ѩ�TO|<�y�3遾j?q$s�T<pTݡ�ѫ����w�'wЫL��0�S���H���y�K��khߊSq�b�Z�R�8��������v=�	sw��:����!R��5z^c��Y5��D�=�$ǟ=(/P{�{-L�\��l��밍2�.Y�i$n��T�%L����r~�3�Fk>ƚ��aHSb��Yf(�8��(���rXq�;��[�.����t�:�*/O1���l1��b�7��o�*�4�Xs�kA�{��c����3EN�t�:���ԩY&}�<��4����9Nz�D���A���e��:��.N��u0��j-e�[.��s0w~M�\K��ૈfpP�o�ry%r����/b��/̚=y�������ͬ�+��O���;��+Q:�zQ�����h��y�R�s89�	��Ќ&����F�4�`����U�Z�е��-����[S%v��DS�m.�-��6T�]��ۍ��@+<4T`���Q)��xA���� X�S��\�)�,iʅ& �\��$*�;Ȓ���]< �)גܛi�� !E�v     