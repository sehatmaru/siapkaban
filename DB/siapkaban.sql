PGDMP                     	    x         
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
       public          postgres    false            �            1259    23971    data_perusahaan    TABLE       CREATE TABLE public.data_perusahaan (
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
    kecamatan integer
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
       public         heap    postgres    false    221                      0    23964    account 
   TABLE DATA           j   COPY public.account (id, username, password, role, status, d_perusahaan, d_pribadi, j_lokasi) FROM stdin;
    public          postgres    false    222   y�                  0    23971    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab, kecamatan) FROM stdin;
    public          postgres    false    223   �       !          0    23978    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    224   
�       "          0    23985    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    225   �      #          0    23992    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    226   �      $          0    23999    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    227   �&      %          0    24003    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    228   '      &          0    24007    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    229   \'      '          0    24011    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    230   d(      (          0    24015    jenis_pengawas 
   TABLE DATA           8   COPY public.jenis_pengawas (id, keterangan) FROM stdin;
    public          postgres    false    231   �(      )          0    24019    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    232   �(      *          0    24023    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    233   F)      +          0    24027    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    234   �)      ,          0    24031 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    235   G*      -          0    24035 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    236   �*      .          0    24039    layanan 
   TABLE DATA           �  COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal, kw_k_kantor, kw_penerima, kw_pemeriksa_p2, kw_k_s_intelijen, kw_k_b_fasilitas, kw_k_b_p2, kw_k_s_pf, kw_pemeriksa_dokumen, kw_k_b_pkc, kw_k_s_pkc, kw_pemeriksa_pkc, progress, perusahaan) FROM stdin;
    public          postgres    false    237   */      /          0    24046    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    238   0      0          0    24050    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    239   �0      1          0    24054    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    240   1      2          0    24058    sub_jenis_layanan 
   TABLE DATA           W   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan, pengawas) FROM stdin;
    public          postgres    false    241   k1      9           0    0    data_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 508, true);
          public          postgres    false    203            :           0    0    data_pribadi_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 539, true);
          public          postgres    false    204            ;           0    0    dokumen_proses_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 371, true);
          public          postgres    false    205            <           0    0    jenis_dokumen_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 1, true);
          public          postgres    false    206            =           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 51, true);
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
          public          postgres    false    221            L           0    0    user_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.user_id_seq', 516, true);
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
       public          postgres    false    223    222    3149            q           2606    24105    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_pribadi_fkey FOREIGN KEY (d_pribadi) REFERENCES public.data_pribadi(id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_pribadi_fkey;
       public          postgres    false    224    3151    222            r           2606    24110    account account_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.account DROP CONSTRAINT account_j_lokasi_fkey;
       public          postgres    false    222    230    3161            s           2606    24115    account account_role_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 C   ALTER TABLE ONLY public.account DROP CONSTRAINT account_role_fkey;
       public          postgres    false    238    222    3177            t           2606    24120    account account_status_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT account_status_fkey;
       public          postgres    false    222    239    3179            u           2606    24125 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    223    234    3169            v           2606    24135 .   data_perusahaan data_perusahaan_kecamatan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kecamatan_fkey FOREIGN KEY (kecamatan) REFERENCES public.kecamatan(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kecamatan_fkey;
       public          postgres    false    236    3173    223            w           2606    24140 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    223    239    3179            x           2606    24145 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    3157    224    228            y           2606    24150 "   dokumen dokumen_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 L   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_jenis_dokumen_fkey;
       public          postgres    false    226    225    3153            z           2606    24155    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    3175    237    225            {           2606    24160    dokumen dokumen_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_pemohon_fkey;
       public          postgres    false    222    225    3147            |           2606    24165 %   jenis_dokumen jenis_dokumen_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_role_fkey;
       public          postgres    false    226    238    3177            }           2606    24170 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    227    234    3169            ~           2606    24175 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    229    227    3155                       2606    24180 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    229    232    3165            �           2606    24185 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    229    233    3167            �           2606    24190 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    229    234    3169            �           2606    24195 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    3169    232    234            �           2606    24200 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    233    234    3169            �           2606    24205 !   kabupaten kabupaten_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 K   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_j_lokasi_fkey;
       public          postgres    false    230    3161    235            �           2606    24210 "   kecamatan kecamatan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 L   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_kabupaten_fkey;
       public          postgres    false    235    3171    236            �           2606    24215    layanan layanan_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_lokasi_fkey;
       public          postgres    false    230    3161    237            �           2606    24220    layanan layanan_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemohon_fkey;
       public          postgres    false    3147    237    222            �           2606    24252    layanan layanan_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_perusahaan_fkey FOREIGN KEY (perusahaan) REFERENCES public.jenis_perusahaan(id);
 I   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_perusahaan_fkey;
       public          postgres    false    234    237    3169            �           2606    24225     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    3183    241    237            �           2606    24230    layanan layanan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_status_fkey FOREIGN KEY (status) REFERENCES public.status_layanan(id);
 E   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_status_fkey;
       public          postgres    false    3181    237    240            �           2606    24235 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    3159    241    229            �           2606    24240 1   sub_jenis_layanan sub_jenis_layanan_pengawas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pengawas_fkey FOREIGN KEY (pengawas) REFERENCES public.jenis_pengawas(id);
 [   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pengawas_fkey;
       public          postgres    false    3163    231    241               i  x���]����g�
UAj}_�*���	67�~9f��f���t��4������j�Y�HG-��~�-W���֜�9ھ���O�E{������>����_����F��헿����Jq�b��s��$&����*�f[����d�;����7��LBV�f��6�YH&(r�ўk3*��,ҷ���^�ѭz�����d�.9yIY�lms�����lLz'�W�9{��1�5�HIY~�h`EG^�Ф�8X���l2��/��>
��ܰ��1�ڹH��X�y��9	��-+h^��we/lU��-�m%AeLss�U;���/$�V�s���j��,-Nt��=ӵM��Ѩ�*54�]+q7�fE��H�������=;��� �m�Jz��{��T�*����)CN����q�=��S�:����XX�SF��*�-�J��k�i��2YQ�.l���EMV$U )^��nX��Mh�p_��1��$pN��b�Z7&+�*�*�ITefEV%�"��G�*����օ]�VtU���Lk�dEW��=�1f̆~����t7���d]Ud*&�uՒ�]U�tm����3Y�U��vCϖvEW��2v��]U�J�A��}EWxcI&o����$pa����DW��*P�d�Ɋ�jS����%f�Us�],E���dEW͏v�|�``EW���s��&�jA�Q�d9����!_����#b>����Jo�bV�BK���]E�)�6f�l�G���/����$`�h~Jઽ�eU����Z_
9�&�D[^�J] ����kۍI��.�~�*8
���]4rO�H��:j�m�	�*�4�GR�~�Y���H�9r9�\ �V�=��)#V,�]9S	Stj�����Ԍ80'=eYhh��*{j��Flb�{h�w��c��٠EkUa���DCk8�a+S)�Ck8��YK�b](���|m�cmCk�'5m[6̶�&h��5��`���5��&���AkZ��s�mh���Y���ܠ�5�݂0.���ֈ��k�&�MZ�ЏT8��e�~��E]���I�ݤ�5�y-�23ӹ�h���~�!�f2R�~����_{�P�D�ǲ$�q��NB��a;Y@�-:㦶w�??�s9�j�WW�l�n����$?��\ה�����Y)��4h]ܟ33d6�=��`f��am�t��Y��DC?5dq��Ph��!�j`5�@C�����S���2���uO��r�>C�ӎN,�J,B�A3!�x�e�3@��n�s儑�ӡ���ڧU��",QY<´S�,���"=����ᄡ��͝X%inK-0�z[1�����0S?�M����b֖�%�8AaQ7v��#a'(,�n����9Tg��	Ca�LE`~�L
K��yk(�p�Vǵ	Ca	
㨡0��$Aa�̦(g�[�RPN�
Kq�yd��0	��V��aP��,�#���vN���RM
����Ą]���2a(�?�n?�_rX`(7 ���*�Ca��k�	z� ^��Y��k /p����bg�Pn8��G-[�
�]����ɚIp���wV��θ@�WI���q��e��ż9�2�����ِ q#��#��[��p'�pu��
å@K={�a(�-˞d���V �s˒
�P�8�D2��5�^ �K��ӄS�Ӑ�z�5���p3���<G�M�0θ@�G9�%��2��^c�@�4�P�p�y�f���C$����ԫa�y�	C$����ĞdiUM"�]$D�P��	C$p�Y�~�}~���ˆƋͿ��L"����lۓL"��/ZE`�0�^��XV�	C$M7�r�h�$F����Zۧ���ZOC=��a(n?�]����`���4TW>섡0���G�	v?�X�ʪm�ݏ��o��5MC���0,
C���#�$��^`]n�-'��a��Kc*8z����J���>�8j2hb���Y?�
X7�<��e�8�8�C���;��G��9P�c�p���C0�.I��0�´��Sr�P��
��y��	Ca�+�A�^�ͣ���.�V(�?�`����-��	W��t��t4�8��[�T/�^�ýU4l�U�u�0n�����s����i�M�4ì]��[���c�v��DG�^���z/A�@뭥0G�<�Oh��^;TD@����qk���7�w_n����Ai��G)%8R�ER��ϑg8c�����J���1�4n���Z��ԣ�{�����`��,�53�N�;���/UoT�w��aӇG7I�h>=g�p쾕���6�M��mhM���G�t��#��=KW>�["��]��9���AC-�۫�'�{�IC-���H~���Lj�������#6i��[�.�TH+ν�4������瓆ZbG�p�POb��.=��k��-^%�%��Yv��'���N������~R��6J�wN�Lw�����L*S�]fG�l�&��t�� �_�7��15�#�l��E	��^k�j�C���0�����d�m(�y�+��C^�F�!�T��2[��HRߊ��z���0D����I[e�	C$�;-R2�	Q�H�7��sj����n'Tw����7��Ê��o�Q3D��͌���	C$��.:`QA���M��	Ca��f �����l**��Ջ(PX�%Ϗf�*k
S߼v���
+�~�Yv��o.�vÊ
��9qʍ�d0a(L}sq��t�0V��-�<aW(���}��a
Ӓz�Pn/׶�P�����t�+���T�K&�@��PU_��v���PM
�����n�P^D��j�0K*&��ix֤�qU���;�&�����,/s����_nڋ�t�o
���&���������t�t��b٭|؝n����[>��tpt�� ጳ,R�i|z���L��N�k{�]R촨%�,m�	�\U�#�~��t���	4�������:��7ً;]@�a������Sw����t�Z���<C>Np����9%����S��B�_n�v�:��-r�K�Y����m];�t��E�ۛ߮�����~����0s+�Y^;�����d�
J9�� ����\�K�tQ���"������s^�\�z�([��&5�o��^��[< ����Šu��n�������աf��x-�6hHX�D��-���"t9�鎟�HyҐ>L��&9��&�~t�V4y��2���uW,/ٺ�F$�8��`Y�v�@�3l�ו^;�'`&+ۙ`�#h5�<.�׋�N'�ꩨ]�^^v:��U@͛�RvZ�}���t�ϑꢧ��(�b�1b��
�G����%�O�]�ɽӚ(KOZw���og&v�/������߶�쓻���W�������>���3iFG�����7/?�����ߞ�|����X�^�|������_�������������_�?��,�� m7�?|���?��~v��擟���'�pj�,�� ^v~�|x
�7r�T�-j�Tn��oo/���S�$��nC��?^p���g_�~��/^���?f�V�w#Ҵ���|�
��p�'P��C}�p�\�on3]ݜ�yBS}ܤL�H���I��������|���<�.�)�f*?!ǵ_�tqq�_>P�             x��}�vI��3�+�)[:�=�yjp�D��X3UY�^@!���"&�i�a�p�d���#<����tuuj� �������9���,��C��ϱȭ��b2r����I���w��lb���s��X��EX�8���g�y)��ۉ�c�".�7��?۱u��(ƭ�ɿ;��Ķ����?���o�DYY_S񔋕1�O�vO�ͼ�pb{'�K������Yf��U���̶q����'6��{|�i�͖q�ŏVE�'���߭/����gH�(���wΓ��.���lH�������� �[�Q��3�����	�5�Q_m�N����fs��8�0;�0�M�6튀�{8��(���D���ݱ��������X��s��_���{�D1q��𡪈����E*,�V�j�T��9鈹���&8a\s 7��&��;��[��Ţ���Z�Q�&nr��T��������lm��1����}�z�y�_��D:j6��1���;��xԓ���3�QH%i�ʶ�1ϓ�(��!ݾ=a^4�j.����y�-��!@c�a�JA\�B��i������β�pTp��Ws]g��5߅E��Zg[�.�o����F�l�&��=��5�62u�R���ϳ4���|7��$`Ȟ��}?�I	D։5 ��8�<}�P]g;�%���`�g�o�4�V}�w�ȷ�*�uQ&�(
��5;DC�	��d��X���%Y�s�ИN��N��
�X	jE&EL��~�J��Y�����2�����a6�)�D�8��œu�
`t�u��{�����3���̂��%Yg����_��5�!f)��f.֯�d03z��X'�ى�;�g�x�.�K�>z�$�t	G�I�?�[d¸����	�x�j�}g�-��"�s%93�F?���Q�+�/�7���R���AN�Ij-�5��Գ���?�gGsC��c�ED�V���i���	A��@2B�����h�7oM7�8=��3�4��?Ţ�.�\<����k2�=j:Y�OI)O�7�R�����wC"�9��<��ŀ��?�/�o��s�RT�WDj]�q�q�{\|������6.G �Ry�,���p�_+Y�'���5j�Չ&�������mY���[���r?�`�@)*��.^Z��f���{f��J�����w�x�L� �R�N���Ѹ�x�~�����=�2�*4Q���̺J����շ"e5 ��U��V�QKr}{�������wT��T-��ka�Q��6�b�3� �g{�����Y���o�ǧ�\bD���8/�u�=�.����7�О�.h� -�˂�5N�/�Y��q��_�E�8�V��_�����f}�o���A�Q��&x�k�y[�f|5َ���� o�;q�K
Ȳ��>�3�<+�bi���E}�E`J�pbR�?�Ȇ�� �z`%a�7t+P�@'�\�P���~�j�>����iM���]?�NF�I�$ � $Q�����x(�� IS�jp��Q�]_���`#
v4�ȖweypB�߱�RJ��ĝ1�o3�����:���z�����m)�Ʈf�]#�Ϡ�6Yn�Gi��62_A�O@,�e<d`2�_1|�)�꛽H��`��<$(�+4и��J�@�Z,��~�o��{U�� ����V�M�@R5�Ǧk�h�;A�m��c����O��l���9��̯9��'sW�>�k8�5��������`�i�o�×�}��I���"m�<o������Է,�/EM�0j�I�5�e��X"l\���]V���@����bT+�c}���4��L�}����O��+pl��e�6 ��������g���~$ �e�5)U�-������C&6#�����k�w!�ڙ�T�T#��m�V���LB]����f�����y7D����B �I�;�N-U6��ʀ�Ѵ2I+�0Z12�39�
;���_=�am$�g�3>���{v��
A�:�=k5B����b��Ea�%���Q�|�ܙ�{�k�3ݖ`� ��4�>�Y��>|8+���H6>�.ʫC	x[�5`jK�Qx>�d�g�'m� �8�ȑ�}@��į�� ]�fU�$5��C�f��5Y��%�go��]}���4�V�3�D�9e�EX�l���{oB��o`���cDhC�� oС���R{^d�g��(�.��K����Ns��LK/�t�܍�0 lC��Z��V#�З��|��Y�(t��e&�G?�v¤N8d1�z������Qt���s�d�T��4��0?�����bP�6�p�Ģ��pi��S�f9Z��j#�t��6�+<�8��9϶(��{�\"~g�H�D�=~		�|K��s�-%f�&�o�3�`��h�Ѻj���W�t3F�>�ҷ��C9�(@�@z��L��+��k6��0�Jnu�ٍ�5�P>�ҹ\� B�+ ǟ�Mz��|LZ8����hle"��m���Ô�&VA�2��%p;{��"I�����h�&iZ�?�}[*�&�#�$ F�XL@p@�9y���ӳX$J�>P�r_�b��������@�7Z�J�e���"���"��NM��{VZW�^]�'Ur�0E7�xk�� !�xK�T	����i��uP��͊j�����K�����x񲀣Ɛ�6K���(tA�=p:gp㼯?�u��{U��������lN��O����L�P�	��_?��{b�(��Fi�ޗ�kx ����Š���<}���{�@n�5�7D�r�f�s�L�	1��]��H탯+�w�V�ǿ��k�(�4䟨��zc���� c��
�sc����L�UF���jV� �=
��h��FJ�-٥�|�T��|�-����Il��d��6�ٚ��z��w���]�)�뤌��-��Q�.���?N04���G�N�!qGSj�x�۝���A3���ȗ$�b��(;b�In+ژ'���8d)�jIH`�������i��TT�R��f
��x�&0, |��o����ـV�H��dO1� 6�t;���� @7�;*��f���ˊ�-7U^����C����2�qz��?a:��}Z�K�]�U,���1
r����_ER�tGĮ"2��G�f��+ף�<��v.YX�S�#���nL�D��!�&�u!:Q�xsm�1.o=*� ��@���8��y�c�p�@VG��-L)|Ir�2�>�,jYHuf�#z�i���y��3�I�Y�)3d�b��$��F7BW�����5ލ�,8�n�_��[d��;�)Iӌ�0�V�w��\���i(�?� a�o=���tem�y���V�Qn�_fӋ?K��L��U?Af���-�
	��d��f��mE�g8�����o�깢P����@��k �C]�T�&�\�e��dx=��/����۶*�ǆ�gK|��fs¾��y{���B$��:]F�a���XR��T�g\��y�AP7]� MwemF@/�;K�I���
Q��A�p��_���/T���!A����i����7Kea�f���$����XT:�#�a;��c�W�)�����`Fs�VP�]]�_��ļ�O-cP��c�U�`�a)
�c��e�&��Dj��1B�*�-�:IbL7E�`�馛xO��殾WA[<s8�Z�৻L���%�WA4
��������D��tJ�j|�|�w(̂6^�&����
Y/��Y�a�׌��"�m���B�9�cNM�M���O��"���ϳ	��}���$?���h�qr�������k7El3i�\�)dB����]��=V�6)+�ׄv���uf��{��sz����s�q`��`|���0�C�h����{HŴ'�ߨ�T�mx�|w�<I:�@xKy��5p���O	�`���$0��ۈ�d�]�m
�t�W��J0��߮�����! �O2l��c�^�S�I"�K�|�*H�\m��:˶��! i��������1\�O/��    �(���U������	���o��,��l�=!jj_����k��٠�>�Dҥd�S[�
2<[�;�s�p��-�ŢC.�n�.�I'�f��r�U���sC*�*7
��;+dXQ*hVf��¶l������Z� t&��c�[{�K�m�6�����ēx�a���E^��@HL��>��'ƭU���p���N��!-�cU��j�p�������	�h��mθ�9+*�~���|q���ݰ����x�T��E�>b���p�`��l�,�~��$�UZfۚ�ȥTP��ǌ�E�H҉!�:�xǋ�.^�'�1��xey��Gn9�&�0La��n�'(pQ-��TGR��<6���tPZ���_����� ntWY!olF)�ǋU'8�B{ �g0NX�r�=&�8���h���E�
7�m�/t�-ThS"��Z���Hƛ.�y���QG��P�&��M�[H�nT]bl\+f�1�
�]�Y
C��o�*�ִ$o��V��(� ��7�Uƽ=�[�Yظ)Z��O��*�QI�"���cҿX �4n)��x���3Aa��	�ߗ3��#i#�y}��=mWc��-z�-82�S�6��m�2y�N���`�FC<��˓�bkc��c �|��	+]�F<efSH��A�8���Կ{�c���^�V ����L�MW�A}2 �.w�`�!+f�����i���o���a��.�udɫ��?e�G�]g��^�ј� L�ΰ��4���+Wx~/����![{y7�Tׇ|�ٻ����a��3�7	���c���z�^,_��1�|�ݝu���.�2^���s�5��:��4�0`��h�1x��~���v����`��nG�
(00�ݼl���&$`�Nm�N|Ov�H�I��[lt�4��q���6�"�CS�-P;�=�XR��4�cj�>��ʢ���2�����r��O�).KJ4g�f!���)&7��`SR���
1OT�X)�ߞ+��hI��ֆ�z�*t]��������m�� �<�z��$��8.s�Nz�`��+�ٯnΓ%���w��Lp����U���1�Ga���q�~q�e5��>b�	�uU��e���`�aFN�G.��&o���-fS$B`*�ɽ�_�x�����_�4�#�rɁ���Y���5�Z�������{�V�.&��y�^�-����R��,C�?:}
`�p�AXK�G�+'��@rRK����G��4^�y�M0��c��S�z@/`lUh���FueSA��˔�ֵ�خ�\��( q�	C�����/s��y�t²�5��tHn�� �(}[	x�)��F��+��ax#*��x=�8��L@0���Pd�K���@�O'���9vc��T+�]�]e[��T}��zd�U�Ry#f$ve�ص�d.a׏��rI�A�����Aw0��h�ĵ�h��&u
�zΨ&�x��.�~�5%ǅ>%�����2E@K�Wˌ>�%@2������y�����y�dX�E �"��0˪��/xԈ�y��`(,̹��0(b9gc˛ʆ_�l��	��f�e%M~"�2MA���w��(2�ҶX�	_���:'��!I7�){�l"#��րGޟ.�ʎ��ےt���İ�MO�/$��@�I �r�z�P�Tk�V����W�~n��]gp���m���3nhS{P�3�Ȩ�Pe���%V���گ�dn<�5Q��0r�Q�G�ي
�}�@������nE0��~��<�vRS�-7c��#Lg���E	b	�b��EY��v�,ǟ�G��ޔ�Y�<&E�]IP �u��E/����p>6����hf��&cv4�״(3�+��#�tm���z��||�n�R
�PG���V�p�]<a Xg�e�ܑ� ��P_)��|y%o�q����Rͧ���C��6��y[��O�+}�JFlI���EX�|���'xh?�[�Ьf4���Z�m�����oMr��s8�E���R�%6ǎB���}u���X>�@���w�L{�/�c$��m�q��6\��^12P���I��aii���²�b�x{���c��(<Mi�>gH#���I��:�(��?=ܶk�L|7z��Y]��� �6�;ؘb�̴�?��6��B�7?Ü����Ow���9��Eݥ�d��P}P��@��8�؉��7�c3z;�=��犌���UE$GА�z�wr�������H��j��Y�vMɵ��E���/���0҈]�����˶|�eA�@5��rl������dȊ��գc.�Q�jDq��t&��Z������F���t  �;�G�����%�ǩ����4���rPӈs7�i��8|9�j��e��׳�B4�u��qחiO�+]� 29,'��L��8�^�o�3�A9�b���8�&���g��ꉡ�u4v����׻O��?,���k�� `��y���i����~1G`��䐜k�ȊN0O���}�vZZY£�#F�{iO�\C���*m�,���!w'>���A]����;���ï����V��s��?9�:^
�ͯyo�)�.���܀:�����v��;�t��uU�9��
����d������r&.����,��ƺ�Ud$�G���C�|����#�����'�5M��$N�5�侏~gD&�9a_�FPN��N�f�	A!�BV�c�N�oگc�u+I��BW�?�[T0��M�C��4#�6>��e4f�09�dN�fp[`��mH�K����>T��퐀���h�_�o"��2P�:f6����u���uZ3#;]��9�MWh� �;�t$�n<_��rSo*}��v��e#�PSYx���8��1�1`��N*ש)�b�ROI!T���"x�%v0cb[��!��~���1lk�wr�ÑB����&�x[�t2hk����zoP����P�B�$ ��?F�o6��-J��܊�B<����L�va�R)I5���u��6�e�A�EF�ѧX�x�V"�!�ɿ�+1eS�<>0����R���Y�L�*�u�j`�F�� �&�}��ҏ��X��o�h�2I�Õ
l�����9ٞb�W *��Њ7bF(��;9�[=:�ã��t�.�u�������Uy)��w����H'��60e�ijf�ã��A�,
B4%�+jA��#��_tp��٩�'WҤ�5�c�=�	��c�.���%���f���a��=N�\d�#�����f����2GTĘ�z�"��G>�$aİ���T)�\�lVٌ	_-��x�a[�7#6C���gK)��דU��{�C)���ᬌ㦥?.���oqo�bIf�J3�I�T��3љg�o�3Pw�Y����2k=f�������k��M����y(8� ��!0�>2�½�Q���k���(�+�x�m�G��$�-����53��}��t�4g8�T�a�y��$���rl@�1�2��ܢD.��px���ǆ�QbK�sR.�F�5'W�5���r�<�%)���hϬy?��y-�10�W���U���������H�X����s�f���r+n��][ As����r��{���G���9��n�竢�d�r�l`!N7p�Ս�
L�Lώq{�:>I�4o���Ɉ"�qnE�n8��{,{��,�1�.����_l�츣�;��_�)��ul�e�p�&Iq��*�`*�R`����1�<��m������&aJI���9ݶ�^��*�?��_iҔA�V�?cQf�o������#�i�Q�v���smV�G �Z &=	��JCUkY����=��s���Ȱ�d;�l���FR��rdT-�n�5v ٢] I9?��~ŕ�3 g{d(�&0�l�ì�N,�2�}+^d�5���g[fp8�tU�*��JI���d�<����^�r�6�K��1���gϜ֤{.;�'[�>N���#/T�a��v:;s/�v:���70vy���l��N�U�/�"��B�Cة�O����/��v��8�W��� }S����O*c��R�\bWU�_����9.f��$O     ������,����&��L��~-���:�T(�����p` ��3�/784-Q�;uNhN�sJÈ��}hl�5�wn& h�W�a-��P��ND#�׍�ˈ)��@��`���|���S>*N�Cv�g3kF�����f�Z��H��r��98��G`jd���{e�+�,Rj�#��� �Wj�,�zx
q�-�cl~a|�_/2����c�U_�e���X�_ҥy#c��-��L����?�wO��yԭ���97:q_)3Bwu܂d�nZ�wp��N����ȁ�����g����λY,
��U�]��c�*�݄����H�d퐳}��o���l��Q�yR�+�2g�H��	\������VM[��q\�a�5�|�:CIx=D��,&Nk�K��2��O�Mc �]v�8C��C'p'��2�:^S�F��T��TV>neq�L�tJ��j�:s`�7��Iq�q�]q��6E�TBG"�:F���ӞW�j5�z�5y2.�fO��)�f�w��?±ǅ;�'=�����Ҙ����ɃL��X����

Y����@��}�0��7.{�e2G���.ϖբ,:����nb����7�CF�m���4������i6
�����7%\v�͞H�>P�~�)��0�3�0G��#jЎ�~��ޥf�|cJe'�"���dE��{ C=��!�B���n��'��9��J��)o^�D ���zL�QS�@�����7C���;h�����j0����bn�͝����9���MX�z�ИE����MoV�)(�gaٰ�ջ8�^[��ڐo�MV���A*��[E�86*��l| ��6���r��e\/"b�F��1re�Vm-� ��(��+�/��b䶂ܺ4'j꿸�̛�Ej�E��c	?�Pk��GQn�U�5HO,|�:�G�Q��1�X�o�W�wB���+u��Ń�m]F�|3\Y��9X� a���{�Bg�7�/���4j��}ٟ�1�GuL��&D�BiD��]��Q�i��KNS/���C�s�j%���SYλ��Q��20�$k��I�'E~Psf�o����&������A����Bt����t�{H7��-�������f𫙔�PoPc�ļU��6őc�Q��ʢxY�'5��B���v>0u���Nיz��;�����Գ�t���U�.;�������9O� �ksp�+s^i��S�1�5q�Av��4��$��T£�p G?�U||�f33�"�)�$��m���R�Z�Ī�dD�౽�]�ѽ�����0F�5&M�i�7�3&�Ga�w��3�M�������"�E��qQ\F������\�ɉ8����ST�u�T�g��z:A�q5��r�~�6�:C'4a'��{�j�T���=[�JoW�
�7�[��/���׀Ev(�4`͆���Y����'�kh>���xꘋj���V�k.�
��㷦�?di�W������Ȟ�o	��/��<��<�(��@��^j���n\�z���PO*Ў��6��N��������[.����]_XY,�g7Urz�d9ݚ�^&�q��J�^O'�DcA��D��3��1Zf�8d�3�O�#�+$US�|���*\O`���u�?S�u�{F:��l�:�[�����~;���;���#�������S�Ѳ0>0��¸���7�l���d�ԫs;ϰ^=�x�F�	���od\��3��������!�.�Bg���(��9��F��*�&�%����X�T�;49�evw�K��]O��hn?d������E��&�"K៺�m����jF!|EΆ��~�/��P���<�:Ū����\w���)3���]Y�:���]F7�F���_^w~y\�0O�_J�:"��I�]>8��\@��>j��͡�V.���0���J`�R<|s�Ō/�ߡ��%u�C;�:AcYN�.�ɑ������k��t��b��S��O)����߸���,8k��8b��6m.�75|�ѻT�H�,T@WO�e�1q�'����o���;d^c�F�@�[s����=�
ı;�^�p	�{�H1a�P�;�����5ͯ���h�>��W��nE��G� ^қ���Tg�=Z�knͲ=T��;}c��_��}�ДÇ���{A��ԛ����i��;(T,0 f������|Co�^<R^��p ���;Y����e��Z.h$�M3�\:��!�S=0� ���&�FB-Rt�?���5��vw��kb��qO�C�v9��W�z�t���]�w�Ʈ��BE�8�l����(����][7k�����i�8�`I�ڜ�=�N����?#
���g�d��\b���hփ�ϭ� Ղ1��w���(���wgt�bCs\@x�*aH��x�5]��)6ސl��T*���
 <�H6	m[e�ja���c�s�,�f����PZd��d�$@F͛�1�]N-��q�C<��^�zi�:�ihrRj���<L��?�<�����nE!w��|�l�����ƶ.���Vb)vj���g��S�՟I��́����b��������p�#����xKhN�_�K��M8�RH����ci� ���ҙx���*��xs��T��f��@C����8P� �MN%��������g�xuU���kGP6���a9@�Oձw���6��Z
�;M/�M��D��$l�d�����F��*�}JC8� ���/��)[D�F�Vpf���lj�dI�,N����d脄�Q�����?ڛS�(��W]3#�#�%	���˲����;�����IGG�"�!�%/Cs�td�].9(F�gs��dS>Wϒ��P�@d���]/�V�-��h@`����t��<���b�B���donD���n�1���X���{G\�&���,��ͱ�mU
cr?>�c�b�_�b-I̋�t ۷������n�VQ�� 32}�	0}�>���x��T#=U�m��a'��Q]��פ
vj���d@6_}��f/Eo�ٍ���h.�s�ƨ�l~j�\U6�m��j� M�`?��T�� j��v8���|��ǭzq;���LY�L6������~/�j���~.�M���¡���&�M��˰Y��w�� ��X��gT��=q�ao`VH40��l�?>�>Y����h��Q�&�^��"I���У�!����([rG]�b]�LNK��Nڝ��բ���+�)j&)�&0�aB���H5���"�'�5~_�l�۶r��^P�p��Y��Q�c�W6%!M��1)��n- �-E^d�jo��M�c{����B�I�>����m)~t�xs�"�f�<5��أ��P$�F�?�`R\���� ^�a�r�8�w@C�)pʒ��b|��h����aա��e]�!����]�n��Ȁ�0'~��L�X��?�������P�˛ߦ��O�/�/o�+����~���ǯ7��n.?~�2>�~y���A#'lS���f�y�L��T(#�����U�R������1E+�������"�e�u��<�Z��6}/O{7c�f���$��
�1*^�vi�^����]�s���B
C�b>��T���Z@���_�>���⟓��������o��Ԣޣ'�=ʓ׍Ƞ~z��)�C��D6��6ʎ��M�W�z�25!s�{��� �7�s�`S�=9�,g���7�$C9�_r)*�]�˜	P���!x�$T�FYq�/8�˚M�0�������:�wT�Ҡ7(�0'���o�[�����	.(H�.�z��o&9t��n���rIF#*f	��;8aʼ�\;�p����w����Q@�Z���p�d<�T�@v��S�j`$C��'�a#��F��sl��=c�)�;�#��,����������!b}������k#m�ܰ{�c�\�롫��x��ȈɞU@��mFX��v��M8�Ͽ��)����Kc��lY��W[�鷺g�n	dT(ä_O�Mg`w�_�L�~C�t��������N��]��.￾�}3����藯�Y~~�m��b���[�4\#S�;��;����y�� �  L����0�� ��	w\��	��DuoI�,+��,)�T�����{�Zs�Jht�@2[�d��IT�U]'���������b"8z�!��K(�������a��B�RkSU�֯dFO<�qH�����G�k'FΡ��u��x���ա0��Q�a�L�3�H�3���.M�Ƒ����mF͹�5���:�$0���V	�i6��y���:��ʩf��u��zFl1t4��}s�ko:��!ud,��r��m\��`��%xI5��f��orHŎ�+�B�'z2�]��n`59n����}u�����֫yY��;��]��~���1*#N���Z���?W���E����./~XW�=�- �"I��ɒڰS]3���Sb�,�X��Y�O��ˋ$�t���� GW��|p�C��9k
~��d`e;sb�>���ݕ��;�1֝�i`j
�zgj��%��՗�twPϙ��kڙ��$����2u;�j7�к�M}�ݰ4�_��uy��V�2fL�۲�����#'\Mwq�������y��1��$�,ɖI\Ĉ�q���5�D!�i��|��Rџ�Ǧ'j�h;4ё��|��?��5�Ҳ≒x�/���g�ݯ.�Iw�q�ZA:̪U���
��(�:� %j�U9��Lb>���T��C0���ⴆ�牝l�Ȧ;���{L������|��;�-w� ����S�����T�?n��u�P���Ȩ�&uy�eݳ,f�k��`�=��BBD�\i@52��G�l�n���k����k��u!���:^�d}�ɑzz������<�)�׽+������{	����c���d���	k08�?9-0d�Gdp�S�v�;rz�E��p�����:��)��z������������\a��1]��K���q�DT5gtt��ఘ,h�s�
.~�����a�am!�\(YWv�?!c	 6�� sD�n����n���k���0|h֙��Ǒ��>dyYQK��)N�FąKC|B��V�HS�N	��Q=Yh$�,Fm�ֶ��K�,��tV����n���}�g�m�Xu�0_Kuh�c����#���������G�g*
y5�h9�I�S(X�Е,0�;n�nm˞4��)�ڽ�h��2ֲ�����;r���dd�tӦ��C�u6_W�R�
&���Y(S;�������cƲ�y'�	�dwU��F��ƍ��J��n��XO�~�|C6h�X#u�k��	�����4DN@�90���q�X�Z�>߷F��������e�t�a���Z�'�M�7� �E:�u����gL1bv4������M)�y+�E=��V�㊪M����4�A���ࢻ�iӡ�S@.|N4�>��N�8M�|��i�B���0�ٙ�0N�as׀D���)t�q�m%d�sӞ���G�������Ĳ�8=�J�9��6'-8rRM��HFE�Ӫ@�p7�J����l����v�L���/b���4����Tʎ2�m��d��t5K��ȱH���K ���L���\- �"[ḙС��?5>P��G�̶�
�e1�@�[�5/4ᤞsW��s.��{�E=Aw��r ��$��H�޲7f�͑��� 8�ޕEdl:���S��l���p2�0Gma��"��aE�\"��I� h�*��
Å�CK8ش�)��:�7mHe��f��(�-�v��!9[��ĮP-�<�Ɔ{BT�y�O�
�H=����\��k�j�6���+t��� v;�
"{H�8���	m�f�Tu�ֵ(���
y%�� �~��!��*q�L!������	7r'N��!0O���bU�'F�.v�*�Od��;`�0V�}���b��g9c�>C�"�qz��Z��J�ӄ,wS�NT�M�&���Lba��xCR��?�c[�x! 2�]T�	�!Ǯ׸��7�X�՞�4(P��PrL��u,��{�c�	9���5��T`SF�wX��
��\�Ą.�ݷ	���m����ɑ�dM��^�i��}b!�����P1N�����$1�zsAE9Fx�cplD�L��N���Sl A�1C]|c�gq�����hE�XR�=�٪fܧ��p��<�fL;6�!S�]l�8c#g��A>�C
�Y��-y�GJ��&�Û�V�t�h3S.�1�G���\���L��a������|������oP1mF�~E���=�d!��koXQ^v����x�����V��>P�+�*ls8����-���gFN����U�B�+�C��W<|�f�W 4�p�U]�nL�ޓ ��}��?fh�\v��\���K�߾��r9���ַK��$M�o^;�\����e��Ua�Y�-�1t��*Ì;r\��w�l>�U��7���������VU<�I�iPz�b���|TP��#��s
R������@
{gt`���g��p��#i!�@��'�j:�.Ҷ�/K{Z�V���kY w�s1��.�N�E��G��$��R��)EU��GC�`������ �$ W����R1�XDB�S��)d��޷���ʭ���7����g���z֙��g�bI�~����7�y�Z�ݯ�\ic�ԑ����]6�r�7K�8���k��;rn�C��ڞV�-�
��E�F�N���$u���QR!���帛p���pK�Y\�8� 2�c{S�O@B��������}K�=#�,G�<�q�E�"�͜>��1�(7kjI�)��c�X�h-6�������H���C���h.��>I
m�fy�j#�3 R�
qG�|yK۶)�{۫U�`{�5�U��]㦳)���c^���r��?��U��L��*ϣ�i��F7�|�M���)�{	A�>���k�z��n&�$���_A���j]�{6X���ؚ۽�z��rn�9`cU��z�b_j�@1��Ӥ�Q2r.dKe���2l��ˍ�ݪ�;P-�Q')粑�iL�����I-Y2��j�$��q}mM�V^��1�s_G��x\#&4�G��P�]��ƊVWw�`��!Wsc����}�c���I�̳���>����umF'r���I�_�$Ys���Z�Z�	�����H9���F��Kx�j�\�P�=��P森�b{u�����T���T8�(]Fc�x*��]}Oڛ��1C��G���E��GE��D��0�\� �����i�_���ϳ�����y3O��L�Gt�kpF!8V��:r^��>Փ^�zV'���{�vc!7bc�e��Y��j�.�V�9�g�>��@DC���>�(�xϲJ�V�˙+C��Q/�2��ld��NPg��/e�Ov��I}��k�IG�B �O�^ͫ��)�]0#6��Y��0��g�����020,���t�`	�o˩�%�iZ���v2�o0��2NyJ�8{�x~`��D��E3uGN����G}s����qdgvd���x$��G��G�_qMΟc��(
���_~��I~SA      !      x��}�r۸��5����MH�|�r�Sb;.;����TmA&%¢H�*O���b�� %�%�c[P�h[$�	���k��*9eND��'�m�ul����ȅu Q�,�j��B|m�o�B��/�w�}ESV�2K�Y���^Z0}���7���p6���Q�T�D���;.r�6�v:���y-�>����<-���Y���s޸쯴�Kr�Ӄ��ˋ�<u�e�H+9��(^�����x�J$ia]�ba]V2��U��:�I��Kul��X���^��n!����Y��9~=�w�"���o|6��l��li]�$��D���j<z�HKw9i���p�7��u#�=�2Pq^rD;�axGX�B��նjȮ�[Q��S�n�7G��wN[�.ڪͭ�B��4l�ƽ�i���켂{�l���\I�\dp�F��v�]u�_����wlv��I%�Ǚ���HY�!��W~�(s�yy���H,P1���bQ���{�W���^��K�eG�d�DQS��K�G�ׁc���D�C��x�=J�JX�Jx��NI�Yq�ȎB�
�����z���.۪($m|X��M�P�(2�$L�WدW��y��5����Kkd}V�H�I�&���0(Xբ�g$�rR��V���7+�����WaaZ�.��X��(��~]�%-R#f"�
W$�cЗ��7���OOO���V#��fI6���V�w�x�ه6���L������w������=C-���e{��_�6o 
C��rJ2�-mV�jn�� ?ݬ���47Y��3q�9Q��L�*bW�o_D�;�#��'�Q����!�L_ڜt,j�LZ'i�(�n�0��'1j��̀�9|}���Y���3tDJ}s���ڊZ�6�ڹ}�6��&t�U[K���^�@�#C��<�����t���L Q��Ҥ���එ˲.���{�cg&��e_Dq������@�:�2�7���V
�'�I�#�+�q{��4i�|v$0X�y�<c.�����Q"1`'m-���S�0��b)d*tQ7m�<���45���4ɨ
#v��i)/ $c�����G����h�����Tz,�����ʔAE6��9P�K������ΰ���I���f��k�Sx�h���(��UP�W�^�a�,ѿ��4]_��6��d.���KX��X�#�s�v�ii��E`g�ek}�`{v�(����2<[�f�9���-�A;7*���՝�aֈI����r�H�`"k-3C܌O2#��R�On�XT��{%WB`�����4jo�}��(X�']��u%�v�h�ҎW��?ĺ4�Ő]W��-D�hӥ�eg6Y=��Ɓ2���p�Bv�pybS1�l����2�Nd��?�*�[H�����O��Jl����^��T���tX%n�Q�8}�{)�������jJww�a�A�"#L��I�U~F-"�ꃅ(�+�sG�RV����*�p�b�e��WY�U.�<=��@����M��.��6��bb�����W?2@��%^|
Zv�+,��:l� �LZ�@Eb��F�Ft�4�`R�91��:k���u$�D���b'���%�d���|N	��udX���hkzCb&�`���pڅf#2V�7����0h�`Y�u{�srT��s��E����A�F�LX,v"A�/�+�u��E���`Zc�,&�v� 5�E�A�N���L�<+G}o�(�l�}���^Y��L��"���0�(z� �
������=n�D�=�vĵ��
2�;&I�[�m�l�������Q+�O\�*�j��P���JÇ[�g&y����D%x%��`��C-(�	_\�B�t����S"�f��".�Tk���T��#bvK��j�ܧ����Jx�����/�鷴R��'g��?3� u�}�i����Ҫ,�JC}0Y@-�ߨ�A�j���QĺRrk\��>������í������/z����Wı�
�78���Īx�и`���.��{7Һhg��`�f)j�fy�����!��$=6*����ri�K%��Z�=*��E��>�`�hѨSVO����Q��	t(�H�Vme]�ق��Ʀ���8P��9Cv�J���OT�-�vQ�t�E�4Ϩ�3�1��:��SQ�@�����3�l�D1�/A��sL����Zv+�<e*I���k_F@l��v֕X�J�zz�t�"4j�r����V)������=�Nm��w�QvX+l4�0q�EC�휧���>@�-|d�E�������z&iB��8U��
�"�G��Q������������l���}v���tn��/1p��|��t��l�t2�=�6�A�7�A�kWբ3r�X1�@`.oSSX	ٵ�ӬMY�N�u7��(Y����p֣��~���$�&�ꁗSQ�3�؉�a�A�}�'H�Tp ��*����)_1Hĥu�����m�WъG�s$fF�m�Y��`��n�ń!��Z�L���~E��u���cє�܃���	�b�x.��d8`J4�>Y�J�c�Hg��ݥ68�,O�j٘�ٗM��2������C2tR�W ^�v��U��>����,����e8�JAU��|�JB]����~�k��(Xe_X���[�G$}ǡ6f���X'(��r�V��˱��>�|�f"���wus�>h.�acQ���"m��P]gT��2�6�H���xh�ɥ����^���{tf+q����E�}��x�(ֿ�N����T̷=v�����oxG��e��*�m��
�~C��!�)�ϲҸ\v���㙈�X6��8La��
2����?z욽3Qܶ�(ޝ,M7�ǘ�S0^��u*)aYf]5!-��10|�|��Z�-%]�%V�\G���'�5�9��������֨��E?t�у�g4�a��u[�@P�9����N�U�w��B,ze�`�N��k8�VE�;��˨�VR�0��1�~9�.�6�����5�����5��P�>��~�/�e�j�����ÊQ͆�*dGB��B3�Q<P������T��l�Ʊ��`ń����Q��OIj]js]��x0�d6��H���f�<���6�9؁⩘ͤ5�H:�?�,�$�U���ʦ
��'��=S�Me�,r�*Q/e��vA��Fw���
\6���U��:��cc�Ə5���)��+�ȆR�Su`�	t��FY�h�Î~��Nջ���ŝ�Mb+@���f�]; ������z`�t#� ���+��{�'�
<Y�d���Q����-���<��\�3���Q�T�S�
٨��!{XP��ch�1e����,����^3u�?�,D�Q�[��Y{��I���}Y���9z1:�cEf�?K�b��ܼi�U4l�L�B`��g�ϋ��2!����G��f���=Y-���?��-��k�Gd�ѱ	�1���|� ���"�R�=�c �4�r�fZ�ަ2��#l�CvC���J5��~���x��]��u$jy�Q��H�!�9�7�>�g@��Xd�g��U�dY`G_�gz�#rة�3�V��&��%e)�wV�aL�g'X9H���h���НWl��`"�}�jwp����G�b��O��0~5<v!�6�-I��l�	qlc[Eh��� ;�D��@���D��-܎\�J6�tG!�,��^M��9���D���/6�t,+�G�~�7���IB�1��B�G�U����j"���H�o�Z%��3�8_���+��LĶU����Y�����t;�%��F��6j��J�:7hL�t3휍)�er�Yw��Ӡ��f\=�@�����ϙ~�c��`��X�sQe'N�g������S���}.&*ԃ��6�0�����O�`�Kc'���6��������!���6��숅��3�
9g`mM�|�c�b?�5����TmD�%�4���L�fG"[�O�~�UYkxR� ��4wq��2�L�L��������A��E�UX�,S0��j �  �Tդ{�.����(���pj�Jw4�A���_�E�}r�g��3�cb�M�m���H+�(�ti�Ö�� ���:�w�e��!uy���ۙg�����#�كE��腈p.���fw_��򈍰��B�8P�.1�r8�!Z��1���u���<NޖkH%�C��j:���jر�Dvl�L4��yD���p�U�%�ʱ��k�]��fNh3�|]�T�p�L��e��t<�ҢH����,�Gd{�0'e.��V���Zr�b�>��'h���������tj�0F=>"=�����n�^�>@�ڥP�Eѫ�����7尸�qYH�w���֕��K������Q����_C��]g���7��LB����6<�Z� �b�E�5Y�U�H$4d�X�9Yhd���p�V�f�ܦ�-Mz+�@�A��t[����+��V�N7��Q��BH�����:�E�+1�P�!�X��n�v�(D,�^��O�����%Q'm���z�Š��=|��yzI��A<y���mq������Εe������K�Ob�g#x�LW]*���υ�!����A��ѷL����2ځ[�D�/�̄�@Pb�v�l�DŀYW=���)brA3it� '����s�X��XB�<�M�!�Z(̡�6�rm�yYɥb(�p���-��^�{O%�i�]@����'��샘��,�EG���x���豇�d�*a�[{OsH"
_<E:�.A����:T��(E6N��
� tT�ݳ�n<c�vmc��E��u	��ނc��a� ��6�iw��j�4G���]6DP��NĮˢи������3D��42\�n�l]���Ͱ<������!E�}fl8��?�z��C�Tt�P��)^���8��ޅ�޴j��=���n�{���e���A[7�hsܠ�d�]�?�s��-�k#ao˛��x\�eu�j���F/p�|ٗG�ޖ� �]�g�����%�$�z�f�M����L�i���\��s�	�7����I�ы�_BRYMw>B������ l��+`������X�[4U��g]#��������l��֨���HK(�#����z�� |;d����}��]{C*̇s"��&����ws1��B�oo�����(Ԉ�M�sf>��VC_�9;�rZM��kZk�'��j��r���=��ؗ$�,�E�Q/�m����1B񬐒h\�r���g,�>�����a�#��ʩ~�����`���C��G9�:�"����^�>i�!�Pb�@�(�]԰wU�?��� ��r�D��X�T��<^�������c,a�*��,y�p�8�&m5뼭�b:s��>z�f�Alpv��ä���mU�8���ă�8m�z/�)�:�ӣO�v��D�����Alx�J�����ԔS�)r9�N'� �Q�{�+�pk+>��0f8.��AK���b[��'��E�`���{Pwk�>
��rA����ֺ֐
��@Q��5v�?�G���peR�R�m� 1oa`��J]�nD�A<��\L�*���e���F^��k���:�Q{G���nd�U6��>�4�+��eW��"�mI�臕��:�	ܬ�k*@�w�l��Gf̗�Y���L���A&��R��Q�(��sٳ���~��%x5k�0웤�m$�>�6 ]X�V�kd���~ ��z�F�P:�Wzb"����k�}c'R�!��n���e b��.�DXc0p�}�T���5v9I���/�Y��* u�9c�O�N;hY�#��-i�l��Z�B������+���!H���<U�����4�X�	;?��� �]k�,`����Q#4��}�s���D7|��*��2�Lc9_�{���5«z�u���	���R��U�� ؽU�.��#r��L� ��L���u7�.��#bAr�:��4ō;�I��;�b{O��k��Q%�)�Kэ&D҃���x�x/��'.�Z`��AS�9/s�@o�?'k���`7�=��j���vV�w�"7��j��R�-��Ók]��2#��ҭh� u��n1 �T�7�ؽ�] xb��<���&:d�Lj(55e9���z`�I�F�`�`c[�S8��5s�)4���"����e 5�mF�?5W�~>a�c�/D5/�+�|F� ��m#"�noT&EH�j.���U��Pϥ��ޡz`-�w����'��]BC_yI8K�yBzO 	~�o��г��g��{AS�΅��%�a,	'�ݴv�%���|�h})g���Tr�A�ʂ���)P�e�
��,�5�y�}���}�B6N�u�"b.efE�"ؼ�:���4�"5K�H4mU���\�[�>U1��9��i� ��'�=��N'Ek]�@*묝�ZI���@�i@��B�@�c�W�Y���ӽ>�Ƒ�x%}�*N�|XsU}+,�׳�O$�c�e��n���e��r��03C,H�{Z���4��y�hu|�1 ן:􈨟�����p�t`y4����Єz�T�
e�O�z��$�#B|�[pL�T����=��$��\6� ��b�'�#Fiw�ɪ��:b���:wW���.��o�H�]?y�6�r
�u���GS�:��II90����
�_�)���, ��5����.ʵH՗x��L��}�*�6�0E�+���;����F���D���T\���z�JD�`�\^�/S�ّl@�`���\�P���7�N��<�x.4
�Q]��'�>����G�"���Dt�g�S��l�a*Y"���R�8SSN��9�g8�;�����cܟ�JR�u������Οө|�C�Ƃ��g5*�W�.�&��<���`�zG�B��>�����I`a�����b*�m�L椝�z�spDV�s���׏�d��.�>�/����R1gk\�ۅJ������3I9��O�43����]���� ױ[�;��]R��z]#� 8{���zr��c�\�=���Md������H+�a�^ֿ(�H��?o%r]��>��aZ�7�f��=�����߁
���Ro����
p.�w`HP7�C���Z�:��K� �\�����D�L���V���j7����L$z�l�q�����?��?uZ���4}G�xw_Vsx�7�u���M�wS����P��������7t���	V�$�W��֗D�v���_X�q؜~=��
|�����'n���r���ǮI~a;�o�t��U:�*~oA��x�ax�o8�ϱ�������/�I�����H�p�!���t�cI`�����V�XR'��k�g�F�C5M�	m�m.�X��r�'�p��|ۻ�6[.�,�2<�:����y�\_1c�:���׺����)S����cSx�Sص���E>�k}6�?�l��%�c%n�g�w?�!uҩ���p�6�D�,�����ꂘU���Yy�f�0�ҟ_���7o���b#�      "   �  x�͗Mo�@���_1�����|\����*����8l�X,��_�Y .�9���� ���̬��1�Rfm!lD]�i�P1�ucR!�F���CYgM�Ot,��p���
�Y��Jʧ�V�q�v,��n���'�6g�Å�mv�֨EQ#*Ȅ�}��	�K�"�
ABm*!���D� �nq�����aw��(�;��^é��bJ���Y*�����|w�b;�r��㽃������Y��g�!tx��������c7���9���	�0���^vI�Wh�@@�)D��]�Ъv�'tD���6��R���;�v"o�
��v�H���]l����:d�_RAovU�!,��D��(O|��#>�{Ӟ���i��yx���gMk��|�3�֌'���ĉ�i3��_7���k7�I�u3u:W�i_�����O����㛞������eپ5�ݽ�c�eQְRI��rH >ޮ��f����c��������r�[�_�M�en���5���9ʡ(���ɴ�	ol�ٺTϲ.� �Ө���[�p���\&3�������-�LKX�J2�T���6�>ý(*ԟ�FgKZ����e¥��|��&=�����f��[ds��>h�yQ�L���5�D4�4{�L��Äc�	��.�-6w�&�D�1��X��:x4��6�V�2++� �u+�ܚf`cR��)�|����$w�X�aS{;�#m�Y��}~�!e�S����x�X,~��      #      x��\�r�8>3O�Ӗ]� ER��h=;��Q���K.p�H4)JşIyN{ߗ�g�G�'�@��Q?�♩Jb��@����s���E��I�-��e��O٧��N���tG�	�n�Xf�:��1�Y���bgw��s�>V�*��s�[����}<U3E�.���t&�D��΋,�$��yV�a���J\�f�~����#v_����W�=��zR1�U%��:�2."v��E�D1�p���\��!\�Tq��}��dD�'�����oFR�圤Ln&lJ?�'�A�uWV�z$*�G��ӳB�d�X`���
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
�օ��!Lt�jy��3���:�۷6Ӳ�rG��&�R~��������Fا�߽{�r.-�      $   '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
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
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�      .   �   x���ͱ� ��PE����T���ę7o�1���E�ԓ�%Fz�.&'�N�%$&�'�I�`�P�&r�!I�!h��l�Sg�=�����~<�nc�V��(`���k;j��ϴ�`�͉T����пLB1^����=�%�A;�C��0+�u-Nm�~Єp��?���o86���z�-0rU�������WQ�g�:����=�|���*���      /   �   x�U��� D��c�����G���3�/��M�:�n�ր�䲓�6�X]�����!�QJuN�}���J�NiGqa�"��L��(���iE	�V�����K]#��x+)�Lƫ�>��,v�h)�G0�k��6��]��V�X���{�
�3������ދ�j ��ĐD      0   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      1   K   x�3�LLNN-(IM�2���SHJ,I�P0T�.(HJ�2F���B&(���3s�LQ�A��8�R�R�A��qqq �	�      2   �  x��UMO�0='��G�P���~\WH-�B9T�˄�lp⍜X���qX2��Z�]���ｙ$K
㛟�'��C�%Y�J8 �Q�?�Ƃ7�wg|m���`C3��B@��ㅨ�]����{��I��eї�)G��k��^����up�x�P�l5�n�=Zq�~�V�8`�� ]&g��'��M��<����7�9��k�2L:�_~s()�_�v+
����|=k��E����8�6��d�%�I�Z��
I>ѭ�gCJ㡂eLaܓi����Y$�û�{(È��8:INC����$	���,)䚱	��0�t��4}��GF�E����uԭj�8S���U�0��9����oʀ�Ť��ykl�'��]Z�&t7k�"ש�B��I��N�ꯕ���q(M�1�O|��{��'P�g��C�{�t~��3�OA��OJ��Ӧ�|6v�~���!�·����f0���3���<��������q���ƣ��Mq}>ep��$	szG����K�O���k�x�^��2gU$EK^�fQ*V�n(5��r��q��08^����!#w��U���s�
�h�*g0��&:J%�L׷0qu��3.���͚O�^x���Y��&���)���~J�3�� :�8)����$Њ㤁�'��qU�U3���j�U�w6�("���.�횳U���S��� ��ч     