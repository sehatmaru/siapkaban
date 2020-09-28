PGDMP     6    "    
            x         
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
    perusahaan character varying(255)
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
    public          postgres    false    222   ѫ                  0    23971    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab, kecamatan, kabupaten) FROM stdin;
    public          postgres    false    223   ��       !          0    23978    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    224   ��       "          0    23985    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    225   �      #          0    23992    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    226   �      $          0    23999    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    227   Q'      %          0    24003    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    228   �'      &          0    24007    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    229   �'      '          0    24011    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    230   �(      (          0    24015    jenis_pengawas 
   TABLE DATA           8   COPY public.jenis_pengawas (id, keterangan) FROM stdin;
    public          postgres    false    231   )      )          0    24019    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    232   9)      *          0    24023    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    233   �)      +          0    24027    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    234   *      ,          0    24031 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    235   �*      -          0    24035 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    236   .+      .          0    24039    layanan 
   TABLE DATA           �  COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal, kw_k_kantor, kw_penerima, kw_pemeriksa_p2, kw_k_s_intelijen, kw_k_b_fasilitas, kw_k_b_p2, kw_k_s_pf, kw_pemeriksa_dokumen, kw_k_b_pkc, kw_k_s_pkc, kw_pemeriksa_pkc, progress, perusahaan) FROM stdin;
    public          postgres    false    237   �/      /          0    24046    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    238   U0      0          0    24050    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    239   1      1          0    24054    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    240   Z1      2          0    24058    sub_jenis_layanan 
   TABLE DATA           W   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan, pengawas) FROM stdin;
    public          postgres    false    241   �1      9           0    0    data_perusahaan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 500, false);
          public          postgres    false    203            :           0    0    data_pribadi_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 501, true);
          public          postgres    false    204            ;           0    0    dokumen_proses_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 283, true);
          public          postgres    false    205            <           0    0    jenis_dokumen_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 1, false);
          public          postgres    false    206            =           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 28, true);
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
          public          postgres    false    221            L           0    0    user_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.user_id_seq', 501, true);
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
       public          postgres    false    223    234    3169            v           2606    24130 .   data_perusahaan data_perusahaan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kabupaten_fkey;
       public          postgres    false    235    3171    223            w           2606    24135 .   data_perusahaan data_perusahaan_kecamatan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kecamatan_fkey FOREIGN KEY (kecamatan) REFERENCES public.kecamatan(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kecamatan_fkey;
       public          postgres    false    223    236    3173            x           2606    24140 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    3179    223    239            y           2606    24145 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    228    224    3157            z           2606    24150 "   dokumen dokumen_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 L   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_jenis_dokumen_fkey;
       public          postgres    false    3153    226    225            {           2606    24155    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    237    225    3175            |           2606    24160    dokumen dokumen_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_pemohon_fkey;
       public          postgres    false    225    222    3147            }           2606    24165 %   jenis_dokumen jenis_dokumen_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_role_fkey;
       public          postgres    false    226    238    3177            ~           2606    24170 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    227    234    3169                       2606    24175 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    229    227    3155            �           2606    24180 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    229    232    3165            �           2606    24185 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    229    233    3167            �           2606    24190 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    3169    229    234            �           2606    24195 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    232    234    3169            �           2606    24200 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    234    3169    233            �           2606    24205 !   kabupaten kabupaten_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 K   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_j_lokasi_fkey;
       public          postgres    false    230    3161    235            �           2606    24210 "   kecamatan kecamatan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 L   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_kabupaten_fkey;
       public          postgres    false    235    3171    236            �           2606    24215    layanan layanan_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_lokasi_fkey;
       public          postgres    false    3161    237    230            �           2606    24220    layanan layanan_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemohon_fkey;
       public          postgres    false    3147    222    237            �           2606    24225     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    3183    237    241            �           2606    24230    layanan layanan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_status_fkey FOREIGN KEY (status) REFERENCES public.status_layanan(id);
 E   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_status_fkey;
       public          postgres    false    3181    237    240            �           2606    24235 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    3159    229    241            �           2606    24240 1   sub_jenis_layanan sub_jenis_layanan_pengawas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pengawas_fkey FOREIGN KEY (pengawas) REFERENCES public.jenis_pengawas(id);
 [   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pengawas_fkey;
       public          postgres    false    231    241    3163               �  x���]�W5Ư��U��M:�V����������|��~:ə�9�S�J�#��I��$�-W���֜�9:ݹ{���C{s���?/?��^}��''��?=���	g��V�K>3�8�wȠ$1���V�6۲�N&���y��$�����d��H4�5����B2A�۬�v�ͨdf���r?��V�[�P'��ɖ]r�I�Y�lms�����lLz'�W�9{��1�5�HIY�j4��#/rh2H���e6XуA���7��E�|z|����'�Ż�9ݺ����x����B~T4��)񨜥|"n���N���ȧs�x@*�}^)�w�e/lU��갨�u�����5�X��[?��[�q�c�QP��8Y"*��Yh�0O\��WYd�YР}���T�-�"����W�WA{"��aA8+��L�������U����S���e��J��{�."�\ubۍٱ����t�U�=U[X�.1מ��h��(	\�楿쎢&+�*��gh7���Ɋ�
4Ux�
�AƘET8�����b&+�*�*^ITefEV%�"��G�*����-�M�VtU���L��dEW�oS�1f̆q������X�h���*2ĺj�̊�*uM�6u��OMVtU����c��Ү�J�-� q��,��BWR1������$�ƒL�T2���$pa����DW��*P�d�Ɋ�jS���b��誹�.��e�7Y�U��8��誡�N�ڑ9j��t5_I�3�8����X�9"��f��+	�U�Y�-튮ty���ٰ̈�����x#��zL��a����:Z^v��9L�H�����i�N���es��b��XO�����Dx��'��S�Y��e�A#����j^����Ѷy��N��p$���U+	�ě#����o5����eƊ���+"g*aa�N-"�_�!~Y�g�2�� W����6��1,l�5ߵ���#>���UI�i.n��(�R�R���p䳖nźQz��4���چ�|Ojڶ̶�&h�5�;a���5��&���AkZ��s�mh���Y�m�ܠ�5�ݭ0n���ֈt�k�&�MZ�ЏT8��e�~��Eݴ�J˂n����\��io#�4�F�p�TL��@j�O�U�u�'�I�z,K�W�!4j���@��Yp���ճ��	CfAO�<�����i��Y����B����q`h,��Ϝ�̜f�*HL����wj�Z[�:��	Z�PX(z^ѥAV�D(,h.���(L*�f9N
�N�*ʾi_
��?%����l���"�XU�ބ����L̎4K�žcV,Ƽ2�&����x��p6�PX��r"���ÍE�~8�#a'(,�[��_�9U;;���0	^�"0��K&�%�\�I%����5a(,Aa5FV�$(L������aK�PX

ë9 Ca)8Oؐ&�3�Y�-�I���92`p��d��eQ4a(�}�3��չc�P|�n�}�Ѱ�P<|��qod��0��j�O�0ڰ����*X�F>���Qe}�3a(^>�^�eK��0��K	�5���G�k�6��>��J��G�K���~9�2O���> <}���2W����
���RϞv
��߲�$6��>��%��08�v"Y�ɚ��#x	�z��aI��G𜆤�w�������DF�M�0�0���Q�7}�������=V��ȞF
=�o�"."�=U�^{���H�ҋ1��di6M"�]$D�T���!��,O?�ޟ�çG�R�x1��̈́!8�\�d[M2a�V�<7�'��U��u��eǘ0DҴX��AK&�0���&�ض$-0�z�9�Ca��a�m�Þ�����rR'���g��xݱ�`�#x�u���&�����P�PX�4�H�
���0�p;"O�_������r��\�[���Ҁ3��*L/uv6�	�Q�A�/��	W�Z��jJ��q�p�2�[���#x��(˅1a�v��!� ��לkyN
�]a:��%9a(�w����V؄�0�Ɓ ���t���!z}cT<�!_ �7��ҫ�p�m��L:n��:�^��q�oxt�[j�r����"~���?v�i�M�4<gY����?�I�<A{�>y(֛�Z��9�PC��	�W�<j��Ag��sܚ>�������]��V"(M��(��<֢ �����3�1{�����0����� ��C��5������JCk0�y��W'ˍ���җ�w"��;
�ڰ�Í� �����3K8vcJZ�Q��2�]��mhM���G�th�#��=�3�|(�D�v�hk,,#w��Z�WqOl7œ�Zbp#����f�PK�/"�i=c��Z�������^����x�x{�Lc>i�%�q��!��2bxi-�ŋ����=K�a�{����ԝ{��Y�'�z�P2�9Af0��(@�8�ط��c�P���:��D�0Dӽ�w
|m�P���t�ز�n%H�{��N����`�s̺.�y��0��M.�7ymQ�HR�e���HR/��h���'��q3�l�V�l����N���(C$���;5YHr��;��Q�H��W�a��o�Q3D��͌���	C$��.:`QA���M��	Ca�? �8@$���?��x+]�^D��J�|cU񮲆�0��k���PX�����06|s���VT�0�͉Sn�$�	Caꛋc_-������FhY�i�Ba����Y`(L��Wqۃk��o.�MG�\�0���L�d��T(��k���ٙ�	Ca0�Y��m����P����7;��N�D��N���j�|K�U.����є|��QW9��x�O��� ���x��z�A��k�I�;���e��c<[M��7K�A�+�B���.��
!�������jPo���(���.c��ˎN�@��a�W4�aۨnɴ�m4�nZ|$�-�F�Z����]ؖ���N:��w��L7��@�8�����ΠC�ؼ����:�;��b7�t�Wz)a�讵��ɼB>���ň�A*����e���?H_V����99z&�*Ƀ�Z��p���t4Ԣ�s�%b�$�jQיU������AC-�v&2}An�P�>�
?L�{�+�IC-0�s���Tfl���_w��ǯ����N���D'����M�|�A�0��=wE&��,:m��r��l4����P*�_}m4����l烍�'���	\D�>��	��+jݮ3�Fg��EP�7*-
�����tl̑U���sK.�h̘龍���d5|��~��{ixo4�Z�9��������r���3�Zt�����n�������x�����{���{Ջ7�,����bH9�����=���U��4\�}��/^|��E�䧓��s��?�ϟ��~��������g�o_��zy>X������4'F^�)����?���|����_�����{�g7���$�ǅR��I<����u{��/��?�|��O�?�������X�LY^��_�[�����ˋ�?}�ݓ�n;�mG�������_=�!�ϟ�ߞb��ONx`�x�y�B�<	�����W�?[�������ow^]>��j�O	�KS*��9"��JcZi�{T�,��JbQ����99��D:%8W)�렖R�r	��˗_�t��ŏ����W���_�S9.>������ f9�             x��}�v�H��3�+�Tc�EQ���<�b[�d�EU��W�$I��y�R?�8x��DDf� HQ��5==勬KFfdĎ���7�{p��t�|���)�s���yA8�x8
N|��\�|^mFνx�$-�fq�Y,EQ
��v���йHw�����s�����ɯ:gbS�����_�7I�����+�X��07�O����e� 9q��#|����V���y�Y����&�eb��K>��������V��Ȥ8W�9_��	�p�Ob'��Q_s�-�f����g���r���"�9w�|U#@E� `'nr�]C�����0��|\�S�p6bn4b<y���N�a�b�e%J��X{�� E��g#�x�V���b:j�\�q+.���]�q>��#V��j]m�j}:�]0��;E'��(йx�]U�v��bUo&jV�Q�ƣ��|��^�r���~�����9[�Kg|�J���4w~�gK�	���o�ނ/�2]9w�Q�o׷'�����Gn�'(qr�\[#�8]�l�¹�께�UѨ�3���O�Jy�ש-v#�)&cpG��<G��i��ME���n����%�/��E<�\���3C����V�"�8Ĵ�f�̋� ��#$��D��]ZT��Z9t)�ܔ�P�4.�u���,��Z(:�5jz�8S�C8�e���R-Q;�\\�\��E�tA=��T���7���4(U2b,�`d�%U}8�\�RT�G@���])�T�)�x�t3����^�I��k݄M�Kc��G#����Yfk�$�|gQL�Xgp3�XCr%�N@xfX��%ɟa��s���ص6�uGK���hD9�J8��s���o+�Ĵ�)���-X K�����m4/���vj=�K�D�N�.we�$�Z��(c����x)�����RC>0:,�G��G�^wF�D���LJ��ܵ��YZ�T��b���X�b2�0cќ�T�!�=:w+�δ�`�'r�����ڹ�>s���d�k8������T?S&�(��2��R�a=�R,���$�ӳs< �'�a ����j�I?�]	�6˅q��z#R�$���޳c��ϕζ���6��V �*]��[�NA�8�]f+g���%ܚ���A�Ϟ!��`�a��b-:�N*�b�+7��КoS0o;����������y������ҹ�s�~��Ҹ^��n���zB��R�3�r[�;�1iS���e�o�x��\����E?}f϶z]A>�E6��b���bi��S�$� 9��`����ç'�i��܍��0��]b8�[�mW���}�s�~/�s��8�{�t���F��=�����g8D�ٛ̐#���h�{���Ɲ㎈xH���阱q��]��º��G������j����R�o,޵�Bh�_n�2B����J76g�7���ѿ�)Y�LY��)ěo%!��t�e:s��'0�p��z�������Y�:L���>��㫵>�ܦ #Z��Yex�Kp���|4�x�D�I�~�3nUD~���c���y��Jﯮ3�� Ā��n��� y�����ž�t+20��T���I+��p�c� q��I�'�0�9tP��� �6f� � ��=�Eݩ�Nqi���Bڦ&�Q�V�{����(\<
c#π`y����^"x�H[����3�u}�}�#r�_G�#�K :�!$umro�z������`��y��G٫�}2oD���^�qڸ�ȏ�i����}���,�����>��hqY���8�E֍*�ՁͿ�{��GU �X��M?�'��aU�t��q�gX&�D:�zC0����aDg{]��t������<�y��a����s�[^��L�7�?���ݿj��:�\��M|���y�ւ���|�p����z�`���'��ݸ�낍�J�D�m��
{;�E��#��v��k\�a�sl�ub�:�ý϶��U�' ��B��y�7�n���uSB`yTJ�#����󆤑us�p����{�^��'��u5/�^�!٤�}�o��[}-�[t�7�Z������N���j���W������xV� fr����R���� ��<������I�]�;d|���s��V�z�_�X��/��b�Jw;�.ۦ3��e���B^c��7kr�LC��I�s�6�'祊1,�k��uF!� s^`\Ði�
W��L19�I�rkX�"X*�!@q��J����m^��d�nF!2�!_N��� ��G��`�^} :J5�]<98J�;e�q8�|������"1�|ݘ������ a0�9�:�������0[���38����餭nA�7 �1ߐ�8n��Q�Lx�R6ЇO�˃ؠt-[���,'����N�4��i�,��+�n-Ǝ�bB ߲��)��e�$tE�V?lf��DW�W�Z��~ۅ���%z�e���C�*�[n .�[����H����s���k� :��ہ��Fj'D�!�č`:&������\2��(�ʈ�RvGz��]�.��z�� V���z$�s�u�@�wy�H��sϊ����`:��l����:wC�)Gp{%jD����!��R��Ob�)��@	�}����D��Ex��܃h�X.9��؋l�nv�yt��X�ҹ����=������(sH�w��:h��'��HlR���+���(lY4;�	3*�r�?ᾥ�}:{���c~`����� ��"�y��Ʈ_�/������%�p`�N��o��p|�\_X��_���G�l)}�D���U��0!g=^ ƻK�N5�@�$z�c?�g�o�%����
ix�S1���78�m��v�.+�>C���_KB��������*���P'Bd�ch�)���J��r��b�S�t�X <z ��R"��p�ّ�K���pa;�a��~c��(ְ��,^��|I�]���N�Ζ���`s[�`�]�4��G�m�#�Y������^�i X�*e!���;&�\e)�E�Jt!6��Е��BW^���ܻ�����5V[����z �Y`��� _��?h��k������}�B�z��zB}��0-H:�BE�����CB��Mj�Wh��jq��?d�
~,�<����fTp���\��ܚ(�>�4m�!�J"�$�x����7$+:)�Xf�[Cy<�n��!i9��\���f��1Mˁ�n;M�Y�08�r'Z)���ݠq:��A�ՐJ�l
x�p�"L�1�y8�A�f&��+�=%�d��� g[s! �n��>�;�<_�Xg��̕{r�=1��)Ҽ��$ɍ�����Y�]� �!ה"�Rl�G9�!�bV��bb��a[���
���oNc)�Y(�x�!����:�f��g��4��F��%p�mJY�(�nQ���-\&
\����ed\��ϰ�K����d�SE9�W��@>��scM+k�La�<o5\���y ����B~��sa���M@��Y����Dd��4�{2|v]4��ڷ���K-������*�t��o�( �n�ڽ��Ɛ�l��*�B%&̯�?���S8�Xvu|!�:���$X�#��:?�W�z� �5�lؘ`V��]�Aq@�����G�]��+�B���aӇ㱦����1���)��)�i�a�#���{���2�xSYh�u3Ha�`��~��V��;	��z�;7�n���]}(��*iw&����5��n�e�GP%,n���Ȍ/sh�n6��+�gӢ�� >G��1�0�v���Yئ:H*:ny��_s��j���9�=�.&i�L��u�d��cD.� QN��KP�@�Y���"I��7���q7�Ggt����ɥð�kȵ�1ux��^����	���(Y�����)P�Vn�1_��[�(t�:�c50E��nx
��eL?�򹚡�o��3�Ճw�{U�Iȑ��$��L��!�)�� _�n*3�ۦ    ���d�E��}:+��6���E�n�	��%���f;�3U7�1]g3��YOaH�"H������ꏍ��¼e�HlL�q��gχ�wQ���ϋ���/��x�����ٹ{DdeT�$kEӵ��>m���*�N]m9�!m����1Z6�{�ŕ�Ę���~��z���vUǡ�⚺����l�;�O�����$���
�L�% �MٰԚO?�Z��(��+��f���������{�R�J�0V�s��g�z%bH��aH�a;�6vm��K�;�K5�O�V�o���k˴�����&Ah�8b	�v��nW�M���.�&aL)�N��z���L<�(I��CF��jZ�wes���UW�2�ԋM|*��7f*0&r��J���:x�nmәx�_W�Գ������;^`��L='��p-	(\T3�~���u^�f":��f����kX;�>{l���o��$��x�j%�Y�����?�$.g��l��,����q�_���5E��
�JL�.��T8n�xޥ3��j3�-��[p�uj�;��~$f:!c.���fݥ�0�+ž
�M�ZnEY��y���B+[�x�g�NK 7a�6ð��'��ʯ����Sq���2����>N����x1� �~y11�U2���wG;9t�} �W��M���4])[
^p����A�E�r2)���#�<�,�v������h���`�^3����f�@n֦T��U��v{�کN�r����6����W��98gop����>����=f��2�G�S�D�T�x ��F8����9@)� �Ii�w�_8�(;u^��iy�˻I��Q'�7@[�_�%M�B�����h�a,��"��c����9�2E���p�9�Li]W��pM��0E���m�`����c�ba;�?��G0p���|���<$�N]~|�x�h�)D����ڃ/����n�b�1Hx�Mq!�ߌ�=���յ=�g$���7�oO"Ӌх��^u�y�z�jhq���Ҳ�b=��^VJ�Qh<�^#���vb��l����>U*,�Z�N��Y���*���;���K���jjܻ�&���t>iZp�tw�sa���� �gs��2ؒ@X�AhJڃ�Yٞ�"�Ύ�|-��%]�Fs� t>b'i�sU����?0D�Q��C�����<\;�!�H��_TJ�{�TI����E~��Y�)�s)�� p��r����"���{I~m�FMz4�]��8<�m0;�e�W
·��t�ua�����l�P4��9 �V����G���U�,�|�aZXg�%�-�c �r�8�}f֗_�)�OkSQ]�#cF��DgX�?`^��Z/�V^�@���SQ�I)��A�z:D�+�/跮�%	YT���r�)5������H�M�ks����kG��!~'�r�n�Nr�~�fNM/�j��y#;`$�e�(�l�d>�܏���rI*B�~������|����w����duݚʈr|�}W�?ᰲ�r��n�M)��2�OEZ,�nK���w��nn��6ud�Z���H�jL��c���$�\?�K5s.1��L�8���	Ʋ�78�!d5�5�`^I��J7�(%��6���+T� HjS
dU�~;w��~�Vk�,R�o{;/���%�PQ�n3:S7EWzX�����Ѳ#�G҆�n�2��bU��<�^�.��x�á��O�o�-���k�ěᔔF�F��{�B����ԸKZ�r���k'��ql�*(���� �Jc� �Y��U��!����J�[1I�\G��|���J�Op �U�P�F^�|;��]}�rK���#X���h�+�$���|�}�\��C#c=͍��7WPs��@�)�\-;���Z����g	D/��dV��lF�T-�G�xĤ�.�ˬ�'�êuN]�������b�2�+�fh���>ݙ9�0��Be(�{T��np�HM����6�e���x��� <V����=�`���ozC>X�hR�uZ�&�V��(u�0�.�A��5-Thv09��*�mo:)�y��A���&��osLF`o�9�$#�	<�tZP2_��0�$�<��ûק��~��KK�(�P��>�F�v�?Ig��;;3�)��|z�����F���D��;WSd�tf]E�\	R:����%v�!.:�4Z#�����N�?xʋ�n�`����Ta?�gG�gA��(�>�Z��OH��-/�!b��Lr$ź��S��-���2���{&5�JxY�|5B�o��Ib
�ҿD�"���M��J"Dw>H"�m�a0�q�>On7z{��8*�(�Qܓ�)�LN�!�ϕ��N��z��#@խ����RNL�W��eÿ�D��]C��5�܏;v/��@�ʹ�<�3�嬇�61�'���CY�$�^E�j>�)L/�A�2�2`�;��&Z�	:�3����4m�3�!`�mH��#unw���ў�����G�]��������i��i��ĳ�|!��o]*Id'����k��V.bU�ׅ�}Y�p���r�љ#ǃ�k�,"���%�S�Z\ޘ���Q+F���ʄ�{l�����Lq��ѓ�;�(�\�s�z��������!2��r35�N��=��fX��@�E^W%��Z���+�ب�}3��wZ�*.	�|�D�q.
�*��������I��ɺC�Ćb�:�����y-�Z5�����b^�u��M���W���;���#'� A�ܺ���y�vg��ȵ�@�(��b��&��$K{f	�C�@�t�m�p���L���3��:�u���	�G�×~q��"}�����[��>p���aQS��!�����@m�d�ƃ��H�J���
�e/�MJ-S�#;���Z<��&{���8��1]5����I�h�a�1W�l'�R�\���i�ԁn*���pٰΒ����G�l�G�:�9yTQ�����f2�v{V{����E[S��B�% (��lRW�6�a��͹����������e���B�>�HL���UA&�-󅳜�������,���d��,�l�n𞩒x&6����6�c���Tw�Fn|h�d��	������8R�����L�#�q���_��b\g�S�U ��N�}��o�o��٪��mr����20����#\��r�*�
����bud�Q:�
�r�4u�,�I����0^�ڬqI�@#a�]���,��/if��51�q8o�D�α^�Ѕev�ѐ��X��}��a��<_b|-`b��,�-|{!P��'�+��A���I�yq�p��
´fȭl2������T�b����L�u_��h\j��0	:J�YV�D��0�m��i�"NwE�،�7�1'�U�r�'����B������~��՜(�c=����kL^H*`�K4��ܥ��K�ԗjU
����ee��4�ɭ\~(��B����I4uqG�i��)��&�-s�}#��EUcYp����>4[7�qU�bZ8T4�j�܃?�-Y�DKlr|����[c�����2���_�����v�]����A`Y���ʪ:i*�9_�8�)K�"���tv�"}���S!_���]5�k(i�\<�a������Ƞz8��Ս.�"\��գS�tā^og�}d�)�2�|/$��n�6�=�(c\έ���L/����.���j�ߤ#����B�I����%xY=�Q�|���y���\dmE�Xj����:&�D����,.���awAS��E�k�uOU'���Eq�J��ZSK�3C�d!�5�J�~ۀ��(>���&3	>��$ 0v�`�GD[U۲��M;q�K��=�fϪ�r�)�#)0��~�P��
���ߞb���������H��< r�X�ew a�b��Y�[�,��hk|Zm��� �E�i��+�^?���wVpY��ץ6���N�Ɍ�T<�R�Q��G#�`���9�C�3�R�P�5���P��=C�Q?    ��>*S�]ŽQl� �I��'f���n���#�č��/nmN$���O�?�M�����9b#�����o�5�|�/�uT�]����)�9?��B�ő�R=��uɳ�M��W���g������k��)Q]v�sdJe���[q�l������6v�i�J�b����u�m 3H9�6�~����|�!��I}(��l�Lh�D���9��7A��2*O Xd��r��� ٮ��a��.��!3��RQM�}�� �'Ƞ�߲"��O��Y�h�t��3/��2&3�C�*80^��Y���݄��O�y\`�]���$��6�F��l'r�l;t��C�6�:�hE�ܽ�Q�η�!�H8I�N�}�v���|�*ryq���������6����f����dFb����s�B!�J�����,Q)X��8NK�Qu����H}�k�����r��iZuz�CĻ��ju�ip��h1�uE���F��5������|L��C�Jtd���\j�euM�U<�j@(��z�F����F&�����x��W�7��{b��E�-��q\�N��c�L���
��ox9 @�����+)��:_!����F�$Jh��:�kq�����l-D��MiB�]�ϫY�kmA�� �m�,n��~�/�Hc�Z�F�>#3��Ѷ��H��0�"|p�l8y$�@84�s)!^`n`�qzR8��Gp�d�p���f½�eec�Z�"�u��P ZT���6Һ�^H����76:s�^��z\�uk$> �T��FD�g�z@�����6?��ֈ���Ar��
�_��������n��y)7������U.�'e��$�#.Ǿ�1�P��=��B�*6����n��q�V���x,s,=zY����Ҵ~�EF"Fv��G3�j/�����u14Ng��5���;����q�h8Q���5<P��=�K�,����;������[�21��m�"C���BDPa�=G�{p�=�f(�lH��r ��v0Gl��$�7bq'�ٗ��t�X��Pv�}L�$T]-8���F&Q]R:��Zl�4�B�jʨ���g�Y�Ǖ��aIW��`���h��vn0�)(=S]r��ܧv��A��I�pN��IMX����=B�F���;ђ��
~���`b|��u�J�Cj&њ�A`�SoL�-�Q`�O�G�{+Y��:(�7I��1x��>0�����V�\x�R����2�S����>;�'m������gSP��V�s^�m����9�&X��^��"5�)�f�\�j�5���f����G���U�(�l'�4�0����'Z��sS-b�ꓢ���!e�E�����'��f�7ƈ�=SL���A��8��U�粅���-{�c�V�-.��I�j&�	�p�S_��)��\��R��ja�H/�F��tZ.��_'Skچ^�ɽ��.�'�s��!:$�L�fa�����U^�`���X���o)�
d�,ʘ���p��FB�Ꮌ4UgmT/�|���W͖�%�A"DR}0 s�{F ��l����+�j=͐ �>��{�5��n;3s=�d�Y�'3�@� �ob�i$[�,Ҽ���y�ˆ�߱��r*yC��;��kS�:��&��ѡȽ\�ފ"�&��E*42����.��oze`���|�R�F�	!p�ym��[�#S�_I�|��Z���4L�)����z[�E�K�.��#��MM�p�݋���h���i1<0������Ռ��yMO���֕�_�	{�u�a���W�.���]^*�,q�њ.���4i����ˌv(�CV�L6���1s~o�	x4)�gn{�M+j�M4��p7�	~s��"K�c+�._����Gu��_�<G����]^2 t��<��U�r�ʌ��(�-`fJ�%��фue�͍R7�Zw1�$��Y������7[���:\����QU��X/>1�aM��fh��-���gX�|T4���AP�X`)Z˱_z��� ��tOki�''_��e[4�?W�g՜�˯ c�`�=����Y��skљ����О�kJA�kJ�hr�1�1�PC��zx1�;oHگ�G'����L�7����䁚O�:Q�j�G���>-�6M�H���e�B��ye�ǧ_^u�;Ƥ*ɮfU��Œ�>�s�ɘrdZ��e�"��\���3�SlQQm���M�e��u[V��_���
���̔H7)�A�'j�{C��#�?��_ӕ�ߩ�N|��ĸ�8��7���/�:>ب�^3Ji:����ZQ�zx���j�i��cd��p2z���~��~�!ŧV���eo?G����_��$ۊ�*̲]���Jr��8�ٟP�V���.c��,�3�p��p~�����#���>	�B�Hr���4�娣X
r���kf\HC��M75^���Kf�j�^�9m�X�0�"�:2('�|ԁ��/��'� J� c����;�E�t"6�]W�(���G�ͤ�sxG��yc�>ے�O|(��� }5U���@4d�
�|�I���R'��bHC��R[�֣�������JL���V� 1��H�I�x�0\��W�G�=/+�z�#�fP���z��k���Z��@�S�b'�ÛJ���ﭘ	l��Wv!�b��-�}�	<=|]����|� ��q��,�Us5gr#��I<���ᇱ��k9��B�\���岤��i^� i%G��$�J�*�ֆ��Q3�W�`Z�ӱ63�EK���&Xw��Z;3��+�!�6mƿ�y��>�U��t��o�ߜ���ƳZʸl�Bۄ�+��^���v���{@E/�A���0�����`�h��b���ֆq&� &i���V
d�a�c�5��q�f�����i/�d�}����,��JpT��-hh6C���4p�<����[��o���o�\�^�0�����'g��Bl|�-��'dS��mGf��p>mH��A���q^�����>Hx1`h��d,�?�87$Gz#*�uӒ�V�
�d�qO�S�g�����W�}���T�n��#�Â���Z�X��ߑ�����~���y���ŕV������CZd��(J�c
�M�S0P5�Y?�s(��ep�F������3yޕ�"�"�F�{�ݏ���S�m$x������H1ޟಪk*A������� �wU�K�����:iL��b5��=�(t�����N��*y��7�Y�}�V��r���G�����4a�J�4�ܑ��#�({�NA�I�r����T(���q��mc���r#r���㳚H%�|E{�X�y�7<�'�(�Q;�XV;j���y`ͦm�ֶR2�P��430������^�ϭ�����,Y~��}��"����|ۖB=��ƝU�%�̊�1\b*�[*�y� rw ����M�YRjBVQ�b�m�
�9PJ����S#��\�-,Y�	�g�2�{2d�m�SKc����yH���i���B��x � [�됙��eH�b�����J�a��?�F��oDe��^���n������[���ΈӨ.��ߌ�8��?���������
�7���ǟ�_?^�_��G�Ƿ����׏_o 4��������l����&м�^8ww�glc�մ]�L��?qT�b�bqz�&fm��s�|�kТ��E��K��=�3��H}l�^�=�s�����|���\�=-J��	"��ll)�����ղ@:*�Q��Ud��)��z��9����oS��������9�]�^���5Ǡ�+���M��+�U��@�V^v��S��t��YS�8�g��~�y�>e`��n��c���k��6�X��]��h@p�&9������[V' o�3�ss&�;L�m��x���N���5��0SZ�yZK��'ܧ;���������c�'u�[/I�X��i��$�8s�L�MU`)rU��*'y��X���s�n*|��'f�'��t��md�dc��������6�M!=�ccZX�ꎑaNw�
�U·�m�G�����u�8���tk89ř�=� \  ����b�'F����iR��$��`t���+90u;�|j?��WR`�j�Y���m��5ю�T����\�˛�ٯ谮�\|�r9�#����������{@�7#��O����_}�i\�#}��t
^v�4:�f�-!�[�5���U:	�=�hS�����es�Py,���{�|�=j�1���/2�e�S��V/I*6�ՙ0�k����0	{r+8��Z��w�p�w7g���ܗ��֜�vq���=	t�X.]R"8&Y�C9w�[Z��_��Jg��*��Fk
����Tv9�ˀI�Ӡw����Hk�j�qP����T|�)��|��o㑹`���N�W����z�\�4e;@=���]��d����@��Dr9��6-�/����xT����d��~�K�r�Ȗj��EUdz0�[��n�5$ŏ}�dC��~�fݲ��]
��56�(QM���)E�����<��;]�u(1�x��Ԓq�9��l�iv`'��?��Ӭ�����a�#O�2C���I�v��P�;�`�pwe>��=���B8�V�U�:%5c�������0S���|&m�"��8rlMυ��Y�8���u�!k��5.�{b�53|�(_�>x7d�/K����R�'Ǒ��iV���u�Ν�<_bZ�+��Y�ϳt�"���/�<��b P3|�.�8��phƢ���Y��5p�s��/2%��s'��gԈTC�]�]�&8���5�cR-�G;�˩4���Є#�������3���̭�;	�[����?pǳ�Y�ۊ��3�*�{��{ܗ�V75���Y.ۓ����]����<�}}��v�Qm���"sq�F�X`ϓ�����Α?�W¤G�!?���DhϕYTO�Ҟ�y��#è#D�;�-���'�{]�t��6Y<:�h�����C2'�R�����������DGc��S��$����5��a��|�SI�t�ֵbvO����W�G�v�a��,�	{�H����:L�����0=,��F�'�i:s���9��Щ}W���s���;���e��W���gr4M�)�xI��m���V ����'B����6'��z�O�������q�䘮yQVČ)��b���a�#2!�z�E�թN��z6F8O.Wk�xp��_:k�pXl��m2�=�^B��;:���0]Ju�h@g�Z`}�D�O������60M����dO��J��:v%�����M��S�<E(��V�U\�,W���6���㷤y#W��dM��!f���p�5o!b�|o� �����'�M�~��φx,h��� (��V[�s�ܰQ|�4�A���6��_���zDfiD���o������2�E�E�#S��M����z1������ͣ�����j,���n�V��iC㶓d� �9����>�Jl�Oz �$���R��V���"����#��8����XzB��Z��=��c�=2�������x!�ӠgO}�B6{j���Is}�5Cb�V�征���L0��>��!޴{|����8?��5w��ӁV`9�������ON��#���:�104�O�'�zs3��m	�{�K��@�OSm�NOz�V*�r�v�|��r����lA��+-B+� �bѦ� *�^����v�a39�!�O볆�]x�\�k���TN���ys�<���#pA=|D�h���R��)tw�Y*��`_�U��1����+j��<9�����B|H��IB~��K�oZș�5�'=pt`+�ۗ�m#�H�Uɂ���+�����}�]/N6B�6�>#bo��X�t`��ʁPr躚Ȋ͸Z%y>��7ۨN��:���Z2��E��ޞ��{̯�2qr�-6{�
n��j(���F�����uV�r�bG�h��QTbw���Xy�x]��*�xr �PW�n!�O����K!Xn�=]n�һ�ῃL.��D��=ނ��{ײ�z�36�|�����#b����r|q�\ �6��<5�F%�d������H^Ч�^�/$z,o���<@��x��=�@�s�'~�D��QIH�b��Q����f�9�I>�-;>�{ n˴N0y_ǔ6۱T�T���ȡ_	�뎂�$�f��{:�ʄx�����X���M��~�D�t��A�H/	��� E��o�j���4�߰��B	�r����(����*��ߡ�Af*R{�:���t�P��.��<f�\j� !*�Nt�a��XM��s4�� ��{vڮ8zr�>�"�����8�go��G��hM��t��4�H��I>���JXy��C*������B������o0:�,^�lr䨥I6�Ň�X�Pmw���#���V��>P��M�^9���6Q��gvVONU�C	��vBY��b�4^U���;��b�VZ͉7f�7A������&3E�zɓs�&�l��V+�ס0�/(Dm�2.jBYjʴ�7&ὉTfl��׷C OMN�B�N���;�d)#�$`�L��/�9H|O����j��^�	hY��� ��e�� E�ү2F�i�@�
�ut"��̹g�E���E1{�X+Z����m!�'��^���6�.�zOr����[]�	\|u�����'���r�Ξ��1�չ��m.���=K��������y^['q��).�d�ی��>��I�f�6��C�`��|�|����l�������15d؛F�<�#݁,�|��i$��'M�q"�u/w�w�	�gkw�{rn�C��MV�=V����jZ� �z�9�:�[���d�QqmH/�=@\>E�/��LU�E�����ހ]��za_��.�-u��	�P������7���NE�L�V��ic2x�J4�p���[���*{�'���f·�=ֽ�~����̙�e��"]l�y�4q�t�Rm��'g%��ǽ��}��u�Ȣ+V��f��b�k��X�Z�z�NӚ�Q�G��N2�)	�R�]�f,��i6��!�wc�(�� b�Ǒ�-B"���G"iN��_@�7�j���Ta1v�c�p�L��*�ɧ�����ɮ��C4V/G�ȑyE�1�[�o qa�\���fS݁�����G!�1�Vy���.����` �XJ�����9��7V?��;B��|�1b{/�1�0���G��#'��q}��Q%΁i����6��k���vm|\L;f�{"��aO����ۧz������z��a%1�b���G�Rc�·���:{��V�W瓾�Ƿ#����l�h��9�?������O�\P��#���,F��t�>u,��{QO����gP�]�(ʵ(��� ���5�-��u���m�A�7_w�a���q?�'U!ߍ�3*�0�q��E�Ք�3�Ŀ	|����pz�2[u_b�%9S���9z������e�.� =�;��$ݖ�:
���'ui�}�}������c~ ��Q0(���e�S�ٷ��\��~ï)�~1��3��>�!|1׋o�;"XF��~��jwi	�[>%.�ˏ�cW���	�T��D����$��v��8
c���{���[���a ���W�w.�����Њas�b���Õ	�_��z��/����c��0�`�ퟣ���o���1*      !      x��]�v۸�}F��o��1��<9��N��Nw�j�� �aQ��C|�/��u�V@�v�D�$h���XE
5�ؠfE~hZ�eE�i:�i��C��7�E�󩁟�	�yn�g�]3ろ��_����uQ��/yj��3��kI��
��.p�Zol6�6�s�<.�D��Y�� m�i�D]&�J�:��Z��|��D��9o�w�ïdH�/-���~y��?%���������e<Nr����ƧR���rV�|>.bz��iYkß?��OI�͹z|�&Y���!��a�O|㱡�E��e�R�)/�`%4]�^�ǝ���4��q3k�/@������BT��7��@Pd��C��ኰI9_oث�j�.�k^ިS僴��B״�N[�Λ�Ɍ��g�4�M�D�D��m�"vV��<]6�0>��8�),V���mG��W��{�-�]�|\
x�Q�+x8Rf�o���-�,vV\�|�c��db2>�`y�Ǯ�I�@�W����r�a2/Q�TI����Q������+�z[�X.{�����I�^椽$�8@dK��
=�q�Ϝ����ϖ��ι��^sf��?����n�$٫���{7E9��
>���1�����Dd�l�4����bZ�]������d���L��к3~�a��Fp��y,�/�urU�F�����hΫ:)G�q2�G#���c,v� ���Na|jʼ����@xCP����S��ߴ�� �g������'|�ƍ�g�����t��7��H)�Mb���xY�ˢV7<#��?�]��WaaZ���<_��y�VLUdI]ͧ<�w$2#0 Z۵�_NNN4��Uf0��zIFn�4�#v�F�y�}�M�2�����)<n�?��\,x)���D�I�'?�?�W'�����e1!�����t��z�O�KaՈ��&�J�L����F�`K'�BvQ����(�p���{�Չ�������h��"�qR��J?
���G1���ɀ�|�\�h��0�p�e�J	���3�%��f�������� o�]4`!��{�S��!��M�\��7^3�h�cXzʁ(zE]��f�l�<��ˢ*�eu��Nu���}��
�ϒ��4U��o1�!>��O��RCR������Ӯy�c�Q�Yx�������T�ώ���
ޖLY��:Ո���XLU7�T�6�������NFU��fVCz�ˤ��)ʉ�݉u��E�<� ���ǂ�a��Li�Qhb%�ՙ �X��i+��şN{f��De?�g��mVR�����2>%���d����h*cx#`��|�M�Yۿ}��N��=ŗ��1lShp/����6`M#�#tr��^912 �I՞�~V�N����e|��@�XTJ7(��2O�R��G�琗s����?`�+��3��l��]�U�X����q��f�(+ҌV��ǊԈŀ]���yY+Kҡ�kk��=���{R!�!��.�����D'�"�Y�|Sdb����U���R�}�_zi��C2�s�^��hb�y��_�`Yz�}����5��b'�V��`DA�PCL��������D�&�<G���)�RZ-������ш9�d�DT���c���{�ꨛRH6-�T�H�@��/r� fm�Y	;�/=�^�ţ�d��F������J���eĕL1eD{`DG��t
&G�����X3E�^Bd�6�rz{	:�`Q�0oS���2,QU�$�n�ЗN;�L�L�lH�
�&�S���l�l�T��6�W|���Ղ������ʄ�b�n�q�E��o2.��6���ȩ��@�b�f�@&IPF?@����ދ7��(Ǭн�Xc�ȧE*SW��=����(�l?)s'5�$��h��M3��5�3壛w���&3Κ\�Ծُ��O��A�}��1V卹��T����<��c ��/�1t*N!O�p)r>U� �����0�p/�F
��.�a�H�nwD�.`˖<_��_�/�\" _*O8y����H�'���=r֭�a�S�P˲�ǫ��O�0)��4d����?^A�@�V��X��g��I�&��#��zX����.a�Z�ʹ�)�a>����>�K}d���sub�e�<O*�)ѐd��KJ�Hѥ�^.�V[�aV��-2i����Mhu�Y�����)��"�S�9������z^Z	g�����*�/E��Z@�A��ϴ�А����ƾ����*Z���jv�GpA����8K�f4��/��Z��A���@�����[bM�q��Ԣ��E,��uj%���A�`�9�|�ԔnUcS�lo)�ˈ�m6�����*��f�c�N�����@�5�$��q��(�B�"|���tڮ
2%u��*�~�Z��_����<����e��-�c�[C�Ϧ��g?K�������)v����4MX�� ���6��N��R��c�Ċ93q���J�.y��M�\�SPK���>�9�U�g�i#~��{���j�r� s)1�c���8����� djO�x��l��V��@#.��$�dуi:f�
5�j���"F+ �d>F���n��� �&��*̷��TZ�Z�Ŏx]Ԉ�p�
&`�Ȭ��\�)Q󛌧m������ќv�zU���i��,�����!r�e��T�`˴2t��)0�B����\��A,�����Ҝ�]$pU�l)�9;�tiN�*Qz5�62��# ˮ�����p���-�z�M�B;pt#�]<J�IS�,˔�R���]���lZH �Qd�ps��j��*C�މ�˵U�˴�	>��;/�ڧb)��� �ӡ�9�.�ْ_�೏isg�5��&���8��U��������ϢTH]!��z����Pԅq7�b}��
 ��W��y욽S�_75���8�|k�cĆ	����L,ҶL�6I��k�U��N�����KbQ��]��y��	�hΏ��o�Au#�nX��[��56���˦RA�ȵ,�_u�>`�U�w�ɜ�;��`��V�<�9.�=y�;Y��Q���:\��#,��LUI�9#�g�kc(Uڂ�ue�;q-z���}�D���,�&��AK1�KU���8�[��\!y���]�!d������VY-��	�}#�W(Oqb|RwDd�Ƀ�'�7�'���r
��	�ޙ��[����T�rcj��v�MB�r���6U�<���c>�e� ����R�}�t�ѭ]0�|�(�~Q,�Voy�1�e�g ��l���EMi�<0�]�;lx�Y"-[=��aK��k�j�3<p��Nl�h0��Q��E����uv�J��sO~��f��ξ���;�����;^�D���A)���l���<F�L�R�d�{�7T�_sQKAt�=,��	�10��2�`n��΁��X�<X��B[���i﬽z�$��Į����z1*a�d�;[�`:�ܬn�U{1W*:!0`�5����M��L�r���L1F����Nh ����}a�Gh�б��� ������<�����c %�2!�\�����B�ZCvE���BN� ��a#Z�h�Mi�J\�T�y�cuH<�o'���\OR��_�+�-{ł���b'�LBLe��k����,�Y������6;��=� ���C��G��bC�K$t�W�6��Jl�H6\��T		�w�e�"kRp����&#E&��Pf�𱳈�p8������mb���S�����0`�yY���X�!�B�B�=�]MH�B��㋸�SO�u)�J0Z�\�QM"�7r�[�x����m�U��/���L���e�"�H3�j%J�K�apb���I�2Ej!V�6)҇i�ِ�W!	wrk+5�><̂�F(�󪙵���9�Op�H�L���:�e^��4x�o/́�>f�5����X�sp�F�����3;�~fc9�C�rE؉�6�uf!`�zf��uH�t���>;b�Ax��G.fL����	�p�P�'�2�B�q�P���ѕ	x�� �  �s�	��ܸ(*��	����
��@t\�p��X	\55TzTw3Ȇ�{^|���<��!![e��N���y3�ϋf��y4�DiAÛ�X��\%� ''Y����:�����遟_�Ii&�� �ThR�w��e�4f�g�{f@]V�=n[�,o�w�&Ɓ�A�`��y�;!"�KdK���{ޡ<d,(<�N�S�K����ɭu��E���I�uٝMޖ�I��m�-��6��糴lr�Xe"[�Jja�ܡ�bC�����2�c��W#���6����Rq�@���J��~���x �A�eyY:Y^w�v�Z��L bе,������޽C�G�GM�=,�J�����x�t�z.��n:�y�k�B5�pp$	/F��:c@U��E.�/h��"ƅ�n
�d��A�����3^�B��Q�޶Bp)`�3$����J7���yz������2,cD��)G��\A���}Ȟ�L�&͊�oh�1_AU���湋Ys�"޲H_���a�j���K�Eg�n{h�ߧ��x%nk,�슱dmղ�w�i����Z�^ٱ�`�u��6��#�����ߘ���!�œ�x���W����(n���LZO�Y���$@s/=6��LU���5倶`3��Φ��f/�|6��J {��E�������L��9%���V߉@U��aJ�B�/�4�E�p$��^�=G/Vߋ%t�cA�O)B�ˍ�<y�^��!Ǥ9��J���.�}�Р=%�%��{�D��@�|�����8I����	z�"s@Y��n�6��u{�4�%��onhPGH!��hM�q�'����	ZM	���4��c�&�U
��t�<X2��}O���k�=O��*���[p,@�SL2%(ᦠ��9�}����pv���(
=�	�e��
�����>M�yD3��%o��D�5�gK\���к����J-coݧ���6��*��0:tM��>N]����4�^L��NmZ��M�Zͧ������J��F�\��7U��&#��H�����Y�hS^mzS�<5+�(ʛD!i�&z�`}y��M��a�r=_'L�\��Fo>� k(T8iZ�d����@?��� �Q���V"�n���Jg�� �O���* ���?{��\�.,/k�5�-%�(]�d�D���J ��[B�8��B ����b�� M��\��<�+P�Rn��2�n��H%��X�ݢڿy���kQ`�!��L�v��,���eG�z�%��A3ѵp����{_{]%N>�(&�������~/�}�z�H�N4��:���4I`e.�n�P/���� ��˗ೈ]an����!<`&&��	�Ia�F[(��Ey�
8{k|-�X�>Ld�U۞�zǷ���r$�YS-�d�g�
��5������b�f��5���!��V�%���^<8�&�w{c.��� R6si���m���b�eb�HR]LЦ���8�L<��I�Z����^�x�
"���s��Y��uj^5&���8l��n�V���r��Ŝ���9��q���ma��>dm�*H�?��E���ʤ�������GZD\9ʊ2A ê�|�W�b>��V�&�w� ���ͪ�4�ԥ�)��Ff�D�r��UͿ��]���۪�ޔt�����"��j�T�Ao�n��t������8mҦ��&�(j��xޔ��7l�H��{f�Eg�
�a^�/2�&�ejI�Ǩ_շ�'%F�j�§x� <��Zʉ7�1�T��Hp������b�؉P(B�����Mx��&��p�U*��mNZs����,D\�:�#1�&Be,��ֆ����g�mX��ն��KAK�	��J�% ���UGVO�q:����a)��n���s���=�4f�a_y��0���)ZUck.��紈�.�X���F5��8ZxU�C!�'aS�}�Y�������&ܦ^�C�Ͼ�� r�X�D����n�ۦH�!6`�\�K��b�w)����۟��_��n��F��vk�8�eF[i��u�Yd�(�,28��|a|�c<�6V�QK�Ű6{w���qla`�UI�A�Ϳ�s.��WŜY���׸��R$��y;N�]*�)Ʌ}p���/�k�֝�LY��dB��@�Χ����D�oߕ�F�x����{��{^�]F�a���o%�\�Zz��y������+bM�Cہj_���8��8�8[@���Z>7����B�����f�փt�6Do8��8���W~��Lq������0�q�5��6��S?�����]�.����&��vIi�-/gɿ�1[Ut=�p���-�&Q���g'>�$J�ʥ����|IX%�~�p��i�=l�#rِJ~�y�;iQ�9>H�:��@�#��\�M�k1�ԗ%��#��د���� e>{_T7p,ͨ[c��ʁz��KZ���7�D٥42O�W�K�y�G\(g��)��oKpek��ק*b"�0�%h76�ۣ�2��8o�Te�6cQI�Q��5�YHhw�MkR�Xy���C�9��t�ܥ�&$?ƹ��$~�����#�r�QQ�(���E�3t�p6,p�:��-��o�t�jy`=b��;A0�U��Q�\����|p�T|0���4֘z�}��%2W�8��I�G�������
� �;��ɧH����Ⴜ�9���/�CF5$ɲ��:bw��Z_Z\�v���6�lF�/�d�ͼ��{�� �h��b>.(a�ݶ����U_���6;M��F��b�/��iG�)�E���f������P��Х��>D�|�ax�����gu%�(`.��#�
���՘#�����?�w�dJmv(j��0�{gx�l/�� ЄN��BC���	�
�XUlh�'�>���ԣ�_q�s�[���)�x6�0_.P�r�Aʩ�ԕ����Մ���VX�|JA}��i�OgR]������3�P�.<��	Β�Y+0�����l��<�朆 r�1�7:),ݾ�"�T1�"�u���9nƲ���^�aV�6��e^%�.��6l<���cѲ�X��0f�o���f@��ޫ�~��x�w���9��(�4J"S)觃����b�ڎ����>%n�x˵6H��!y৊1������G����M�${�{7E9�wx�_�0��7N�&"K��V�&�h�O�ў�>'�1X,*�q�v�w���CvY�q�_1v�@rm�sV'�������ϓ��_����ֻ�F��h�n~�-����z5|gE�7g4�o4Z����O��9�y)J.j����.X���w,3����a�b�����a`��_g�"���u�(�<tq�cĕ�w	���z���t;k[�vCX��q`���-�s� t7^�cI�-K�^65�.��F#�lD�,�f��e6�(�=���_�;����q}8���@�W/)
��W|Z�������� �qn�@�w�l���E�I�>2�a�E6&1S�Fo߼y��BHy�      "   �  x���M��0���W̱�V�/�؈V�H	��e�b�ؑ��_�q@Z覆pɇ���;��1{S�3*��;4�Ģ7ˍ��5��5�認��ӻ�N�Ut��I4<��������i��j�������U'����%,-&i��͒����WO`�|��!8e叏ڞ ��<fl���}��< � �gl�e�ro�iu���9��-HIș��n����z	%7����fU~�JV�r��+�j�B�*	��eu�n�"�k�Έǆ�r���F�p������Z��0-Mv]o�q�/(�6b\��4�n>ge/��5�x+!��5^Ѣz�=o;t/�{(��^��w>Tf9/خ7��{������@'v�=��Tp��GY3���Pħ�/ؖ;�FK2��|�Ⳙ-���v���m������(d1 ���_�i�;�,�ê��	���L��Q��7�8
�Ћ���F�(3ԙ�^�(]�i��\N���$� ^'��?p�
      #   I  x��\�r�8]3_�Ք]�n ER5��=����V���M6p�H4)J�G�<���O̷̧̗�@�u�������ء�� ���PܹZ��"L�$���2U��S�p�y�|��?�s�\,3v�N˘�ì��\������?�L�	ҹ�g���f}<U3E�.���t&�D��΋,�$��yV�a���L\�f�~����#v_����W�=��zR1�M%��:�2."v��E�D1�p���\��!\�Tq�h|��$D������o4)�rNT&76�������z*+�O����Q)���P,YƤ8Wa��DFKǞgLi��ѓ�Z��p�����X��i���d��0-�B�ZlҎԛ��I�G8������8�#��_h��,�s�p��\+sĶ�q�y�V�G�WҬ�Yޕ6m2)�a'w����?����9�-yTY�gzk�����o�6�hKV�$�Z��2�)Qu��IrNdo�\�hI�,���y���D2��fW�&>�M�n��eg7�K6Q�j�]�����琠�F��"��"���ŭ|�8�2uk�E�z���*����5���ǎc���`Z{v�x�%T��S
)m@��0�I*�����,�2s���2A�v�������|�Dܗ��c	qцף�)�Ž���#��=�>֮gp���q$D�Rp���M*.�<2vɎ�_�j�����x���|�q(U
��0^�N�FGZ��0!3����6���JcX�JR�V�N�� lr�G��P�,T�](bG`�����g�X�S�3bZ����zVk]�G�O�2&��wNÌdT��6%��b�P�h��GBzAM`�"#��қ�w�6������5H�@���AB/Dm�V��1]䦗���~����to��,8��  �A��<�8������� (����ݎ�(�X�(�; �qC��@:H�=��]d�����/{QG�w+'1LAtY��r�k[';��G
�kaN��NB=��G��ۓ+_T��wq��)���Q���Gw���5��	�&O紝q/�^�2�X�I�2������uV-��Cf�T���E{,��\��\� b|���UT��s��&�)����Kh}k�]�(��AA��kB+L�6�©>��]��K��Fp]@E1��8B�#��ǻ@~$^���)�j����]����o�M/��P�yΪ�]����}�R��u�u��D�5���2���i��z����T?�'�����䖼�v���bt���U����j������_&�4\X�Id������C!�G��u���E{�!�>ZS_#�"����_��/uB� p��/���{sa$��*���B{��1��:�w�ì�����o�\����K�tA&V�Oe�ŉ�4̞T<����hաJC���_�j�M�3ڜ(&�W(A'e�|�|�Gv8(���
l"�n���*�Uݬ�e�/+3oe�:�����Ķ�F��ߍu�=>��O�j�dߛ�8���ӶN�Dq�v�[S��0(*8��-oZ�Cu��vL���m�<bq�H��h���ث��s�:�R��Ư@�n�鞘W11ױpю��nFF{ڴ��(�����[�Z�V�'�>EfGt�И�Q��P������ ���)�4	@'�x�xKI�n睆�{Ժu�?0d	 �������4��F�G�GJBU˷L�2�'��N��-%}����a[Qq��4���G�70�7Pp9� u�z	��6 ��J�"�u(ŏ�չPl�չ�/Aj.�3�.��7/ ���;K����+0��$�cW?��Ե�Z��C<�U˽���k��iv�E���p5w�N�/.G�R�`��ڼ�j�T`,����UqQ�ED�&-.���$�~�LT�toEE얀o���WMW�P}5��4ʍA�X?x�J,¼~ ڿ��`����J���C�;��B���x;�BB��a��|b����*��y�U��9�*z�c=$�U���Q�$���(�~ls�֝���;8K�5}�����G�p��#QM⻐ug�o��w�F�������%�'b�+7�-�:��y����@�-^��"�L�'�Q)ʢ6��U�wL#�tI�;�/�T�������MW���+���I�Q�Ӱ<�O�@��-�p^���:O�@L>R]mr6m��鷪,.�1qf���x!�����j�����^���u�ڞv2��4g�:�Ҳ�=s�Y~.i��
Q��S�e^��}�y�C|ۧX����*��IJUW8�������0��H	�zȲr}qd&Ѫ,��B�Lgq]���fY�}���]�̯�g����$ڮ�tk���Ʊ�W��/(C(.*#Mhhg*����z�V�=Ǝ_�M�2Ŕ=�fZ^�`Zə���L.*ʋ�[˚�ܭ�i�-xR��`�3��P�^���֘c} �W�֕�V���J���������(4_�ћe��]��T�
n�s1'�LP���5�j۪=cz������ �1т@@c��Sۑ���>��?F���_��0���ٰ �;�ϱ��f���Ϙ�P�G�=���)��]}��~�����m� ��n�����	}�q���BB�%L_87�nۚ-�_�21M��h�8���-��2�`���+`Aw<�h.	9�3f��rO2|}�lOㄘ��F� ss���� Ã��`m �������E�O��q�W�[~
��-����p�on�=�����|x��E�������NB�;j�Zx�K�2��N٤v����S�ߗj��e���2Q��{!�Ն�Q�+�Tw�:4�C��M6��oA0���j�"���o�胑��2s�I���h��	k�c��xą��M�Us����%}�>
{��w�w1^�[h���y��U�߸|?ն��F{J�tę�^O�~��z7AW�~o���S�5ѱcf�I7&T%�:sUoC��9q��|�+Ex�ﾸ��Qx��Q	�U
�=AT�'�J��w⨄��o�0���Q	S�Jp�>�?iT�\�Q	So�0g�Q	sv��b�gJ�7&���7�q��224��[��[�:��wn���7�Tu3�R��{p���'�a��~��)��HL]�8Db.��YN"1�W��P��tB$��8Db.�!S�A���G�7��3��!��8<�s��R�����{�����׿7������s)q�VCJҸQ�;��F�W#\�$|că�.\�!���������efl،�q��+#�y������ɕ�7�7?�o��g��ю� nO��q�<P�!ޤ3�^O�	�O����x�'�u�!h�I޾6^]��Fv�Zr������f�e�������F�4B���m�b�_K¯(���E�U��B̚��F�i
$)$�!)����`L�!�2Ȟ�S0������[pv!�2����[6&��[6DW�$~�u���[xRb�Ф�[6��S%��A�p�\L{�]9B��1d.GT���ǐ�Q�������(&z�
\�a�q]�
�օ�塘���`sgT�uj�ol�e��t�u2����w������      $   '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
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
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�      .   �   x�e��� D�P�6��c�OL[A��cAڄ ����! p��y�ccb�@��o���o���PԨ�]Iu5#���F5�FZȀ�!��,G��tXȳ��)7.�x6fS��qAy@1�>B���%Z�j�\�w8�&K�>��$LgR_�չ^�������s�1� AYT      /   �   x�U��� D��c�����G���3�/��M�:�n�ր�䲓�6�X]�����!�QJuN�}���J�NiGqa�"��L��(���iE	�V�����K]#��x+)�Lƫ�>��,v�h)�G0�k��6��]��V�X���{�
�3������ދ�j ��ĐD      0   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      1   K   x�3�LLNN-(IM�2���SHJ,I�P0T�.(HJ�2F���B&(���3s�LQ�A��8�R�R�A��qqq �	�      2   �  x��UMO�0='��G�P���~\WH-�B9T�˄�lp⍜X���qX2��Z�]���ｙ$K
㛟�'��C�%Y�J8 �Q�?�Ƃ7�wg|m���`C3��B@��ㅨ�]����{��I��eї�)G��k��^����up�x�P�l5�n�=Zq�~�V�8`�� ]&g��'��M��<����7�9��k�2L:�_~s()�_�v+
����|=k��E����8�6��d�%�I�Z��
I>ѭ�gCJ㡂eLaܓi����Y$�û�{(È��8:INC����$	���,)䚱	��0�t��4}��GF�E����uԭj�8S���U�0��9����oʀ�Ť��ykl�'��]Z�&t7k�"ש�B��I��N�ꯕ���q(M�1�O|��{��'P�g��C�{�t~��3�OA��OJ��Ӧ�|6v�~���!�·����f0���3���<��������q���ƣ��Mq}>ep��$	szG����K�O���k�x�^��2gU$EK^�fQ*V�n(5��r��q��08^����!#w��U���s�
�h�*g0��&:J%�L׷0qu��3.���͚O�^x���Y��&���)���~J�3�� :�8)����$Њ㤁�'��qU�U3���j�U�w6�("���.�횳U���S��� ��ч     