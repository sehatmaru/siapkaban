PGDMP     )            	        x         
   siapkaban2    12.3    12.3 �    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    19843 
   siapkaban2    DATABASE     h   CREATE DATABASE siapkaban2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE siapkaban2;
                postgres    false            �            1259    19844    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false            �            1259    20160    account    TABLE        CREATE TABLE public.account (
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
       public         heap    postgres    false    202            �            1259    19853    data_perusahaan_id_seq    SEQUENCE        CREATE SEQUENCE public.data_perusahaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.data_perusahaan_id_seq;
       public          postgres    false            �            1259    20167    data_perusahaan    TABLE     $  CREATE TABLE public.data_perusahaan (
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
       public         heap    postgres    false    203            �            1259    19862    data_pribadi_id_seq    SEQUENCE     |   CREATE SEQUENCE public.data_pribadi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.data_pribadi_id_seq;
       public          postgres    false            �            1259    20174    data_pribadi    TABLE     �  CREATE TABLE public.data_pribadi (
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
       public         heap    postgres    false    204            �            1259    20181    dokumen_proses_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.dokumen_proses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.dokumen_proses_id_seq;
       public          postgres    false            �            1259    20183    dokumen    TABLE       CREATE TABLE public.dokumen (
    id integer DEFAULT nextval('public.dokumen_proses_id_seq'::regclass) NOT NULL,
    nama_dokumen character varying(255),
    path character varying(255),
    jenis_dokumen integer,
    pemohon integer,
    status integer,
    layanan integer
);
    DROP TABLE public.dokumen;
       public         heap    postgres    false    218            �            1259    20190    jenis_dokumen_id_seq    SEQUENCE     }   CREATE SEQUENCE public.jenis_dokumen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_dokumen_id_seq;
       public          postgres    false            �            1259    20192    jenis_dokumen    TABLE     $  CREATE TABLE public.jenis_dokumen (
    id integer DEFAULT nextval('public.jenis_dokumen_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_sub_jenis_layanan integer,
    deskripsi_dokumen character varying(255),
    role integer,
    status character varying(255)
);
 !   DROP TABLE public.jenis_dokumen;
       public         heap    postgres    false    220            �            1259    19887    jenis_pengelola_id_seq    SEQUENCE        CREATE SEQUENCE public.jenis_pengelola_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.jenis_pengelola_id_seq;
       public          postgres    false            �            1259    20199    jenis_fasilitas    TABLE     �   CREATE TABLE public.jenis_fasilitas (
    id integer DEFAULT nextval('public.jenis_pengelola_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 #   DROP TABLE public.jenis_fasilitas;
       public         heap    postgres    false    205            �            1259    19893    m_identitas_id_seq    SEQUENCE     {   CREATE SEQUENCE public.m_identitas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.m_identitas_id_seq;
       public          postgres    false            �            1259    20203    jenis_identitas    TABLE     �   CREATE TABLE public.jenis_identitas (
    id integer DEFAULT nextval('public.m_identitas_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 #   DROP TABLE public.jenis_identitas;
       public         heap    postgres    false    206            �            1259    19899    jenis_layanan_id_seq1    SEQUENCE     ~   CREATE SEQUENCE public.jenis_layanan_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.jenis_layanan_id_seq1;
       public          postgres    false            �            1259    20207    jenis_layanan    TABLE     "  CREATE TABLE public.jenis_layanan (
    id integer DEFAULT nextval('public.jenis_layanan_id_seq1'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer,
    id_jenis_fasilitas integer,
    id_jenis_pengelola integer,
    id_jenis_penimbunan integer
);
 !   DROP TABLE public.jenis_layanan;
       public         heap    postgres    false    207            �            1259    19905    jenis_layanan_id_seq    SEQUENCE     }   CREATE SEQUENCE public.jenis_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_layanan_id_seq;
       public          postgres    false            �            1259    20211    jenis_lokasi_id_seq    SEQUENCE     |   CREATE SEQUENCE public.jenis_lokasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.jenis_lokasi_id_seq;
       public          postgres    false            �            1259    20213    jenis_lokasi    TABLE     �   CREATE TABLE public.jenis_lokasi (
    id integer DEFAULT nextval('public.jenis_lokasi_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
     DROP TABLE public.jenis_lokasi;
       public         heap    postgres    false    225            �            1259    20217    jenis_pengawas    TABLE     g   CREATE TABLE public.jenis_pengawas (
    id integer NOT NULL,
    keterangan character varying(255)
);
 "   DROP TABLE public.jenis_pengawas;
       public         heap    postgres    false            �            1259    20220    jenis_pengawas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_pengawas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.jenis_pengawas_id_seq;
       public          postgres    false    227            9           0    0    jenis_pengawas_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.jenis_pengawas_id_seq OWNED BY public.jenis_pengawas.id;
          public          postgres    false    228            �            1259    19912    jenis_pengelola_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.jenis_pengelola_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_pengelola_id_seq1;
       public          postgres    false            �            1259    20222    jenis_pengelola    TABLE     �   CREATE TABLE public.jenis_pengelola (
    id integer DEFAULT nextval('public.jenis_pengelola_id_seq1'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 #   DROP TABLE public.jenis_pengelola;
       public         heap    postgres    false    209            �            1259    19918    jenis_penimbunan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_penimbunan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_penimbunan_id_seq;
       public          postgres    false            �            1259    20226    jenis_penimbunan    TABLE     �   CREATE TABLE public.jenis_penimbunan (
    id integer DEFAULT nextval('public.jenis_penimbunan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 $   DROP TABLE public.jenis_penimbunan;
       public         heap    postgres    false    210            �            1259    19924    jenis_perusahaan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_perusahaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_perusahaan_id_seq;
       public          postgres    false            �            1259    20230    jenis_perusahaan    TABLE     �   CREATE TABLE public.jenis_perusahaan (
    id integer DEFAULT nextval('public.jenis_perusahaan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 $   DROP TABLE public.jenis_perusahaan;
       public         heap    postgres    false    211            �            1259    20234    kabupaten_id_seq    SEQUENCE     y   CREATE SEQUENCE public.kabupaten_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kabupaten_id_seq;
       public          postgres    false            �            1259    20236 	   kabupaten    TABLE     �   CREATE TABLE public.kabupaten (
    id integer DEFAULT nextval('public.kabupaten_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    j_lokasi integer
);
    DROP TABLE public.kabupaten;
       public         heap    postgres    false    232            �            1259    20240    kecamatan_id_seq    SEQUENCE     y   CREATE SEQUENCE public.kecamatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kecamatan_id_seq;
       public          postgres    false            �            1259    20242 	   kecamatan    TABLE     �   CREATE TABLE public.kecamatan (
    id integer DEFAULT nextval('public.kecamatan_id_seq'::regclass) NOT NULL,
    keterangan character varying(225),
    kabupaten integer
);
    DROP TABLE public.kecamatan;
       public         heap    postgres    false    234            �            1259    20246    layanan    TABLE       CREATE TABLE public.layanan (
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
       public         heap    postgres    false    208            �            1259    19947    role_id_seq    SEQUENCE     t   CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false            �            1259    20253    role    TABLE     �   CREATE TABLE public.role (
    id integer DEFAULT nextval('public.role_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.role;
       public         heap    postgres    false    212            �            1259    19953    status_id_seq    SEQUENCE     v   CREATE SEQUENCE public.status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public          postgres    false            �            1259    20257    status    TABLE     �   CREATE TABLE public.status (
    id integer DEFAULT nextval('public.status_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.status;
       public         heap    postgres    false    213            �            1259    20261    status_layanan_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.status_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.status_layanan_id_seq;
       public          postgres    false            �            1259    20263    status_layanan    TABLE     �   CREATE TABLE public.status_layanan (
    id integer DEFAULT nextval('public.status_layanan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 "   DROP TABLE public.status_layanan;
       public         heap    postgres    false    239            �            1259    19964    sub_jenis_layanan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_jenis_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.sub_jenis_layanan_id_seq;
       public          postgres    false            �            1259    20267    sub_jenis_layanan    TABLE     �   CREATE TABLE public.sub_jenis_layanan (
    id integer DEFAULT nextval('public.sub_jenis_layanan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_layanan integer,
    pengawas integer
);
 %   DROP TABLE public.sub_jenis_layanan;
       public         heap    postgres    false    214            ?           2604    20271    jenis_pengawas id    DEFAULT     v   ALTER TABLE ONLY public.jenis_pengawas ALTER COLUMN id SET DEFAULT nextval('public.jenis_pengawas_id_seq'::regclass);
 @   ALTER TABLE public.jenis_pengawas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227                      0    20160    account 
   TABLE DATA           j   COPY public.account (id, username, password, role, status, d_perusahaan, d_pribadi, j_lokasi) FROM stdin;
    public          postgres    false    215   Ĭ                 0    20167    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab, kecamatan, kabupaten) FROM stdin;
    public          postgres    false    216   ��                 0    20174    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    217   N�                 0    20183    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    219   �                0    20192    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    221   L                0    20199    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    222                    0    20203    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    223   J      !          0    20207    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    224   �      #          0    20213    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    226   �       $          0    20217    jenis_pengawas 
   TABLE DATA           8   COPY public.jenis_pengawas (id, keterangan) FROM stdin;
    public          postgres    false    227   �       &          0    20222    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    229   �       '          0    20226    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    230   x!      (          0    20230    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    231   �!      *          0    20236 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    233   y"      ,          0    20242 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    235   �"      -          0    20246    layanan 
   TABLE DATA           v  COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal, kw_k_kantor, kw_penerima, kw_pemeriksa_p2, kw_k_s_intelijen, kw_k_b_fasilitas, kw_k_b_p2, kw_k_s_pf, kw_pemeriksa_dokumen) FROM stdin;
    public          postgres    false    236   \'      .          0    20253    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    237   k(      /          0    20257    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    238    )      1          0    20263    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    240   a)      2          0    20267    sub_jenis_layanan 
   TABLE DATA           W   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan, pengawas) FROM stdin;
    public          postgres    false    241   �)      :           0    0    data_perusahaan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 1, false);
          public          postgres    false    203            ;           0    0    data_pribadi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 1, false);
          public          postgres    false    204            <           0    0    dokumen_proses_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 1, false);
          public          postgres    false    218            =           0    0    jenis_dokumen_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 1, false);
          public          postgres    false    220            >           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 1, false);
          public          postgres    false    208            ?           0    0    jenis_layanan_id_seq1    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq1', 1, true);
          public          postgres    false    207            @           0    0    jenis_lokasi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_lokasi_id_seq', 1, false);
          public          postgres    false    225            A           0    0    jenis_pengawas_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_pengawas_id_seq', 2, true);
          public          postgres    false    228            B           0    0    jenis_pengelola_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq', 1, false);
          public          postgres    false    205            C           0    0    jenis_pengelola_id_seq1    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq1', 1, false);
          public          postgres    false    209            D           0    0    jenis_penimbunan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_penimbunan_id_seq', 1, false);
          public          postgres    false    210            E           0    0    jenis_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_perusahaan_id_seq', 1, false);
          public          postgres    false    211            F           0    0    kabupaten_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kabupaten_id_seq', 1, false);
          public          postgres    false    232            G           0    0    kecamatan_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kecamatan_id_seq', 1, false);
          public          postgres    false    234            H           0    0    m_identitas_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.m_identitas_id_seq', 1, false);
          public          postgres    false    206            I           0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    212            J           0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 1, false);
          public          postgres    false    213            K           0    0    status_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.status_layanan_id_seq', 1, true);
          public          postgres    false    239            L           0    0    sub_jenis_layanan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sub_jenis_layanan_id_seq', 1, false);
          public          postgres    false    214            M           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
          public          postgres    false    202            K           2606    20273    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    215            M           2606    20275 $   data_perusahaan data_perusahaan_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_pkey;
       public            postgres    false    216            O           2606    20277    data_pribadi data_pribadi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_pkey;
       public            postgres    false    217            Q           2606    20279     jenis_dokumen jenis_dokumen_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_pkey;
       public            postgres    false    221            S           2606    20281 $   jenis_fasilitas jenis_fasilitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_pkey;
       public            postgres    false    222            U           2606    20283 $   jenis_identitas jenis_identitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_identitas
    ADD CONSTRAINT jenis_identitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_identitas DROP CONSTRAINT jenis_identitas_pkey;
       public            postgres    false    223            W           2606    20285     jenis_layanan jenis_layanan_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_pkey;
       public            postgres    false    224            Y           2606    20287    jenis_lokasi jenis_lokasi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.jenis_lokasi
    ADD CONSTRAINT jenis_lokasi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.jenis_lokasi DROP CONSTRAINT jenis_lokasi_pkey;
       public            postgres    false    226            [           2606    20289 "   jenis_pengawas jenis_pengawas_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.jenis_pengawas
    ADD CONSTRAINT jenis_pengawas_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.jenis_pengawas DROP CONSTRAINT jenis_pengawas_pkey;
       public            postgres    false    227            ]           2606    20291 $   jenis_pengelola jenis_pengelola_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_pkey;
       public            postgres    false    229            _           2606    20293 &   jenis_penimbunan jenis_penimbunan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_pkey;
       public            postgres    false    230            a           2606    20295 &   jenis_perusahaan jenis_perusahaan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_perusahaan
    ADD CONSTRAINT jenis_perusahaan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_perusahaan DROP CONSTRAINT jenis_perusahaan_pkey;
       public            postgres    false    231            c           2606    20297    kabupaten kabupaten_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_pkey;
       public            postgres    false    233            e           2606    20299    kecamatan kecamatan_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_pkey;
       public            postgres    false    235            g           2606    20301    layanan layanan_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pkey;
       public            postgres    false    236            i           2606    20303    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    237            m           2606    20305 "   status_layanan status_layanan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.status_layanan
    ADD CONSTRAINT status_layanan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.status_layanan DROP CONSTRAINT status_layanan_pkey;
       public            postgres    false    240            k           2606    20307    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    238            o           2606    20309 (   sub_jenis_layanan sub_jenis_layanan_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pkey;
       public            postgres    false    241            p           2606    20310 !   account account_d_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_perusahaan_fkey FOREIGN KEY (d_perusahaan) REFERENCES public.data_perusahaan(id);
 K   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_perusahaan_fkey;
       public          postgres    false    215    216    3149            q           2606    20315    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_pribadi_fkey FOREIGN KEY (d_pribadi) REFERENCES public.data_pribadi(id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_pribadi_fkey;
       public          postgres    false    215    217    3151            r           2606    20320    account account_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.account DROP CONSTRAINT account_j_lokasi_fkey;
       public          postgres    false    215    226    3161            s           2606    20325    account account_role_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 C   ALTER TABLE ONLY public.account DROP CONSTRAINT account_role_fkey;
       public          postgres    false    215    237    3177            t           2606    20330    account account_status_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT account_status_fkey;
       public          postgres    false    3179    215    238            u           2606    20335 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    3169    216    231            v           2606    20340 .   data_perusahaan data_perusahaan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kabupaten_fkey;
       public          postgres    false    216    233    3171            w           2606    20345 .   data_perusahaan data_perusahaan_kecamatan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kecamatan_fkey FOREIGN KEY (kecamatan) REFERENCES public.kecamatan(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kecamatan_fkey;
       public          postgres    false    3173    216    235            x           2606    20350 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    238    216    3179            y           2606    20355 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    3157    223    217            z           2606    20360 "   dokumen dokumen_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 L   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_jenis_dokumen_fkey;
       public          postgres    false    219    221    3153            {           2606    20365    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    3175    219    236            |           2606    20370    dokumen dokumen_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_pemohon_fkey;
       public          postgres    false    215    219    3147            }           2606    20375 %   jenis_dokumen jenis_dokumen_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_role_fkey;
       public          postgres    false    237    221    3177            ~           2606    20380 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    3169    222    231                       2606    20385 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    224    222    3155            �           2606    20390 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    3165    224    229            �           2606    20395 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    230    224    3167            �           2606    20400 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    3169    224    231            �           2606    20405 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    229    3169    231            �           2606    20410 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    230    3169    231            �           2606    20415 !   kabupaten kabupaten_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 K   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_j_lokasi_fkey;
       public          postgres    false    226    3161    233            �           2606    20420 "   kecamatan kecamatan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 L   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_kabupaten_fkey;
       public          postgres    false    235    233    3171            �           2606    20425    layanan layanan_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_lokasi_fkey;
       public          postgres    false    226    3161    236            �           2606    20430    layanan layanan_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemohon_fkey;
       public          postgres    false    3147    236    215            �           2606    20435     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    236    241    3183            �           2606    20440    layanan layanan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_status_fkey FOREIGN KEY (status) REFERENCES public.status_layanan(id);
 E   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_status_fkey;
       public          postgres    false    236    240    3181            �           2606    20445 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    241    224    3159            �           2606    20450 .   sub_jenis_layanan sub_jenis_layanan_kppbc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_kppbc_fkey FOREIGN KEY (pengawas) REFERENCES public.jenis_pengawas(id);
 X   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_kppbc_fkey;
       public          postgres    false    227    3163    241               �  x���M�.G����W��^d�&E��9hzbrMb��u���󺙩�!�E��\�uw?��>����/�����c�����/~,�������>{�K^��WM/y���IS���>��)�����?|�]�_���?���bT۫��/����C�hI$%�`��_����0�K�2eN�c�B�D�3MQCS�1�ZCٳg{�lh��Z�
Вz*�����=Z�*�$��Zm@�?�P{McF�����*�5���
t�ǁ)�N�w��4�]����u��R3��}W��B�6���w_'��'�={s���DۅP(5k�5k��Q(�<o&{a�f�T�RjF���q�p�өn�S��P�֖���^�YX��*�V�Yh��adM�	;�
[�is��W}8�|W3�����jb��5��W�UG�O��jp�2BͫY�,���Ls{U,��*Í�s�]x��g�u���^zec������+>M�J�5�ՄW(l��9�}'�˫�32�n^���Yg:9��L�]NE#��&��r�[��� �P�����|�&�B��GS�b:��gx59^�c����7�P���X�#�«I���)1���@?��b�D���1�m�
��%�U�����\S��O>�$���19]��&4�x�S)b}����i��ؒ�앋�'C��}���.l;<IH���v~2X�'�ܕʁDK"MӪ�{�b�_|����`�FUvLx������5�d������5����-\�:�-KI/�ڳ�H��᯶��Vw��tM��L�&�ښ8zt��kR���Y�tM֠�mc���Jפ�[S�G�+]kpT�1�kB�8�<k���4���Z:h����N���k���G��k��k�ז�;�|۶4]�⓶rQVot��k�Ƶ����&�M�5mk����d[p�j�v����co���zߖU��w�)�N/;a}P6=�i��ikƈ��Y�ݤ}���V�=L˲��=�l'7L��Z�7k�	L�2�����0g?C���
�+n��eO*��-���W�khT�Bò�e6"�G-ӰLð�����iXI��
��x�(4�#[�X����)w�4��^u���0+\�!�{a�iXY3�`glw�݆iX�k�6n����-W���}�LcY<�+�Iٕ��x�T6_���.f��0��HLn��0?�O��%�m�6L�*��i�F%�4ţ7�>)���x��j�4�;�6*C����ÑF�P��i��0��,2w�vQ�a��~b��u�ݾc�4�	�=nŎ^r�e��}��`�߃��6c|��W��wf���OlU0�Q>���+�Z�<3c�KH�ё�q>����p���x�`�e&�,�NA��e�L����g���Y<a�$�iS}�Gz��4����>z�a�\6�I6���>���1<�i�}+�*�s�L�Y<��tIF�,ކ!�z}���0f�,;2���p�;3�g��7k���L����}<G� LÎ���o�E\9`J2�048�z�ϼaJ�$�$�aӆ)�X������;o��0�7=�(��;0sz�� ��_�l��0��M��I6LI��,ٱp��%7LIf:>U���$��8��$�0Ĵ~";�d�asCk�4�y=�S���a�K�04���0&��O�Dسx����n+{?}{�e6}2dn�"0c񓻱'z*�zا�x˕0ǰ�:ӊ�h�p#�}_%��P�br�p'\|0�1�6n�� �u�M5�|��$�֦,�M왙ԳxLt��ێ�a!<,�V�k��1罞�a��}�%7L�d���a�a��B8~�����K�X��1���t��M���mx^��H��O���ά�6qX�o���=	=b����a�u䵑}���ۿ&==N�u���3h���Hg��iqQ��C��,�V�~���Eܡ�G���]P�g��[�>|Ɵ��1��Y��VU���|�e�'��4S5�Vyc2�Lט�=���E[���Y��Go-�5���y�%J�5���K|�,w;˓�kL���3���f�v����YP��Lט��Ȓ���j�k�yU�<
�M�r���B�<�϶Q���X�k��.q�G#S�k�a*{h��<4]cZ?���Ι7M�ʺ���%r]g�t����q��{o����>U^�W�-Mט���j��MӵR��y~	h�j����p)A�G��4��}�z%T��)�G��r�x����}�x��
<s�f��y��Hl�xu	dô�#{�Y�m��1�< ނ�G?Z�G��~<+�J�ُ�N���b�4���������6�+P��$��F��O����}b����q�i[d��aV�.�w��[�Ӱv
q(�w���i�G��o8�����0����l�"eӰ��?��F���=r��7�֡����0��T=H��Ӱv�3%���0k��a�ޥ{A����k�=�t��}�w]Ҧ�{��yd?�$�g�a}_�H����i���$��i�a٫��%2l��yd�Â�6L��2Lٲ�({�0F��9�~a���}�n��w�a��m�g4�#{\�ɑ��#��1�f�~.>Նi�~ӳ�3�	� ��Y���o�����>�b'.��]�c��y0�gS��pY=��Zڟ�}R��q��L�.�z�����s�JI�����9��/�ϵd��������$"�N;�Fz��t=O�Ct']\���Oz��n�٧�w~ғ4s)�"K�')��)�^?�����^�9i!},�54�4m�|y���aK��?h;�����.��e���+']I�
+�t#��zOB��Iw��8L9�B� ]י�����Iz�6��
�P{���JP��kaSEH�hݤ�]������'��N��1j��3�PkM׎�>�����隇�,�K�q�t��vs����{4];�v��/?44]���]��_|���k��[�Sa;l[���3������o/��,��ooo�V�I            x��}�v�H��3�+�m�EQ��}���ؖ%�jQiW֪��)�p@�N������|ɜK���^S]��%�R����s��'���,-�]�\�g�:��������h��HD�(8��h���:��n�5~]�ݕ�s]���U��t�\nw�.s��e6/�C��r�\����s��p��й���_�r߮������.]��r�Y��`��O�;�59���ԩֻj�,�5��j��׷'N������T�"�/'nr"#����<?˶λ������<<1�pɐ�$���z�ܧϩ3�JX��G����9�;t.�-|�n�oS�</�t;�>���#�$ۤ����L��t��ħ��}\}��N���جާ���GQ���9\9ra�a G����b���Q�8W_�O��	ǿ�g���q�s�/��,CݨW=^l�mQ�[��"���DQ-�@m�k� �*��>9��c�H1�[B#�^�Z��=�D�u��J���A�i�J{>�?�%n�u�8j�=/布��E�6[;3���I�ժZ����vu |���i�@���ڶ�l�75+��(q�Qx�>�&�7��r���������9[g|�J?�����}�/�+Dߦ�|��ҹ�A��b�7H���A	J������$�VY	�<wn�u�-���4��	\)��:��n�!��h���(R���G�)������Y�Gx"�I�b�'RB�$�*�]�X��tW��.=tG"HFI-�>���$Cd��i����pSf�:�q9��N���a�@ӎh���x�����E�\TO��?qM�$kQ����i.P�d$D8r����z�Y����YI7SHO���Z�u�T����M؄K�=�Yh�Nkg��@��38��X��n�l�KcH���	/K�$�3��t΋eQ�����(	��(���D�Ή�cw�a��K����؀����=6o�y-�S��]�����]�$��Z�3�w����e�L�����O3C>0:"�G��G�^wF�D��[�Ҩ?w���K��!e7�=��`�=Ѷ�5�X��E� UyȦO��2q�ڃa0����aK��ʹ�>s����*Vp����~�L�QB=�eL/Je�3��8�t�&'A蝞���x >�� M�/�3ؘi�#��@٦����z#	R�$���޳c��g�r��]Q=V �2[���Δ�"�L���nM�w� �g�� \Z0갎�w�*�C8�ċA�܈e�5�f`�����6��y+�����;���)��yV�J�z�.�!Xf{�	I| �8}����w.�cҦ��sA��~�]��2��
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
Qd�A$d�#i[�����5K��W����T-���/"Ʊwln�I��������j#yy���>��U�X��3�s�!�����z(��˖��o����Me�2��������.�����@2�}��Ҥ��D���+������{���{�1��>�Ѫ�0u������U"aM�|�o|ܘ2�A :������p1���x쇒=���뇚0�hՄ��z�;�Jb��D����RQ%��A�?�^�:[!�^�O��ߎ�����F���	����_8h�|����V��	����,F�Bt�>�V�,�}Z�\pp�5��6{Jw�������r4-VįV���bQ����o���o��͹�            x��]�r�8ҾF�ws�χ��#��qəd2�U[�I��(��C\��{�/�w7@I�D���-h3;�	ٟ ��?���\T��L���΅�n�9����봪��gi��N3Ѽ�/�Y}'n�k)�fb,�����D��[9Ӵ~+�����஘��\��K�/z�)���lv�M[�w"[�����r^2;|�s";�˶-�f�;��AMY�'�/��E�b!2>|����Ң��UZLŽ�E���U��������	�?]\��$�iZ��؛�a_@��_�͢,JxG�(�U٠��m�vlǱ�P��tV˵���)�v���?^�Sdy�l(�b���,꒟���K��iۈ��[x�HlŶx-�����ٙA�=6�*~U��Y\M�r W�۬�g����}�O*�&��l�V�������������� �g9���פ���2s���rr��f�-;��j;[lV���l0��M���F�(��I�"6*�*܉�����J��*fG��ms�/Ck�I~�V�2ia��o�!-�f����f�&7gh�6��(���,d���R�b!	_�*�2�	m6j�eI$h�j
�9V` �{d��qM�;�GOEѺ�4i�vR7rQ֥2v�����$[��(�A�A%�va(�T�E3�ǆ�Z�R�?�d!�~�`�h?:���aҪ�� �Sl�s	���g�Tb�N�Zt
�Q��~����O�ú�A
�FH�����0ɩ
#v���U ��J�ÀV�&p��o�̊p��Je���a���BY�|:�s	J��ں�+�
��gҚE6�U2�m͇��U���
��|�>�(����E�?T���:�!��V�&eQ"�!�B��: @l1F�˝��b��n��\��$�Z�7�V�ֹY�2�)t�j.0)t/+�3�I��h��ػ4�Q�@�6/>u;(��⥳�������
����텹h˗�e��3��a�$�*Ď��y�ֲ���@�3�o3>�2�?O����={�?��*�NX&昜���(�@#n	(xe>��No_��v��X�A�`LǨ@`��iw�
>bo՚��J��H���gՄ���{Q� �Z��\f���6j:l$�(�������:��Or粣���A�*��H~�%�����i�a����ci��=P"y��B(�R/�h�j�))�ŧ�P�򰹽P��T�ʴ�� �x;cfR9��v���@�ǲJD[�'�#k8�#���8bX�)��
cşi�U�G[���2icv�E��I�z���l�*ի�a�������F�ܨ_㋼�C)���b��6h���(�	��N%X�9�NŲ~���t ,�XLy?jD��=����J��X �I�^��6H����`��pYL�L��"�4FE��U!��T���-���"ˊm�{�zL�� rc�q����-�OX����?7j�q�KX%؍7*���V^�I�t�=�� ���C�ZP�������"���dm�:��E\H��У5�e7�F�lK��r��mb�?�@|�<�����r�~O+e�}
���%�s�P۶�Ǜ��O~�Ve^��e�0]Df!�d7
��]Q�}&�;)���O�zf=�O���e���F��vZ�ְ�6Q�ɳ]��1�sM��AQ��T$I�\*���؜�Q�C�Ш%��0��}��rY�msF:;�y�cq[��ٜ2�&��e���8�9Cv�Jp��G�̿�M;/���!��?3j�F�u̬�3h*�luػ�un����@�ق_�����W�n�mVР~1P�l(��3 a+��#1/���*b{f/Ch�ulv*F�;)�wmC��j��f����8�2�X~UY�3{������lTb6$��?	:t��eDI��V�$K�x:ɔ6k�c��3��>z-*<��ཱུ4�Nk;>%\�Ϧ�����V��'"�)N��|�m�@� ����r<^t5�:#���s��65JȮE�fm��B�Q�(��a��lE����'�X���~�}]MR�S ���!@;�y"��l�7x�T�=�zq��EO��S\1h��E��,˵�e����ǈ�Tf�0M�c����.��� �����n�w�[�vݒ�s5���D4e�?U�<D�L�� �:H�� W���Ⱥ9�=��c��.ͨ���,�<�_�Mda�f_6�Ǯ�\fZۖ���b��t�}v�VՂ�o�[����T��6J�T��l�zQ]'^�2\�e��j�|d��
�l��{D�'�m�1�@��эuu�$+'m�F�l*;{��{;Y��u;%���ɱ}�\�͆����n�=g/L��0�We?b$o>xd�J���r�M�.�Gg�7:�`Y��o���5NO�ݗ��)�c��Ţ�v,�tb� �b��>�rZ�p�Cv*�s/���dU�.=%��]3ƃ��P6%������]&1Ѐi��v�\�m#������a
��5�f%Dˬk5�ER×ʷ�?i���(�����Q���8k�'���8ns���,�S�> �l=�a8���Z'�b϶�`��}��w��\��z���&э� B�"����_�>[I��;��f[��p >��m.>�������ug̢~��N5�/�υ�be�u��E�����Bp/��H;3Q=��m���a���d���!;��Ś�̊�@#���!b�ʉ���уn�`	�����D��$�W�lŎ�;RLW6�Ů�a��k�)�O(4R�/��lИ�t��RU|O,�I�U�K�������B>�]�8E���A�1j7�{|��e�R����[>���~����L�b톺&��������i`G9�%��S��{����~���dn� }X���]t���pw/LJ�Ӕ��!�I��%�'D�F�LĎ�E�K�x!��9|���
�,{m��=��9�D����h�����Q�Cx�C��lh�!��a�8��ρ��D��:X
���BAU��\�;�D �0_�/+�0xu�Q�.��؄��R�X�-7k�z9��+�kY9 �Y����N=�U9� �"��(�ܓ���Y��/Ǧi�ո���=:6;�����tsD�Rd�;C*G�'h0Pa� 'm`�s)���g�0 �
~�+��c��?0�U�v�V�X��&�n�[��C�;��{�E�(o/?X~��+��%�������LU5�k�H�ɗT�C�GRY�=8��N�!�$8_�kR����0L7"�˾R?��T��]�
�����Fb�jx�R�m�Y������|���i'���� �D��P���X��b+rM�|�ت�쓨��D����&Z?�φ���m�!�����Ҩ��iF�yچ���8bj�Ķ�c!��ĘH�Εr���ݽ��"�t:R��}��\�����QF��6�'�浠�ƶO�2��!��V�CQ�3���!�����,����E,��f�*�N%��v�"��������|�R"x�A��f���8³��PD���8$�r[M��#da��ݣ�ҫp�x�#��s����S���+�l��2ঢ�[�GLu�E�C�HSԘ
>av,�9���w�Ge�iG�֣��19�L� S�ת�2��5ݕp�ӽ,�	��H���B�)J��k�K�N@�˲��� ��U[�
�E%��p���>9�3$\\sJc�)b�O�X>��u�V�8w�ܱN���`��h�Eg�o�4 ��m�ng�ك�S��\�-��߼l�Z���%����{8I��	^�/��,�1vؖ!V��1�>��6KW�kϻ�tL=ٶ��|1˪���]d��E7#|�GR�lm�6EIν
���5�/{$�CD4���un'T�r�J���9HG�)��=/�$����r�i�K$3�U�d������d����-p4��� :M<c��h�(��v��`p�R��E���� Qg�
ٰ,$���<��d}_R7����y�|�rc(џ��v�B
xhGgb�� �	  ��T����ȂzA��WQ��V	��!'��\��F֏HG��nf�t,�8l�f�d��+�6�1��c�t��#}%L�a����"*�E����{�N��� <�XH'�`��r�:
��em��T[�}�����6V�{<����L:k�O���i�0yӇ��ݍM:I˿�3�=�b��z |I��^ }6��Lu����޻�i�vk��r̠� l�=S��xi��'^Ÿ�@&�q-ݟ�P_wf��Gֳ�zOy9N�մq�W_U���qu���l���8|s��Fg&��P�{�_�ڿ$�$�Ȳ2$�W����Ʀ�h�E7�^Ur� ^���T{���q3��h���A2�$�{/&��B�J"��G}�MfɐU�������5�(k��v0�Ǯ�B�������3�Ϩ27L�ْ� �U^߳�n<c�U��e��u	�� ��Ni�0R�O��6.��"-j�hm�|p��ZEa��]�E��P�>	�o>C�yL�G����5�]Q��	��<��c�<���˻U�`�����A�/��|�I�[�b�.�&����i��25Q�e�j���5�ݰ�^�v���6�c�m݈�͉��*��6��hQ^�o���|}[�eYV���R�,�l7_����O?�gW����r(����ɇ��7�5�il��cu?����&q�`�D|'�]/b
IJ����ŵ�>\�ٗ����w���G4U�]|�\����k��[l��֨�s��J(�'�粑F�˱� ؊K��DS���o(c%w�Q���/pK����R����n7
���i�c�d�n��֊� �� Aϒ?��R�����
+���coj~T��W�r�?���v�F�K� �=D����jG�"�Kb�.�n7V/�C���:��P��H�a�jr����`.&u)?�f��w�k�K�x�ipq�����l+g�7\�jҙ_��؁�n�F��^o����4}/�j ]]mv��1���2d��"uz�!�^0v�ߛj�H�Z��H��:�^\䠓���A���N�dS�s吪y�]�1��᱑�b�	;�)'��r��ƕ GU��R��ٮ� E[{W����i�A�`�}^Cع6�=�6x��S9'�mx�8�ךJ���B/�#֍����P|Ԟ.�]�獩� f�#��I^V)2G�m�l7�u���T���J�}��1�}+�L^Ǭ�<]%/'4��7�d��i�78����}W��O��h�lg�T&�F������y0�Yn��1k2[��6k�we�6Lm�zģ�-��u�g3C2j��b�Ag�;ֶe��>��=q�V�ld�W�~ �k�z�nn���Zߎ��+�����G� IMۄ���� *��Aеh������vjko�ǚ�������b�
h��e$�EF��e�,͇��)^��;��+����l��٪9�S���Ț)3��5Ɣ�{x6طs��V@iy�oB�!���X���%�j����S>+���5�������q\#����;�p��ǮD��Q�b��[���R/>7`�e
b��p,e�,`�&8w��	�;���q[��f�Z��_��\��9G����K�7P>��a�M��x'S>��N��=��f��N7查���O����ԉa����}dp`\�E�]�eu�	иU���\��জ3[#���ΊsP�t�]t�b��[�U�'%��x���+햮�EN����U[A#@h�OY��o2���|c����C·�%I�e<����x��8l�Zxs��T1�ǟO$Ykoh�����ƥ�kG��Rem�yj��-t����|w���}��+L�6�h8���M���8�}�<�sK���7����ָF:#e��'��)��K|)�Y�!Ժ���Ե,��ҳ���	�˟��i��{^�lv,~�o%����6�����cCjɹ9D�tߋ&
�sZ���$��X>ň?�_˩�Y05�c��y�#���$���n����z�C��ԅ뢅l��~�"a/HE�"��.����x��p����X4mU����ڶ�zz}�b6�y��D��0Q�;yl��������+~ގe�tVL��t�b�\6Cu�f��/z~�G�=���IK����$]v�ƊF���E�-�r_���-��IY&x����.F"N�A�3�_3�B�����u��Æ	��[�@'�	���?�� V ёN<&�Gr���S!�
�bN[N���"�+B|��r�.�ӄ�P=k�"���l�r�0���#Fey:bj��K��`ԭ_�잲z�S'Z�&�/�b����@D[$��ѻ��r>.�F��������GΆ��*��Xk�w:��
7R]t=>�W���l��<)g�<-8��{����b].8�9x����7��A         R  x��ӿN�0��y
�EBu��I<Ru@����ri\b%�#;Qac�-y�D��T��l7D�O���$k�7�2t�\i3k�����)żʠf�r_�gU	�(�ׅb��y���K.e�'X(gB��<�V��#"�p�〇!yT������2;H�M�iz��A��螸��}'�)0�TN���U�r��J�(�G��jj(@
�l5ί�k�j�ZM�\_Q\�
[�?�E؇�H��u���9jnv������oD��=-Ƀ���5��N6�bĸ�hAgR:Ϡ�h�yj�4��iE3<�(�.�����K��<�{�_�j���d���e�7�5�.         �  x��\�r�F]�_ѫ)�J�� �5+1�I�+�k6޴L�� �,<�Ҭf??1�2�2_2� @�4�$U�e��Ͼ�s����*��QƦQ�\-V��>�2�;�Χ���|X-W9��fU�&Q^b!�ه�ɹ~�x�(7�s��8c�c��L���d[g�(]�Bd�qQ�y �ǳ�欌�D�%�;���K�/E��R�U�������œH�o"�g�r�L����m���q'�­�*
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
%�oPM�d�ͫ!��\1}�%ѷ����;4M�S�����@ͮ)c��/�E�.m��<���aNd]kXy�ܸ%���W���>q����|����}M�f5T�ܽ�������޽�?���.         '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
]          4   x�3��	�2����2�H,.�/�2���q�2Ӿ\f�~�\1z\\\ �
v      !   �   x�m���@D��c��.������1F�_�*�:$�ޔig64�i���}��М������2�jl0��08-����z�<��m��=� ��C�WJh�y@�6���h���h��А�y�F(��E�c%���%nΫ���J?D�F<9�ĳ�TW��L�K�n��(^2���EXK܋�@܋0%�y͈{^��uqb�l�,��ew�BY>��FN��FN��FN��F��h'vqډ�V烈�B%8      #   '   x�3�I�KO-\F��@F6�1�wb^yfW� ��	e      $      x�3��pr�2��N�+������� <0      &   m   x�3�tJLI�S-N�H�4�2��I�MJLOTH�M-��+I� 
s:�E��Ss�sBRsK|3�&X��Tl�j�wbyb1�~�Hi^Vb^:P�~�i����� rA�      '   Q   x�3�tJ�K/�K�SHI��O,I,U�I, �%�q�rq� �ٙ
�y��I u@Qc�м��l$A��t�Ң��t� ��      (   �   x�M�=
�0�g�>A�m�B� ��.
���Х�������{:+��6��DA��J.���/O
�A�
Ǌ�$�z���[�s��`�jc/×��oQ��.�5I���8I˲�E���K��ĞC�HpW��B��<N ���9      *   g   x�3���/ITI�KO-
��9�%�y��\FhR@!cN�Ĥ҂Ē�<q��`߈�I\���93'5=?(`��* 1/%5=��I�'5)1(���� ��5`      ,   \  x�M��n�8���S�	��^�P���f6L,��ElA�~��r:��G�E������&�I��>��x2�&S�w�ܼ;����zpa��r�u�|�ǿ7Y�
�-���w�����b�Cc�[�
���.s++!��A�^����ͅ{𺘛g����N�B=w�:Ri^t]<�2�n�U]�͛]\h7��yѠ�ɜa�e�9��ҋ�)��M��* ;�=�/̏� {��y
�2��pT8�t�4k���7Gh̳�&ǟ�1�xrײ�<�+�RH��bW�M�����vn^l7��0�1��4�v��"K V��ζ� `T@��!�FF���Z~�R�Xɉ�Kz�C�)��&[�.{�.�r��<w9��@�hEW!�0HϖWJ�U��6g;��K�ؘ��P�a%'�������H�R�Dad��`Vz��s��� �R�߸NO&���Dbš�pѾ�� P��A"@���+���?	i���-S$C�~�W)l�Z�1ذ�H�BTn��V��I4~{	Ѯw�ߩX8(��=��B�ũI��fZT�t�O��d������E��ol̀��2�.q�-6k��2�d�1�es�Tհ���Y��q>~�n�g��O,H����V�̜��y���Փ�6�e���{�Y����_�C]�,�fO`q���Fb��Fj̓]�n�Rs2����I����)x�C H��J�:4��	�u�������\ܶS�ߨH̥�aD����\L��t;A�_��WVaTH��nE���G��'�.LZw��E\4���Jg�����Z^��lN�0i�p_�1l_�⇉
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�      -   �   x�uQ�q� �v���gˀ���	��sԄwMB�;�eYH�\F��Y^�^`��Ө���?4ο����BB�o��<�7�Qըŝ:�&���t�E{�)���K���N]ZWB�� @p��QJ\b;�y�wHs='&pm��a��_P�
"#s�X5��'}�TϹڟb�32����9j��*/��gޡ�(�K�!YSh�	�j�yj�n��e�J7%jB�jv�]Po�����1mqS ���|��۶���      .   �   x�U��� D�������[�`����.�8og2��zw/gA4R�d���*g`H'}��=�j��%�`��y½1���S
LEd�\H4c�d�#�:GP�0�������Cޚ��6�������d���-���Tm���ќ]���Q��w]yje�Վ���K��/�z;      /   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      1   L   x�3�LLNN-(IM�2���SHJ,I�P0T�N�+���2F�)d$%%s�(+( 
�����4�,J�JM���� �[�      2   �  x��UMo�0=ۿB�(�X���؊�v酮UG�G�������g�[������{�h�'���`P;1ɶ��ujm����&�.m�݀0=�D@��� :@_���s� ���`h��  �,D�x�H���<�Q���WqP����x�:ѩ�TO|<�y�3遾j?q$s�T<pTݡ�ѫ����w�'wЫL��0�S���H���y�K��khߊSq�b�Z�R�8��������v=�	sw��:����!R��5z^c��Y5��D�=�$ǟ=(/P{�{-L�\��l��밍2�.Y�i$n��T�%L����r~�3�Fk>ƚ��aHSb��Yf(�8��(���rXq�;��[�.����t�:�*/O1���l1��b�7��o�*�4�Xs�kA�{��c����3EN�t�:���ԩY&}�<��4����9Nz�D���A���e��:��.N��u0��j-e�[.��s0w~M�\K��ૈfpP�o�ry%r����/b��/̚=y�������ͬ�+��O���;��+Q:�zQ�����h��y�R�s89�	��Ќ&����F�4�`����U�Z�е��-����[S%v��DS�m.�-��6T�]��ۍ��@+<4T`���Q)��xA���� X�S��\�)�,iʅ& �\��$*�;Ȓ���]< �)גܛi�� !E�v     