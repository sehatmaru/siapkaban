PGDMP                         x         
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
       public          postgres    false            �            1259    21518    account    TABLE        CREATE TABLE public.account (
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
       public          postgres    false            �            1259    21527    data_perusahaan    TABLE     $  CREATE TABLE public.data_perusahaan (
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
       public         heap    postgres    false    204            �            1259    21534    data_pribadi_id_seq    SEQUENCE     |   CREATE SEQUENCE public.data_pribadi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.data_pribadi_id_seq;
       public          postgres    false            �            1259    21536    data_pribadi    TABLE     �  CREATE TABLE public.data_pribadi (
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
       public         heap    postgres    false    206            �            1259    21543    dokumen_proses_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.dokumen_proses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.dokumen_proses_id_seq;
       public          postgres    false            �            1259    21545    dokumen    TABLE       CREATE TABLE public.dokumen (
    id integer DEFAULT nextval('public.dokumen_proses_id_seq'::regclass) NOT NULL,
    nama_dokumen character varying(255),
    path character varying(255),
    jenis_dokumen integer,
    pemohon integer,
    status integer,
    layanan integer
);
    DROP TABLE public.dokumen;
       public         heap    postgres    false    208            �            1259    21552    jenis_dokumen_id_seq    SEQUENCE     }   CREATE SEQUENCE public.jenis_dokumen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_dokumen_id_seq;
       public          postgres    false            �            1259    21554    jenis_dokumen    TABLE     $  CREATE TABLE public.jenis_dokumen (
    id integer DEFAULT nextval('public.jenis_dokumen_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_sub_jenis_layanan integer,
    deskripsi_dokumen character varying(255),
    role integer,
    status character varying(255)
);
 !   DROP TABLE public.jenis_dokumen;
       public         heap    postgres    false    210            �            1259    21561    jenis_pengelola_id_seq    SEQUENCE        CREATE SEQUENCE public.jenis_pengelola_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.jenis_pengelola_id_seq;
       public          postgres    false            �            1259    21563    jenis_fasilitas    TABLE     �   CREATE TABLE public.jenis_fasilitas (
    id integer DEFAULT nextval('public.jenis_pengelola_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 #   DROP TABLE public.jenis_fasilitas;
       public         heap    postgres    false    212            �            1259    21567    m_identitas_id_seq    SEQUENCE     {   CREATE SEQUENCE public.m_identitas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.m_identitas_id_seq;
       public          postgres    false            �            1259    21569    jenis_identitas    TABLE     �   CREATE TABLE public.jenis_identitas (
    id integer DEFAULT nextval('public.m_identitas_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 #   DROP TABLE public.jenis_identitas;
       public         heap    postgres    false    214            �            1259    21573    jenis_layanan_id_seq1    SEQUENCE     ~   CREATE SEQUENCE public.jenis_layanan_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.jenis_layanan_id_seq1;
       public          postgres    false            �            1259    21575    jenis_layanan    TABLE     "  CREATE TABLE public.jenis_layanan (
    id integer DEFAULT nextval('public.jenis_layanan_id_seq1'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer,
    id_jenis_fasilitas integer,
    id_jenis_pengelola integer,
    id_jenis_penimbunan integer
);
 !   DROP TABLE public.jenis_layanan;
       public         heap    postgres    false    216            �            1259    21579    jenis_layanan_id_seq    SEQUENCE     }   CREATE SEQUENCE public.jenis_layanan_id_seq
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
       public          postgres    false            �            1259    21583    jenis_lokasi    TABLE     �   CREATE TABLE public.jenis_lokasi (
    id integer DEFAULT nextval('public.jenis_lokasi_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
     DROP TABLE public.jenis_lokasi;
       public         heap    postgres    false    219            �            1259    21587    jenis_pengawas_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.jenis_pengawas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.jenis_pengawas_id_seq;
       public          postgres    false            �            1259    21589    jenis_pengawas    TABLE     �   CREATE TABLE public.jenis_pengawas (
    id integer DEFAULT nextval('public.jenis_pengawas_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 "   DROP TABLE public.jenis_pengawas;
       public         heap    postgres    false    221            �            1259    21593    jenis_pengelola_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.jenis_pengelola_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_pengelola_id_seq1;
       public          postgres    false            �            1259    21595    jenis_pengelola    TABLE     �   CREATE TABLE public.jenis_pengelola (
    id integer DEFAULT nextval('public.jenis_pengelola_id_seq1'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 #   DROP TABLE public.jenis_pengelola;
       public         heap    postgres    false    223            �            1259    21599    jenis_penimbunan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_penimbunan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_penimbunan_id_seq;
       public          postgres    false            �            1259    21601    jenis_penimbunan    TABLE     �   CREATE TABLE public.jenis_penimbunan (
    id integer DEFAULT nextval('public.jenis_penimbunan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 $   DROP TABLE public.jenis_penimbunan;
       public         heap    postgres    false    225            �            1259    21605    jenis_perusahaan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_perusahaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_perusahaan_id_seq;
       public          postgres    false            �            1259    21607    jenis_perusahaan    TABLE     �   CREATE TABLE public.jenis_perusahaan (
    id integer DEFAULT nextval('public.jenis_perusahaan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 $   DROP TABLE public.jenis_perusahaan;
       public         heap    postgres    false    227            �            1259    21611    kabupaten_id_seq    SEQUENCE     y   CREATE SEQUENCE public.kabupaten_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kabupaten_id_seq;
       public          postgres    false            �            1259    21613 	   kabupaten    TABLE     �   CREATE TABLE public.kabupaten (
    id integer DEFAULT nextval('public.kabupaten_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    j_lokasi integer
);
    DROP TABLE public.kabupaten;
       public         heap    postgres    false    229            �            1259    21617    kecamatan_id_seq    SEQUENCE     y   CREATE SEQUENCE public.kecamatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kecamatan_id_seq;
       public          postgres    false            �            1259    21619 	   kecamatan    TABLE     �   CREATE TABLE public.kecamatan (
    id integer DEFAULT nextval('public.kecamatan_id_seq'::regclass) NOT NULL,
    keterangan character varying(225),
    kabupaten integer
);
    DROP TABLE public.kecamatan;
       public         heap    postgres    false    231            �            1259    21623    layanan    TABLE     �  CREATE TABLE public.layanan (
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
       public         heap    postgres    false    218            �            1259    21630    role_id_seq    SEQUENCE     t   CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false            �            1259    21632    role    TABLE     �   CREATE TABLE public.role (
    id integer DEFAULT nextval('public.role_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.role;
       public         heap    postgres    false    234            �            1259    21636    status_id_seq    SEQUENCE     v   CREATE SEQUENCE public.status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public          postgres    false            �            1259    21638    status    TABLE     �   CREATE TABLE public.status (
    id integer DEFAULT nextval('public.status_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.status;
       public         heap    postgres    false    236            �            1259    21642    status_layanan_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.status_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.status_layanan_id_seq;
       public          postgres    false            �            1259    21644    status_layanan    TABLE     �   CREATE TABLE public.status_layanan (
    id integer DEFAULT nextval('public.status_layanan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 "   DROP TABLE public.status_layanan;
       public         heap    postgres    false    238            �            1259    21648    sub_jenis_layanan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_jenis_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.sub_jenis_layanan_id_seq;
       public          postgres    false            �            1259    21650    sub_jenis_layanan    TABLE     �   CREATE TABLE public.sub_jenis_layanan (
    id integer DEFAULT nextval('public.sub_jenis_layanan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_layanan integer,
    pengawas integer
);
 %   DROP TABLE public.sub_jenis_layanan;
       public         heap    postgres    false    240                      0    21518    account 
   TABLE DATA           j   COPY public.account (id, username, password, role, status, d_perusahaan, d_pribadi, j_lokasi) FROM stdin;
    public          postgres    false    203   _�                 0    21527    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab, kecamatan, kabupaten) FROM stdin;
    public          postgres    false    205   �                 0    21536    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    207   ��                 0    21545    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    209   �                0    21554    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    211   �                0    21563    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    213   �                 0    21569    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    215   6!                0    21575    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    217   z!                0    21583    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    220   �"                0    21589    jenis_pengawas 
   TABLE DATA           8   COPY public.jenis_pengawas (id, keterangan) FROM stdin;
    public          postgres    false    222   �"      !          0    21595    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    224   �"      #          0    21601    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    226   d#      %          0    21607    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    228   �#      '          0    21613 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    230   e$      )          0    21619 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    232   �$      *          0    21623    layanan 
   TABLE DATA           �  COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal, kw_k_kantor, kw_penerima, kw_pemeriksa_p2, kw_k_s_intelijen, kw_k_b_fasilitas, kw_k_b_p2, kw_k_s_pf, kw_pemeriksa_dokumen, kw_k_b_pkc, kw_k_s_pkc, kw_pemeriksa_pkc) FROM stdin;
    public          postgres    false    233   H)      ,          0    21632    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    235   l*      .          0    21638    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    237   0+      0          0    21644    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    239   q+      2          0    21650    sub_jenis_layanan 
   TABLE DATA           W   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan, pengawas) FROM stdin;
    public          postgres    false    241   �+      9           0    0    data_perusahaan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 1, false);
          public          postgres    false    204            :           0    0    data_pribadi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 1, false);
          public          postgres    false    206            ;           0    0    dokumen_proses_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 4, true);
          public          postgres    false    208            <           0    0    jenis_dokumen_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 1, true);
          public          postgres    false    210            =           0    0    jenis_layanan_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 1, true);
          public          postgres    false    218            >           0    0    jenis_layanan_id_seq1    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_layanan_id_seq1', 1, false);
          public          postgres    false    216            ?           0    0    jenis_lokasi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_lokasi_id_seq', 1, false);
          public          postgres    false    219            @           0    0    jenis_pengawas_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_pengawas_id_seq', 1, false);
          public          postgres    false    221            A           0    0    jenis_pengelola_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq', 1, false);
          public          postgres    false    212            B           0    0    jenis_pengelola_id_seq1    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq1', 1, false);
          public          postgres    false    223            C           0    0    jenis_penimbunan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_penimbunan_id_seq', 1, false);
          public          postgres    false    225            D           0    0    jenis_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_perusahaan_id_seq', 1, false);
          public          postgres    false    227            E           0    0    kabupaten_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kabupaten_id_seq', 1, false);
          public          postgres    false    229            F           0    0    kecamatan_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kecamatan_id_seq', 1, false);
          public          postgres    false    231            G           0    0    m_identitas_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.m_identitas_id_seq', 1, false);
          public          postgres    false    214            H           0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    234            I           0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 1, false);
          public          postgres    false    236            J           0    0    status_layanan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.status_layanan_id_seq', 1, false);
          public          postgres    false    238            K           0    0    sub_jenis_layanan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sub_jenis_layanan_id_seq', 1, false);
          public          postgres    false    240            L           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
          public          postgres    false    202            K           2606    21655    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    203            M           2606    21657 $   data_perusahaan data_perusahaan_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_pkey;
       public            postgres    false    205            O           2606    21659    data_pribadi data_pribadi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_pkey;
       public            postgres    false    207            Q           2606    21661     jenis_dokumen jenis_dokumen_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_pkey;
       public            postgres    false    211            S           2606    21663 $   jenis_fasilitas jenis_fasilitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_pkey;
       public            postgres    false    213            U           2606    21665 $   jenis_identitas jenis_identitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_identitas
    ADD CONSTRAINT jenis_identitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_identitas DROP CONSTRAINT jenis_identitas_pkey;
       public            postgres    false    215            W           2606    21667     jenis_layanan jenis_layanan_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_pkey;
       public            postgres    false    217            Y           2606    21669    jenis_lokasi jenis_lokasi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.jenis_lokasi
    ADD CONSTRAINT jenis_lokasi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.jenis_lokasi DROP CONSTRAINT jenis_lokasi_pkey;
       public            postgres    false    220            [           2606    21671 "   jenis_pengawas jenis_pengawas_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.jenis_pengawas
    ADD CONSTRAINT jenis_pengawas_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.jenis_pengawas DROP CONSTRAINT jenis_pengawas_pkey;
       public            postgres    false    222            ]           2606    21673 $   jenis_pengelola jenis_pengelola_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_pkey;
       public            postgres    false    224            _           2606    21675 &   jenis_penimbunan jenis_penimbunan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_pkey;
       public            postgres    false    226            a           2606    21677 &   jenis_perusahaan jenis_perusahaan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_perusahaan
    ADD CONSTRAINT jenis_perusahaan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_perusahaan DROP CONSTRAINT jenis_perusahaan_pkey;
       public            postgres    false    228            c           2606    21679    kabupaten kabupaten_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_pkey;
       public            postgres    false    230            e           2606    21681    kecamatan kecamatan_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_pkey;
       public            postgres    false    232            g           2606    21683    layanan layanan_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pkey;
       public            postgres    false    233            i           2606    21685    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    235            m           2606    21687 "   status_layanan status_layanan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.status_layanan
    ADD CONSTRAINT status_layanan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.status_layanan DROP CONSTRAINT status_layanan_pkey;
       public            postgres    false    239            k           2606    21689    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    237            o           2606    21691 (   sub_jenis_layanan sub_jenis_layanan_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pkey;
       public            postgres    false    241            p           2606    21692 !   account account_d_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_perusahaan_fkey FOREIGN KEY (d_perusahaan) REFERENCES public.data_perusahaan(id);
 K   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_perusahaan_fkey;
       public          postgres    false    203    205    3149            q           2606    21697    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_pribadi_fkey FOREIGN KEY (d_pribadi) REFERENCES public.data_pribadi(id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_pribadi_fkey;
       public          postgres    false    203    207    3151            r           2606    21702    account account_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.account DROP CONSTRAINT account_j_lokasi_fkey;
       public          postgres    false    203    220    3161            s           2606    21707    account account_role_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 C   ALTER TABLE ONLY public.account DROP CONSTRAINT account_role_fkey;
       public          postgres    false    203    235    3177            t           2606    21712    account account_status_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT account_status_fkey;
       public          postgres    false    237    203    3179            u           2606    21717 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    228    205    3169            v           2606    21722 .   data_perusahaan data_perusahaan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kabupaten_fkey;
       public          postgres    false    230    205    3171            w           2606    21727 .   data_perusahaan data_perusahaan_kecamatan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kecamatan_fkey FOREIGN KEY (kecamatan) REFERENCES public.kecamatan(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kecamatan_fkey;
       public          postgres    false    3173    232    205            x           2606    21732 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    237    205    3179            y           2606    21737 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    3157    215    207            z           2606    21742 "   dokumen dokumen_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 L   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_jenis_dokumen_fkey;
       public          postgres    false    3153    211    209            {           2606    21747    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    233    209    3175            |           2606    21752    dokumen dokumen_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_pemohon_fkey;
       public          postgres    false    203    209    3147            }           2606    21757 %   jenis_dokumen jenis_dokumen_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_role_fkey;
       public          postgres    false    235    211    3177            ~           2606    21762 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    228    213    3169                       2606    21767 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    213    217    3155            �           2606    21772 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    224    217    3165            �           2606    21777 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    226    217    3167            �           2606    21782 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    3169    217    228            �           2606    21787 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    228    224    3169            �           2606    21792 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    228    3169    226            �           2606    21797 !   kabupaten kabupaten_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 K   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_j_lokasi_fkey;
       public          postgres    false    220    3161    230            �           2606    21802 "   kecamatan kecamatan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 L   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_kabupaten_fkey;
       public          postgres    false    3171    230    232            �           2606    21807    layanan layanan_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_lokasi_fkey;
       public          postgres    false    233    220    3161            �           2606    21812    layanan layanan_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemohon_fkey;
       public          postgres    false    233    203    3147            �           2606    21817     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    233    241    3183            �           2606    21822    layanan layanan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_status_fkey FOREIGN KEY (status) REFERENCES public.status_layanan(id);
 E   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_status_fkey;
       public          postgres    false    233    3181    239            �           2606    21827 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    3159    241    217            �           2606    21832 1   sub_jenis_layanan sub_jenis_layanan_pengawas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pengawas_fkey FOREIGN KEY (pengawas) REFERENCES public.jenis_pengawas(id);
 [   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pengawas_fkey;
       public          postgres    false    3163    241    222               �  x���ͮe7���
����L�$)�	R&-�"�tI��Sk��}�l�F���k۟�U�>�G�!J�c��b����?�%�y|�������w)���_��/?��%򊯯���Jo���Z(1�j�B�Q&S�*�Y�j:�8�9�I��b,���k̬�eYdG����B�
�:fg�wcfSVU6̭~��7z��ʦʮ�QC	�H��K�U9�]�ͭO9Tm�a8��*Sm�����f�E���7�s\�����F]�8�`)&�ߤ�CbiAS���}��_�7?}�X�o>������u����W�}+�%:@w�ӧ{��*��dv妞(������CtgyvȘR����n��
R�a��yL\��hɠl/�$7���Ra��h�����d��E����A����[�3�!�IH�G�^�Y���NS燎�L%��'	5T��úƙ�p��v�[�<U��j�4��(���L��4�� 
�C;"�7Q{C���F��,��t4m-�jd��\5�q�c[���-8��:O[��Q�۠�*�X�jD�P�h;�B�<R�E�G�Z7�W	����#N3Ǝ�1�\�`E������:3�*D�ŭW]&�al�nΩ�W�\%-�gϸ�
����,^�8�\ur�j��.�~/�B�C�,�Un-� W�F��w}�ꓫ$Óa�\�aڈ5���'fp5��GѱH�Zp5�7��M-�,��d����ш]p�y�\�+p�yΌ���YZp��G'W����3.��*�L�:��ٱ��oAL�� ��zI�1��� �6[���.1��(�D�d�b [�C�	��@S���6��G��ޥzvy���*��"�R��j��Tg;sl�!C����ӓT����j�&��M������鿱bͣ�TwF��	N=��o�[3�/�M�GM��v��(m3��Ǝ����Z}������u$²7�KM��
��i�H�d�͠�Zvp4�A#Y�e���M��Lj66
f�zY��fM�l�#����h|�Ǆ�E������dM�٣o��R�5���p�[M�Dl�{�.ֶ��I�-;�t;.5Y�l��9J�X�m5Y���Rh;3�D[M֤�G\�d]~	Q��Iv�����b���-+ȍ�t�	�;� }69Ka���VX=7�o11K�M��o�`�bR��J�$��Nn1!K����Xb�_5�'�9ùTD�����lV��$,�S>��1r&a�Y�b[C��d�,�iFȏF&a������p�IX�T�cd��"������[L²��U�o�IXfy�����#&ay��������-&a��:�c��:�$,W��xr�Ӎe�H?���	��峞Wu/��I��$�c+R�~���Bs^�;T�1��-&a��i�$L��V�l��c�=a���LL�恘����u�ɠ�0��YȚ�3a$��A��Ʉѽg�(Ȍ�cQ��$���@�3/C�bF_?����71	���wN~1	��o��;f�6>���rW%�:��g��*�[�-&a��5��w#{����͇%d,�LB;��Cl�lb�7��g�w$@��t�<������$����s��ّ ��3x��I�#�0��*���7�0�������0����&�b$�����T�HL���k�E���7��g���S�ؒ����!T��>�1a��<:2�c��Ls��C����#�32	���g,��u������k��)���>�Pg군o�y�		]z��I�f��>!���f����ЧW<�
�~���>=�GAaԟ�-&$t굠���d�		�z<U���	�U��m�����bB2�X���'�l1���s�ڒ1	3���0��4�.<=F�h�떴4�ON��0:�*n�^����b[*/�BÞ�ko�L�!��M�G��`7�O�_��!���?r��9��F��h-�%�'�"ev�ss�oq�8[201��n��N�뺛��|��Aq�MY�����3xt��qclq��Oq�Gb�xt��<��$,N�l��[r�IX���>��$,N�4��a������7Foo�ڃ';��M�|�w����S<m�\:[<(���6z�G�a���٥��$d�R���G�y���z����ߦz����,g�R'���s�.����TGŞ<4�͂H����y�Po蠶�m��G� Dș����O�w4���}v�*B�̟�x�䱖$�F�^#�t��ߝ��.��>D��j�1>��D�̣��#���Ѥ�]bgf>u����ѥo��D��w��ڲ�ӻ� 牬ѧ�̒�ݘJ"k4��T�r�M�R��ԙ��U��Q+�V,�5z����̔��z�������&kt�;��=�V��<�� �x��l5Y��=�0���{���4�C�S!{p��q��{�\-�9�j���j��K@2Q�e��;m�'C
I�e_Q����b�f��L��?29˳����,�7bF˞O
�D�ƻG [L�̲��Ȟo�	-�������B�̲�<��^�"F˾�y�4N-��0Z�����mV��:��N*	�e?p���g�J*	+}մ�S�l1	+�����Bl1	��R��h����0�샽pr_GI%af���i�<a��:�����RI-���</ W{\IX��Bї����eO��c%����gFW���$�η���Kq0:A�7:�ϴ��i$����ﶤIg1	3˾OH��L��~:<����e����I#afً���I[L�̲�eA���-&am&��t��IXk�s�=a1	����1����#&af�c���7wf�=�$O&YfD'a|�߇������Rm1	�߯x�p�7��0��������7�.�&?"6��[A�����t�Z�
�!�,�;z���P�IH����C��V}8�K<1O��3���o��ЏY�S\\�12ղn"\uڥ�Tϻ�&�ͷKݨΆQ����S]�`���9�ԃj�R�E����Lu
���C�������R�׿c��:/5i1����R��d;~�v����[�������\�B��>�u�p�+�i�{�e�^�Fu^�)�݀Kݩ.�N�nS��A�dm��r����'��pP��U7���p
V ͗��Z�R����"����R�5Z�=sq����dm������nKM��l��`�_��&kf�+c��>��Xj���v�/?$,5Y���.�6��~\��d�~{��s*��α��i�v�~���/����ҁ��~����_��P|            x��}�v�H��3�+�m�EQ��}���ؖ%�jQiW֪��)�p@�N������|ɜK���^S]��%�R����s��'���,-�]�\�g�:��������h��HD�(8��h���:��n�5~]�ݕ�s]���U��t�\nw�.s��e6/�C��r�\����s��p��й���_�r߮������.]��r�Y��`��O�;�59���ԩֻj�,�5��j��׷'N������T�"�/'nr"#����<?˶λ������<<1�pɐ�$���z�ܧϩ3�JX��G����9�;t.�-|�n�oS�</�t;�>���#�$ۤ����L��t��ħ��}\}��N���جާ���GQ���9\9ra�a G����b���Q�8W_�O��	ǿ�g���q�s�/��,CݨW=^l�mQ�[��"���DQ-�@m�k� �*��>9��c�H1�[B#�^�Z��=�D�u��J���A�i�J{>�?�%n�u�8j�=/布��E�6[;3���I�ժZ����vu |���i�@���ڶ�l�75+��(q�Qx�>�&�7��r���������9[g|�J?�����}�/�+Dߦ�|��ҹ�A��b�7H���A	J������$�VY	�<wn�u�-���4��	\)��:��n�!��h���(R���G�)������Y�Gx"�I�b�'RB�$�*�]�X��tW��.=tG"HFI-�>���$Cd��i����pSf�:�q9��N���a�@ӎh���x�����E�\TO��?qM�$kQ����i.P�d$D8r����z�Y����YI7SHO���Z�u�T����M؄K�=�Yh�Nkg��@��38��X��n�l�KcH���	/K�$�3��t΋eQ�����(	��(���D�Ή�cw�a��K����؀����=6o�y-�S��]�����]�$��Z�3�w����e�L�����O3C>0:"�G��G�^wF�D��[�Ҩ?w���K��!e7�=��`�=Ѷ�5�X��E� UyȦO��2q�ڃa0����aK��ʹ�>s����*Vp����~�L�QB=�eL/Je�3��8�t�&'A蝞���x >�� M�/�3ؘi�#��@٦����z#	R�$���޳c��g�r��]Q=V �2[���Δ�"�L���nM�w� �g�� \Z0갎�w�*�C8�ċA�܈e�5�f`�����6��y+�����;���)��yV�J�z�.�!Xf{�	I| �8}����w.�cҦ��sA��~�]��2��
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
Qd�A$d�#i[�����5K��W����T-���/"Ʊwln�I��������j#yy���>��U�X��3�s�!�����z(��˖��o����Me�2��������.�����@2�}��Ҥ��D���+������{���{�1��>�Ѫ�0u������U"aM�|�o|ܘ2�A :������p1���x쇒=���뇚0�hՄ��z�;�Jb��D����RQ%��A�?�^�:[!�^�O��ߎ�����F���	����_8h�|����V��	����,F�Bt�>�V�,�}Z�\pp�5��6{Jw�������r4-VįV���bQ����o���o��͹�            x��]�r�8ҾF�ws�	χ��#��q���dj�� �aQ���q)O������� %�%�bKPMj� v@��k�*9fvD���v[�k[��>�"�H&��p�4JE!
���v*$���	�Eє�]�b.2>�p����҂��S�.�ݵ�8l0i��ERI\�
C˷]��,�M���uFi%�<-���E���s޸�ϴ�_ɑN^Z//~����_�����Z���[Y���nD��h3~]��UMK~&f�2��j[�������z���L�'��I��9~�;x~��7>�D6������2�D� +��9��|<{�HK����v�
�?Y�M�nd�H���E�/9�a3\6����Q�m{/�G}�8����ȳ������js>��\�Ɓ�[x6Q 훺�]V����m!��J�K��b��=���qխ�!��޶�m&F��g�f���#eqh���v��Pf���.3�pP1�r1�ay�Ǟ�+��z;��ǒ�v�q.k��&�)�G �RT��4l��^�������h������c�6s��1�o8�6�x���H}*m��G�S	~^�X�0�4;\p��(t�B�o1���������������ۻr�l��_uZ���4}W��h�=�մ~w�Y������(}7�y�6i�����rR�}X�"��zX,���:��_R�'���*��Uɯ۪(g$�}�l��੾W�t×������^���b�����k>��a[@��{x8��(hf8�E	�H��*m����"�����?v��&��	\6E1Ǔ^5Z]u��t�19��#���������r~~nǞ6�Q�4s2��^�$����/��m>���� � ��-2� *e���zʜ����C~M:�hl��o�1��tXmTypX������_��\�em��`�̉�-�2���ݔ�}�DP�t󶒣&1�c�Y��9��-2��ҪQ*�>�`�Y[1j��ŀ�)|���Ѭ����ڶ"%��8	^�ti��A�n]x����&��M&K��R5e�9V`�r>�x�����`� ���
H�6�aG�h9/�R)�xE��a��$]��(�Pp��Na(�QG���fc�c�JA�<e��c�C �uߜ�?L�5����j�b�K<9=x�b�H�Y[�n�@�;�)�S�2;���Q�FH���{��0ɨ
#v�Nɕ ��J�݀����ܳ��OY4��	c��^*=F`�hx�e� �"�>���%Œl�3�|+؊?��,��ࡒ�lk>|��_U,"��K۱�D1�E�Eļ�+��.]:��^j�Rّː�B��P�v�'���6i�<��\��(�Z˕�V�օY�2��u�j&0(�(+5�I��gШ���i^�`�mV�F��X��/���f�!���ə���V�K�δ�{F�=��dR���9��ZVybS1È?��_A����L0CIRx)����a�T�-0�21���K��1�U�{b�2��^��mM�x��y5�U�����u�4�	��n_�g�&:X"1r�?gp+e��N��`���A̹�8�K�@e��"o��i����b�F�+B����؃��w"d%Z)r�!_�/>�:6�[\6�W&mU���d�i#�#:�N!���CLU���X�'�JD[+/!�#� ���l�8b��(��j]�(*=:�^ϰ�I;�cL����eD�
�2;�R�l�m�tފj~�wb���т5Y�^.�Q"6��I��3~���R��P�?Lk"�����F��c��㴀�("O��Q�śA���1#t?�l��,&e��>��o�$���;J�B$i#(�G4d�E�9Z��L����������e[(�:�bg;Ea�����J��m$T�,����V�I�tp<Q	��)0X��P
y[Y��N��N�M�Ӭ��^č�j=����j�tD�n`��X앻�/��a.���'ܼ��_.�oi�t�Oκ�;a�j�6�tא��OҪ,�JC}0Y@-��Q-���F��`eZ�	�N��� ���r�&��[X�����T"�=,&�\��G�gL����&��AQ���hH�\*	��X��Q�@/Ш-��0��C��2Y�mcF):;�q�q_��)�e�#,�߯�r0�p��2�`��OT�~+�vV��� ��>3�F�e̴�G#h*�hu�;ota���AA��[������w;ho���\��gC�� �֓�1+���.b�c/Eh�ulv"��șmC�v55��>�f1����~_U�0D����q0��9.�)1��O��h�R(�v�g�&t<dJ������hyVX~+*������[�n;>�I�r?�t�K��(�\�V<B�&�!&��b�9����+��ZtF��+���}j
+!�y��I"݊@��}$3�u��?�� �{��n%I5J��1�3�'�OA��O�*�� �5%:��W�b��s~��*z�,�
����ڟs$&w��I:!��~7��lUْ�Z�L�;��T��횟w!�]����l��,DL�
D�Y\$ù S���Ⱥ^	�=:�c8�.�y���"�<}��Cda��P��n�\fZۖ����������}v�V՜h�����D���&UQ�ӹ��t�x���p��������� �W�,=�}D�'�m�ӵ@
�Սuv�4+�m�ڗlKAH���,v$����g�|Ww_���l6��)҆�s��sU����>�w8/��'r�@�� ~�C�p�=������� �"֡Xk�0lܺI릥$O�i,�F�i?�(�^��K }����{�ǰ�h"���Kt`[�f��� 0�p0�%��0����	x����4�Y�M�����x&"6�Mɟ�"��r�T���g�]�w!���ŻK�����a
&�-8����H�$�c`�V�;�-���%�6Cu6�'�=�g%f8?66Ҽ��Q�	��=��pH=ܶ�Şm��B�
��N�w��L�V*�� ���-�p<p(��w� �Fտ�*�A5�X�f[�F�pF|^�L4|(	VVY�1'R��A�E�g�M��2Ve�dp���a��f��S�!k�����(���Px���r,�x�u�[�D�`�t���X���$��ZGĎ.=R<�~��]�u$�bWx�PLPg��\���TL&�0�I�S�6	}*t�_�T�a��,�y��X~S�9Nk%�L�1�t�{L�l@�
7�<�䖏�h��x<6�Ǡo��m� a�.��>��(�Vc!�w����ܩz�8{��Ilh0���,��kd��R��S���b��s�`@��D��Q�	�����2�j�۠R~�e�l�}�<��RN3����(Z�<*�l�A��=,�;�1����h0w�P`��Wy��L],ŏ�7AT�\�;K�8�08q(;�0xt�^����X��V���)7m�zѸ�+�+!0`ʳ���?L�zL�r�Q�D�#o�@v�g�4� �M�ˎ;�#����w@�x>B���J�����́p�1�
��T�B��Ce��F��2�܁=�j$��G�j+~"jy�Q��H�%�to����"k9�4��W�E�\4�4"��󏘄�����6� /)�X���c�=�v�5�� �����v�	�y���J$r�W����J�*6<�^�		�w�cW2o3pϒ�p���c���GƳ`ϖ��r�G9	5pű"פ⇵��Q�>��|T��C�(����]X-~6�t,q+��_�>茺�M��P��6D]��#�jO�?�6��$�L)�Y���+��LĖG�ʽ�Y���*3��N�Jb=8Gaw�<P�"�ј�z�6��'����ƪU���Yp�`�#Q��n���g��=6���p`�NEU��8_d��ks�O9~���l��98� On=������H��]r1��/Mn�Y�1����(=�^���S�1px��W!�L#+,�	�/p�P짢�{�;dua .  F���H#���av"��~���5j*p�?5�9�'d����5��e#-GM7�x�W�_��)R�L���	TU����J�c ��lg��H���(=�lĆV�I���<C���:V�(���僟_i�O�Qg��:4i��@�����,�
���[���<�'����q�{�=X�yՊ�N�%����=�Q�^���i�%F��2Dk=�8fCY���m�tYv琷�R���dۢ�M���4��N�6�mK'��q�Qm�!��M�%�ʱ��k�]��f�pt�|�u\*T�x�R���:���)�-/�$����T�Y�K�b�Wep���ػ�h�	��-����k �Z#�Q��Hٰ,$���,�od�XR��{�<.��� �m���wX��=	��{�����z�B�X��WQ�d�U	"��$�S�n��W#�{��L:͊<ji�X�m���z�����>��v��Z�ӱ�an��
�~�Jr�>�����E�Oe�%X�h��B�lYik�	&��\�&:e���U(��n����
��<�&�Z/�<��Ƕ�ٍ�<I˿�Se��f-{�z0�� ӽ�� �2�u��sSC����V6�� D{����L���2:��=\� 3�	ّ�43v��B1���V�2������7��Qq�����{��n"	�*Cx}�Q���9l�=�Z4k�s�P���*o���&�w/�(�\6��z��_$3n��b�~�,��P�?r:����=�$Cv	����G6Q0`�`3�ut�o�b�i_Ig7��c�i��w.�E�h�p�g�=xƜ;�sƾԫ4������:E��H+n
\m���"Xi�hi�(m�
�YAa;�-�B㓺}��W�!�<�����w��p*����%n���Y/Ƒ1�ɳP��x��WJfoynG���O1�uOe�A�p�x�8�S.SM^�N�F�TX��ӷ#0�#[�ǎںE��EY#��ь��
�)�Fߔ7_�0�*��1�瑅���������)��]-����P�a��1�͇
�N WR٧��jj����:ho<`�{/QT/b
I�7�����k��j/@���O��gb��h��ӺVwOi�>B׷�0��QSA&P��PpGͲFk�Y�^,�
ޡ�DS�T��(c)w�q���x��Z#4�^S�߼��e��(���D$Y�+ã����c�����4�iN
qѳqڟ���_{S��
'Rݔc����Su@/��F��9N���:v�E4�aa.��Ȩ�!�Pb�Bw�+P`D���U�ߋ�0�J2J#��{(��Ey���|˿���J#+c�7\����ߦ����2�Q��Ql�����'\�l���T)��Y�,��o��¯a�'�HU����	���|���EX8��K��M�|���)�T���<����3�$5�-�\N���`�j4Q�9�=Ԑ�b�V5�}����Uݯ�R�k0��
>���\�o��� |�B����4<G�����B/�#�u����/���='\F���kCA��-GԙӼ�Rs��h~&+g#��@�l�g-/
�W�[�:�SkO����p��l2�?�5�/���:{_�䛒�7Y�S~&X���~�����̬��`��L����چ
��C٠E[���(D�	Ddݻ�Yϊ�.���a	��33Wk�2�|�QG���?J+�6����� �5E=W�(�R�c"����~k��#@R#)!��~�7e b�t��D�!85<�j����J'���e=1W�������H��p!��Y�^u���w��+���!I�-�3<U;����4���l?�RX���43�%�}�r	f�e_E6�dE.AQ�~�e�Y��]����ģn�����U=MoEX9����q{-����c�ޢ�r�r���"S ȅk)S��k٘��#��ؐ=��r�m���c����sQ�s������M�7�P>m�aM��x/-5?o�����f��n7Ɵ�x��o����T�a����bpa\�E(\�eu�	��U���L���]9c�������rP�t�]t�*Qޭ���J��\�b�x�R��N��{^檬�@�Χ�����>���F��F�-{��+B�e��M�!�㨥I��Zw9�dԯ���ר�%�]1~M1P�B8�p5�NA���er�/Mt����tj�v����0	������!��c��ڏt_(����" ��d 5n�G)k5s�z9a�c��D5-хZ%���B]�B$'�Ȫ쟐��	L�W��i\ԥ=6uת�ϼCC�
+�{����[���pB�_�t��/܂$����D؋B�u�_�p�<6�¥+���N�j4�P �iy��@�d��~�-'�:�T'z�gǂ���9P�e�
��!hN�>��.5�*i!������4Lid��įS����]lG\��윈��ʩ�L�mK���S���x'
�[����c[�|T����u�v$k%�cJZ�ҀZ��t�t�
�6�����]�>�푤ؑ�yN�Ch��tQ�+��S�[�����-	��iY&x���e����@PC��Ẇ'c���2�����0��x�0С�gD�t���
�������m����<hG(شU��7$�#ނ�$�jb�Ɛ h��i�&�F���]���?Y�/�S]g`]����9��^v�,�ߴ�g3�~�, �����"��>���QI�D,�w���`{֬�S��Z�Ax�!r���5���wL;O19
𤜶���p�e�cp��*]p!���͛7��uu�         �  x���ώ�0���S��H��q�8>R-�U����i�mMR;�-p��[�$L��\PJN����2��E)r�tҖn�?���`	{
��rԚ}��^��B{�h*؁e;͞M�Y���e""�y�T�����K���M�L���B��d�,�|ԕCj	��F�=�RKK��n�F�Q���0�O��c���C��'�M Ut����CJ�Rj,%~�&�i�Bo������휮SM�,��|u�jR���V|,� �ƨ�?����{l��.an��/D�����.�3Xz�����@|�Z'�|�v][h��F��#�bdtU���������p�w��n��P��jd6Q�	.8W9[�L1�wc#s��[�L��o�ҧ�cܲJ8�=L�V����m�B�fN!B��=I�I��,;��4('�&2�3V���R�m�l�VGh����9�8=T�횖���%|�˘>���~�.�O���u�R֟ng��/��<:           x��\�r�F]�_ѫ)�J�� �5+1�I�
+�k6޴L�� �,<�Ҭf??1�2�2_2� @��$$ZI�l��>��}���0���q�
S6��z�NE�)��ZܪX����;ۺ[���N�e̦aV�b)������?�L[Ǻ�g���j���� vl�q��u"D��E���?�E�`E��"*�׺Y�_�l%���(s�U<E�l#�D�~I4��ckZ�E�n�M���(&n�W����=���(��/ٔ�(�!Ϻ/��j&e\.���f����~���R��B��3�2� '���%��G�U��%��ڱ�R�y�$�Z�)��X_�x��ي�(��<L���T�fG�[��i򏐞�������8�#������,�s�p���^f�]�u�W�G!-���̻��"]&%54q[�غ��C[>��4��Qd%���
b�%�����Lr�%�M6�^eJR"V�͓��ޒ�J�K��sМg;�u���^�M��Oru�����7�6�f�]�����3��6�R�a�e�##� �8&U	�P�ڡ\��k�@Eg"��eQ��LL
���0)W�¼�����,!)��x�h��L��[�Y���)<d�10�o��a/?�b4����ü6�M!0���������`���a����e.�����l6�Aɣe�DY�s;��e4c*�e*z��5�c���Pd�G�c=��c}�D$u�����3�/E�9�HI�+�m&�I|�3�1��&��>��?�!�2CB� ��N3Kr�D���"�tl����H9d;nHc<�e<w��t���=� �a[�� [?�	1X���	��fW7�crd�֪�Ӗ�S�.)cm�w����4̊���Nr�7��)�ph���,h/���d��
����,�$��DZ.��db�e��{b��|�9��pf���e����9I�XDK��B��+�*c��qf��}�vk�>B���}pC�GBnH���vC^-�Ǵ��4S|�8������7�G��iT����v�z0�� �[E[4�s�FzG�|ۭ�P>&}=�'��y���48�`���{ڇ���}�nz|��@���q1�r9jX����G]ÏT{�x��{h�p��ڻ����)���V���࠯�}T���Y�&G5����9�D�˳��v,3�-Cե�|M&`��c6)Y&��TYW��X�љ��k� bA���[ä.�}Ӊ<̦��;�M��sܶ��Z�`|D�B�Q���h��!���oA�B���`�:��h���@Q�nx&��h��ݠw�����aO�H��Мx��g���<n.��ڲDm���*#o���8_��W�ͣt�Þ��Ot���"Y|�~�f��Ux߇_� S,�4���i�2�N��ַ���{
�p�ݟ(�HmV�lFs���>V�ܳ L@���d�}�/�hN�]itQ��E�ә����͹��j#̚��f�/�M�ϑ�V�Y}Q5��o�\���)J�rA.V�Oe,Չ�4̞D^������ׅ�)���)����8QL�>P�Nʼ~_���� <��S�n�pЩ��
�H��M�#�M��a���B^�,e�b/c��. 1��,_�[�c�#�$mвr�V�:�����7�1�=dvv�}�=g��7�vKM�V��wwCv�V�6�S�5!칒N^.#X�Z!�_�|�L{dx����i8>��щKkIC����!�(9�KٱIٹLիf�ր|7qc��CL�9��G6:��
<��)Rk)���Č�A�6�:no�`L��R�A���O���[��I:�]�Ӱt٭ݚp�J�&���מ��P��F��#�H�s_�EW�a,�ܙ�o}X<n)�T-J�kOxPZ�8��^�;�n���sH04օ o6��U�H�R��Ipǆj�V�;΋�F��;�ܳ�9>b���7���s�7X����cW?O���C���!�sr��̫V@�lO �<G�~�
{������aCl�r��������}��,qi�������"
P�0G��>)u��������5g��>��t%L�'��(O�\9����M�����-����f, ;�=\�=zX� �H�v�>ض뒍��9fy{}΁���>�3��>�#�U>��s�����s=\��\�sN�z�� C>'7ݨE%�w+������k��=/��G���o��@��vH�j��>�w��QG��H����tz0�k
U3����A��މ"�&
��?9n���N�K�za�.�J
E��eQ�	���wLB�tMmJ��w��(�01FL{�A�G
EiN��:G�ml���Jt��u����Q,�7�4�܊�����$�}�ˆ����k��#�M%��)N�-!8��$�;hT.�l�C{��KZ#i!�#�tY�e~֧�׼��7������tʾ93��!Rw���7��'��.2=dY��(�
�hSQ�]E�Nqմ��i��>E�cO�{��6Y�fhL+�&8�P6��b�,󂊝���8iBF��1����v�6�u���]�R]������AuE'W�3�\T�燗�g�T�6�Z�'�����p�ǆ��Ȁ���'���7.�4v���
�J��>��"��o�����{[����ܠ���'+7����f-�B0� �-����1�W�Pъ*{�Z�ޏ��>��?FM�ʍ_Y�0��!��"�G��8��V��������.�(���+X���X%�,m��a��L�w����-�xN\xЖ�m��߶nB�i����R�����d�:�;𨏷�Ǩ X9��s�B+r|(`z
`{�vF�
�6�l�@1|}�bO����J�澽�cE�G�?����`��&>�w�����W��X~
���m��漹��(���=����>�w�SC!����yg�e s�4g�p����I��o�s�>�k��E�㪳<�\�|���N�4Q�+�T�t�uh��k����KA0��J�&n��ӎ�n%2u�K��l?�i��Jk2b��x$�h7��ꦾ����%}6��^�U�=�W�EĦ�D�.͞�{��φ/��w�"��hM�Nf�9������^ݫ{�q�t��O�T^���R�;�{�B�T����\@�|��h�ރ7\pti{�ɳ:��=�Y	s�(+a�މ���QV�҃Wf%�u�?+A"y�Ҭ���Y	s�� +a��d%,�5��$X����;aLs���n���ȅe�hjo{0���\��޻��^�<�^���'������.��`'��r���dS��>Q6�ܝgS,�Б̩�)���3���3�V6�D���)�Ȧ����)�<�A6Œ�7φX�}t6�����D���߿�mQ7M�<��0Ϻ#�fW1��p��M�� On�k�S��jV��4d���S�33�%N�ht��K�������iW�Ɗ�}��X�r����<RZ�����Q#l�X��ݕ�>?a4~�}ebM��N7$�UO�Z1�I �	�Jl�9v�L����x���yC�|���w����V'�         '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
]         4   x�3��	�2����2�H,.�/�2���q�2Ӿ\f�~�\1z\\\ �
v         �   x�m���@D��c��.������1F�_�*�:$�ޔig64�i���}��М������2�jl0��08-����z�<��m��=� ��C�WJh�y@�6���h���h��А�y�F(��E�c%���%nΫ���J?D�F<9�ĳ�TW��L�K�n��(^2���EXK܋�@܋0%�y͈{^��uqb�l�,��ew�BY>��FN��FN��FN��F��h'vqډ�V烈�B%8         '   x�3�I�KO-\F��@F6�1�wb^yfW� ��	e            x�3��pr�2��N�+������� <0      !   m   x�3�tJLI�S-N�H�4�2��I�MJLOTH�M-��+I� 
s:�E��Ss�sBRsK|3�&X��Tl�j�wbyb1�~�Hi^Vb^:P�~�i����� rA�      #   Q   x�3�tJ�K/�K�SHI��O,I,U�I, �%�q�rq� �ٙ
�y��I u@Qc�м��l$A��t�Ң��t� ��      %   �   x�M�=
�0�g�>A�m�B� ��.
���Х�������{:+��6��DA��J.���/O
�A�
Ǌ�$�z���[�s��`�jc/×��oQ��.�5I���8I˲�E���K��ĞC�HpW��B��<N ���9      '   g   x�3���/ITI�KO-
��9�%�y��\FhR@!cN�Ĥ҂Ē�<q��`߈�I\���93'5=?(`��* 1/%5=��I�'5)1(���� ��5`      )   \  x�M��n�8���S�	��^�P���f6L,��ElA�~��r:��G�E������&�I��>��x2�&S�w�ܼ;����zpa��r�u�|�ǿ7Y�
�-���w�����b�Cc�[�
���.s++!��A�^����ͅ{𺘛g����N�B=w�:Ri^t]<�2�n�U]�͛]\h7��yѠ�ɜa�e�9��ҋ�)��M��* ;�=�/̏� {��y
�2��pT8�t�4k���7Gh̳�&ǟ�1�xrײ�<�+�RH��bW�M�����vn^l7��0�1��4�v��"K V��ζ� `T@��!�FF���Z~�R�Xɉ�Kz�C�)��&[�.{�.�r��<w9��@�hEW!�0HϖWJ�U��6g;��K�ؘ��P�a%'�������H�R�Dad��`Vz��s��� �R�߸NO&���Dbš�pѾ�� P��A"@���+���?	i���-S$C�~�W)l�Z�1ذ�H�BTn��V��I4~{	Ѯw�ߩX8(��=��B�ũI��fZT�t�O��d������E��ol̀��2�.q�-6k��2�d�1�es�Tհ���Y��q>~�n�g��O,H����V�̜��y���Փ�6�e���{�Y����_�C]�,�fO`q���Fb��Fj̓]�n�Rs2����I����)x�C H��J�:4��	�u�������\ܶS�ߨH̥�aD����\L��t;A�_��WVaTH��nE���G��'�.LZw��E\4���Jg�����Z^��lN�0i�p_�1l_�⇉
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�      *     x��R�q�0����� %�C'��s���Ƒۋ�h�$�D)�P��ܸ���p�Q];ݿh<�	���ܘg����6��ũ��:�VZJ���?����N�<?>?�e
1��SZֆ��� �yc���8�<������4��
�֧���d���X<HF
 ��*GqzA��W�mc�71�zHR��/�$�Wz2��g�/��t	��)��;�l��4�;$+�g���2j�:�?�&s��d�	�B����z"���!�kLB\�c������m۾K��      ,   �   x�U��� D��c�����G���3�/��M�:�n�ր�䲓�6�X]�����!�QJuN�}���J�NiGqa�"��L��(���iE	�V�����K]#��x+)�Lƫ�>��,v�h)�G0�k��6��]��V�X���{�
�3������ދ�j ��ĐD      .   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      0   K   x�3�LLNN-(IM�2���SHJ,I�P0T�.(HJ�2F���B&(���3s�LQ�A��8�R�R�A��qqq �	�      2   �  x��UMO�@='�b� �B2�����ZD�r����a��h�QE}�	�qA��@�8���{�ɒR{��8pb>$Y��9C{:�@T����X��}�o�0B�8�`���b�x!jp���]��L�$O���2Ո^w�5����i�k���*V�Yu`���`��Nt�{�h�"2q6����<8,��b^|�M��:������9�Ι�
�N��ӆ�**j��nE�u�����Kވ��C�F�M��������$bJ�=԰�)�{֭F�1刳fW�u����>($��-��B�r��F|5��!#�"���<���ѯ(Pm�h�;_�G�s���"�a��
hP,Z���c��~E�og�']��]gO�5B�W-q,��,1>�A�#�Q�\jI��z���Vt��e_��Q���Oc}�͘;w���`;']k��r��[�7�&�r�#I�Ta<�3��,]RX�t2[*vw7�Te�pNK�T�Mw}��:��;�NWL
v��t�f���gk/���m�t<���gʯ�i�o�3^�x��-n\m`<�A�ݖ7�м!���tF�HKEs��Hz�e�P(]��(� �d���3��՚���E�Q�/�f(�ц���N|G$	,�^�t�[LI�Bq���\ꊩK����Dՙ�*��WK�s֔LFE2��,�8�d0D�`:*�q�=U���S��� ���      