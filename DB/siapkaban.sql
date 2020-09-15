PGDMP                         x         
   siapkaban2    12.3    12.3 �    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    21515 
   siapkaban2    DATABASE     h   CREATE DATABASE siapkaban2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE siapkaban2;
                postgres    false            �            1259    21516    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false            �            1259    22755    account    TABLE        CREATE TABLE public.account (
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
       public         heap    postgres    false    202            �            1259    21525    data_perusahaan_id_seq    SEQUENCE        CREATE SEQUENCE public.data_perusahaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.data_perusahaan_id_seq;
       public          postgres    false            �            1259    22762    data_perusahaan    TABLE     $  CREATE TABLE public.data_perusahaan (
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
       public         heap    postgres    false    203            �            1259    21534    data_pribadi_id_seq    SEQUENCE     |   CREATE SEQUENCE public.data_pribadi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.data_pribadi_id_seq;
       public          postgres    false            �            1259    22769    data_pribadi    TABLE     �  CREATE TABLE public.data_pribadi (
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
       public         heap    postgres    false    204            �            1259    21543    dokumen_proses_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.dokumen_proses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.dokumen_proses_id_seq;
       public          postgres    false            �            1259    22776    dokumen    TABLE       CREATE TABLE public.dokumen (
    id integer DEFAULT nextval('public.dokumen_proses_id_seq'::regclass) NOT NULL,
    nama_dokumen character varying(255),
    path character varying(255),
    jenis_dokumen integer,
    pemohon integer,
    status integer,
    layanan integer
);
    DROP TABLE public.dokumen;
       public         heap    postgres    false    205            �            1259    21552    jenis_dokumen_id_seq    SEQUENCE     }   CREATE SEQUENCE public.jenis_dokumen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_dokumen_id_seq;
       public          postgres    false            �            1259    22783    jenis_dokumen    TABLE     $  CREATE TABLE public.jenis_dokumen (
    id integer DEFAULT nextval('public.jenis_dokumen_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_sub_jenis_layanan integer,
    deskripsi_dokumen character varying(255),
    role integer,
    status character varying(255)
);
 !   DROP TABLE public.jenis_dokumen;
       public         heap    postgres    false    206            �            1259    21561    jenis_pengelola_id_seq    SEQUENCE        CREATE SEQUENCE public.jenis_pengelola_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.jenis_pengelola_id_seq;
       public          postgres    false            �            1259    22790    jenis_fasilitas    TABLE     �   CREATE TABLE public.jenis_fasilitas (
    id integer DEFAULT nextval('public.jenis_pengelola_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 #   DROP TABLE public.jenis_fasilitas;
       public         heap    postgres    false    207            �            1259    21567    m_identitas_id_seq    SEQUENCE     {   CREATE SEQUENCE public.m_identitas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.m_identitas_id_seq;
       public          postgres    false            �            1259    22794    jenis_identitas    TABLE     �   CREATE TABLE public.jenis_identitas (
    id integer DEFAULT nextval('public.m_identitas_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 #   DROP TABLE public.jenis_identitas;
       public         heap    postgres    false    208            �            1259    21573    jenis_layanan_id_seq1    SEQUENCE     ~   CREATE SEQUENCE public.jenis_layanan_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.jenis_layanan_id_seq1;
       public          postgres    false            �            1259    22798    jenis_layanan    TABLE     "  CREATE TABLE public.jenis_layanan (
    id integer DEFAULT nextval('public.jenis_layanan_id_seq1'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer,
    id_jenis_fasilitas integer,
    id_jenis_pengelola integer,
    id_jenis_penimbunan integer
);
 !   DROP TABLE public.jenis_layanan;
       public         heap    postgres    false    209            �            1259    21579    jenis_layanan_id_seq    SEQUENCE     }   CREATE SEQUENCE public.jenis_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_layanan_id_seq;
       public          postgres    false            �            1259    21581    jenis_lokasi_id_seq    SEQUENCE     |   CREATE SEQUENCE public.jenis_lokasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.jenis_lokasi_id_seq;
       public          postgres    false            �            1259    22802    jenis_lokasi    TABLE     �   CREATE TABLE public.jenis_lokasi (
    id integer DEFAULT nextval('public.jenis_lokasi_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
     DROP TABLE public.jenis_lokasi;
       public         heap    postgres    false    211            �            1259    21587    jenis_pengawas_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.jenis_pengawas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.jenis_pengawas_id_seq;
       public          postgres    false            �            1259    22806    jenis_pengawas    TABLE     �   CREATE TABLE public.jenis_pengawas (
    id integer DEFAULT nextval('public.jenis_pengawas_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 "   DROP TABLE public.jenis_pengawas;
       public         heap    postgres    false    212            �            1259    21593    jenis_pengelola_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.jenis_pengelola_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_pengelola_id_seq1;
       public          postgres    false            �            1259    22810    jenis_pengelola    TABLE     �   CREATE TABLE public.jenis_pengelola (
    id integer DEFAULT nextval('public.jenis_pengelola_id_seq1'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 #   DROP TABLE public.jenis_pengelola;
       public         heap    postgres    false    213            �            1259    21599    jenis_penimbunan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_penimbunan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_penimbunan_id_seq;
       public          postgres    false            �            1259    22814    jenis_penimbunan    TABLE     �   CREATE TABLE public.jenis_penimbunan (
    id integer DEFAULT nextval('public.jenis_penimbunan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 $   DROP TABLE public.jenis_penimbunan;
       public         heap    postgres    false    214            �            1259    21605    jenis_perusahaan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_perusahaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_perusahaan_id_seq;
       public          postgres    false            �            1259    22818    jenis_perusahaan    TABLE     �   CREATE TABLE public.jenis_perusahaan (
    id integer DEFAULT nextval('public.jenis_perusahaan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 $   DROP TABLE public.jenis_perusahaan;
       public         heap    postgres    false    215            �            1259    21611    kabupaten_id_seq    SEQUENCE     y   CREATE SEQUENCE public.kabupaten_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kabupaten_id_seq;
       public          postgres    false            �            1259    22822 	   kabupaten    TABLE     �   CREATE TABLE public.kabupaten (
    id integer DEFAULT nextval('public.kabupaten_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    j_lokasi integer
);
    DROP TABLE public.kabupaten;
       public         heap    postgres    false    216            �            1259    21617    kecamatan_id_seq    SEQUENCE     y   CREATE SEQUENCE public.kecamatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kecamatan_id_seq;
       public          postgres    false            �            1259    22826 	   kecamatan    TABLE     �   CREATE TABLE public.kecamatan (
    id integer DEFAULT nextval('public.kecamatan_id_seq'::regclass) NOT NULL,
    keterangan character varying(225),
    kabupaten integer
);
    DROP TABLE public.kecamatan;
       public         heap    postgres    false    217            �            1259    22830    layanan    TABLE     �  CREATE TABLE public.layanan (
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
    kw_pemeriksa_dokumen character varying(255),
    kw_k_b_pkc character varying(255),
    kw_k_s_pkc character varying(255),
    kw_pemeriksa_pkc character varying(255)
);
    DROP TABLE public.layanan;
       public         heap    postgres    false    210            �            1259    21630    role_id_seq    SEQUENCE     t   CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false            �            1259    22837    role    TABLE     �   CREATE TABLE public.role (
    id integer DEFAULT nextval('public.role_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.role;
       public         heap    postgres    false    218            �            1259    21636    status_id_seq    SEQUENCE     v   CREATE SEQUENCE public.status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public          postgres    false            �            1259    22841    status    TABLE     �   CREATE TABLE public.status (
    id integer DEFAULT nextval('public.status_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.status;
       public         heap    postgres    false    219            �            1259    21642    status_layanan_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.status_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.status_layanan_id_seq;
       public          postgres    false            �            1259    22845    status_layanan    TABLE     �   CREATE TABLE public.status_layanan (
    id integer DEFAULT nextval('public.status_layanan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 "   DROP TABLE public.status_layanan;
       public         heap    postgres    false    220            �            1259    21648    sub_jenis_layanan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_jenis_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.sub_jenis_layanan_id_seq;
       public          postgres    false            �            1259    22849    sub_jenis_layanan    TABLE     �   CREATE TABLE public.sub_jenis_layanan (
    id integer DEFAULT nextval('public.sub_jenis_layanan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_layanan integer,
    pengawas integer
);
 %   DROP TABLE public.sub_jenis_layanan;
       public         heap    postgres    false    221                      0    22755    account 
   TABLE DATA           j   COPY public.account (id, username, password, role, status, d_perusahaan, d_pribadi, j_lokasi) FROM stdin;
    public          postgres    false    222   a�                  0    22762    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab, kecamatan, kabupaten) FROM stdin;
    public          postgres    false    223   �       !          0    22769    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    224   ��       "          0    22776    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    225   �      #          0    22783    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    226         $          0    22790    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    227   f%      %          0    22794    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    228   �%      &          0    22798    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    229   �%      '          0    22802    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    230   �&      (          0    22806    jenis_pengawas 
   TABLE DATA           8   COPY public.jenis_pengawas (id, keterangan) FROM stdin;
    public          postgres    false    231    '      )          0    22810    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    232   N'      *          0    22814    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    233   �'      +          0    22818    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    234   ,(      ,          0    22822 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    235   �(      -          0    22826 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    236   C)      .          0    22830    layanan 
   TABLE DATA           �  COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal, kw_k_kantor, kw_penerima, kw_pemeriksa_p2, kw_k_s_intelijen, kw_k_b_fasilitas, kw_k_b_p2, kw_k_s_pf, kw_pemeriksa_dokumen, kw_k_b_pkc, kw_k_s_pkc, kw_pemeriksa_pkc) FROM stdin;
    public          postgres    false    237   �-      /          0    22837    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    238   �.      0          0    22841    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    239   �/      1          0    22845    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    240   �/      2          0    22849    sub_jenis_layanan 
   TABLE DATA           W   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan, pengawas) FROM stdin;
    public          postgres    false    241   $0      9           0    0    data_perusahaan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 1, false);
          public          postgres    false    203            :           0    0    data_pribadi_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 2, true);
          public          postgres    false    204            ;           0    0    dokumen_proses_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 595, true);
          public          postgres    false    205            <           0    0    jenis_dokumen_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 2, true);
          public          postgres    false    206            =           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 57, true);
          public          postgres    false    210            >           0    0    jenis_layanan_id_seq1    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_layanan_id_seq1', 1, false);
          public          postgres    false    209            ?           0    0    jenis_lokasi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_lokasi_id_seq', 1, false);
          public          postgres    false    211            @           0    0    jenis_pengawas_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_pengawas_id_seq', 1, false);
          public          postgres    false    212            A           0    0    jenis_pengelola_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq', 1, false);
          public          postgres    false    207            B           0    0    jenis_pengelola_id_seq1    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq1', 1, false);
          public          postgres    false    213            C           0    0    jenis_penimbunan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_penimbunan_id_seq', 1, false);
          public          postgres    false    214            D           0    0    jenis_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_perusahaan_id_seq', 1, false);
          public          postgres    false    215            E           0    0    kabupaten_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kabupaten_id_seq', 1, false);
          public          postgres    false    216            F           0    0    kecamatan_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kecamatan_id_seq', 1, false);
          public          postgres    false    217            G           0    0    m_identitas_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.m_identitas_id_seq', 1, false);
          public          postgres    false    208            H           0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    218            I           0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 1, false);
          public          postgres    false    219            J           0    0    status_layanan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.status_layanan_id_seq', 1, false);
          public          postgres    false    220            K           0    0    sub_jenis_layanan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sub_jenis_layanan_id_seq', 1, false);
          public          postgres    false    221            L           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
          public          postgres    false    202            K           2606    22854    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    222            M           2606    22856 $   data_perusahaan data_perusahaan_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_pkey;
       public            postgres    false    223            O           2606    22858    data_pribadi data_pribadi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_pkey;
       public            postgres    false    224            Q           2606    22860     jenis_dokumen jenis_dokumen_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_pkey;
       public            postgres    false    226            S           2606    22862 $   jenis_fasilitas jenis_fasilitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_pkey;
       public            postgres    false    227            U           2606    22864 $   jenis_identitas jenis_identitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_identitas
    ADD CONSTRAINT jenis_identitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_identitas DROP CONSTRAINT jenis_identitas_pkey;
       public            postgres    false    228            W           2606    22866     jenis_layanan jenis_layanan_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_pkey;
       public            postgres    false    229            Y           2606    22868    jenis_lokasi jenis_lokasi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.jenis_lokasi
    ADD CONSTRAINT jenis_lokasi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.jenis_lokasi DROP CONSTRAINT jenis_lokasi_pkey;
       public            postgres    false    230            [           2606    22870 "   jenis_pengawas jenis_pengawas_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.jenis_pengawas
    ADD CONSTRAINT jenis_pengawas_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.jenis_pengawas DROP CONSTRAINT jenis_pengawas_pkey;
       public            postgres    false    231            ]           2606    22872 $   jenis_pengelola jenis_pengelola_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_pkey;
       public            postgres    false    232            _           2606    22874 &   jenis_penimbunan jenis_penimbunan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_pkey;
       public            postgres    false    233            a           2606    22876 &   jenis_perusahaan jenis_perusahaan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_perusahaan
    ADD CONSTRAINT jenis_perusahaan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_perusahaan DROP CONSTRAINT jenis_perusahaan_pkey;
       public            postgres    false    234            c           2606    22878    kabupaten kabupaten_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_pkey;
       public            postgres    false    235            e           2606    22880    kecamatan kecamatan_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_pkey;
       public            postgres    false    236            g           2606    22882    layanan layanan_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pkey;
       public            postgres    false    237            i           2606    22884    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    238            m           2606    22886 "   status_layanan status_layanan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.status_layanan
    ADD CONSTRAINT status_layanan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.status_layanan DROP CONSTRAINT status_layanan_pkey;
       public            postgres    false    240            k           2606    22888    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    239            o           2606    22890 (   sub_jenis_layanan sub_jenis_layanan_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pkey;
       public            postgres    false    241            p           2606    22891 !   account account_d_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_perusahaan_fkey FOREIGN KEY (d_perusahaan) REFERENCES public.data_perusahaan(id);
 K   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_perusahaan_fkey;
       public          postgres    false    222    223    3149            q           2606    22896    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_pribadi_fkey FOREIGN KEY (d_pribadi) REFERENCES public.data_pribadi(id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_pribadi_fkey;
       public          postgres    false    222    224    3151            r           2606    22901    account account_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.account DROP CONSTRAINT account_j_lokasi_fkey;
       public          postgres    false    222    230    3161            s           2606    22906    account account_role_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 C   ALTER TABLE ONLY public.account DROP CONSTRAINT account_role_fkey;
       public          postgres    false    3177    238    222            t           2606    22911    account account_status_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT account_status_fkey;
       public          postgres    false    3179    239    222            u           2606    22916 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    223    234    3169            v           2606    22921 .   data_perusahaan data_perusahaan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kabupaten_fkey;
       public          postgres    false    235    3171    223            w           2606    22926 .   data_perusahaan data_perusahaan_kecamatan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kecamatan_fkey FOREIGN KEY (kecamatan) REFERENCES public.kecamatan(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kecamatan_fkey;
       public          postgres    false    223    3173    236            x           2606    22931 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    3179    239    223            y           2606    22936 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    224    3157    228            z           2606    22941 "   dokumen dokumen_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 L   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_jenis_dokumen_fkey;
       public          postgres    false    3153    226    225            {           2606    22946    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    3175    237    225            |           2606    22951    dokumen dokumen_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_pemohon_fkey;
       public          postgres    false    3147    222    225            }           2606    22956 %   jenis_dokumen jenis_dokumen_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_role_fkey;
       public          postgres    false    3177    238    226            ~           2606    22961 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    3169    234    227                       2606    22966 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    229    227    3155            �           2606    22971 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    3165    229    232            �           2606    22976 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    229    3167    233            �           2606    22981 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    229    234    3169            �           2606    22986 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    232    234    3169            �           2606    22991 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    233    234    3169            �           2606    22996 !   kabupaten kabupaten_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 K   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_j_lokasi_fkey;
       public          postgres    false    230    3161    235            �           2606    23001 "   kecamatan kecamatan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 L   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_kabupaten_fkey;
       public          postgres    false    236    3171    235            �           2606    23006    layanan layanan_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_lokasi_fkey;
       public          postgres    false    3161    230    237            �           2606    23011    layanan layanan_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemohon_fkey;
       public          postgres    false    3147    237    222            �           2606    23016     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    241    3183    237            �           2606    23021    layanan layanan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_status_fkey FOREIGN KEY (status) REFERENCES public.status_layanan(id);
 E   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_status_fkey;
       public          postgres    false    3181    240    237            �           2606    23026 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    3159    241    229            �           2606    23031 1   sub_jenis_layanan sub_jenis_layanan_pengawas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pengawas_fkey FOREIGN KEY (pengawas) REFERENCES public.jenis_pengawas(id);
 [   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pengawas_fkey;
       public          postgres    false    3163    231    241               �  x���ͮe7���
����L�$)�	R&-�"�tI��Sk��}�l�F���k۟�U�>�G�!J�c��b����?�%�y|�������w)���_��/?��%򊯯���Jo���Z(1�j�B�Q&S�*�Y�j:�8�9�I��b,���k̬�eYdG����B�
�:fg�wcfSVU6̭~��7z��ʦʮ�QC	�H��K�U9�]�ͭO9Tm�a8��*Sm�����f�E�00Il��Umqh�C:GI�K{��K"r}}x���_�ھ����Z~���_������7��`��W�Yy+�%:@w�S����*\���u���8y��n����P>�T �������C���!��0����5CmC��-b�߬H���u|�"KZ!M��]t���J��#���=�ҙHt}���H�Ij�1�4�~
��t �*q�PCe*9�k�i���maǻ��h�Se:���L�-�B�����wHE[�8�#�{�7Dm-�jDJ�3��N��ւ�F���U#�P!p=p�@u:b�T5�J�AUn-�jՈ,�>�vp��y,��f�\�nZ	�c|k�U�ǔf��c�;���
��	�\uf*U�r5�[��L&��\ݜS[�:�J,<Ϟq�G�VY��q-���
S����^p���"Y��dZ��8��<'��p�'WI�'�n-��ôk4�5O��j�9.��c����j�5n�ߛZp5XH���p5�����8��3��W���]y���
��N�Tkg�g\p5�U֙B�Y�c�߂�`�A(����c��oA�m�"N��9\b�5�Q����2� �<�.߁�<Qm�!�ѽK����&7�1T��E�>Iպ���6v���C"�NuYc�'�@w?��X)L$�9�7�?zѹ��cŚG��\U��z ��?�ffo]�!������mf���1��8Y��ґ��T���DX��v��[A�2������^���=(c$k���㳱�Z�I��F��[o!k�٬	�	�B�"�������H�x�<���<4{��ZXj�&q��#w�ɚ��yO���V�5I��b���cǥ&k���6W���&k2�Z
mg���h�ɚ��������/!j2;�����[L���e��t�n1A�aa��&g)L�4�
���-&fɺI]����YLʒX�dx��-&di��v�1K,����D3g8���!xt�1�U���%s*��;F�$,5�Wlk��L�2����$,�0T���n1	���*���o�L�2�O����ӛ#w�IX�w����m1	�,�`v�]Xz�$,��s3֓q��$,�Y�sLW����j#O�^b���Gv!a��z��9����!xlE���/�bVh�kq�J:�Sõ�$��0�����B�<vSF�1Ş�IXI&�W�@L�J^�ŎdPH�W�,dM�0��ǠI�d���3xd���(�bF�~��a�~�;�������-��獆GL���û网_L����Ŏ٦���!��Uɻ�4�<����g�I�|M���Ȟo&at�!F	�7���g��7����4�<�	�?2}��3�~y02	�����ov$@z��bf��$����{x��$���(3{��$�����I��	}}�##<�0:�v���Mt�<��Q�ر%i�3xMC�z���c���3xtd�;֙�>��8���G�gdF{_�X��̞N1	[��o�"./1!�3u�^�曷��Х�1ɚ�h6m1!��k�n�y�		}z�3����y���3x4F����bBB�^��I���Ъ�s{2��0Z�ޖ�yN�-&$Êu�z2�3ѭ0Ǯ-���1���an1	�_OC���3a$���nIKC��n1	�c����u�9l�a��!���-4�������$lXR�؄y� ��vcO���b;n�#���Jht+��RY�Jq��*Rf�:7��7��%�3��-�[����x��-�ٔ�Y����N=��Aؠ7�G��Gy$��A�k�3�[L��$�f��%����I��3a[L��$La�>���^�/yc��ƨ=x�#�QL�4�|G�z�;��6��u��Ń�j�m��|t���]��NB�-u�/q��wA~���_��m���i|�rv/u���<��\�Lu4P��C��,�����'5��j���Y{�@���?�q[��7A�?���g��"$����� OkI"j4�5�Jg��݉�ѡﲌ@�C-��]s�YKd�<�|=r��Mz�%vf�Sgy��]���N�{'��-�>���p��}z�,�ٍ�$�F��Oe�� ��d-��O�ɚY�I��h�2Y�W_�>�L��Ѭ�ܡ�yXj�F���{��3o5Y������V��<�S��y����M�>>��w����ѱ�����&k���<=�$5Z��1�ӆ��q2��4Z���+�-&hf����#��<�����r|s!f�����.H�i�{�Ť�,{��)𶘐Ѳ� ހ��)d�,����I!b��{�7J��Bl1	�e�1۾,��&ae�#>q餒0Z����}}v�����WM[=����2� ��-����.����)n1	3�>�'�u�Tf�}����6	����ቹ(��Ѳ�H���p�Ǖ��y)}�`�I�Y�t�8V�HX]}ft��[L��|{Xٻ��D�|���L�ym�F��|/�nK�t�0�������$����So1	[�=�H�^�4f��h�Ξd��$�,{\tO�b�&aOG؝���:���0{���]o�=bf�=f[�|s'af��qN�d�eFt�'�}���i��,��0���g�{�A:	��?}��߾�x�>h�#bS܌�d��_��I��.�%ϡ��Ȳ��������>���c�==�U��N�	��E�1I�5�#S-�.�Ui]�J��}ir�]�ԍ�l $�|�;���K�p�/�����G%S�B�z�T���;>����X����K-T+>���R��d9~�ve�7�[������.�/u�ZV'��ԕ�4+��^/u�:����w�;�e�J�}�_=����N���+�D�(���&���M�J���Xm^j���޴���]j�F����-�=V����7�v4��m�ɚ����[޾�d��re�W���KM֖_.��톄�&k���A�V��ϣ����1��~���9��5���ʏ������|q^:P��o�����X3�             x��}�v�H��3�+�m�EQ��}���ؖ%�jQiW֪��)�p@�N������|ɜK���^S]��%�R����s��'���,-�]�\�g�:��������h��HD�(8��h���:��n�5~]�ݕ�s]���U��t�\nw�.s��e6/�C��r�\����s��p��й���_�r߮������.]��r�Y��`��O�;�59���ԩֻj�,�5��j��׷'N������T�"�/'nr"#����<?˶λ������<<1�pɐ�$���z�ܧϩ3�JX��G����9�;t.�-|�n�oS�</�t;�>���#�$ۤ����L��t��ħ��}\}��N���جާ���GQ���9\9ra�a G����b���Q�8W_�O��	ǿ�g���q�s�/��,CݨW=^l�mQ�[��"���DQ-�@m�k� �*��>9��c�H1�[B#�^�Z��=�D�u��J���A�i�J{>�?�%n�u�8j�=/布��E�6[;3���I�ժZ����vu |���i�@���ڶ�l�75+��(q�Qx�>�&�7��r���������9[g|�J?�����}�/�+Dߦ�|��ҹ�A��b�7H���A	J������$�VY	�<wn�u�-���4��	\)��:��n�!��h���(R���G�)������Y�Gx"�I�b�'RB�$�*�]�X��tW��.=tG"HFI-�>���$Cd��i����pSf�:�q9��N���a�@ӎh���x�����E�\TO��?qM�$kQ����i.P�d$D8r����z�Y����YI7SHO���Z�u�T����M؄K�=�Yh�Nkg��@��38��X��n�l�KcH���	/K�$�3��t΋eQ�����(	��(���D�Ή�cw�a��K����؀����=6o�y-�S��]�����]�$��Z�3�w����e�L�����O3C>0:"�G��G�^wF�D��[�Ҩ?w���K��!e7�=��`�=Ѷ�5�X��E� UyȦO��2q�ڃa0����aK��ʹ�>s����*Vp����~�L�QB=�eL/Je�3��8�t�&'A蝞���x >�� M�/�3ؘi�#��@٦����z#	R�$���޳c��g�r��]Q=V �2[���Δ�"�L���nM�w� �g�� \Z0갎�w�*�C8�ċA�܈e�5�f`�����6��y+�����;���)��yV�J�z�.�!Xf{�	I| �8}����w.�cҦ��sA��~�]��2��
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
Qd�A$d�#i[�����5K��W����T-���/"Ʊwln�I��������j#yy���>��U�X��3�s�!�����z(��˖��o����Me�2��������.�����@2�}��Ҥ��D���+������{���{�1��>�Ѫ�0u������U"aM�|�o|ܘ2�A :������p1���x쇒=���뇚0�hՄ��z�;�Jb��D����RQ%��A�?�^�:[!�^�O��ߎ�����F���	����_8h�|����V��	����,F�Bt�>�V�,�}Z�\pp�5��6{Jw�������r4-VįV���bQ����o���o��͹�      !      x��]Ys۸�~F~���$ܗ�t��[b;.;��L��dR",���2.���u���n���Q�-�����&���k�*9fvD���v[�k[��>��"�@&��p�l��B>��۩������GQ4e�������?���`z����|w�7LZ��A�TW����m�r�6˲;���i-a�QZ�F/OKd1yV�~�7.�+-�Wr�Ӄ��ˋ�<����,���x�VV�+���Ō_V2��UӒ��٨L�ږm�@���R/���	�$�t��e����?|��e"�F��D�k�d�R����gq>��w���UN�i;{���&`W�n�x�]ʀ"ǃ�щ���T�冽�Q�u{'�}�8����ȳ������js>��\�Ɓ�[x6Q 횺��W����m!��J�s��b��=���qխEJW/�m��L�*	�<�DG���
����;|D�����L�D�AŤc>�Ŭ���{����}?�4�ˎ��h���N�9^��
l��H�_��ǲ���{���Jx��NI�]q�ȎBg'���LT��LL���̄��ޖ3f�w��iU�{���]�f�y�PV��^���R�O�H�F黱��w�I��~'�7/'����Z��x�츅GW�=\˒_�UQ�H��p�"�k�cŦ���o�ـ]/�J�FR�|���%����@x �o��� �(�ɼUe�U/X	�U�^;?��UX؄�7�ˆ�(�xˢF�.�C#&"Kw$�b�̝Qُ�/���q�i�eC3'�o�K"b���bo>���c��	?)�֠��q����A��{Q)+7�ЦQv�?���k��@5)�t]�I����
�3���=g㧇� �B6��6ksu#dNo��I\E����h�$�"����5����s���I����$?I�F�4pp@g�	gmŨA��������f��жm)Q���YHp_�K{m��tc7�y�ZCÛ�fW-�.	:��=2�X��o�X㵣��;��'��W�* M�,����6r^֥Rv����ؙI�.t�WQ< ������0P������ �<6�ǂ���	��R��H���Gݜ�?M�5�	j�b�K<9=x�b�H�I[�n�@�;�)�Sg�2$���Q�FH���{��4ɨ
#v�Nɕ ��J�݀��ܓ �OY4��	c��N*=F`�hx�e� �"����%Œl�3�|+؊?��,��ྒ�lk>|��_U,BБ�K۱�D1�E�Eļ�+��./:��^�e�Rّː�B��PQe�'���6i�<��\��(�Z˕�V�֙Y�2��u�j&0(� +5�I��gШ���i^�`�mV�J��X��/���f�!���ə���V�K��δ�{F�=��dR���9��ZVybS1È?��_A����L0GRx)�����i�T�-0�21���K��19U�;b�2��^��綦A<��Ӫ���z�:1a��N���3j�����3����Z\'�N0oG� �\v��-k���e��7��4A�VR�i�rХ}Lk��_��E̻ ��Ts��/f��{���-.�ۋ+��*P�J2Ŵ�o�L
��!����v
��#Y%����ۑ�y��^�I6X1�y��w��K�M�g�Ȥ��!&��]�2"cxS��^)�v��]��:oE5�[1Վ^�h�⣀h/�(�	��N$h����C~.�\�ȟ�5�brj�	P�Xt�!��qZ�ʆ��S�p�{�f�n��r̈ ��p,�*�I���Od��*	����ҪI�J =�M�c�eE�V�=�%�yG����(is~�ʦ���Nџ���4�-��h	+�P���yf�� >OT�Wr
��:ԂB��ɵ,�D'Rl'�&�i�e�@/�FJ���a�H�i:"fW�esQ,���Ɨ��0��W�n���7�鷴R��'g���?3� �m�}�m���GiU`�!�>�,��_Ta�@�Q�9XY��g����?�{�sp��2�a}�w.����/�I%2��b��E�|$���|U���
�Ģ�E��RP�!�s�$�cb��G��\@���g���-Zd�d	��M���@�q��]�V���f�y�0��/|��������T�a�?Qu��l�YI��p;�̨�3�1ӒH���L���a�љa
>QL�s~��S�h�_ͻ���A�j�@��!hw̤L@IH��WbV*)��]��^�Ш#���Dv�3/�ۆ�� j� �}J�2b��f���(a������`��s\vUb4(���:j��P(*��v�$M�x:Ȕ6+�W��#���ZTx�?��s�M[�_���v|v���:~6��8�Q2l��x��M�CL�+O3�ŀr��?(W:?��\�V�)�˻�VBv-�4k�D���!�5�4Hf�+���A�����J�j�sb(b'2O?��n�� UjOu��kJt6bk�|� ��*-jU�`Y�.B��?�HLס; �t6����n��� ��%���.jwV˩�۵&��wmv,���F��u0{(eq��L�F<�"�z%|���4�ᴻ��w�����a���i�}9D�.s�il[NH�v��Jo�������C[]>��8� �� `W)�����U=���+]5�S�H��\M��,�2�/,`���#�>�mS��Rh�n����Y9n+վd[
+i^�g��Um��仺�j4�g���0E�6���P]�è�\��,��y�.�>�s���+���ѝ�ĭ>����Zs�a��UZ7-%y�Lc�86JN�q�G��b���So�g��C<�/@Q�-�X��@��ԦW9�
C[>éى��^H�?�J{E�$�/jy�g"bCٔ�ip,��+wZA�����%{g��kQ�;XMo�1�`�]��X��`,��MR<�o�o�S~�R�y^b�1j3Tgsx��3�qV�a��cc#�[>�d��0������3����u[��W�ٶ,���ѽ
�.;���J�:�D�ݵ%΀e���N��ר�WR�3����lKרΈ������%�*+;��DJ����#����[ƪ�n0�=,r�l�Bv$d-��5���u~��\����u�L��������R��ѥG��ov`�K��$\�j��	��ޛ�� ���D��0�{,`;�&��
��W6U�<9�f�1��Tn���Z�z.�:5���U�*\��[>��i Z��� ��Ƕ�����0ط�?l�Գ�,[�T��aG��s���gx��^�&�����G�Ћ�����J	�sO	���;�y�м�;���'�;�������o�J�%���I����s9�D���h���Q�C���n/|��bC ����AC��_��3u�?�_,�Q�se�,�z�$��ľ����9z1:�cj�?[�b��ܴi�E�6�L����)�Z�?eB�1-��G1�f���=�-���� �6M[,;�ڣk�c�	�� qG0 s-E&�;�2{�� *,��R�pV���ga? ʰ[r~�/��(�6⥏v�V�H��6���;��K�;���{�E�r�
h~%�+���4"��򏘄�����6� /)�X���c�=�v�5�� ���]c��̼`�t%��+��ÌF%�AjV�ꄄ�����gI�8׉�[ı�O��6��\�� g#��8V�T���Z=
�gQ�j�x����!Z���φ��%n�!�����P��iPJ0چ���|�T퉕�GB~æ1�d�)�8K�{�������HU��1+s�e��݉2BI�� �H �|�R�6� �"]O�Æ���Ѽ��X�jP�a=��t �v�M�S��L����prT,֩����᳌�{i|�)ǯṁ_��T8g!�ɭ�?`���3��"�K.����m2!;D�3]���+W�x�#�#f�>r�4��Қ0���~*j>���CVfD��4�L�fG"�a�7���Z���ʔOs��B&p��X	\ @  =G5�r�t3ȁ�{Q�-�_"��!��@U��^��.D;�/�v�M�4���=�zFlh5�p���99�3ċ\1�c�b�M�X>��u�V�(ui�C��� �ٜN;�2����t�̳|�9�X�ك���X	�$["[�����	�`Aᅨq��v]b��-C���c6����6K�ewy[�!�^�I�-��+_L��-��jٶt���	�6¯]�MQ�q�+|��eOhvG���絎K�
�T�]��`6C��49EB��e�dy=!�c�j9)s�XLw�.֒�{�	�>�6���<s�Sk�1��	�!���_В�����J���a������_DC��m�A���v�'!��}ru�^U�K1�*�l�*A��$r,���4�jd}�t�}3�IǢY�-�<���@�BOqw��~�G��+���t�n���B����������zQ_��ǲq�,[�]G!b������ky�^�����*��]D7@@Jg�`c�^K�O���c[܂��R���_ө�Sp���H=|I��^�l O��:E幩!s�fx+��r��X
��[�@�qB����n�̄�@P�;]� �DE��V+L��S���h���8A�{���XB7�a�!���(�H��6�r-��yYɹb(�pt��7�y�^�Os�� �]@���/�7�u�1F?T��(�9L�f��o�!��Q�o��(��t0��]�:��7h1鴯�3���1�4L��٢�?�U�ڳ�<c��9c_�E��u	_�ނc��a��7�6�iw��j�4G��h⬏�0���]�E��I�>�����a�\dpɻYn8�u	P��7�~�g������]L<Aث%��<7�#��A���񺣲� F8�m<��rً)��&/��U��*,Sw��{%0�#[��ںE��EY#��ь��
�)���)o��arQ��C��#=���q_�{S�X�Z�=
Cˡ0�:�cЛ<*� ���O��Ԧދu��x�4��N��^���
o��"��Po�^�z����L-�T%�u��Ҋ}��o�aG���L �"-����e#��kg{�`+x��M�Su��z����a�UN/���Jk�ФzM��nח	����#�d���Vr�_ �#f�҈�9)�E��i�R�3|�M�+�HuU���loG���p!"��8i���%ф�����EF��ه���_�#򅵫��^�G����T@�Q15�A	]/�����[��D7� xUY۾�r'P���:-p������}�b{W��=�j��y[��x,�J��g�u�v{���f�p2�T�x������w/\����������^ϗ�ڙ2HU��.��z��+9A?NRS��2�唟�*��F%�3�AY/V|`Q���J��\���+u��O���Ε�v�Q	���(d���M�s�[~���]�!��>b]�.�����
��sa�K��6T��rD�9��*E0ǺM��g�r6�����6�wq��B�`��լ;�vԩ�)����&��m#��[;荒wUO�)�z�e;�'2�����M���z��ƨ�t��ڬm��Lܗ�0Q��*}�B�@D֝˞��x�Q����-13�pհ�-#��u$����¸`#;���_S�s5O��+u;&.��ᷖ:�0$5�B�1zS"N׼M��S�ө���ok�t����_ֳ3pU@�`�� K�� ���r-푥!�UW��K`q�^�2�<=�ٲ8�S���ʚI3��a��,����L�A3�PRާ.��`\�UdsLVt�5��g}Q���	�e`��L<��J88�^���V��cؘ���"o�\1��-:*w)���/22�\��2U�?�����<�O��=|^N���c��R�/�?u?���8��9�y���F�tۊw�R����S�m6���vc�Y�{�Q��6;XoH�8�);���'�u\��u]V�� �[���̄��ޖ3fkN�/,�,�)�LǠ�E7���
\ȯ�H��*&?�G,���pʽ�e��
D��|�~������j�jh߲���"䞗j��t�?Z� O�u��JF�����y��X�����Ձ*��W�B�$��@ў'���D��/�IA��nǘ�[�0����~8����H�����M-�� �QR�Qz��V3G��?��BT�]�U����Z"9�FVe���O`����nH�.豩�Ve~�
VXQ��Ϗ܂$��R�¥sП~���$a��o�%�^z���LЅ[�!.]��wT��8M��ïʷ �g�>��k9�1�:�c��8�,��e�P֭�8���-��#�@���X%-d��A����)�,���u��~��툋Ԝ�#ѴU9�Ó	�m	���T��J� Ɖ.ǖ�pw��;-��a]���ZI���V�i@-�B�@�c�]���`��.O��HR���yJ�Ch��tQ�+��S�[�����-	��qY&x/��e����@PC��ẆGc���2�����0��x�0С�'D�t�g��
�������m����<hG(شU��7$�#ނ�$�jb�Ɛ h��q�&�F���]���?Y�/�S]g`]����9��Nv�,�ߴ�g3�~�, �����"��>?��QI�D,�w��?`{֬��, ����p�C�(p#Uk���2�H<��(p��r��҂íz�����OV�X,���h�ǄOţ8��nn.+9����w�mss�$
 �܀Qۤ���(����*&i�ݼ}����k�=�      "     x���AO�V���^��h�8v�t�F�(�	���2�I���tD}��'�g־�����C�znQ��/���Z��]ݿv�]��m�m�/�o��oݮ�yؽ���7���=�w�ǫ;u�����7��u�};n�y�g�&+�hY�z�]|~�}O��^$EqU�U�{����ݝ��uݟ��٥�|���u��|��/:���?M��5N�ӱsONN�o)}�}����v�=}����ӻk�R�ػf��}9�//�7�m�~oz�IMz?��tL���1}s/n����n��b*�Ze��i?4�m�V�6�f/'���pG�~J��77|J��N鵜������ʱ���[$�����<�O�ww{������!}p�(J��r��s���W�yrW.=t{���������e�nݳ�ҸD��S�p�v͋�/��|9�1g}�S$tC����Nr�pJovu;4�;��ɝ#��S���X��emƬ�EV)��o����3������@���o�G|q�+��~:�]T�üXV�z9ż����kc���1�v��F�kc.AU�kc��H0�@��3c��s6�\ss�b�Y�9��0?3:�U�0�T����J�b��9:��\�s�a�A���c�\�s�E��2��s̘c�	�Ø#�s�b̑e����	�
�̲��*�b^IC�e����#~̵�1G��2�b�%h�Zǘ�.�5�1G���,~0c��6�,>�1G��2��b̑e�̢�N0GU8̫|����4��\;stď��3�h7�\���U�ŀ��1樋sd�83�:�1�`�5�1G�)�Ř#��3��Q��rYU�n�!,�����#~̵�1G��ĘK�"̵�1G]$�k c���1���9�`�9�9rL1�,�Yv���`��p�g�j���3/3i��v�cG��k;a>�a�A�9��0�:�|��s$����1����8�s�!��S�5�0��0?3ʘ�U���b]M1_HC����1GG��k;c�v��>�1��e�kc��H0�@��s? ��s�y �ss��> �Y�9��*��Q���S�si��v0��smg��n��1�TĀ��1樋sd�83�:�1�`�5�1G�)�Ř#��3��Qs�Ñ���4��\;stď��3�h7�\�s	*c�\�s�E��2��s̘c�	�Ø#�s�b̑e����	�
�ihUd��в�����|c���1�v��V��|c.AQ� �:�u�`���9��4�3�l�i��0�ȱ�4�sdnRF'��* �բ�?�3/�!0澃1G�� s�Θ��
sĘKP;@}c��X0���9���f�1�s�Ø#�s�Ř#�set�9��a�̪���YV�s�`��?��Θ��sb�%(��Zǘ�.�5�1G�̘�`��M0��9��kc�,;�όN0GU�5�\����h%���}c���1�v��Vk�>�1��(v�jc��H0�@��s�����9۬���9�k�>�1G�ᚹ2:����~����-�«      #   R  x��\�r�8]3_��T\�n _�YY�n�����l��#F�)Q*>:�Y�~~b�e>e�d. R��C=l��]���p�^����2)Q��Q�XΖ�J?e�R�;����y'���b���tR&lee�f����������T�� ���)�h���5UD�m<N��|9W*5��"��sE�<�tʊ(KT\@&�s�L���B�1�/TQ��z��J=���������Q�1��V�"��	�p���\���!Z�Tq�h|�F$D������o4)�rFT�7c6������fz*+�O��Jfq)��Pl�LH8"t��T͈���=O��RO�'5��༡��e�L�+�VeEɮ'QZąʵؤ�7e?��p>��3="&I��jE�кEY������V�m�s��V�G�WҬ�Yޕ6m2)�a'w�x���v����֖<���3����ZX���o�6�hKV�$�Z��2�i��M��3"{K�E�HHg	t���m%�y�4��j6�Io�u�/{�0�`c������~��?����E0��AvAp�.->聁a�fkU����;���Պ�?gZv��}$���S
�l�����x��$���L�Z�l�G��A������N����pJj�]"�K�����hK�Q�C�@q�5H�`��!\��fds"L)ZM���t��q��d��/d�xAg��Z�p{�\�øC����k�,��Dg?�#��s4'S����6���JcX�ʼL�&�w�	+������K��d�I���
p�A�Y᰻�0��
�F�>�ǲ0�2�ӂ �8��g�&ѕ{��dL���}4�2�Q�ڔ؃a�~���LC�CD����	b���d�����.�f1� ��CP�~�I���ܗ�7H���� 88����2uP܏���Ãa���a��	 L8蘝!U�0��]���ף:���E�< ��`;� ��p)�Gw��q{ ��SG�uf��,a�����80�eY�ˉV|�m�� �)4.�eD9}8k�g:{����\�s�'��8:��"� [ p�8;]��j: �V/n Q�M��i;�^���g��2�fe(~i	��Z6�Y���4qM��X��滹@!G@��;�q��tK�
�?�G{S��ˣ�����]��5B� �j��oB+L�6�©��]��K�	�p]@)2��8*��`�w+��x!�ۦ��.(&�\����R-��C׹��!4h1�:��R����U��3��1<P���͍;��lj"�;��e�}U�$N�=�	������������l|K�[����btH��U�����j����K6p��{r�ha݅f�cӇ$����
a?r|���gE(/ރ%!������]X�SL�	HƱ��dC��͹��*�bL�f�/Ƭw��ܹ��"�br���~�`���W5�L�L��D���i�=���Iq�*x��)���)�>_Nis�8^}��>/�����>ڰe�AQ�U 4�jO4D!Tᰂ�fE/*(~Q�y+����h\�$L&��L�Gu�o�[���T�� ��4"PU�	$� ���'�c������A�)�nyӺ~�[�#�6'���W�b�P ����_�Dk��rS�:F�ni�q�X�>9�tOLL����X�h�D��7#���pZ�c�j}㶯@�o+��J�b�#:jh��(�ڬE>h��v�3�$A~�=MЉ6Y3�RR����!��n�Z��(������0��F�ǋGJBUo�L�2�'G�N��-%����a[Qq��4���G�70�7P<p9� u�z�&6 ��ʯ"�u�ŏ���Pl����/Ap.�3�.���@ �ͥ�{sT���$�cW?�~�е�Z��#<Uo����kl�iv�E�0�p8w���/.G�U�`��
��j�T`,��*)+����d��T͙����K�l�13Qy�{1*f�|�̖t�j��곮Q��qnR%���jn����-���GfWr��*��䘄�B"@��
	����g�����˫����V�C�H��r�U��*AZ!Q�?���+;i��`�9ݧ�*�|;7�
��nN�s�z����!�@��,!@����HT�.dݙ��������=�!�t�GЌ��|rY���De2j����9�K�FC*���S�EdT�����m���x%]�������'�n�&�b��?��P��m E��4,���F�b�y4�Y��o�W)��j7���F#�[U�P�8��]�����}z��8XX�L/�����	�(�&��SGpZ6��g{�D�K�#�B���Y���Y�p~�.�킬��f�R���\�*��*�\=��^@1��H	�zȲr}�e��UY�u��<�q�N����JͲ�l�	=I�?܎�:��4�u��c�c��e�8�jY��e�Ee�sZڙJ|�t�ޫU}��c��lӤL�f�͙��>��r��B}&����|��âi(w�b��f�ԣ=���ǳ=ԥ�w�pḵ����I�B�_�څ_��{�{�/� P��X���*��@�,�`���6���6��������������iUOm�׍�Dr�9	�2'a���aA� 8�c����1��&��{R���
f���.��F�s���m� ��n���:R�#'N<��$?Y���s�N��2��(�ϲ��ނG}��#�`��WfL�wp,�ᮀ�cW #!���XB�I��� ��i�Ӗ�(`n���?�;����ٿ�������EM��q�W�[~
��-����p�on�=�����|x�E��ᩡ��O�;l_tx���\��?'�lR�i�����r�L�eq��.��xl�wڨ�h���|����&��7� ��Bd�q��E�7_�iG}1����Oj�/���ń5�1}\|�BsW��䪹����%}�>�z��>�a��b6��*s��ݫT�z9Ѷ��F{J�tę�^��~����4AW�~5����T�u�c����nL�Ju�^�bcs����ූ�|^�q�i���ɣ:��{���){'�J��⨄�o�0��Q	S�Jp�>V?iT�\�Q	So�0g�Q	sv��e�g��7&���7�q��224��[�[�:��wn���7�Uu��R��{p��3��.�� ��\��!?A4Ŕŉ�)�.OM1�}G2�����+�\z�v�\:�O
NM1���h�)� �B���DS̙�h�����!��;wd��\�����}���������!���t��\y�Ր�4n�����7�Ϊ.Q���^J.Q��A��^Z�Iy���K�3���1�o��;��j��	3BpC�u��2�����a'o~f߅���'A#�UҞ��	��X6����~������x�f�����^��j�n����:�$<p��{�Gr��Z�����Ww��֒���]�MD�oUT]��A�?=����f��b������	x.��o�xshMօ_�#`Y聲P
	�E�H
�a.8�Ң���W vI@iQ��w����p�\��n��~J	��C#�/��.%�2ض���P'%�2~s;#�;º�Q�)n������w���	v�      $   '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
]      %   4   x�3��	�2����2�H,.�/�2���q�2Ӿ\f�~�\1z\\\ �
v      &   �   x�m���@D��c��.������1F�_�*�:$�ޔig64�i���}��М������2�jl0��08-����z�<��m��=� ��C�WJh�y@�6���h���h��А�y�F(��E�c%���%nΫ���J?D�F<9�ĳ�TW��L�K�n��(^2���EXK܋�@܋0%�y͈{^��uqb�l�,��ew�BY>��FN��FN��FN��F��h'vqډ�V烈�B%8      '   '   x�3�I�KO-\F��@F6�1�wb^yfW� ��	e      (      x�3��pr�2��N�+������� <0      )   m   x�3�tJLI�S-N�H�4�2��I�MJLOTH�M-��+I� 
s:�E��Ss�sBRsK|3�&X��Tl�j�wbyb1�~�Hi^Vb^:P�~�i����� rA�      *   Q   x�3�tJ�K/�K�SHI��O,I,U�I, �%�q�rq� �ٙ
�y��I u@Qc�м��l$A��t�Ң��t� ��      +   �   x�M�=
�0�g�>A�m�B� ��.
���Х�������{:+��6��DA��J.���/O
�A�
Ǌ�$�z���[�s��`�jc/×��oQ��.�5I���8I˲�E���K��ĞC�HpW��B��<N ���9      ,   g   x�3���/ITI�KO-
��9�%�y��\FhR@!cN�Ĥ҂Ē�<q��`߈�I\���93'5=?(`��* 1/%5=��I�'5)1(���� ��5`      -   \  x�M��n�8���S�	��^�P���f6L,��ElA�~��r:��G�E������&�I��>��x2�&S�w�ܼ;����zpa��r�u�|�ǿ7Y�
�-���w�����b�Cc�[�
���.s++!��A�^����ͅ{𺘛g����N�B=w�:Ri^t]<�2�n�U]�͛]\h7��yѠ�ɜa�e�9��ҋ�)��M��* ;�=�/̏� {��y
�2��pT8�t�4k���7Gh̳�&ǟ�1�xrײ�<�+�RH��bW�M�����vn^l7��0�1��4�v��"K V��ζ� `T@��!�FF���Z~�R�Xɉ�Kz�C�)��&[�.{�.�r��<w9��@�hEW!�0HϖWJ�U��6g;��K�ؘ��P�a%'�������H�R�Dad��`Vz��s��� �R�߸NO&���Dbš�pѾ�� P��A"@���+���?	i���-S$C�~�W)l�Z�1ذ�H�BTn��V��I4~{	Ѯw�ߩX8(��=��B�ũI��fZT�t�O��d������E��ol̀��2�.q�-6k��2�d�1�es�Tհ���Y��q>~�n�g��O,H����V�̜��y���Փ�6�e���{�Y����_�C]�,�fO`q���Fb��Fj̓]�n�Rs2����I����)x�C H��J�:4��	�u�������\ܶS�ߨH̥�aD����\L��t;A�_��WVaTH��nE���G��'�.LZw��E\4���Jg�����Z^��lN�0i�p_�1l_�⇉
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�      .     x���MN�0F��)�� ��IV��F,f3�?)l�G�T�_��ZQ,j��}�H�>����P��6�4?�p��i����*_�|1��|�����4���u�������_��ɜ~���>^�Q�o{�؈�J�~�Wi��iV��T^�rdv���|&WH�A����E�'�ά��@��4�N���A ��������kc���1B�����lDr������[���t4i���r��J�&"�՛Hn"v	^�ߞ�m��wT#      /   �   x�U��� D��c�����G���3�/��M�:�n�ր�䲓�6�X]�����!�QJuN�}���J�NiGqa�"��L��(���iE	�V�����K]#��x+)�Lƫ�>��,v�h)�G0�k��6��]��V�X���{�
�3������ދ�j ��ĐD      0   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      1   K   x�3�LLNN-(IM�2���SHJ,I�P0T�.(HJ�2F���B&(���3s�LQ�A��8�R�R�A��qqq �	�      2   �  x���MO�0��ɯ�$TH���u��"*�C�^�L��'�ȉU�_��݆LA���`�̼����7KJ��O�����dI���1�Q�kc�k��Ӿ�^��`���B@��ㅨ�]Ƈw��2ɓ<�K�S�T#zݙ���[��	�O��X�f�m�A���;���=������ c8{�z��8K�y�n45ط�Dpc���^{���t�tU�8��o~{���_P��?��&6_/}�b����7I��|y����)��P�2���Y�Ac&�gͮ�� )���}Ph*c[�ᅈ���jr�CF�E��y�A�yE@��h'�����8��OlO!ZFo���E�r��,ٯ��ۙ��Q{�u�$Y�d~�׈cy�g���⏚GP/�(�B�=J�(H+:�`����8(m���c}p�1w>M���t�=F`�a��o�&�r�-FH�Ta<�3��,]RX�t�T���`S�-�9-��f�L�nY����l��ٛ�ӕ��]�����n���~�{�?|�A�W�~g������7$k�Y���QŒ[N��Yқ,�B�j�T�9�J�Uȼ\1̔��L�9W���5S��6L%~�M�X�����Ul�$��U"�-S!\��%�E�U"u�QE�|�T<cΚ���aT�qϲ����L�,��"�+>SE�P���F-�6t�%�w���S��� ��ч     