PGDMP     +                     x         
   siapkaban2    12.3    12.3 �    6           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            7           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            8           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            9           1262    21515 
   siapkaban2    DATABASE     h   CREATE DATABASE siapkaban2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE siapkaban2;
                postgres    false            �            1259    21516    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false            �            1259    23964    account    TABLE        CREATE TABLE public.account (
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
       public          postgres    false            �            1259    23971    data_perusahaan    TABLE     $  CREATE TABLE public.data_perusahaan (
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
       public          postgres    false            �            1259    23978    data_pribadi    TABLE     �  CREATE TABLE public.data_pribadi (
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
       public          postgres    false            �            1259    23985    dokumen    TABLE       CREATE TABLE public.dokumen (
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
       public          postgres    false            �            1259    23992    jenis_dokumen    TABLE     $  CREATE TABLE public.jenis_dokumen (
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
       public          postgres    false            �            1259    23999    jenis_fasilitas    TABLE     �   CREATE TABLE public.jenis_fasilitas (
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
       public          postgres    false            �            1259    24003    jenis_identitas    TABLE     �   CREATE TABLE public.jenis_identitas (
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
       public          postgres    false            �            1259    24007    jenis_layanan    TABLE     "  CREATE TABLE public.jenis_layanan (
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
       public          postgres    false            �            1259    24011    jenis_lokasi    TABLE     �   CREATE TABLE public.jenis_lokasi (
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
       public          postgres    false            �            1259    24015    jenis_pengawas    TABLE     �   CREATE TABLE public.jenis_pengawas (
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
       public          postgres    false            �            1259    24019    jenis_pengelola    TABLE     �   CREATE TABLE public.jenis_pengelola (
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
       public          postgres    false            �            1259    24023    jenis_penimbunan    TABLE     �   CREATE TABLE public.jenis_penimbunan (
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
       public          postgres    false            �            1259    24027    jenis_perusahaan    TABLE     �   CREATE TABLE public.jenis_perusahaan (
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
       public          postgres    false            �            1259    24031 	   kabupaten    TABLE     �   CREATE TABLE public.kabupaten (
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
       public          postgres    false            �            1259    24035 	   kecamatan    TABLE     �   CREATE TABLE public.kecamatan (
    id integer DEFAULT nextval('public.kecamatan_id_seq'::regclass) NOT NULL,
    keterangan character varying(225),
    kabupaten integer
);
    DROP TABLE public.kecamatan;
       public         heap    postgres    false    217            �            1259    24039    layanan    TABLE     �  CREATE TABLE public.layanan (
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
    tanggal timestamp without time zone,
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
    kw_pemeriksa_pkc character varying(255),
    progress integer,
    perusahaan integer
);
    DROP TABLE public.layanan;
       public         heap    postgres    false    210            �            1259    21630    role_id_seq    SEQUENCE     t   CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false            �            1259    24046    role    TABLE     �   CREATE TABLE public.role (
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
       public          postgres    false            �            1259    24050    status    TABLE     �   CREATE TABLE public.status (
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
       public          postgres    false            �            1259    24054    status_layanan    TABLE     �   CREATE TABLE public.status_layanan (
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
       public          postgres    false            �            1259    24058    sub_jenis_layanan    TABLE     �   CREATE TABLE public.sub_jenis_layanan (
    id integer DEFAULT nextval('public.sub_jenis_layanan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_layanan integer,
    pengawas integer
);
 %   DROP TABLE public.sub_jenis_layanan;
       public         heap    postgres    false    221                       0    23964    account 
   TABLE DATA           j   COPY public.account (id, username, password, role, status, d_perusahaan, d_pribadi, j_lokasi) FROM stdin;
    public          postgres    false    222   O�       !          0    23971    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab, kecamatan, kabupaten) FROM stdin;
    public          postgres    false    223   X�       "          0    23978    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    224   ��       #          0    23985    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    225   �      $          0    23992    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    226   �      %          0    23999    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    227   �!      &          0    24003    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    228   �!      '          0    24007    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    229   C"      (          0    24011    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    230   K#      )          0    24015    jenis_pengawas 
   TABLE DATA           8   COPY public.jenis_pengawas (id, keterangan) FROM stdin;
    public          postgres    false    231   �#      *          0    24019    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    232   �#      +          0    24023    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    233   -$      ,          0    24027    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    234   �$      -          0    24031 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    235   .%      .          0    24035 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    236   �%      /          0    24039    layanan 
   TABLE DATA           �  COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal, kw_k_kantor, kw_penerima, kw_pemeriksa_p2, kw_k_s_intelijen, kw_k_b_fasilitas, kw_k_b_p2, kw_k_s_pf, kw_pemeriksa_dokumen, kw_k_b_pkc, kw_k_s_pkc, kw_pemeriksa_pkc, progress, perusahaan) FROM stdin;
    public          postgres    false    237   *      0          0    24046    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    238   .*      1          0    24050    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    239   �*      2          0    24054    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    240   3+      3          0    24058    sub_jenis_layanan 
   TABLE DATA           W   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan, pengawas) FROM stdin;
    public          postgres    false    241   �+      :           0    0    data_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 500, true);
          public          postgres    false    203            ;           0    0    data_pribadi_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 502, true);
          public          postgres    false    204            <           0    0    dokumen_proses_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 308, true);
          public          postgres    false    205            =           0    0    jenis_dokumen_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 1, true);
          public          postgres    false    206            >           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 32, true);
          public          postgres    false    210            ?           0    0    jenis_layanan_id_seq1    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_layanan_id_seq1', 1, false);
          public          postgres    false    209            @           0    0    jenis_lokasi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_lokasi_id_seq', 1, false);
          public          postgres    false    211            A           0    0    jenis_pengawas_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_pengawas_id_seq', 1, false);
          public          postgres    false    212            B           0    0    jenis_pengelola_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq', 1, false);
          public          postgres    false    207            C           0    0    jenis_pengelola_id_seq1    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq1', 1, false);
          public          postgres    false    213            D           0    0    jenis_penimbunan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_penimbunan_id_seq', 1, false);
          public          postgres    false    214            E           0    0    jenis_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_perusahaan_id_seq', 1, false);
          public          postgres    false    215            F           0    0    kabupaten_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kabupaten_id_seq', 1, false);
          public          postgres    false    216            G           0    0    kecamatan_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kecamatan_id_seq', 1, false);
          public          postgres    false    217            H           0    0    m_identitas_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.m_identitas_id_seq', 1, false);
          public          postgres    false    208            I           0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    218            J           0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 1, false);
          public          postgres    false    219            K           0    0    status_layanan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.status_layanan_id_seq', 1, false);
          public          postgres    false    220            L           0    0    sub_jenis_layanan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sub_jenis_layanan_id_seq', 1, false);
          public          postgres    false    221            M           0    0    user_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.user_id_seq', 502, true);
          public          postgres    false    202            K           2606    24063    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    222            M           2606    24065 $   data_perusahaan data_perusahaan_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_pkey;
       public            postgres    false    223            O           2606    24067    data_pribadi data_pribadi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_pkey;
       public            postgres    false    224            Q           2606    24069     jenis_dokumen jenis_dokumen_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_pkey;
       public            postgres    false    226            S           2606    24071 $   jenis_fasilitas jenis_fasilitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_pkey;
       public            postgres    false    227            U           2606    24073 $   jenis_identitas jenis_identitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_identitas
    ADD CONSTRAINT jenis_identitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_identitas DROP CONSTRAINT jenis_identitas_pkey;
       public            postgres    false    228            W           2606    24075     jenis_layanan jenis_layanan_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_pkey;
       public            postgres    false    229            Y           2606    24077    jenis_lokasi jenis_lokasi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.jenis_lokasi
    ADD CONSTRAINT jenis_lokasi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.jenis_lokasi DROP CONSTRAINT jenis_lokasi_pkey;
       public            postgres    false    230            [           2606    24079 "   jenis_pengawas jenis_pengawas_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.jenis_pengawas
    ADD CONSTRAINT jenis_pengawas_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.jenis_pengawas DROP CONSTRAINT jenis_pengawas_pkey;
       public            postgres    false    231            ]           2606    24081 $   jenis_pengelola jenis_pengelola_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_pkey;
       public            postgres    false    232            _           2606    24083 &   jenis_penimbunan jenis_penimbunan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_pkey;
       public            postgres    false    233            a           2606    24085 &   jenis_perusahaan jenis_perusahaan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_perusahaan
    ADD CONSTRAINT jenis_perusahaan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_perusahaan DROP CONSTRAINT jenis_perusahaan_pkey;
       public            postgres    false    234            c           2606    24087    kabupaten kabupaten_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_pkey;
       public            postgres    false    235            e           2606    24089    kecamatan kecamatan_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_pkey;
       public            postgres    false    236            g           2606    24091    layanan layanan_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pkey;
       public            postgres    false    237            i           2606    24093    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    238            m           2606    24095 "   status_layanan status_layanan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.status_layanan
    ADD CONSTRAINT status_layanan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.status_layanan DROP CONSTRAINT status_layanan_pkey;
       public            postgres    false    240            k           2606    24097    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    239            o           2606    24099 (   sub_jenis_layanan sub_jenis_layanan_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pkey;
       public            postgres    false    241            p           2606    24100 !   account account_d_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_perusahaan_fkey FOREIGN KEY (d_perusahaan) REFERENCES public.data_perusahaan(id);
 K   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_perusahaan_fkey;
       public          postgres    false    222    223    3149            q           2606    24105    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_pribadi_fkey FOREIGN KEY (d_pribadi) REFERENCES public.data_pribadi(id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_pribadi_fkey;
       public          postgres    false    224    3151    222            r           2606    24110    account account_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.account DROP CONSTRAINT account_j_lokasi_fkey;
       public          postgres    false    3161    230    222            s           2606    24115    account account_role_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 C   ALTER TABLE ONLY public.account DROP CONSTRAINT account_role_fkey;
       public          postgres    false    222    238    3177            t           2606    24120    account account_status_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT account_status_fkey;
       public          postgres    false    239    3179    222            u           2606    24125 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    3169    234    223            v           2606    24130 .   data_perusahaan data_perusahaan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kabupaten_fkey;
       public          postgres    false    235    223    3171            w           2606    24135 .   data_perusahaan data_perusahaan_kecamatan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kecamatan_fkey FOREIGN KEY (kecamatan) REFERENCES public.kecamatan(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kecamatan_fkey;
       public          postgres    false    3173    223    236            x           2606    24140 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    3179    223    239            y           2606    24145 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    224    228    3157            z           2606    24150 "   dokumen dokumen_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 L   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_jenis_dokumen_fkey;
       public          postgres    false    226    3153    225            {           2606    24155    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    237    3175    225            |           2606    24160    dokumen dokumen_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_pemohon_fkey;
       public          postgres    false    225    222    3147            }           2606    24165 %   jenis_dokumen jenis_dokumen_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_role_fkey;
       public          postgres    false    3177    226    238            ~           2606    24170 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    234    3169    227                       2606    24175 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    3155    227    229            �           2606    24180 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    232    229    3165            �           2606    24185 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    233    229    3167            �           2606    24190 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    234    229    3169            �           2606    24195 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    234    232    3169            �           2606    24200 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    3169    234    233            �           2606    24205 !   kabupaten kabupaten_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 K   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_j_lokasi_fkey;
       public          postgres    false    3161    235    230            �           2606    24210 "   kecamatan kecamatan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 L   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_kabupaten_fkey;
       public          postgres    false    3171    236    235            �           2606    24215    layanan layanan_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_lokasi_fkey;
       public          postgres    false    3161    237    230            �           2606    24220    layanan layanan_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemohon_fkey;
       public          postgres    false    3147    237    222            �           2606    24252    layanan layanan_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_perusahaan_fkey FOREIGN KEY (perusahaan) REFERENCES public.jenis_perusahaan(id);
 I   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_perusahaan_fkey;
       public          postgres    false    3169    237    234            �           2606    24225     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    3183    237    241            �           2606    24230    layanan layanan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_status_fkey FOREIGN KEY (status) REFERENCES public.status_layanan(id);
 E   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_status_fkey;
       public          postgres    false    240    237    3181            �           2606    24235 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    229    241    3159            �           2606    24240 1   sub_jenis_layanan sub_jenis_layanan_pengawas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pengawas_fkey FOREIGN KEY (pengawas) REFERENCES public.jenis_pengawas(id);
 [   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pengawas_fkey;
       public          postgres    false    231    241    3163                �  x���K�`7���	��{���	P63�D��L��"��S���,�����E�}\.�Ɨ8jQb#�C���}��_��O_~��?�|��/�~�ǟ���W/"/��?������B�I��� �xC&#E�2k[M��6'��� c��()���ͬd�C��:�,JV�JH�6;��k3Y�l[���7z��dS�+9j(���Ȯ�@�#tI6�>r(m��9��)-�,�X�jv��Q�I��:��=DB�()�ػi],Q_D�0�"�~���K��y-�Т��:��$�8ET#�n�U�{�;&*@1�u���]kԁj�{4N�;[�@����{S���.� ����)5,�M��.:L}x���A�þ�G���A�G�� ��P[�Q���S�m�qȩRNj���y�3�6ȩv���fv<,�T�#��x�_A!p��gN;��BQ��o"{���BR���M���Ӟ�Yh�QSMǪQ��B����c�:������J�A���,dժ)�������^�.5{X�uc%����BWm�=�1v̎q��UVMh�O4١��L����Fq��U���0��n6��BW��J�&��=�BWuWeU�qyX�SW(�7lo�+>T�%����
��m�s����U��ɰ����06b�f��a�˭�X�m�q��w������ka<��]�d�h�.�μ�]�+���]y�X�
��N])k{��]�jPWYG
ece̎u���ҍP*�1$�@�_�6Z���.�s+�D�d�b��<6�.S �M�D:Z�CID�.�y�j<
��C%�,�(�I�ֵO:[ۙm�7�:��NOR��~�մR�H�;r�n^��E�^gLbƚ���;#W�paB���WƏ��y`.v����Og55J��"Ʊ�c����Z}����MZ�H�e/nM��|�R�=Rj��x�ӳ�mͻQ�H�Ųڎ�ڦ��Lj�6
f�|�����r�G.�ZdZ�F�5&�Z�ָ�<k�Z��i����hjM� �[5�Kk���$�#O���v\4�&�6m�zʱ��4�&3���vf�ۈ6M�I�q�u� ��̓d��w����4Doǲ��x�@7L�ɰ�6�aSg)LX�
��F��̒�&u�w�5�3L�%��=��'7L��Y�Wxl`j,���͜�*J��$���ޖ��dN��aG˙
K��+�4�+�L�%�e�򣖩�D�����ᆩ�l�2�M���TX������!z��n�
��fU�x��2�3�e��
�s��\��d�m�
�e��l��ꀩ�\��"���.TX��L��$�B�e�Y�����f��0���ţ_�a*��5���t�׆��B�i�T�xER�0�Քq���'l*�$���<����\7�H�
C�
�B�`πQa~�4O��=�GAf�>E�����yX�������kwN���Sa�����2�Sat���߰c�i�3x���*y�F>�<pT9_�l�
����7�i��g*�n>`���x3	�|��l���4�<���o��>�G�a�<h�
���pW�	��>�'�L�o�
���p��L���efO?L���5Ɇ"����e��G0Fg_�.��\�ɀ�>�G�=ʆK��>��4��w_�:��>�ǉL�ذc�i�3x�Ǜ��zZ��h���s<���G�������H�LC���¾��)��0&Y�ͦS$}�D䚪�y�0EB�^�W���`��M�Q.h6L�Щׂ��j�S$�����x�V=���j�c�ɰb���L�a�!���ص$=06f�9�Sa��i�]��F�^����~rR7L�ѱW��y�q[h�3x�6U^m{?�x�e*lXRdl�y`(���ƞ�S��3x����[.���Jht+��RYp%��\�٥����F8[201��n�p'lź���)7<�y(�����N=��Fx@9.�G�}�Q�Bxnt��<�s�TX�
��>.�Saq*����6L�ũ0���d��x���+��7F�����0}�4����w��6��u���A��c��5���FG�0�IȲ�N-�G¼j�k=����_�f��9������<'��\t&M(��yoD
i�w���Ё��m�G� D�3��5nK��~Sh��q���U�J3>�1���Z�(5�y�3��w����wYF��!�p�y�\�h��f}��xij�&���3��dy��]���N�{'�Z[6}zs��y����kfI�nL%Qk4��T�r�M��ٞ��U�y�Z�W<ê�rK�Zh�Ck\c�yX4�B���=��o�j������ͦ��<_D3�y�6M�L�=>�����~�ES-�������|�TK.�h��%S,4�1b|>��EHa^��^Qq���0�f��L���2u��I��)�}.�Mw>
�+=��=��0Uf�;VG��h��h�w^�n���)Ԙ��[���B��t�}�	��!`�TMw���eq�6F�|�R��϶�T���UXVO��a���R܎��:~�I]73�&��6L��o왑�NH*Eb�y��S�'l��N;��'�T���yGk�gx�Z)�:of�o=o�"1ߜv��H�P]���:�m�
��`��8] ��L�[���"���7�Jw�3L��oާH�}���~�<�膩����oXI���7M�ٓ6L��oǾ{L�Sam*Lز��v��Z[����T�=�ǧn׃kL��o�і'}�T���x!�<�d9�
��>�y��_n�j�TMw�g����":��Ux�x<Oӳs��zyz� ���L�����1��Ȥe��Z�+�y��亟uэt�qN�-�;�bSl����^� M��w����ĤS��� �g��#���ǣc���/.ZH�ۋ�⢡�d60>���ݻ�Mg��J=��b��iY������J:͂(��ŋn���/�Ew�e:�����Azjm�2q����K�`�|<�T�R��i
V!����b���2-݆�]q���h�e�����L�EC-H�_>|�����>������-3�s�սè����� �\�]��(�i��
�w�gq�ES��@q}� a��=�F���w}��)LZȵ�B8_9�3�ygY�+��m+��gӝɿz7���W*��<[�E�������E�;��J|�Eg�f�E^�����.���03���/���otFt��h(5���%ʳ1g"�Q�f�<���9cq�퍷��=j�R>ۧ�a��т�hKcm����޿�|���Z�p}y���?��o���_����߼��������_>��؟�	�w�~}}�/ެ      !      x��}�v�:���)x�'YK�	����?Iۉ��Nz��HbdF?ԡ�x���;�7<Or�
 	��,{Ϭ��I�86
(T}U�U!�w�Y��y^>��p�6���c#/GG��ﲑ뺃ϫ�ȹ����,N>��(J�\ߎ��:�>;�[�:�YQ�������C�Ll�t3��ˀ��Mҭ(+��J<b!��S���)wY0�_N�������o�O��s珼�,`��|��21p�ȅ�����o�yZl�K�]YdR��oΗ|����3\��	�kԿ9ϖb3O�Y��Y�x�Kwy��;؋�U#@E� `'nr�]C�����0��|\�S�p6bn4b<y���N�a�b�e%J��X{�� E��g#�x�V���b:j�\�q+.���]�q>��#V��j]m�j}:�]0��;E'��(йx�]U�v��bUo&jV�Q�ƣ��|��^�r���������9[�Kg|�J���4w~�gK�	���o�ނ/�2]9w�Q�o׷'�����Gn�'(qr�\[#�8]�l�¹�ꇘ�UѨ�3���O�Jy�ש-v#�)&cpG��<G��i��ME���n����%|�p�"�t.V|!TLBe�t�o�bZd3Q��n�K��QR�O�.-�MY-��:��w�
n�\�S�w���,�	�Z(:�5jz�8S�S8�e���R-Q;�\\�\��E�tA=��T���7����4(U2b,�`d�%U}8�\�RT�g@���])�T�)�x�t3����^�I��k݄M�Kc��G#����Yfk�$�|gQL�Xgp3�XCr%�N@xfX��%ɟa��s���ص6�uGK���hD9�J8��s���o+�Ĵ�)���-X K�����m4/���vj=�K�D�N�.we�$�Z��(c����x)�����RC>0:,�G��G�^wF�D���LJ��ܵ��YZ�T���b���X�b2�0cќ�T�!�=:w+�δ�`�'r�����ڹ�>s������p�5���~�L�QB=�e��2��z��Xf��Iz�g�x >�Of�< B��6�(~���m��(���F��I����g�j՟+)�m��vmD5�@�U�FI����q

��V�,;/J�5�߱���=C pi���:~/�Zt�!�T�ŠWn$e�5ߦ`�v- -��3^o��!�	 7�)�s����"-`�q�R�,����$>e��=f���w.�cҦ����"��񀿹��/��~�̞m���|H�lx��&-���B�,I��rw��9!A�OObӺ�	���a�w��o�]�&�)�}�� �>
���Qlӹ�8�G����~8xC����go2C�t�@���?Gw6�;"�!!��c�^ĩ
J0t��
�֫E�G��UV:�rJ��x�
��ed�i�5\�*��`�%��#�D��,d�2e!ާo�u����MZ��̹˟�@O�}��A�bLs���gQ�0M�����A����@?p���h�Jg��/�n �;��l3�AaDx&�}ϸU�����i�j_��c*����h�\L�iԳ����#fa!#�}��Vd`8a�d��VM�6p�A��m��O�a~#r���'��m�fL�{0��S'֝:��4����MM����t���Q�x.�F��"��m=G1�D��������g����G�ƿ��GZ�8 tCH���ވ��]����`��y��G٫�}2oD���^�qڸ�ȏ�i����}���,�����>��hqY���8�E֍*�ՁͿ�{��gU �X��M?�'��aU�t��q�gX&�D:�zC0����aDg{]��t������<�y��a����s�{^��L�7�?���ݿj��:�\��M|���y�ւ���|�p����z�`���'��ݸ�낍�J�D�m��
{;�E��#��v��k\�a�sl�ub�:�ý϶��U�' ��B��y�7�n���uSB`yTJ�#����󆤑us�p����{�^��'��u5/�^�!٤�}�o��[}-�[t�7�Z������N���j���W������xV� fr����R���� ��<������I�]�;d|���s��V�z�_�X��/��b�Jw;�.ۦ3��e���B^c��7kr�LC��I�s�6�祊1,�k��uF!� s^`\Ði�
W��L19�I�rkX�"X*�!@q��J����m^��d�nF!2�!_N��� ��G��`�^} :J5�]<98J�;e�q8�|���'���"1�|ݘ������ a0�9�:�������0[��Ggp�&L-��I[݂�o �c�!�p�P5<棪��<�l����A�Z����YN��O��0i"9ӶY�m�W0
�Z�)ń �g��S��%�
FI���-�~��%��,���k��=�K���$����U��> \�@�-y��s�%�h�	LמAtZ������N��C6��tL����ӓ�d��Q������Y��x]���.�A�2gG�H��>�V� ��0!�>��+S�,�t8��j�әu�S2>���<JԈ k7C+**�.py��,S6���j#ԩ��̛����Ѩ�\r��9��:��2,���;���s����{2U1wQ����#u�&	O�ɑؤ���+���(lY4;�	3*�r��ྥ�}:{���c~`����� ��"�y��Ʈ_�/����;Kx�������<�7�������C3�'�������R�~�j���6�	70aB�z�@�w���jJ�pI���~b'�.�[��K�;�i�����b���opH�\��:�]V�}�N�׿�� k!�/(e��UD]��N�Ⱥ��$S��ו8�/&����"���f� x�  	�D�?t��C#�#%��?�Å휇�R���ãX�ʲx�2�%�ve�G/��-��u	D��\���4i�?�0��F��Z]/���X� ��mU�BLEq#vLB��R,���Bl�%)�+������g�e�wQ͉Ձk��Q#�� ���(g�A�����r���3�s�OT�c��
9�1�r�	9�1V<3��Hp �
EJ�	-�4�e^Q\��*��K��-*����cO�Q�I��ra�Kpk��,Ӵ	��+�����+�Fߐ�,�Hb��cn��|������<�s��/�9��4-���4f]L?D��Ld˝h�0�w���Z�VC(�)�q��0=�4��2�q��Pb��� ���Htp>��m��΅ ��������|Y�b�m�2W��!��4��H��6�$7Bӫ�6fA�wix�\S�PJ��L����Y�r�a���mZܪ+���}8�� g��ⵇ�-]-�u>�V�J�iʃ���K�,۔�<QTݢ�	[�L���1�����j�aϗ:Ud�SE9�W��@>��scM+k�La�<o5\���y ����B~��sa���M@��Y����Dd��4�{2|u]4��ڷ���K-������*�t��o�( �n�ڽ��Ɛ�l��*�B%&̯�?���S8�Xvu|!�:���$X�#��:?�W�z� �5�lؘ`V��]�Aq@�����G�]��+�B���aӇ㱦����1���)���)�i�a�#���G���2�xSYh�u3Ha�`��~��V��;	��z�;7�n���]}(��*iw&����5¯n�e�GP%,n���Ȍ/sh�n6��+�gӢ�� �F��1�0�v���Yئ:H*:ny��_s��j���9�=�.&i�L��u�d��cD.� QN��KP�@�Y���"I��7���q7_Ggt����ɥð�kȵ�1ux��Q����	���(Y�����)P�Vn�1_��[�(t�:�c50E��nx
��eL?�򹚡�o��3�Ճw�{U�Iȑ��$��L��!�)�� _�n*3�ۦ    ����N�j��:tV'�'l����$`QK,���vng�n�c��fbU��*D���!<;�7?!v!���y�^�ؘ�)�́����,�՟���+^���e3$U��s����>��'H֊�k/�)|�W/U����r�Cڐ?j��c�l
�r�+8,�1i3l��"s�.�����CQ�5uՏ���6w2�t'��IJi���TK@��a�5_~��,XQ09%2V �{��ӭ�g������$����a�f�:�ϸ�J��&3Ð �vnm�4ڄ×�w<ԗj_V�����זi	)��M�Ьp����]-ܮ��@�c]�MR<��^�����x�Q��#҇��58Դn=��������Ve����Txi3n�T`2L�R1�V�u.�x�ڦ3����W�gy�����;^`��L='��p-	(\T3�~���u^�f":��f����kX;�>{l���7U�	�f�cx�~��,v{R�v��qB���G6MY�MF���8˯p~���I��IJ%����d*�j<�ҙVb��M
�
8�:����?3��1�\}[����\֕�b_Ŧ�y���,��<
{jy���e<س~�% ���F�a����X�W�OIi䩸|HF�K�C�z'g~WJ��r�w����*�]d�;����� �}�[xe���-/����� ��n9	���ɑ_�|�T;	�v�
}JG�|xm0q��K�~_�t@ 7kS�?zU8��^�v*���\e���Me��}��y�C��\z�uz���r�����Q��)Q"�) ����!y�'CNP�7@��bRZ�]�"
�N�׷}�G���n����|��	�M��aIS���z:;/?�ĺG����Xo��s���LQ�s0\�&SZ�<��\���� ��@�@�d�-�d���X�N�/������0_�:	m�SW��!^#Zj
�g�;���-�}�[�fuS\H�7�a���$|um���_;l����Idz1#�0ѫ.2YP-n8�YZv^�gb���J)2
�G�kd�5�NL3��VV���J�EZ��i�>k��]]V��� 3��{	�[-@�{���v1����"M�Ε�.x.l6����l~�R[�2MI{�2+�SS���Q��ey�����h��n�G��!�q�J�z��^4
�z�� }��gb�k�9$���J	s/��*)t����R�#�>�|.���  ��#\�ݺ�Q��}/i���=֨I�F��÷_ �=�fǢ�l�J��P6�΀2�.lv���� *�F�?D��*�����[�J�e�o2L�L��D�U��x�[������0��	bm*�k�5v�`�h����̫ ��9Z�E�ʋH�6^b*
0)�#v;��V�C'��E��A���պ$�!�J\c� ]0��z#P�6�6�ɶ�rmuu���C�7��C���"��I�ԏ�̩�eZ�P=od�D��嚍��'���pY.IE�q��[�<p��O4����^���[SC�B����Vv\.U"`�ޭq�)�ZB�[���H˃%c�m)7>�.k���p1�iSGF���܍��$�
�=6
h�@Bn����T3�c���i�;:�X��g=��&�f�+�tyC�f���U|���|��#` ImJ��J�ķs眜�l���"eq��'���>!���Q� ��6�3uSt��E��+�-;�A|$m8�f*3�,VU�~���ꢟ(��9�9�$��2��FK��NIi�qh��qi��1)D�:�L�[���,<N�v�����Rj(��4��u[�Pe�ҪH���ݱ���u�K�W����]�%i�eη����՗(��>/�=�Lʊf��xA�k�����@ȵq>42����Kys�1�;$���Y�բ����Ehq�!���|�@��KAf�)�ftLբz�~�GL*벼��{:�Z��UH��ϟ_(�+Ӽ�lv�&Y�ӝ��
c�)T6�ºgA�O����K�1�l�YQA���p�~� £a�h�ߓv0l��7���&�\�l�l���RW�s�Ī[�B�f���x>�r����"��I�d�ix�6�d�6Q��NJ2�1����I��%!�I�OBʃ�11�{}Z��������~�s�k$kg��tvI��3�rJϧ�[����h��K�8�s5E�Ig�Utʕ�!�3����Pb7��3I�5��Q<�������X��V&���hJu�yqvDN�pd+��S��E@l����N�2��"V��$G�P�{�w
���XC�Pc�{Ϥ�]S	o!���Fh��s;iCL�X��hYd�|�)SI����ID�M;F3n�����Foc�c�G%�6�{�@6��ɉ:�ϖ�r� ߩTS0t��u���Yʉi򪜺l��(8�k���c���q��E��Y9W��<w&�����&��D�=~(��Ы�^�2��1HYF{Al}���DK9A�sF�\b����r�B0��� ��y�����0�;��w�{����Y���>c��4my:���xv�/�z �K%�줜��sM�]��A������/��V;�U�<:�b��x�Sbm�E�X8��p*U��s2j��5�߮Lx�����O���`��=	,�3�r`�u:��_�,�����"c,/7S�d��l��?t_�uUZ��y����7��q��E��P�gI��P�bP�_�,m��
��,I��;�@l(��3ΊY��ע�Us�>�y/��]w��D9��z�o�NA�*L�I�;rq
��a����`:� ���hwV��\�d�B>� �obM��g�09�Og�&pl ��T�O<{�#Z�[;�`|�;|�7�(����N�����;�55K��N�>y
�6Nh<�	���Q�ʭ�Y��ܤ�R1%:�3�,��#�i"�'8���(�U�X뚤��s���vB�(�:��/�a���N覲��A��,����|���p�s���Ge�~O��aV!�k�g�7��^�5��*�X������&u5m�v�ޜ[1��8*���G�_��/T�S����|]db�ba1_8˩���_��B�~�M�/��BL����*��absiio�p�i�>f��HuGn�Ƈ�J6�� �9;P�?�#��X��K��<��/����� �u�9EZ +����[�F�����j��&�N`�j ËjY=�EA`�/�X��ѯ;��+VG���@.gJSG�.�t
�Q��%/��g���1��%|O�R8��fv,�ZS��F�At���]Xf��ً�^އ{v9��%f��b&�'��2�·� �K�z�z��8���o���G�P� Lk���&S�l�8I�� &�m_��dX����ƥ�������U`�HT�S��I��� �tGQt�͘{ssr_�*�}�Lqμ�.t_���:��#_͉�=�{�y��䅤��T@���]���O}�V�� �A�8QV�M��ܺ���r�/$�;h��ASwda��H���jR�2��7���\T5��nl��C�u���Pu�,��CEc����=�#ْ5M��&ǧ��=�5vX��Ъ*s��%+��0k��?\�5�����f������-�Mg7+ҧA��`>�_�U�6����������Ϋ�G��Ἤnt��bpe���Jm�#t�z;��#�L	�`�qw�{!��t{����HE�rnE��g:�x$ݤu	�,U�&��Ŀ\6�L�-U�/����:��3�?ϓ�pL�"�h+��Rs_�ݗ�1)&:>��eq�DxG����^�(b^�-��x�:�e/��W�Oe~Кr�Xҝ��g [1��P����\�w@�9M�6�I�% $�ɰ#�<"ڪ"ؖx�mډ3^��$��6{Ve��NAI��(��+�J�W��4��st�$�U�_Dz%�@�9�C�R.�����̚ߊgYF[�c�j+/�H�]����I�0�����:�.u�!.�v�Lf����	0�������S=�	���h�q���D�R����G��Fn0��b��Q    v�Q�
��*�b�AL*d(>1epw�Ŝa'n��~q�k�p
 y~|��Il��(��%v�	]��?xC�����~��
���-��O�\��Ql��(�ܗ�i<�K�o�U�2�X�=픍~H]㈵L1��Ӕ�#S*�̀�]݊�d+�D $�(&G���PM�V��n�N��l���@��`���;����S�-N�C��ggBs&�����޿	:��Qy�"�� ��p�_����v��O�t��9���jz�@�q=A��)�x� �|�?�rD��C�p��y�m�1����T���r��R� ��&��:o������'�T�97��_`;a�;�`ۡ��H���X�yG��(
X��� �p��F�I*v2�Uf�U�ˋە��El�T��(��L�1˅��l&3�l��p,�kPaV*�����d�J�ZG�qZ
��봽|F�\{=@�04&�k�MӪӋ"�-<�V�#�M��4G����(�G<�x4��/�������c
F�ZU�#D-�RC-�k��	WB)֣7�O��72i�>��ǓЧθ*�y���[�.Zm�U��/p�msg���wP86�p�}�{��<�w^I�<(��
iP�p�7b'�P�S3tX �1\��p�u�ek!JMnJ"�|^��]k�dQn�dqsw��|�FsՒ�5����o���Du߅���f��#i�"��y�K	�s#�ӓ��h=�w$��5�-/+՚�9��,�� �j�����]H�B*֮��љ�~�Jw���[#�`���d0: j�0=����m��	�F��� �ϭ����1߆x5�v�&�K�A�o0�o��r�u8)��'aq��8������?�	�(�V���h� P�w���Ӵ��G��`�c���"-g�����H,21��G>���V{O h6(����q:�%�y7�ܹf%��FÉz�/w���g�9 ]�f~% �I5-p<��◉G���h�b�|A�3�4}���ux����M��!q��ʁljB�5�����ވŝ�g_���ib��C�e�1��Pu����DuI�\�õ��iP�(ՔQ��'Ϣ�r�+1�Ò�z������4�� �`�SPz����O�68^󃚷���Ó��x�{����w�%%���w��������g����L�5C��8�ޘ&�[����5���V��%uPZo��b�>�}`l�k3��������9�j�e��
��!.R�}vO�,I���9Ϧ��K��"����ӑ�slM�ⅽ�Ej�?R8ͤ���k����"=>�ӏ�����Q�Nbia��7�/�b+�Z,Ģ�'ES�Cʦ���ǫ�O`�+��o�{��6+����q�3)|�0�e���-{�c�V�-.��I�j&�	�p�S_��)��\��R��ja�H/�F��tZ.��_'Skچ^�ɽ��.�'�s��!:$�L�fa�����U^�`���X����)�
d�,ʘ���p��FB�Ꮌ4UgmT/�|���W͖�%�A"DR}0 s�{F ��l����+�j=͐ �>��{�5��n;3s=�d�Y�'3�@� �ob�i$[�,Ҽ���y�ˆ�c2��T򆸧'vF�צ6uj�M���C�{���E�M-��Th<dX'}�]@�����*S����j�"�B��ڮ���g���p��ٵ��i��S��k���@��C;]b�G�ᛚ>�Ի�ˁ�8=�?��bx`8�-z׫#���V%�+Y�����v��⯔]6T�S���TzY�ң5]�'�i����W7���P�k���l��c����&�Ѥ���6���h���n���r�E��u�V�]��ou������<G����]^2 t��<��U�r�ʌ��(�-`fJ�%��фue�͍R7�Zw1�$��Y������7[���:\����QU��X/>1�aM��fh��-���gX�|T4���AP�X`)Z˱_z��� ��tOki�''_��e[4�?W�g՜�˯ c�`�=����Y��skљ����О�kJA�kJ�hr�1�1�PC��zx1�;oHگ��N�3>���K2�o��2(�zw�j>!�D����
��tOD�h4�"�+�o��#�5�5�~y�	��v�$��U5�VK�d�1&cʑi���U���s��$O�EE�	���6I��m��mY|�~]�^�+�Sj2S"ݤ�Y�D�],�q-��l`�?MW�^��b:�p6���|���<������`�B{U�(��"�kE���g�.�M�i8���K�Q��\so�-�����Z��G[��9��Znt�~�ʓl+��0�v�nf*�A�3fB	Z�22���s��c̨Ý��A�	N�\�z�\*�l$��
�"����l���b-(hȅ�w��q!�R7��x��&/�٫�z�洡bM�l@���Ƞ���Q����Ο�(���[��� Ӊ�(v]U���Eh6�����獍��lKF>�����T�/ ѐ�* �%'�Wl�J�P!��Jmy[�N�����+1e��7� Ab�-&������a��߯6��y{^V�GD͠L=����`)��zÁ�w�n�N>v�7�n)��[1�`'25��B��VM[>�,xz���;���<��-�P�Yګ�j��F�Óx�#��ccK�r�K��,�5%��eI/H�Ӽ\�J��7
<	HT��Ub�U{�f��@�,6��cmf��(�F3iM��n��vf��W<C|mڌe��_|�~�#���9�Q�g��q��K��	HW�G�����]����4^�#���a`gk]����6�Ť�ͭ�L6L�l�������+��k��N���Y��^2�
ȴ�9��Y����z[6��l�VNi��y��ӷf)N�H5�߲���
ah����O��s���,[��	NȦ��ێ�js�0|��(M�L���$3���}��b�Ф��X$�qnH��FT�#�%���ɪ�P�N�`�=���%���MG.�am��J� �g�#�K�eW���="����#�+�L���+:����J5/2P�x���`�j��~d�P�W��&�^E-d'��g�+�5E�	D�	����Ń���H�d�=����b�?�eU�T�=cˋ��A���&G���uҘ2��5�j��{�Q��I����s�U*���o"	�6�?,����7��e�%
�%h�*h��#?qG�Q�<�����y]��Pꯏ��+�"�x!��F�r���g5�J.�����P�ox�OTQ��vN��v��O/#���M���m�d6��0�-if`�-E�k���[mk��Y�������Eā�S��-�z<��;�VKt��b�,�Tp�T,���� �E�˝�l�������ń�VTs����1��F`O��[X�~X�je8�d����'���*KG��)G������ ����!3	p�(�>@�$_;�ϕ~à�ȍts߈ʎ��~���1�i�5J_o�ne`��Q]:5�q��������5�+�.o~ߏ?��~�����Ϝ�o�������@hpus���������L�y��p�6�D����i�b�^��X�
����4/L�6�^��$��נEịt����{�g�s������{��\I�?�"_չ{Z��D~{��Rd�5y��e�tTd�&���'vSX�����r��	r�ߦ.�,�I�韁?s̻��F!�k$�A�3V���5���Wh�f3�j���$]��-� ���~q�Ϻ���&}��.���pO�X��ך�m��3��р�H'Lr*G�E�?��C��N@ފg��LFw�L����t�I�=*�k,9�a��&�8��\�O�Ow47zGiS�q����U�^O�޷^��(�Ӕ�Iq�������R��_UN�"7�,{)�D�T�piN��aO���.:�Q��.��*�+�+y��mƛBz4 �ƴ:�&�#Ü��֫�'~7ڮ��&�-��.#p�kk��pr�3�{* '  ��A���<N�\�Y%Ӥ��HF��<<��Wr`�v�7��~4�'�������\�k2�1������	�$�7���a]}����rr5Fvﻻ���������oF��5_��+N8��>�r1�Ҹ4G�����0�lit�͢[B�[�5���U:	�=�hS�����es�Py,���{�|�=j�1���/2�e�S��V/I*6�ՙ0�k����0	{r+8��Z��w�p�w7g���ܗ��֜�vq���=	t�X.]R"8&Y�C9w�{Z��_��Jg��*��Fk
����Tv9�ˀI�Ӡw����Hk�j�qP����T|�)��|��o㑹`���N�W����z�\�4e;@=���]��d����@��Dr9��6-�/����xT����d��~�K�r�Ȗj��EUdz0�[��n�5$��}�dC��~�fݲ��]
��56�(QM���)E�����<��;]�u(1�x��Ԓq�9��l�iv`'��?��Ӭ�����a�#O�2C���I�v��P�;�`�pwe>��=���B8�V�U�:%5c�������0S���|&m�"��8rlMυ��Y�8���u�!k��5.�{b�53|�(_�>x7d�/K����R�'Ǒ��iV���}�Ν�<_bZ�+��Y�ϳt�"���/�<��b P3|�.�8��phƢ���Y��5p�s��/2%��s'��gԈTC�]�]�&8���5�cR-�G;�˩4���Є#�������3���̭�;	�[����?pǳ�Y�ۊ��3�*�{��=��a��E�{�,���iag��S�uc|����K�C���6�fq��8M#M,����_�`r�H���+aR�#䐂��COY"���,���i��<Qґa�"��v�V���ӽ.D�|V�,�O4T��r�s�!��v�����yw}uy�^��1~��)�WW�ax}���0�B>Ʃ$�@�V�Z1�'G}]��#@�ذ��s����Z����g&D�@�|��Ks���4��S`���u��Ծ���鹎�Cʝz�Ѳz��^�39����C�$��6]Z�L+�zD�a�!��	tg��tk
�ѧq����G�}C��G�<9��C^�1cJl�X�$sDX��LH�^s�hu���⽞�Γ�՚$�ܣ���)[�;��x��e����-ĎNd(>L�R]=�٢X_{��S�����}�Lӡ3�6ٓs�d��x��]I>�~89i�f�TE.O��U{�1˕h*�M%���-i���.Y�"x��<z7ܼl�[CD�9!���8@�/�E/�	s��_d��!a�3����=7l2kP�w��D�w9f��YQ3|�f�G��}��j�x���T�vӿ缳^�}o�� �v�hl}7��K�w�ۯU}t�Pø�$�& e�%��n���c���@"	��:�8%�H�&���&����3���3����Db�d��m���h��e�<^��4��S߼�͞��Cr{�D_o͐!��p�o '�-4m�O���d�7���~d�>�O0�G� �t�XN��=�5�����vp��8`��	����g�a[���$�R��E,���T��ӓ^��J��7�췜~��1[�=9�J�Њ" <�X��t�ʫ��綝x�LNq�������l�2�횤�?�ӫn�s�\@0��z�DP��#��u��|
�]q��)!��a�({�$���Z5:OΥ"����B�ea��j���r&k�z��I؊��%�c���!R��GU� �6D�
���#nw�c׋��Pú�ψ�[�2�5��f��r ���&�b3�VI��c��6�ӿ~��h~����utF�a�������L�u�͞��[a��J7Gm�Ѫ��.,h�Uu�ܵ��_/m���0V&^)��+� �3���[���%��R���aO���.qF��A&��}"��o���k�Q=��>�y��Nb����I��
9��W.�F��\�H��v2���ns�C$/��`��=��Lgr� i|�L��B ��?j��è$$z���(��z��M���$Ӗ��= �eZ'�<��cJ
��X*e*��[�Я�uGAb�C3q�=��e������l,���&�o?C��E��� W�������q���l�F~�Q�oXTT��{9�D�Z�OT�o�}�����3��=�ONg����n�oz�
�.��s�s'����S�����9l���=;mW=9u	E�
V�	YAг�|�ϣ�Yq���d:SA�	�G$���$�i�l%�<��!�f�\h�f�KQ����7[/p_69r��$������H,J�����x��r~~+�w(}�ܦ
{/��g`X����3;�'�*ɡ��~;�,�B_1X� ���U�Ne1|+������ԛ ��x�o�r��"i=���9J�m�Yg��
��P���6T5�,5	e�����D*36����!��&'b!{'���z��H�z�����$��'�j��F5}Q/���POD�VȲ�z��xZ��W#ٴs O��::�L��3֢?��Ң��=p�-�jv�ғ@tK���O�Ik�'�[Jzݭ.��
����j�^ГX_Q�Ng�B�Ă�\�B�6�A؞��	�NpU`A`�</����V�����2�WW�mF�p��Ќ�G3B�ȡE��i�s>\OZc�|�c|zTۘ���M�Y���@	B>ed�4������8������;�a���;�=9��!���&�i�+��I��T5�_C�ܜZ�-NFq�Ϩ�6��� .����YL��獢�Ď�SYo��.��^ؗ���{K��F-G=�n+v;�Ej��S7��պyژ���$�=���)c}�ʞ���=��_��!�a�u�����a-s&m�'�H�g^9M�(��T�}�ə;�i�7�qo�j��m]7��Ɗ��r����l9f���ޥӴ��G�G��ᷓzJ���GW�K��A���>j���X!��3��q$m��ȡs�H�S��7����Z��7UX����/�>�zd��r�)`cE#y�e��>���D����Q>rdB�lCL���D\X6����Tw`l*�n)G�Q�i�U3����,�2H&��s{��z��xj�ƍ��+�΄#+_s���{�1��>�Ѫ�ȉ<\_;�nT�s`�����������?�]_ӎ����~ؓ�y������j0 �溞fgXI̵XC$������X��i���ި�B����/����]]��jV�G�4	#�Qf��;F��E����3�h�|-��F�p
�2[u_4�%9S̚�yt��࢏�o���9������a��5      "      x��]�r�8����wsu�s_.��[b;.;��djn �aQ��K\���:/v��D{�Dtl	�I%�E`7��_�lT�)�� �lǶ�ز\۲�1����2Ō�W�T���5�΅d_� ��(����2K��������L�p��p��u�Ѭ��I%q5 *-�v h�,�#�&��֙��h�2�D�W%��9p�_iɑN^Z//~�����EZ�y-D���V?�صH҂_�b��*���U󒟊ŤL�ږm�@����^�,��I��,����;x~����e"�F,�D��d�R����gu>��w���UN�y�x���kY7R<�.e@���K��D�W�M*�zövTCv�މ�Aߪ N+��8�,g�E청ڜ�"���q`��MH��.f�-�e[H����Bd�X#q�c+r\u�Hi�����Ĥ��̓L��p�,��ޖ��#�lvQ�fb!*&��Q.5,���s|E�@ok��X��.;N'�%��:m�xYb�*��6\c ����e����(�+��*�0�2���������N(lv��7*�.Kɯڪ($m|���M�X�(26$L�wدW��y��5�������
\i0	��� �Z���dYN���
t��
�G/����6�� p�X�OGYԨ��2/i�19�W�#����L�a��~vvfǞ���6K�	�.�tq_���ě�>��dg�O�.(x�=h����^T��-�4�6����C~M:�(�/n�)ɸwtXA�ExX������_�F�\�fm��`�̉��eW�.�"<����H���T̎�e���cQ[d���U�T��3���^ĨA��������f��жm)Q���YHp*�k+j	��|c��u�z����f�m-E��z5e�9V`��<�x����Na� ����I��Cr��F.˺T�.�	�!�����B�}�
��R�)e8���b�cc|,X)h���&�y���<��Y�Ӥ]�ٱ�`��)��ē3��ߍ�;mk�mxG1ec�� �B�Bu�6J���IS;C�ߟ&Ua�.�y#��@2Vi]�QP�{�)�fy8a�I����a��L�Qda�!�չ�X�m�v��o/�Ϥ=�=�ݠ��³/A�U�Daﮂr��چl�D��l����� ��辒�lk>~��wU�
zG����!�Ҥ���˖��xv�(����2<�f�9���#�A;7*����ݺaֈI�����b�6@�D�Zf�x_dF���
"��ұ�^J�����W�gШ���i^�`�tQ�Z��X�֥�1�ui�!��Ё[����K���l�{F�=�eR�"�������$�b���%|e�Oe��?�*�[H�����O��Jl����^��T���tX%�Q�8}�{)�����h��jJ����GiЩ��?hR�C��Q��`��B����U����:�w�8A1粣�����*�E��S M[IŦ��A[q��1�_�Jԫ _�/>-;�6�[]6wW&mU�"�d�i#�#:~�B0)����{���9�Əe���V^BlG�x{	&�`q�0�S~��(*=:�����I;�#,8�v�و��Me��?�9�v����s�!o�\;z��#+�A.�Q"6��J��~����B��PQMLk�����F��#�GӴ�(�"O��QěA���1�t��l0�W�2S)���_�$���;L�B$i#(���G4d�E�9Z�L�����F����E[(�:�b�e��ܨا	na�`��D�XYH��í�s�<���x���s`�Dס�/nd!f:Id;�K"�f]��"n�T{���T��#bv[��j�ܗ����Jx������e�-��n��Y���ύ2@m�f�n�>�qZ�XiȠ&���B8(PmN������y���^]��,5�_Hʹ��G�����,�B6�N.$��*<,4���m��n`�F��vV��A1k��Vn�G]��Or�Mb�c��Hk)(W��TB
�U��ѣA^�Q[�q
����:e�/o�+�@����]�V������06��ǁ�Ũ���T�m�?Q���l�EI���e&�Q'4b�(c�%?��SQ�@�����s�l�D1�/A��sL�^��Zv;h�d*I���k_F@l��v�Z,J%E=��X:HuD����V)������=���V�R�� �V�h�a���
4�h��/�=�}�ˮKh w� C'-�MEE���3I:��S�M��+�$Z���߈
��{xn�)����ێϮ�w\��f��g?ʧ�����6�ɼ�4CX�(���ò׮�Eg��?�b΀�\ޥ�����Y�$�Н�-�>�O�d��n���'���ݮ$�&�ꁗSQ۳�S�'��A�}�'H�Tp �3U>��S�b��K~�����,�
WъG�r$fF��Y��`��n7�ń!��Z�L��;��,��tm�f'�)D'x Q���\V�p.��h�C.����ǀ��N�Km0p�Y�>,�!�0ӳ/��c7e.3-�m�	��AH�_�
�>;N�j�?����Xp����pv���(��R���N�k:2��U��j�ld`!@h�}a�W�@��	l�ژ-�B{puc��<��i[��.�R O���=���j;p ���i���<��E��V�������F��*sh����ϋw���\*H+���5yN�Gw��:�`Z��k͉�%����4�a�:Ng�� ��JN(���V�F��٩��)�gYi�;��U��LDl,��?EX��	�D4�O�f�\wm#��\,?7�ǘ�S0Pn�=*))Yf]� m��10|�|������sQv��^�՞����Ώ��'���~�E?<�ѣ�g4�F؛����سm;X5��
d�V�w��B,z��`��v��k8�OE�;���Q����`��c��-]�m8#>j!>�q�l��5�;{�}DB�6_"��T�i�y	f��U���OUȎ��V~f��x�V�}�!b�˩�����a��	�}#Ϸx���_i;��F�`��,v֑��]��yB1A��{s��S1�I>�h9�8Ol�$�U�s�ʦ
��'g��z*���Dqr�*Q/e��tA��F����
\6���u��:��c�ƈ5����)��k�Ȇ��Sua��s���EY�L�Î~��N�>��27�� F�>��^t��L^w/TJ �{J�]cU�@z�#�}ܙ�=�<!���R�#s𮖿�*�Xvo��=�1fr��4�D�R�Mq'd����a��^�����@G���R;�3��g�b)~L�X��	�h���Y{��I���}����s�btN+ƪ�p��ŴH�y�֫Ng8\����)�Z�?eB�1-��G��f���=�-���?\��-�-j�Gd�ѵ	�	��|�@���"�R�=�c �-�r��V8�Ce��F�@�2�܁�ޗj�!����G�l+~,jy�Qy�H�%�to����"k=4��W��Ί�����GLB�T��K�H�����C,�Yx1��G;�
@R�`|�W�ǄҼb�t%��U��ÌF%�*j�jꄄ��K���gI�G8z�&]ı��=��6�P\�C� ���8V䚔��6;
�gQ�j�x����!�߅~��!�cAW~�]��N����4�
%mC���|�Tۈu��B~�)�d�)�8k�{��,��Ñ�N�cV��e��݉2BI<��@�5�R�Hm�4&E�<�S���q�!��FӠ���,�z�ӡ��y7�N�3����Q	8�X�*�N���2���9�٧���>���pF0ȓ{���af��|��螰;��&��,��Eϼ7W�W����G`G,�1�S�9�8kk��3�����N�~P]�i�3Ґ4�2o��l>A�M���0��A��i�!rO�.0+�k�G�FZ��n9�v/˯��%R�L����QU�����R�S ��l��GC� �  �(��8fSV�{I���<C�ŞA+ �m
���ϯ�����3Hc�4���̖�h�y��o�ԭ���Wng��>Q��8��,��lE/D�cm�l���b�'�Gl������~�u�]ö�ZO(��X�o�,]��9�m��T{=&ٶ�n�|1Ϫ���Md��	C#l�'T�l�N��$�^9V�~�˞��j?��k�
������b���Or��h��6��zB��0�rZ����T\�%�)���}�(8i�ay<�H��c����!�N��e�t�]
�<��Q$��
��
ٸ,$��;X�_����J6�!�<^=��,�u����h�=bu���S7���}��/���2�D�� '��B��F��@F7�73�t,gy��Tf���������E:~d�n��g�a��f��!*�E���zq��O}�%K,��J�dm������k��	.��\�%B䠃��M��8s���N`c���lO���c[܂�����_ҹ��p��R|K��A�lO���I�5լ�p3�ަ��� �6��),}4F'p���2���
J~c�����0��ǔ<E�P.h~��t�z��7K�v'�`�2D�W�y�����C�E#3�*�TN�R�O�[�l�"�!&����{�E2�&�� �����e%"�O�lL��M2d�0V��}��!�(^"a�cW����Z,*���g���m��l�<�*��YC�1����[�2���g��� �N1�0R����G紻Z5Z�#RZԃ"(�`'b7eQh�Pw�~��"�co.y7����AB�X�f��̀�Մ�i�P�>3��?�B��CwTX� ��%^�v�8�Ԧ��ܴj��<���>s��^�a���a[7�hsΠ�d��?�I�^�6eۨ՛����eY=��;��|~��#UoJ~ kW�9=ah9�?'�z�X�C�C��L�i��2��{�50E��������ҙ�~�ȅ���� �@�w�O��gb��h��˺fwG��!B׷�8��QSI%P��P�Ey�k�y�A,�
���DS贖�����;����<Ri�1�T���o��:+�Z��,�,׵�Q/�l���	�ެ@�h���L�lpg,�>�������	J��T����v��D����;��H�X�>��&�̥�	�?dJ��|b��֮J���`bR��@�4�i��"�A��+���w�K�n��a�R�����;���V��.�z)�S1W* p�C��YĆ�.�{��RU���K{7p΃xpM��{cn�{=I�jʔS-�(MĆǮ�=48IM9E�"�s~6��xI���x�S�X�D����qU���j^&��58l��n�Q����(d��-�s�;~���]a�>b]�*���G�E�9�ʤإf{��b-"���e�"�a�&���+Y��HU��F��;��B�X_K�f�}Z;�Rݔhp#���tۈ�pk�]e�j�7%�A?�l��T&�X���T#���x�n�1�0_��6k*k�e�:Lm��~���t��yV<tf�@��K�j�x�a�7Im�H�}F�����0�0���>�7���RMΡ�A�:�D�õ�?��R�N�FB���4o�@���]���c0p�}�T����5L8I���/ϳ3pU@�`��(�J� |�hG�Z�Y�]u�aoTۡW�#OO�Pu�.�T����fҌS�&�� Ka�t�|�,`�����"4��}������D�c�Y_?gev��r����k�W�81a}6�aKЕ��{*��A�{�n�]��'��w�@.\K�*�X림]�'Ă��t �R0��V��F��7��֞����G�L��.E7�EH}�W��������k���L���U��@������M�	�Y��U�Vw���������T{����J?l	x�\��t��u�nE�3RwM��ԁ�@UhÉ��{)p�bv[��|m�C��ȤF4SC�cL>�g�Dm�f66?���Ԯ��J��צ��o	��8�q��/J����	�S|)�y�^I��s�u-��t�2)BBkWc޷s�VER@�Mm�z�y���>T����_@��UMx|�%�h��	齀$,<��EP~B�	�_		�ylLU4�"���h@� N�ڙ��������!�R��:���$Ζ]��3�,`ʺ'�ط5�x�}�mj�>i!����\K�Y���뮳���'���H�m9M[�s=y��ָAۧ*f�2�0M6�ʄ��Ƕ�٤h�5�~���D�J�ǔڦ�"���^m�߃����|�o#I�%}�*���4��@6V�,֯g[_H��N�2��~���E�D���f��i�G��в�����z� \(_� ��~��+Q	d����h
F-��Є��T�
�O�z��$�#B|�;pL�T�Y�=��=n��$#�.P��u��������QڝN���#���ӆ��ݕw�[e��������g�`3/��^	x4���\LJʁa��㮠Z�k�̪[exp�^����\�T}ـ��e��<�����Y�4d�o��K��ŃWx"Y�w3Pq����&���ky	�L�Îe���p�چr��xC�t�����₰���ux�z��+���z�< ��FND@�:�	�F��%bM�,�35P�V_Ӂ}����\,>��9�$���͕�%xu�5��W�;�h,�OxV�r��:`�گ3����w�/�������`�/%S�Hm�f�wNۉ��� �AT``5@���W���L�Ӆ����_�|�A�T̙��y�P)��?z>�NRι�I�f0����>ٍ��R�ïM��t�NS�i�^���}b��\�ũm�˘�ע?>(X��R��c!�T�����<��������̑���>A�ܯ�U�2��� 8�{P���GeŖ�1���V<��������\�      #      x������ � �      $      x��\�r�8>3O�Ӗ]� ER��h=;��Q���K.p�H4)JşIyN{ߗ�g�G�'�@��Q?�♩Jb��@����s���E��I�-��e��O٧��N���tG�	�n�Xf�:��1�Y���bgw��s�>V�*��s�[����}<U3E�.���t&�D��΋,�$��yV�a���J\�f�~����#v_����W�=��zR1�U%��:�2."v��E�D1�p���\��!\�Tq��}��dD�'�����oFR�圤Ln&lJ?�'�A�uWV�z$*�G��ӳB�d�X`���
S5'1�:�<cJ[=�����?��F�ߗ�2^�h�*+Jv=�"*T�ͦ���f�4�G؟������8�#��_h��,�s�p��\/sĶ�q�y�W�G�g�̢�ޕv�2)�a;w����?����>�%yTY�{zk�����o~�h	�$�ʒUm�_�є���`�$9'���ڴJ���,��4���h%�y�4��j�I/�=^vv�0�d����%��~x��ѓ`oM��L��h\ -n�&��q�[�P.2�Cr�@nP�]5r����?�}����ӣg�������͔�"�Ԩ��,<d�t>f*Ҷd�<���eAZv�������z�BܗWc	iю�3�!���w~���	��u�3�S��˜�#!����mf6������;:~"���;����ۓ����T)�_�xI��:Y�1�\?�		�QS�>`G��D>VǢ�$elGb~׉�2�M��D��D݉�;ڞ�!j�6��Es��k�I(Y�q<u4a@���Q��,Y�5@��ʴ�&A�%��%T	
z!Y��:t	��&=M��㸧��`΃�{�~�es��ŀ�:n�A��E�&PRك��z
Er;�Fn��G� "���^ä�D��T�w	���0J_��)����VAb8Q�˲`?�S=��u�<|$h\X�s�p�X�4���9lO��q|Q�ޥ�>���M�G8;[��"p �V�5t��b�sZθWf/c�l�̤��������ΪiӚ5d�O��5m�c�G�Z���Zp@������ݯV��a2ޛ�^ ]=�6���yq� � Ĵ��V�-�®>�]��K��#8/�ȏ�)���Nv���\����(�%Zk'��CM��Yձ[�g�KөoԩMe3�kf���2���i��z����E��(|����lrK!P��}�U���gԟ0O���p�b}���	�����G��q�v�H���cM�Q�h!��Gk�k�TDS�F�і�5�h�I>���\�F�����X����&{��ܹ�"�b��~�d��SJi0�\�L��X�Gi�=�:�Gq�p��s)��SF�S�6Y�hq��4^}����y�y�q�l�k�`C��^�RFPW�)/63zY�����[i�� f��N��b��zTcf�G�@�`�ŉ'��b��9'�����2!�(���y�S	L�S�ڊ��&��eߎI[B\l����G,�"�)�m��~������9.r
T٥���ĸ��\cᢍ��fn"���[��c�U�ŅJ�ʵր'�>EfE4jh��TZh~jb�����dvcě)�4	@'�x�xk��]�:�H��y�n. d	��������4��jF�G�GJBUy�L�2�;��N���A�·��Ö��jUiy�o�?�7���l@����ǲ�- ���S%j� �ev�s)�ـ s)_d6�\�]��qZ ��%��X�%�\�5���]g�����@_c�]��ܪT�'��Ud}UqQ�ED��&-��Ҥ�~vJR�t�@E�(f��H�0]�����8��(7K�b���*�\���d�J�|�=��ٕFA-�G�w�*1�^!Q��vz�����^����^ѣ�U^�#�X��s�W�H9�+zD �ЅڱДl�$��ʍ�M�OW3�'��,���N��5�`�9��(]h1���.T�鴥1֝��=�!���f�h
)���mG��i�ќ)ݹ�P�A��*�ڑ��u�2Z��Y@�
��DR�!EY�f���t�N��s��b���⏩���t��̠U15�(ͩY�X�"I8�U��o�RVt!ikr6-��鷪,.�)if����P�p�0u�Q�^�J/�����.�V2��4Ghci�Ȇ�>�,?��Fz�|u�y���y�q^�h�V�sq3y��ꠠ�~V������0��h�zȲr}a&Ѫ,���@�Lgq����R��X~�!��Gs=��JUku�3��0����B~��jY�ee�r҄&�V�2�>���jUߎ�x��t)�m��L�kL+;�p�>��EEy���b$w���<�G{n�юW{hH���k��>���	y�:�nmK�T��j��>��!�����<Y�`�(t}���m�	����e&h�@��q�l՚1�V�9lB�h8��G� �xa���>z#��$�����q�W�/,�w6l����sl��!8�3� t�N�=���)��]c��~����>l�!��a���
��	}�p���BB�%,_87�.��%�_�21E�-�o�{�I�ɖ���s_�A���!�!���C���3*y	�'�>�`��	B,[~�T���o��ؐ�����po ꌂ����E�O��	�W��Z~
��-����h�o��=����Oxq�E/}������NB�;j�x	�+�r�u|N������K���i��e���2Qݡ{����F�Y�+�T�v�:6�#��M6⥯Q0���j�U�|�#�}.2sH�_dh���51}Z<�B}W��᪹3r�yIΒ>W��S�;��/�-���?4@en@^�{�����O���E��њR?�8SZ���/׽�ח<�t����r��t��Ǝ��ܸP���U���&�ĩO��o����e₃G�ɓ�:��{T�'B%,�;1*a-��������nT���	�IQ	k�G�� � ��f���5��O�q{J�U�	c�WCt���3�^XF�f�x�3|+Tc��{�;p�HUw଴>���q���5,~m@�O �X�8Db������;g9Db��<H��=H�@$��"�����Fo �P�h��5�oqX�8�pϹ#OeW
䬮~�9�>�/x��_��h�~Jo̥ı�F��v��vf�B:�Z�$I�F�{]�n24M��1�o����23>lZn���ݕ1ƼH�������Λ���8����ߌ�� nw��q�<�Po�mϧ���'f���t�'�m�!(�I޾�]]��Zv�Zr�r���Me�J�����B�B���-�b�_ �/����E߀����Z��dD��l����Z���悃1)��Zt� {��\��֢���n�مp�\T�.�\��.�]5���	Ti�.,�I�c�B�.�~���A��%s�Xe(v�!��"�b�\��B?pq���u%�
#ׅ��!7p&z�\a(p]�
�օ��!Lt�jy��3���:�۷6Ӳ�rG��&�R~��������Fا�߽{�r.-�      %   '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
]      &   4   x�3��	�2����2�H,.�/�2���q�2Ӿ\f�~�\1z\\\ �
v      '   �   x�m���@D��c��.������1F�_�*�:$�ޔig64�i���}��М������2�jl0��08-����z�<��m��=� ��C�WJh�y@�6���h���h��А�y�F(��E�c%���%nΫ���J?D�F<9�ĳ�TW��L�K�n��(^2���EXK܋�@܋0%�y͈{^��uqb�l�,��ew�BY>��FN��FN��FN��F��h'vqډ�V烈�B%8      (   '   x�3�I�KO-\F��@F6�1�wb^yfW� ��	e      )      x�3��pr�2��N�+������� <0      *   m   x�3�tJLI�S-N�H�4�2��I�MJLOTH�M-��+I� 
s:�E��Ss�sBRsK|3�&X��Tl�j�wbyb1�~�Hi^Vb^:P�~�i����� rA�      +   Q   x�3�tJ�K/�K�SHI��O,I,U�I, �%�q�rq� �ٙ
�y��I u@Qc�м��l$A��t�Ң��t� ��      ,   �   x�M�=
�0�g�>A�m�B� ��.
���Х�������{:+��6��DA��J.���/O
�A�
Ǌ�$�z���[�s��`�jc/×��oQ��.�5I���8I˲�E���K��ĞC�HpW��B��<N ���9      -   g   x�3���/ITI�KO-
��9�%�y��\FhR@!cN�Ĥ҂Ē�<q��`߈�I\���93'5=?(`��* 1/%5=��I�'5)1(���� ��5`      .   \  x�M��n�8���S�	��^�P���f6L,��ElA�~��r:��G�E������&�I��>��x2�&S�w�ܼ;����zpa��r�u�|�ǿ7Y�
�-���w�����b�Cc�[�
���.s++!��A�^����ͅ{𺘛g����N�B=w�:Ri^t]<�2�n�U]�͛]\h7��yѠ�ɜa�e�9��ҋ�)��M��* ;�=�/̏� {��y
�2��pT8�t�4k���7Gh̳�&ǟ�1�xrײ�<�+�RH��bW�M�����vn^l7��0�1��4�v��"K V��ζ� `T@��!�FF���Z~�R�Xɉ�Kz�C�)��&[�.{�.�r��<w9��@�hEW!�0HϖWJ�U��6g;��K�ؘ��P�a%'�������H�R�Dad��`Vz��s��� �R�߸NO&���Dbš�pѾ�� P��A"@���+���?	i���-S$C�~�W)l�Z�1ذ�H�BTn��V��I4~{	Ѯw�ߩX8(��=��B�ũI��fZT�t�O��d������E��ol̀��2�.q�-6k��2�d�1�es�Tհ���Y��q>~�n�g��O,H����V�̜��y���Փ�6�e���{�Y����_�C]�,�fO`q���Fb��Fj̓]�n�Rs2����I����)x�C H��J�:4��	�u�������\ܶS�ߨH̥�aD����\L��t;A�_��WVaTH��nE���G��'�.LZw��E\4���Jg�����Z^��lN�0i�p_�1l_�⇉
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�      /      x������ � �      0   �   x�U��� D��c�����G���3�/��M�:�n�ր�䲓�6�X]�����!�QJuN�}���J�NiGqa�"��L��(���iE	�V�����K]#��x+)�Lƫ�>��,v�h)�G0�k��6��]��V�X���{�
�3������ދ�j ��ĐD      1   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      2   K   x�3�LLNN-(IM�2���SHJ,I�P0T�.(HJ�2F���B&(���3s�LQ�A��8�R�R�A��qqq �	�      3   �  x��UMO�0='��G�P���~\WH-�B9T�˄�lp⍜X���qX2��Z�]���ｙ$K
㛟�'��C�%Y�J8 �Q�?�Ƃ7�wg|m���`C3��B@��ㅨ�]����{��I��eї�)G��k��^����up�x�P�l5�n�=Zq�~�V�8`�� ]&g��'��M��<����7�9��k�2L:�_~s()�_�v+
����|=k��E����8�6��d�%�I�Z��
I>ѭ�gCJ㡂eLaܓi����Y$�û�{(È��8:INC����$	���,)䚱	��0�t��4}��GF�E����uԭj�8S���U�0��9����oʀ�Ť��ykl�'��]Z�&t7k�"ש�B��I��N�ꯕ���q(M�1�O|��{��'P�g��C�{�t~��3�OA��OJ��Ӧ�|6v�~���!�·����f0���3���<��������q���ƣ��Mq}>ep��$	szG����K�O���k�x�^��2gU$EK^�fQ*V�n(5��r��q��08^����!#w��U���s�
�h�*g0��&:J%�L׷0qu��3.���͚O�^x���Y��&���)���~J�3�� :�8)����$Њ㤁�'��qU�U3���j�U�w6�("���.�횳U���S��� ��ч     