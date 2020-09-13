PGDMP     0                    x         
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
    public          postgres    false    203   {�                 0    21527    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab, kecamatan, kabupaten) FROM stdin;
    public          postgres    false    205   ��                 0    21536    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    207   8�                 0    21545    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    209   T                0    21554    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    211   5                0    21563    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    213   N#                0    21569    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    215   �#                0    21575    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    217   �#                0    21583    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    220   �$                0    21589    jenis_pengawas 
   TABLE DATA           8   COPY public.jenis_pengawas (id, keterangan) FROM stdin;
    public          postgres    false    222   %      !          0    21595    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    224   6%      #          0    21601    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    226   �%      %          0    21607    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    228   &      '          0    21613 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    230   �&      )          0    21619 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    232   +'      *          0    21623    layanan 
   TABLE DATA           �  COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal, kw_k_kantor, kw_penerima, kw_pemeriksa_p2, kw_k_s_intelijen, kw_k_b_fasilitas, kw_k_b_p2, kw_k_s_pf, kw_pemeriksa_dokumen, kw_k_b_pkc, kw_k_s_pkc, kw_pemeriksa_pkc) FROM stdin;
    public          postgres    false    233   �+      ,          0    21632    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    235   8-      .          0    21638    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    237   �-      0          0    21644    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    239   =.      2          0    21650    sub_jenis_layanan 
   TABLE DATA           W   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan, pengawas) FROM stdin;
    public          postgres    false    241   �.      9           0    0    data_perusahaan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 400, false);
          public          postgres    false    204            :           0    0    data_pribadi_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 414, true);
          public          postgres    false    206            ;           0    0    dokumen_proses_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 21, true);
          public          postgres    false    208            <           0    0    jenis_dokumen_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 1, true);
          public          postgres    false    210            =           0    0    jenis_layanan_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 5, true);
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
          public          postgres    false    240            L           0    0    user_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.user_id_seq', 414, true);
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
       public          postgres    false    205    203    3149            q           2606    21697    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
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
       public          postgres    false    237    3179    203            u           2606    21717 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    3169    228    205            v           2606    21722 .   data_perusahaan data_perusahaan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kabupaten_fkey;
       public          postgres    false    205    230    3171            w           2606    21727 .   data_perusahaan data_perusahaan_kecamatan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kecamatan_fkey FOREIGN KEY (kecamatan) REFERENCES public.kecamatan(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kecamatan_fkey;
       public          postgres    false    232    205    3173            x           2606    21732 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    205    237    3179            y           2606    21737 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    207    215    3157            z           2606    21742 "   dokumen dokumen_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 L   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_jenis_dokumen_fkey;
       public          postgres    false    209    3153    211            {           2606    21747    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    3175    209    233            |           2606    21752    dokumen dokumen_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_pemohon_fkey;
       public          postgres    false    3147    209    203            }           2606    21757 %   jenis_dokumen jenis_dokumen_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_role_fkey;
       public          postgres    false    3177    235    211            ~           2606    21762 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    213    3169    228                       2606    21767 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    217    213    3155            �           2606    21772 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    217    224    3165            �           2606    21777 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    217    3167    226            �           2606    21782 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    3169    217    228            �           2606    21787 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    224    3169    228            �           2606    21792 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    226    228    3169            �           2606    21797 !   kabupaten kabupaten_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 K   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_j_lokasi_fkey;
       public          postgres    false    3161    230    220            �           2606    21802 "   kecamatan kecamatan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 L   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_kabupaten_fkey;
       public          postgres    false    232    230    3171            �           2606    21807    layanan layanan_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_lokasi_fkey;
       public          postgres    false    233    220    3161            �           2606    21812    layanan layanan_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemohon_fkey;
       public          postgres    false    3147    233    203            �           2606    21817     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    233    241    3183            �           2606    21822    layanan layanan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_status_fkey FOREIGN KEY (status) REFERENCES public.status_layanan(id);
 E   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_status_fkey;
       public          postgres    false    233    239    3181            �           2606    21827 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    217    241    3159            �           2606    21832 1   sub_jenis_layanan sub_jenis_layanan_pengawas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pengawas_fkey FOREIGN KEY (pengawas) REFERENCES public.jenis_pengawas(id);
 [   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pengawas_fkey;
       public          postgres    false    241    222    3163                 x���ͮe����J��.��dR�H(�Db�JJ�@C��O�U���d�v��õ��rղ�G�!J�c��b����?�%�y|�������w)���_��/?��%򊯯��Ko����Pbe�?B�!���d�u��c�㘓LJf�1�X���k̬d�C��:�,JV�JH�1;��3Y�l�[�No�N34ɦdWr�P>��"��1 m��)m�,�X8;X�!B���ƍ�z���4���N��[,!	����b�v��D���}��_�7?}�X�o>������u�*/�UtF�J}��݄�����J��_t2��~=i5N�����uxt>&*@�a��׆v�:����Q3�h[�l���*,� !��GZ�&��.:M}x���De�ou�p:S���
"x�����NS燎�L�S��$�P�L�g�n�S������xX�	q�VM�3Y{X
�#�>`��	���8��썢6I5JJO4��N�f��FM5��Fa��f!*�'�P�Cf�PU3U�6(P����Z5E�P���B�<ӥf]�n��A�Y�QWc���]�`����D����TJ��j7]u��c����,tթ���c��3.t��Q�U� �g����:u����.�~/t���J�DWѴ�]!p��zN���U��J2<v��U�F��,�<1CW#�qyK��BW#�q����`���R��^O�h@W#�>��3�<CW��
:�<g�|W�,�B�SW��Y���U֙BuZ�c�La�A(����c��O�6[���.��(�D�d�b��<�.S �M�D:��CID�.�٫5�Mna�PI'�<J}��u��6v���C"�N���ӓT���t5�&��M�������߱b�CGҝ�+U�1�S���/o�[3���M�����v��(m3��Ǝ�Z�Sk�Y:Ҧ�4�֑���.�Zc+�R�=Rj���j�eG��1Rk���㳱��8�����ٷ�B��f�&�'����֠��h�	��5>�Ʀ�d�=�f-,�Z�h	�;��MSk"6�=E��6M�I�-;�t;.�Z�l���B�X�m�Z���Rh;3�D��֤�G\�d]~	�&����Ο�a*�[[V�O�)4v�� l�,�	K�Za��h|ÔY�nR�|�s���$V�'�vr�Y�uա���Xb�_5�'�9ùT��G'���ޑ��dN��a�ș
K����I��2����TX��P�Og�a*,[��sӿ12��"�������²��U�o�TXfy�����Say��������Sa��:�c\0���\D<�{�tc<ҏ�$�B�e��Yϫ�����0���ţ_�a*�М���t��k�TX��4j*L�")TX��3��	{¦�J2�^��
+y�uÎdP�0��,d�L��ǠI�d���3xd��cQ�a*���@�3/C�0F_?����7�
���7G~�
��o����M����Uɻ�4�<��V�|��a*�^����nd�7Sat����śIh�3x���;���>�ܑ �#��g�:#�#Sa�����fG����	3��G����+�óo��h�2�����돊�d����g�:2R�#�
���a�~.�d@g��#l^�Nر%i�3xMC�z�}�c���3xtdǆ�Ls���ho���
���g,��u�쁩���k��)��)�>�Pg군o�y�	]z��I�fӆ)�>E"r-��:o�"�O��+��u^0}z��&¨?4�H��kAS}5Ɇ)Z�x�`��F����R5ω�a�dX���AO&�0���s�ڒ�
3�憩0��4�.yz&�
�a�[��P?9�����+�޽9�-4�<`[*����=���<�
��[a
c����y
�z؎�ȅ0sX	�n��Z*����U��]���n��%�3��w�V��n*��qÃp�MY�����3xt��qcl8������5�Y����T���qKn�
�Sa��
�0��4��a�����7Foo�ڃ';a��i��;z�mڃ�BgÃp5Ƕ�k>:����.a���eK�F���y���z����&=�N�s��x�	4�y.��9��L:�P��C��,��v���C��mW�:k���Pg��kܖ>��M�џ�]��V*����� OkI��h�k�Θ���F���2���#ͻ ��G���5������KSk4�u�ؙ�O��ESkt�[�;��$jm����]�G�Z�O��%=�1�D�Ѩ�S��.�56����Ggjͬ���Zy�b�Z�W_�>�L�Z�Y�r��c�a������wϼij-��:�.��:����|O!�k���4�6�P�T�^�}w\4�FǞ/W�k�7M������L�Ѳǌ�6t��!�J�e_Q����0�f��L��?2u�g��ߕY�o.�-{>)�m��l�*3��#{
�Sd��;/����֏j�,����I��h��>o�Ʃ��0F�^c�}YܳM��i���ĥ�J�Ѳ�Ͽ��c%�
+}մ�S�l�
+�����Bl�
��R��h�����0�샽pr_GI��̲��Ӱy¦��t2zxb.J��h�w$��y���J��y)}�`�T�Y�t�8VҨ������37L������w)NF'��|���L�ym�F���^�ݖ�#�Saf��)�7Sam?��Bx�Tز�qE��ʤQafً���I��̲�eA���Sam*L8���v��Z[���	��T����O���
3��-O��Saf��qN�d�eFt*�O��������Y�Sa��U�5\���T��������ǛX��A�q3�&��>9�'�G���<��oH"���>Կ�����e�1��5#��3�q��j������I����E7�ٖ2�Nы�Ȯ���e��A��or��g!�N!��?v(���Op.�����בt�BzX�P|W0�_O&3��+�޽Z�t&=$q]�_t!-�qY�]I�YsE�yzэt^�?�;�2��F�O�Sk�ŏ{�&�F7�놋�>����_�`E�|�~�/��۶W��_M���n�[�k��ESk�U�ng�-�Z3ûb��~��M�����y�Ǣ���x��~}!a�Ԛ�JG����~��MSk��k��4��s�-Ԛ�o�������oo�8/*�a^Ζ�:dz��4��3��s�J�i{f	�s�\���O�X*��]4��;���������.40=��E�fΘk|>.��n���O9;:Nו��>s���<[-f�eU�s\4�:���񂷸��,��x L�]���Z�۷���Ua�            x��}�v�H��3�+�m�EQ��}���ؖ%�jQiW֪��)�p@�N������|ɜK���^S]��%�R����s��'���,-�]�\�g�:��������h��HD�(8��h���:��n�5~]�ݕ�s]���U��t�\nw�.s��e6/�C��r�\����s��p��й���_�r߮������.]��r�Y��`��O�;�59���ԩֻj�,�5��j��׷'N������T�"�/'nr"#����<?˶λ������<<1�pɐ�$���z�ܧϩ3�JX��G����9�;t.�-|�n�oS�</�t;�>���#�$ۤ����L��t��ħ��}\}��N���جާ���GQ���9\9ra�a G����b���Q�8W_�O��	ǿ�g���q�s�/��,CݨW=^l�mQ�[��"���DQ-�@m�k� �*��>9��c�H1�[B#�^�Z��=�D�u��J���A�i�J{>�?�%n�u�8j�=/布��E�6[;3���I�ժZ����vu |���i�@���ڶ�l�75+��(q�Qx�>�&�7��r���������9[g|�J?�����}�/�+Dߦ�|��ҹ�A��b�7H���A	J������$�VY	�<wn�u�-���4��	\)��:��n�!��h���(R���G�)������Y�Gx"�I�b�'RB�$�*�]�X��tW��.=tG"HFI-�>���$Cd��i����pSf�:�q9��N���a�@ӎh���x�����E�\TO��?qM�$kQ����i.P�d$D8r����z�Y����YI7SHO���Z�u�T����M؄K�=�Yh�Nkg��@��38��X��n�l�KcH���	/K�$�3��t΋eQ�����(	��(���D�Ή�cw�a��K����؀����=6o�y-�S��]�����]�$��Z�3�w����e�L�����O3C>0:"�G��G�^wF�D��[�Ҩ?w���K��!e7�=��`�=Ѷ�5�X��E� UyȦO��2q�ڃa0����aK��ʹ�>s����*Vp����~�L�QB=�eL/Je�3��8�t�&'A蝞���x >�� M�/�3ؘi�#��@٦����z#	R�$���޳c��g�r��]Q=V �2[���Δ�"�L���nM�w� �g�� \Z0갎�w�*�C8�ċA�܈e�5�f`�����6��y+�����;���)��yV�J�z�.�!Xf{�	I| �8}����w.�cҦ��sA��~�]��2��
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
Qd�A$d�#i[�����5K��W����T-���/"Ʊwln�I��������j#yy���>��U�X��3�s�!�����z(��˖��o����Me�2��������.�����@2�}��Ҥ��D���+������{���{�1��>�Ѫ�0u������U"aM�|�o|ܘ2�A :������p1���x쇒=���뇚0�hՄ��z�;�Jb��D����RQ%��A�?�^�:[!�^�O��ߎ�����F���	����_8h�|����V��	����,F�Bt�>�V�,�}Z�\pp�5��6{Jw�������r4-VįV���bQ����o���o��͹�            x��]�r�H�>���n}�r��fK�Bt��1Q@�DPc��~�y����̬I�-��B�mS�YK������0;"�vl;�-˵-�a�[�~ QL9~�����};��������hʊ�!s�~8x��ki��.S�>���z�����I%�i@TZ��:@�fYvG�(���3N+�����YL_�������J����`�BX����߿L�i%g��+P���7�IZ�K�Q��e%3�W5+����˄նl�b���z���o���4/s�<�5x~��7>�D6��X���#�d�R����gy>�;���SN�Y;��=�M��d�Hq��E��щ�>6����Q٨�՝�U�VX�8�,g�E좭ڜ�"���q`��MH��.f�<[d����s%����a��=���qխ�"��޶�(�J�;�3Q�ˑ�8�B\�-��=�lv^^gb.*&��A.�5<^�����>8��������v��~���y
�:ո�+��E���.�/�v�Q:/P>�i�����3i�����D�}�h{�=��J��
�"��I��Ⴛ@dG��
}�	��\T��L���΅��^�sf�w��iU�����]�f�ywWV��V\�g)ngb,�w���D��;ؤiZ����i��vi����M`�D�G���=�M���`�����{�V%�l�������E ���^-醋������^�n�R�Zl�����g����o���'�(�ɢWe�-0��H~����ϭ��	-o�EQ,�E�VW]�%�FLE.�Hl�`�t�v?~����ı��v�>͂�2��.	�'���x�ه6���J�Iـ� e ��se�LފJ�����2��a���_�o [)�Q9!y����*�|�_V���`�������9Q��L�*bW�o_E�'T=ݼ'�Q����!��_ۜ����'i�(�~�0¬'1j��ŀ�|-�hV����m��E?>���~��� �6�.�[���&��U&K��R5e�9V`�r��x���������%Z�&m��(�6rQ֥Rv����ؙI�.t�WQ���-��0P���j��� �<6�ׂ���	x�R��H�@��9k��k>;-�<�6�1�xrz���(�����F��wSv?��b)d*vT7m�<���4�����i�QF켝5�+/ $c���Ee����_�h�����Tz,������˔AE&}�P�K�%���mgX�V�$�Lڳ�f��J沭��NU���G��l�>�(����`�t�4�Gi�X3HeG.C�
�?h@���^��~ۤ}���r1O�`,k-WB<�O2�����O��PTs�A�;Y���q0Nb�?�F�̀�O��m��W�n������xi��},0�X٨B'g.�F[a.eX;Ӳ��u�0V�I�bG��<
kY��IL�#��o5>�'2�%I�-�t`�K��YR%������Wb"���W%n�Q��|�Gu ��5��f�Մ�
.�7��&H��t�*?�6����(�+�9��X)��u��6pb�e��7Y�U.��!��	����M����cZ��b.b����h�ȥ�|1K����|<�(oy��^\��U��V�)��h���i
��@lb��-?kg�?�U"�Zy	�9���%�d��ÜG	��:ȰDQ����z��L���b��p҅/#2V�7���"0h�`[ب��y+�y�C^��v�"D�dt@{�F�L�,v"A���d�s��BE�0�1��S�O�Ţ�A�N���lx�<KG�o�(ǌ�}��������J�D��T%a�U��AZ"IA	�;<�� {,����j�g��4��6'm���B�ԁ;OS�gF�`�>�q�+��B��B�_�ou���1�O������%����'|�BLu"�v��D>ͺ��E�H��У=��6MG��
�l!��^�O�e�4�%�������e�=��n��Y�{��ό2@m�f���>�QZ�XiȠ&��?���W��(��,B�3��I��`�=�c"�WN�$�\6�g7�_��Jd��ŴY�Z�H���b�>W�$=6(����i�K%a��<�����>�`Uh�"S&K��؄Q��t�H�Tmů�lN��K�����:�!;O%f�U��d��Kz��!�f�uB#v�2fV��4�	t�:�7:3L�Ǡ ��l��N3�h�_-������\��gC�� �֓�+1/���.b�c/Eh�ulv"��ș�mC�v55��>�f1����~_U�0D��~��`��s\vUb4(���:n��P(*§�I���t�)m֪�"�g��Aa�HTx�?��{�M^���v|v���:~6��8�Y2l�z�r6�1����6�A�7��\�-բ3r�X1�@`.oRSX	�H�i�&�,t+�C���� ����<p�A��߃��+I�q
�ep`�����<�p���A�Ԟ�)�و����D\𫴨Uуe�V�5�3���#1E��� L��!v�Y.f��ʖ|�Zf���Y/��w<��ybܵٱh����B���@Ę�E2�0%q�����1ڣ�8���R���/"�ӻ�:D�i��ylT�2�2ض����N��Vh��QZU��-�.t��[~]�s��TEY����u⵮é_&J@�&�F_�����I����O�)�W7���㬜��j_�-!���Y�@dU��� �������l(�%zS�=g/T��0�$Wi?|$o�ڧr�@�� ~�C�p�=������� �"־Xk�0lܺJ릥$O�i,�F�i��(�^��s }�`U}6��	<�4��b�%�K���Ym�d�CL(m	/� �>d'ֽ�����;��I�_���DĆ�)���X��W�2��jU��+��Dq�6�xw.��� c6L�d��X��`,��MR<�o�o�S~�R�yQb�1j3Tgx��3�q��a��cc#�[>��d��0������3���è�u�+�l��B�9�w[��e�s1_�\_�H���d����,���-�U�J�p�c��m�u��x�s��$XYee�p�H�;{�}D��>[ z�D�������E���OUȎ���fԶ�x���}�!b�ˉ���ֽn��	ӽ6c��x���_j;��H�`��,v	֑��]M�}B1A��{s��S1�J>��&}�l�$����~eS�����j�=�]��89���2QƠ���>0�*\����[>��i�[��� ���Ƕ�����0ط�?l�Գ�,[����aG��k���gx��V�&�����G�ԋ�����J	�sO	���;Ϲ���;��;�'�;^��e���A���^�${Oy�ٹ�e"��Q�TyT�٨��!{XF��ch�!��`�΁��DX��/n��ڹ�wV^=papb_v�a����勱5ܟ�p1Q	Rnִ��qW&�B`��g��2!�������\3F����Ni<\��-Vw�Gd�ѵ	�1��|��#�I�����̞p�1�
��T�B��Ce��F��2�܁�oK5�� ����x�]�?��Ψ��F$����7�^�g���G�_ɫ��Y.����N�GLBLU��k�H�����C,IZ�1��G;��HR�`|����cf^�a��\�����aF��C���WuB����؅��ܳ$�wE�-���n��lس%*��N��B\q��5����j�(d�EUީ	c�!GBR�h�.�?B:�����/�_tB�V���Aa(�h�.�#�jO�?�;6��$�L)�Y���+�G��-�T�{�2�+3��N�J�qp���y�*Ej#
�1)��iwؐ�W�0��r�V�><΂�;���uC��>�op�����u&����i�"C�^��}��kxn��c��Yyr��0������L�%c����6����虭��C�+m<��s�gr�4��ʚ0���~*j>���CVfD   ��4�L�
�#�ͱ����We�QS��pm�����A�?!��T���/i9j����^���K�`��1$U��݋=pمh'@�E�α�{�Q��؈��%.�8'�y�x�ku� Q��)�?�.Ҋ��� �uh���@�-���,�
���G���<�{����q��=X�yъ�N�%���=P�^���i�%F��2Dk=�8fCY�Z��,]��9�m��T{�'ٶ�n�|1˪���Md��	C#l�T�l�v�6EIƽr�p}�����?�ϵ�K�
�T�]��`>G��49EB��e�dy= �c�j9)s�XL7�.֒�{��>�6����s�Sk�1���!���_В���+YߕT3F��^3��˷�"���C۰�.��ងX�#��Mxz=T�^,�쫨k���Kh�ȱ�S7���#tҍ��&�fE�4�X,�6pv�=��yh���~[��Q�ӱ�an�
�~�Jr�>����E��e�%X�l��B�lYkk�&��\�&:e���U(��n������<�&�Z/�<��Ƕ�ٍ�<I˿�3e��f�z�z0�� ӽ�� �2�u��sSC�����6�� D{����L���2:��=\� 3�	ف�43v��B1���֘2����9��7��Qq�����{��n"	�*Cx}�Q���9l�=�Z4k��P���*o���&�w/�(�\6��z��_$3n��b�~�,��P�?r:������$Cv	����;6Q0�)��f<v	��Fߠ�Ӿ��n�#Ǆ�0��3 \d���V�j��{��9w��}�i��%|={�t����V���8��E�Ҫ��Qڢ5��>��v"6*�B㓺}����!�<�����w��p*�
���%n���Y/Ƒ1�ɳP��x��WJfoynG��ꋏ1�uCe�A�pO��_q�e/�\���0�V����L�GNߖ��7�ly;h�FmN�e��w�g3>VO�M�6
����z��EYVw�F8�,�l����ߛ�����ܣ0�
3<�|Z�P����	�J*�4�XMm��x�����IՋ�_BR�Mw?B�����z�[���޻�'f�31W�h��ӺVwGi�>B׷�0��QSA&P��PpGͲFk�Y�^,�
ޡ�DS�T��(c)w�a�ӂ�s<Ri��T���+�v}�`/Jl�?I����h-Gm���1b�,!�h��B\�l��g,�>�eoj~X�D��r�W>��U��?�i����㤩?@�c�\D���v��z��%&-tW�F�kW��ȏ�s01�$� �4bj���^��K����k�n A�4�2�}��N����(-p������;}�b{W�W=�j��y[/�d"fJ��
gi�}���p�~3v8�E�J�e�O`��.��I�^b�(���e�v�Rզ���^lx�JN�τ�Ԕ��r9��J����D��wPC֋XAԴ��R~'Wu��Zݯ��*���s��ݻWl�9
��rN`���4���+<�^�G��҅��7���='\F��Ϗ�*���[��3�yY��X�	� �LV��RՁ:��f�.Σ�(طR��u`�֎:u7%����l2�?]7���EW���z�MIwЛ,�?�	<���~���w��<N7x�5�-�Y����۲A&��R��Q���Ⱥs��8+�dT:%�f+��0\7�m�H�}F	��� �0.��B�7����B�S���Zݎ��+����N>� I���P��i�ޔ���ӵh��`���v�!o��*�������Y��* u�Od�O��oFZd��(푥!�UW��+`q��^F���H�lU���i}eͤgo�1d�����\�A3�PRާ.��`\�UdLVt�5��g}Y���	�e`��\���J88�^���V��cؘ���"oo�\1��-;*w)��/22�\��2U�?�V���<���-|.g����ٿ�)��?u?��8?�9�y����F�tۊw�R�릻��S�m6���vc�Y�[�Q��6;XoH�8�);���'�u\��u]V�� �[���΅��^�sfkN�<�c4����AK���B�K�U���N�xZ��q���k̩�U}k�u!p<"!vH]/�|i�C��Ȥ�ESàcLB�&�Dm�.ZV*?��q�΍�B�ݗ�Q�	%�(�7B��A� ��p1R|!�Y�v�:�g��Z���J��C�|'���z`Ҹ,�zlj�ԃ�;�,��b��5|I�5!�򥟁#�_&(��� �7�
=l�!<�'�!U�\��J���am8M+w�9��'��3P�M���
j�R��1��-����@Y�>�u+8�+��q+��H[���뤅l��	~�"�-�6E�":�Χ�/���4�"5��H4mU��D_�[�m�����$Qh����b���W4A���cY+�S&e�Ԓ,��;�}�V�n=��$Ŗ��C����(��B�X�X��W>�,����>�0��e���~]f8u�!	�3ĢV�|�������/�m�Z�����y@�/�BTY;/u�x0k�c�gL��
�k�8��I�W�����1ɉ#���;�ߑ�I�a�l@s�(!ۏ�_<�e�銩V(����?�R�<Oy#����i3�ft��]@6�I%AG�������Vq;��X2�<u�, ��֜��(p#U �c�L;O�"*��I9k�i��V��\��u��Bx��T����P���H���>�3�K,Y�W3�����y/���K�=Ϧ�aG�U�q�s��3m:]տ!t�L����<��֥y�j��8�Ͻ����W�����e
^�>�.K��-�A5g���_�#����:�����j<��JR�7?K��L�kB�w^�K~���ľ�`�򹠱���F'����}Ap ��J������Ϝ�cU�u~���0k�xD9/S�����'�/�ܾ�Xu���%Vz���1���^��
	B����G?$�c���=G]@~TFIli�|x����?o߼y��=ұ         �  x�͗Mo�0���W��J�`��zJ�����VM�^z��.�5����{�eI��-K6�
v�,�30$7YbvJӕ*v�6Ӡ�}_�����J٥�Be?eER�����֠����T�Q�P�\p!8�y/a��µ]y�G�ĕD�p��3F>�$C�ʘ�J?��T�iEL����@����<A�y8y� )J�T'% ʝ�T�E�S@�-T8���T�[�Ћ;S@��M���6I�LFCY�/M_M
��cC0������kR�m����%������O>��U@ob�XJL��J�s�:y��M��@�LK䠩D��hV�>�P=$�W��>Kfs�KR=�7 ���	&2w%m�7e#}����%��X��˸֊`z3�X�a��Ŝ�ح�LY�B����ivR�G�e�9B�����+���=�ʖoV
�*ț��$�4���tU@B�^�HՑ�S�h��2_M�J\�ڔ�?��3�	˰��f;�Ø��i��9RX>�J*��&,m�Sr�� h���p[w���k�yՈ�{q���h�\�5fZ�E���K��,���zM�]�����ڂ���o�')݀y���`=�;:��;�������p����� G�@@g>�x���� ��9:�A:��A��;�A:��A���O�����lq�#�6�<��g�z����Y��k��Fc"�s]�x��/��e���ڽ         	  x��\�r�F]�_ѫ)�J�� �5+1�I�
+�k6޴L�� �,<�Ҭf??1�2�2_2� @�4�$U�e��Ͼ�s����*��QƦQ�\-V��>�2�;�Χ;���u�V�Uή�Y��I�W�X���zr��/�E.���\�3��G�}=sA�.����<JW��b\�ylH��,�9+�<q	����*��KQ��eU���)~dk�$��H��:�*)cv��e��	�p#��Bd��!Z�Ey����MH�J:�	�����,��jA\�7S6����� ����D$�8��B��,]%d|b�\E�X�{�3!���Ob���@����U�JVk�V�eŮgQVƥ(��d�7g?�񏐞��3}DB���Ś�B~��8)�;���2��G��ˤT�R=
�I�E�޵2����b������ņ��$�"�0e�Q�K-����ߦ�-��h����+S�R��l��g����U�fX��f�<B6O�����c�Y�u��Oru�H{�������b��/������d��v�R�����#'���x&U	P�:�|��o�@eg*�WUY��,L�
%+��(��:������YJR0��n sϙL/�\�;#�W�C��Б�c/?�b�t�c5�Y�!2ad��n������cS�~��	��Z:9U��t�G˼��Z�n�?6v�ӌ����<5A�U����C��M�����1��%_QX����^��4*sf����r�L���H��!2<��kF���Tȉ���r]ݔ��L�c��u�:7ER�E���H㼰�<��7�;��;�c�����|���`.s��.$�@��^�L�M��ߨNA[�H%��J�k��U�)i���˭�2k��!ᱽ�Y�Qw�`��%m� 	�,�RI�EJd%��iD.]���O*F�6�G�('��Ѷ�CX�T&�b/$r�YJ�O���=F��i��m�p��P}���!�{?����ܐ�%�2z!솼:�>Ӆ��M����B;>=#�``G��iT���v�7z�k� �E;4�s0F�|ǭ�P>&}=�'��Q�i	�� ��ф��C����>�=!�j`�	w�@�,�}h�ϣ��G��#���ةἏ��1ŏ�s�6yw�
�,��\���7Ow�9�;�z7��i
~����M�<3m<Cݥ�zM.`�s�6)Y��RUW��X񙔻��ĂL[#�'�p��˘I�a:��`_��;څ:?�]���/`�(Th4My�Z�gH���E0z�_���h�&���8$���3�/���;���b�>'ܻ��4�����n:�9�I=Ϙ!��<l/��ڲEm����"o���8_V�W���lnaOp��P�D�,�Ͼg�[��:��}�%�~��E���b�l�����_��4Z��'�4V��*��l�0����z�{�)�=�ro�o�e��ܥF�1��P$<�JpN1�~ߜ+~��1Ƭ���h����t��|@�2����ꡗ��m�MYҴ
�*{��NgQ�$j�'6�nk^~d�~��Hl�����	I��@:�����ko����pc��I�L�ShlODc*�*h���3\�lh5�g)ǔ;S$������M�u'V>�E�#+��`o�pѨ�	_���z��X�v�n9� �'�a�-5E[�BC�St�O��HX���NHה��Ry��YB`�z�`��l�ZdG9�;�p|x�J��>����cC�Srl+ى)م,��v�ր|�pc��Ǹ�w|��.\t��x�S��R5	�E��m(�u�����j��	�Zcӟd_O6�{Fz�]�Ӱ��[w4�.,�.�M��=)q�"��}/�G���*+��&��/������a��0R�(ɯk�Qe��
f����n����D7��=hV�#Y~���I�{.T���^�6B��;.<�@��# }��A}A}��_V�|�����q�%�9"<vaNNڛ�E=
H�]��s ��p�������.�V>G��a��/|���1X1�S�T&߿����2�)�4l�Ii�����r�G��֜yJ�X��%L�'�����B�H���T����[$���f, ;�.�=,,B ��$�{}l��Ɇ0�<���1�A����<|☳HyU�Yxs6GƜ��11ga�b�������d(������~�As]k��9|��t���;${a��N���!g�产9��B���dK�@����m^o��P=3�l.!4��4A�p��P����a��@�h���>H<�G4Su�TQ(#eR���!@�O�1	���)qq�?��R��L1]�G5�k(lg=V��92�oc�4ZԢm�[��+�G1
���H�s+��B�d�q&�J��y���dֵЋ�8鷔�܂�xb�Q� ���>�>W�F�C�G$�*��̦\о��7�6������М��}3�;J��J����LI���\�ZFi��ʸޮ�x\e����i�4�"�CO�-���l�
3t��Xc�Xh 7�E�Z��yI�N�ra�4%'������f���u�N���RS���������N-�g
�����/=����nS�6�Z�'������bM���#�K�o���JҺx��Uؠ�:�_(-x���g�:�G���]���v�fw����`��56�Z��`r�[)�!s�����%u�&�̧z?ʚ�6��?FO��_ٓ0��!��"�g��8��V��������.��i���+X�X%�5,m��i�	NL�w����+�xN�xЖ���5��un"�i����RV����U�&�{�����ct���������9<0=N�=�z�?cA�f������`��IB���F� K��>��"Ã�ӏP��`��%��������I�WǿE,?E�[x��&�-Ҽ7��"���o���p|�j�?:5��I���w6^�0��@s6��ϙ���i�~��x��K�лhE\}��k�/���ʝ6�z��H�^��,\��d+_lD��b+��,.M�|����>*d�N�<�ټ��NU�d�ؤ$�h���꺹����%{6_EV����K}�"f�M�R�f�ٽ��k×3;E���hM�NV������k�����)�r��+o�������su��	!���U�o. Z$�6���]��w�N;��?AU�'�J�{p⪄��oT����+��:�]� �<�?iU�R�U	spߠ*a��T%,�7��$X����[iL6|U@�F��8ra�����k���(�w.���8��������<�[���K
����]>�`F��svOTM1w���K�w$s�j������µ{�ҩ��(<q5�RFGTS�a��Jޠ�b���WC,�=�b���J�o���_�vh�����c�sGͮ(c��/�E�.m��<���aNd]kXy�ܸ%��ׯ�'|��{9����-N��v�j�X�{Y+�����#��ȹ�J����څ�����{A����Lѕ�	��q�њ��7�-���hG��*b�����])��{2�6l[�k�O�����޽�?�|1�         '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
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
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�      *   �  x��T�q!��U���ģ�T��� '�q�ؗ��X�]�$(@����"�0�?��S������`��Z\�G�@,���s6r�d��_+��O%��T�>.s�Z+0���	�(���6EIZ/xZl�������*ޫ�+UY�JGU2�J\$����SE����<I�Y2�Y�\Q�f���-l>u����V8Ur(�	��
�@�
�њP=g��2r�<zuJ.=Ɉ~$KB	��'�SB���>�1d`f��+��e#}y(�Q�֊��H����`�(n�a/����X7�����ʈM��9�4����ܸO�.��1��5�2��.�����%�NDoUd�0���B�śܦ�F�yo֓�AO��1��o�x��V7��|F˯��?�m�99>      ,   �   x�U��� D��c�����G���3�/��M�:�n�ր�䲓�6�X]�����!�QJuN�}���J�NiGqa�"��L��(���iE	�V�����K]#��x+)�Lƫ�>��,v�h)�G0�k��6��]��V�X���{�
�3������ދ�j ��ĐD      .   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      0   K   x�3�LLNN-(IM�2���SHJ,I�P0T�.(HJ�2F���B&(���3s�LQ�A��8�R�R�A��qqq �	�      2   �  x���MO�0��ɯ�$TH���u��"*�C�^�L��'�ȉU�_��݆LA���`�̼����7KJ��O�����dI���1�Q�kc�k��Ӿ�^��`���B@��ㅨ�]Ƈw��2ɓ<�K�S�T#zݙ���[��	�O��X�f�m�A���;���=������ c8{�z��8K�y�n45ط�Dpc���^{���t�tU�8��o~{���_P��?��&6_/}�b����7I��|y����)��P�2���Y�Ac&�gͮ�� )���}Ph*c[�ᅈ���jr�CF�E��y�A�yE@��h'�����8��OlO!ZFo���E�r��,ٯ��ۙ��Q{�u�$Y�d~�׈cy�g���⏚GP/�(�B�=J�(H+:�`����8(m���c}p�1w>M���t�=F`�a��o�&�r�-FH�Ta<�3��,]RX�t�T���`S�-�9-��f�L�nY����l��ٛ�ӕ��]�����n���~�{�?|�A�W�~g������7$k�Y���QŒ[N��Yқ,�B�j�T�9�J�Uȼ\1̔��L�9W���5S��6L%~�M�X�����Ul�$��U"�-S!\��%�E�U"u�QE�|�T<cΚ���aT�qϲ����L�,��"�+>SE�P���F-�6t�%�w���S��� ��ч     