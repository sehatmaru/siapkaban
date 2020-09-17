PGDMP     3    :                x         
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
       public          postgres    false            �            1259    23329    account    TABLE        CREATE TABLE public.account (
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
       public          postgres    false            �            1259    23336    data_perusahaan    TABLE     $  CREATE TABLE public.data_perusahaan (
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
       public          postgres    false            �            1259    23343    data_pribadi    TABLE     �  CREATE TABLE public.data_pribadi (
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
       public          postgres    false            �            1259    23350    dokumen    TABLE       CREATE TABLE public.dokumen (
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
       public          postgres    false            �            1259    23357    jenis_dokumen    TABLE     $  CREATE TABLE public.jenis_dokumen (
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
       public          postgres    false            �            1259    23364    jenis_fasilitas    TABLE     �   CREATE TABLE public.jenis_fasilitas (
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
       public          postgres    false            �            1259    23368    jenis_identitas    TABLE     �   CREATE TABLE public.jenis_identitas (
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
       public          postgres    false            �            1259    23372    jenis_layanan    TABLE     "  CREATE TABLE public.jenis_layanan (
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
       public          postgres    false            �            1259    23376    jenis_lokasi    TABLE     �   CREATE TABLE public.jenis_lokasi (
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
       public          postgres    false            �            1259    23380    jenis_pengawas    TABLE     �   CREATE TABLE public.jenis_pengawas (
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
       public          postgres    false            �            1259    23384    jenis_pengelola    TABLE     �   CREATE TABLE public.jenis_pengelola (
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
       public          postgres    false            �            1259    23388    jenis_penimbunan    TABLE     �   CREATE TABLE public.jenis_penimbunan (
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
       public          postgres    false            �            1259    23392    jenis_perusahaan    TABLE     �   CREATE TABLE public.jenis_perusahaan (
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
       public          postgres    false            �            1259    23396 	   kabupaten    TABLE     �   CREATE TABLE public.kabupaten (
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
       public          postgres    false            �            1259    23400 	   kecamatan    TABLE     �   CREATE TABLE public.kecamatan (
    id integer DEFAULT nextval('public.kecamatan_id_seq'::regclass) NOT NULL,
    keterangan character varying(225),
    kabupaten integer
);
    DROP TABLE public.kecamatan;
       public         heap    postgres    false    217            �            1259    23404    layanan    TABLE     �  CREATE TABLE public.layanan (
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
    progress integer
);
    DROP TABLE public.layanan;
       public         heap    postgres    false    210            �            1259    21630    role_id_seq    SEQUENCE     t   CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false            �            1259    23411    role    TABLE     �   CREATE TABLE public.role (
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
       public          postgres    false            �            1259    23415    status    TABLE     �   CREATE TABLE public.status (
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
       public          postgres    false            �            1259    23419    status_layanan    TABLE     �   CREATE TABLE public.status_layanan (
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
       public          postgres    false            �            1259    23423    sub_jenis_layanan    TABLE     �   CREATE TABLE public.sub_jenis_layanan (
    id integer DEFAULT nextval('public.sub_jenis_layanan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_layanan integer,
    pengawas integer
);
 %   DROP TABLE public.sub_jenis_layanan;
       public         heap    postgres    false    221                      0    23329    account 
   TABLE DATA           j   COPY public.account (id, username, password, role, status, d_perusahaan, d_pribadi, j_lokasi) FROM stdin;
    public          postgres    false    222   ��                  0    23336    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab, kecamatan, kabupaten) FROM stdin;
    public          postgres    false    223    �       !          0    23343    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    224   ��       "          0    23350    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    225   ]      #          0    23357    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    226   z      $          0    23364    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    227   �!      %          0    23368    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    228   +"      &          0    23372    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    229   o"      '          0    23376    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    230   w#      (          0    23380    jenis_pengawas 
   TABLE DATA           8   COPY public.jenis_pengawas (id, keterangan) FROM stdin;
    public          postgres    false    231   �#      )          0    23384    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    232   �#      *          0    23388    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    233   Y$      +          0    23392    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    234   �$      ,          0    23396 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    235   Z%      -          0    23400 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    236   �%      .          0    23404    layanan 
   TABLE DATA           �  COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal, kw_k_kantor, kw_penerima, kw_pemeriksa_p2, kw_k_s_intelijen, kw_k_b_fasilitas, kw_k_b_p2, kw_k_s_pf, kw_pemeriksa_dokumen, kw_k_b_pkc, kw_k_s_pkc, kw_pemeriksa_pkc, progress) FROM stdin;
    public          postgres    false    237   =*      /          0    23411    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    238   Z*      0          0    23415    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    239   +      1          0    23419    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    240   _+      2          0    23423    sub_jenis_layanan 
   TABLE DATA           W   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan, pengawas) FROM stdin;
    public          postgres    false    241   �+      9           0    0    data_perusahaan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 500, false);
          public          postgres    false    203            :           0    0    data_pribadi_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 501, true);
          public          postgres    false    204            ;           0    0    dokumen_proses_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 252, true);
          public          postgres    false    205            <           0    0    jenis_dokumen_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 1, false);
          public          postgres    false    206            =           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 26, true);
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
          public          postgres    false    202            K           2606    23428    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    222            M           2606    23430 $   data_perusahaan data_perusahaan_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_pkey;
       public            postgres    false    223            O           2606    23432    data_pribadi data_pribadi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_pkey;
       public            postgres    false    224            Q           2606    23434     jenis_dokumen jenis_dokumen_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_pkey;
       public            postgres    false    226            S           2606    23436 $   jenis_fasilitas jenis_fasilitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_pkey;
       public            postgres    false    227            U           2606    23438 $   jenis_identitas jenis_identitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_identitas
    ADD CONSTRAINT jenis_identitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_identitas DROP CONSTRAINT jenis_identitas_pkey;
       public            postgres    false    228            W           2606    23440     jenis_layanan jenis_layanan_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_pkey;
       public            postgres    false    229            Y           2606    23442    jenis_lokasi jenis_lokasi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.jenis_lokasi
    ADD CONSTRAINT jenis_lokasi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.jenis_lokasi DROP CONSTRAINT jenis_lokasi_pkey;
       public            postgres    false    230            [           2606    23444 "   jenis_pengawas jenis_pengawas_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.jenis_pengawas
    ADD CONSTRAINT jenis_pengawas_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.jenis_pengawas DROP CONSTRAINT jenis_pengawas_pkey;
       public            postgres    false    231            ]           2606    23446 $   jenis_pengelola jenis_pengelola_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_pkey;
       public            postgres    false    232            _           2606    23448 &   jenis_penimbunan jenis_penimbunan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_pkey;
       public            postgres    false    233            a           2606    23450 &   jenis_perusahaan jenis_perusahaan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_perusahaan
    ADD CONSTRAINT jenis_perusahaan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_perusahaan DROP CONSTRAINT jenis_perusahaan_pkey;
       public            postgres    false    234            c           2606    23452    kabupaten kabupaten_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_pkey;
       public            postgres    false    235            e           2606    23454    kecamatan kecamatan_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_pkey;
       public            postgres    false    236            g           2606    23456    layanan layanan_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pkey;
       public            postgres    false    237            i           2606    23458    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    238            m           2606    23460 "   status_layanan status_layanan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.status_layanan
    ADD CONSTRAINT status_layanan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.status_layanan DROP CONSTRAINT status_layanan_pkey;
       public            postgres    false    240            k           2606    23462    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    239            o           2606    23464 (   sub_jenis_layanan sub_jenis_layanan_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pkey;
       public            postgres    false    241            p           2606    23465 !   account account_d_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_perusahaan_fkey FOREIGN KEY (d_perusahaan) REFERENCES public.data_perusahaan(id);
 K   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_perusahaan_fkey;
       public          postgres    false    222    223    3149            q           2606    23470    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_pribadi_fkey FOREIGN KEY (d_pribadi) REFERENCES public.data_pribadi(id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_pribadi_fkey;
       public          postgres    false    222    224    3151            r           2606    23475    account account_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.account DROP CONSTRAINT account_j_lokasi_fkey;
       public          postgres    false    222    230    3161            s           2606    23480    account account_role_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 C   ALTER TABLE ONLY public.account DROP CONSTRAINT account_role_fkey;
       public          postgres    false    3177    238    222            t           2606    23485    account account_status_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT account_status_fkey;
       public          postgres    false    3179    239    222            u           2606    23490 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    223    234    3169            v           2606    23495 .   data_perusahaan data_perusahaan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kabupaten_fkey;
       public          postgres    false    235    3171    223            w           2606    23500 .   data_perusahaan data_perusahaan_kecamatan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kecamatan_fkey FOREIGN KEY (kecamatan) REFERENCES public.kecamatan(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kecamatan_fkey;
       public          postgres    false    223    3173    236            x           2606    23505 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    3179    239    223            y           2606    23510 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    224    3157    228            z           2606    23515 "   dokumen dokumen_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 L   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_jenis_dokumen_fkey;
       public          postgres    false    3153    226    225            {           2606    23520    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    3175    237    225            |           2606    23525    dokumen dokumen_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_pemohon_fkey;
       public          postgres    false    3147    222    225            }           2606    23530 %   jenis_dokumen jenis_dokumen_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_role_fkey;
       public          postgres    false    3177    238    226            ~           2606    23535 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    3169    234    227                       2606    23540 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    229    227    3155            �           2606    23545 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    3165    229    232            �           2606    23550 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    229    3167    233            �           2606    23555 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    229    234    3169            �           2606    23560 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    232    234    3169            �           2606    23565 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    233    234    3169            �           2606    23570 !   kabupaten kabupaten_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 K   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_j_lokasi_fkey;
       public          postgres    false    230    3161    235            �           2606    23575 "   kecamatan kecamatan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 L   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_kabupaten_fkey;
       public          postgres    false    236    3171    235            �           2606    23580    layanan layanan_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_lokasi_fkey;
       public          postgres    false    3161    230    237            �           2606    23585    layanan layanan_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemohon_fkey;
       public          postgres    false    3147    237    222            �           2606    23590     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    241    3183    237            �           2606    23595    layanan layanan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_status_fkey FOREIGN KEY (status) REFERENCES public.status_layanan(id);
 E   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_status_fkey;
       public          postgres    false    3181    240    237            �           2606    23600 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    3159    241    229            �           2606    23605 1   sub_jenis_layanan sub_jenis_layanan_pengawas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pengawas_fkey FOREIGN KEY (pengawas) REFERENCES public.jenis_pengawas(id);
 [   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pengawas_fkey;
       public          postgres    false    3163    231    241               R  x���˪f����yC�J��!$�B��I_�N�v�o�Z�$�ɯ���n�����T*-i�����%�1BH1y|��o��?�}��o����R��۟����?��!�/>�?ҋ�u�JL���B�O�d�(�@fm�i����$��d1%E��j3+Y@��Ev��6�������h�����J6���S�=��M�)ٕ5��Nbv\dWr ��$[9�����М�QŔ�p�b�v5;X�(B���F^e���"�c�_�i],�����o>��}���׵|�ɏ��;�����K�(4^�証��m �g��!��Q���t��zRj�z�l7����|LT�b��C�����_�h���p���F[�-`��П��BPa�:q���B+�d}���ԇm@�GTf�{�;ЙHt~T����$��u�z?�f:��*�$���Tr��8�t��j���f��BO�餚�g���G�}��C*�,������&�O�YH�QR����t�^6M5j��X5
C�1CT\�l.�N[�f��f��eP�*7Y�j�,��a;t���-�K��j�X	�m|��U�۔f��c�;tՃ�Mv�3S)!��Q�,t�ej2���'��f��N]%KϞv�+��� 	��<,tթ+TL�{����*�]%�bt���6�9y�w@W}�*��d��BW}1G�X��]�0��Vt,�6]���ͻ���BW��tѵ0��р�F�u4blg�q���t�qΌ�Yy�X�
��N])k{��]�jPWYG
fe̎u�?��ҍP*�1$�@�O�6Z���.�s+�D{g�b��<6�.S �M�D:Z�CnID�.�yRk<5��C%�,�(�N�ֵO:[ۙm�7�:��NwR��~�մR�H�;r�^��E�^gL�Č5IwF�T�N="�_^?�f�ٺ؁�CSk<�u��(m3���Z�Sk�^:�#9ih�#���]4�ƣ K�vK��Z�aP�Z�q4�F#��j;�k�Z�3�Y�(�}�-�Zl6jBw��Pk�i��֘Pk�Z��s�mjM�٣o�¢�5�ӭpn����Dl�{�.�m�Z�4�T<��c�q�Ԛd۴�*ǂn�Ԛ̼�Bۙ��F�ijM�<������/��d�$;�s�7L�!z;�����a
M������:Ka�ҨVX=O4�a�,�iR�|�Y�9�TY+ݓ�qr�Y�u�w�����<��Ω��<N�1�U�m�
K�T@�v������bKC�"�TX�\�!�j�
KT*��9n�
���*c��/�L�e��H�i{�O��SaY^���o�TXfy�����Say�����Sa��:�m\0���\D<�{�tc<ҏ~'�B�ez�Y������N�a*�c)�G�d�TX����*�N�Sa�
Ө�0�Pa�)��1aO�TXIӫ�Sa%/�nؑ
����������4i��{��̴},�6L�ѿ8�n?�;6L�������獆����û网�����a�h��g��+WU��3�|x�r���0F/_So|ղ��T�|�(!c�f�����`G�i�3x�	��2}��3�~��2FO_��>; =}O����2FW_����
��?�̞~�
��?*j�;DB_��k�H�`*�ξ�]�x��}��{�;�$�}�iUﾓu�}��ıa�<��g��3�7s���L����=�xfO'L�-�^�7O�L����:S������H��ØdMr4�6L��)�k����)��*ϸ�~>��O��Q�D��f�	�z-h��&�0EB���ɀw�h�3x����16L�+�q?��$f�[?`�]K�Sac�����0F����%OπQa4�uIZ�''u�T{�۫�簅�=�lS�նаg�Î7�Z��!E�V�����i�<�~=�lۍ��B�9��F��h-�W���U��]�<��7�gK&f<��X��T<���:ea4�>өg���(ǅ��H�O8�-Xύ�לgyn�
�Sa6��%�a*,N���|V؆��8��0���t/և�0z{c�n<ّ��7M��ѫ�p'<m�\:��9��^��q��ott	�,[��r_p$̻���s�_��4�av���]��N���s�.��Eg�фbO��fA���{G0wj�h���Q��@�:3^����7�Fw���[E�4��3�y�%�R�A��W:c�~'j�}�ez"hG�wA̅�F-Qk���둋���h��*�=3�N�M�ѥo��D��w���eӧWwA�'j�>�f�t��T�F��Oe�� W��Z����5���ʭ�����G\�Vf���z(�+4#�����wx/�{�MSky>�Av�<��4���{
a^;�����i؇§B�2�Y�㢩5:�|�Z\c�ij-�u0O7,ɔ-{��i�@�8R�4Z���+�Shf����-Sgy�3��2���B�Ѳ�� �C�G ��̲��Ȟo�-���-��#�3�>s��{eR(1Z����q:Bl�
�e�1ۺ,�Ѧ��\�_��t�J������66L��Y����x
�0ER׽��8e�S$�{��Q�J�������	�"�ӌ��?(�"��ޑÚ��:�V���{��[��H�u��t�t��4T�Q1������|>Xy�(NE��|f��Һy��F�����ժ�]�Sa��)����_?O-�a*l�����]Ҩ0s�ESn�$�Sa�����~�TX�
�l�t�ݩ��V�/{�<0fO��M��\�Sa�c��N�;f�;��$O&Y~B�����{�:ݛ'S�a*���ʳ�ˀq8�
�����}�$��^ЧG�F<ic�R��U���OW�M�3��ʸ������������E��o��8�W�c��$�x�LZ�u��X��Jz^�4���]t#�Mɷ_t']L�voN6�E�4�x�=߅L:�@z~�Px;���h~F;Vu+���������`.jI�r㫲+C?{���Lz�H⺷��BZ�a���_t%�f�]��E7�y�h\���˼X�+?=HO��N����m�����V*?�M�J����Xm^4?۶g��_M���n8������ֳt��t[4�f�w�s}��M�����y�Ǣ��ey��>���hj͞��|������MSk4�k�o�p�s�-Ԛ�o{��o�}��7Oz���0ogKt�k�̦9�o�;�����r��gV��<��E��֍�����E���;]\4?G��]�`zv��.�͝1���\t%=_#��zs�Px��]O�{cΜ���}�y2�Es��<c4����1'e��a���l�h�J	�\R.��_�������Z������?�/�Tz����o�}��?}�����O?�ҏ?���/~����_T��             x��}[w�:���W�i�d-Y&��<�|I��N|,�w�~�$Fft��"��~��0�p~�T  )Y�>gM�>;��F���nop����������S*
�j3<6�p�p��.��;��ڌ�{�,�IZ����X�����ȉݡs��������s������;t�ĦL7��?��o�nEY9_W�1`n��7�O�˂�r�'�G���|Z}�;��f+��t����G.,=�ȷ����b�_Z��"��\}s��#'���b��N_���y��y���ͪ��]�ˋl���^d��(�`( ;q��$@�����G��*��Հ�s���ȳ���pr[�;�,+Qr< ����(��<9��S��m��Q{��BP�;Xq_T�ҍ�9���XU�j�U��)�����(:a�(D���#�ڶ۴�z3Q��7�'~��ll�;�G��oWWW��*_:�k8@'T�E�����<[�MPߦ�|ɖ�ʹ�@��|3��=�<8�~v>r#�8A����:���:-`�έ�T?Ĭ��F�A�F~W��Nm��nH1�;Z�p�9��M���h*J\G}vCo�,�#���s����b*[��|�|�"��2/v\z�X���Z}zwiQm�ji��i���VpS�B�ҸX���uFg�O�-�B��Q�3ř��¡�,���j��I��z�\.���韸�z&(�E�Y��6��@��c��#�-��ù.�����?j�\�JQ�z�LqǛ素�ɸ�d�Xm�N�E�X�&l�\K�=���p�6�2[�&��s8�b�o�:��1_����{(�w�3�҄.I��-��|�WŮ��;�XGo@#�yV����x�X	'��NIu�o��X��=6o�y-�S��]�$��p�t�+�� ���Z7Fctnh��P�K�X�Ηl���aa<�?���3�&�ݘ�eR���p|���2�������������_�*��ѹ[	w�=X��>���t%������LV��������/L�3eb��,�X�(�!���,�2LN��;=;��� |2������1�D�+ݕ�l�\G��7� Ob��n��=�0V��\I�l[���k#�i"��5J�����SP�e�rf9�yQ­	������KF��{)֢c�/�r#)��6�hi�h���z����L ��O�(��?gp�i+�땺�`���'$�)+��1�.�u�c0p��6͞_���͵��|�]��g�l���CZ`3�.6i9 -�*8eI�����		:|z�ֽM��x`�㸿K�}���0�Oq��xn�Q �w�b�Ν����?¶�����"��?{�rĠ�~ �x���8ڸ�a�	���?3�"NU`P���UVX�^�(2_=�x]����S
𭀅��6P�/#��MSF��Z8T���,�F �� �w0e!��)�>�x�$�p�nҢLg�]�z�3]bw�`�#t�>�Z�i�}���z|�����dD�U:��x	�pP݁�f��#�3���{ƭ�����O?LsT�"/S���uF�$�b��O����O\��10Y�O�"�	K%;_�Bh
'��;6��n�~���C^>� �hc�0`jރYԝ:������/-�mjR�m����ȭ��ţp16���o�9��� ��������>c^ח��8"7�u?Һ���BR�� �F�W��7�|����?�^��y#��x����ƭ6@~DN��,�5��K��g��`�<X�V�iG��"�D���/�nT9�l�5��?� a�z�o���<��h����Ԍ#?�2�$b�y����`�OT#:��ަC������	�3 g���;��b57�`�'�a�Q�/��U�Tԁ�"lm�#�u�#�\0?�� �s@��\�> [�M>i���-�Xl�V�%"o{�Wh���,�E�s�^�r��cc��;X֑�}����?�. �W�k���vp����譛ˣRB	,%G؝7$������{F�O�k���F��<�D��y��&���x��ŨH��k�ޢ뾩�B�-�L�tr'�W{-��_��Z�\�Ƴ1����Z�ܤa�����-�O2���!���X��۸�E�
��;����Ҷ�|�$�U��9w�6�Y&/;�F��7%�	X��0f:N�����	�8/Ul�a!�8^�6�3
h�����LW�Jf��yO*D(��[��h��P!���|UZ������jNV��f"C�����2	�x�0��h����T3�œ��t�S�����J~b�yH !�׍��L�� ��C@��� H����

��uq�t'[`��r9���-(�@:�2�] �U��a>��	��P���	y��e+|0�a�������	�&�3m���~�Э�ؑRL�{��?��\��`���!���LP����*{@��֏`�0���D��Lr��]Eq`���%pk�ޒ�?�_r�V��t�D��z;�\�H턨8d��L���� �?=�K<�X�^��H���U��ץ>^���*svT��{�n�.�	r��Y�0��L�s��V;�Y�nh�1%��nϣD��v#� 0D���R���I�2e�(!��6�A���ȼ���{��%�>�C {����.�2�. ���_:W�]]�'Ssp�ei�N?Rm��D��M�pϻZPя�A��0C�.���[�ܧ��l8�6�*_<b.B ����n���'���ݯJ�2�������w�͓z�o��>4�|�����̜-�6 x�j�p&���xw)ة��D�}�'v�삼�M�����]!�x*�Y����͵ۮC�e��g���{I���R6}�^e@�5�D��{L M2��y]�3�bB�}\,r��n�G � !QJ�C�>42;Rr)1��;\��y�.���?<�5l�,��.#_�oW�@}�ҩ��ry\�@ln��K�F �c��-�a:���2\�ы5 �V�,�T7b�$��,ŲHQ�.�&]��r���Е���,�.�9uu���@�Hb=��,0��i��j��/�\�o������}�B�z��zB}��0-68�t���"%�y������e^Q\��*��K��-*����cO�Q�I��ra�Kpk��,Ӵ	��+�����+�Fߐ�,�Hb��cn��|������<�s��/�9��4-���4f]L?D��Ld˝h�0�w���Z���4PdS���az�i��qe��43��\�ۃP�KV`���Q�l˝4p.� `��ާ|���"�l���rO�'��{�4ol3Ir#t{���,��n� �!ה"�Rl�G9�!�bV��b�މö�ު+���}8�� g��ⵇ�-]-�u>�V�J��)3��Y�)ey���E)7 �p�(pm�cT��5p��?Þ/u�>Ȫ��r|��#<�=�|`��ƺ9��2�i�1�pA<��\d��3�w�IυM��s4�sg����s����Ld��u�<Nj��B/�\�g.\��
.�(�5b�� �-k��CB�aL�z\����0�r� �O�b�A��:P�	<dh&�z�>�	��߽�Ԡg�\��mS ��0��j� C�'q=c������v_��[��C��n��o['bZ�W�S�?S�� �6��T���� �Me���� �1����=�[EZ��$؞�S߹Ip��n��C�TI�31����~u[.=�*aqdGf|��@�t�y_ɸ<�V��	`�k�(S
��N�rq�[d+:ny��_s��j���9�{z]L�J�0����t����D!8	.Acd�bo�I6
zC�L7�q�utFw)\�:��\:[О��\SQ�7λU���
��Б��.���~[x�ul����`��U��B����0VSDj醧�:P��3/����6���q?c�\=xG�WE�	9�Ñ�����z<d��z)AJd:�׭�ʌ�    �)��+�p�Ӣ����	�	��{��a7�X�K��f;�3U7�1]g3����:T� [Cxv�o~B�B�?6*�"�1)S8ę_=:?DY>�?/V�3�W�����f�V����#"+��B� YX+���\��es\�T1v�j�AiC��厎Ѳ)��-�d�$ƤͰ������ ��
8�*�[W��:7��N擮��v2I)��B3�j	HbS6]j͗a-� VLN�+��f���������{�R�J�0Vw�:�ϸ�J��&3Ð Þ����i�	�/��x�/���Z=����-�6R�7	B��Kp�#w�p��n�u�6	cJ��vz���O�f�C�����}Ȉ�^�CM����<��r�ժ�7�b�
/�3��TL��Ep�<^���L<¯+�U�Y^��#�����S�	f:\K
�[?uj�:/R3���3� ���5�H�=6�p��C3�1<^�Z	g�=�C���8!��Y�#���,�&� Dq{��W8�|MѤG���S��kv*�j<�ҙVb��-�)ķ*���Ԓw�����h����ۚu���°��*(6=�kE�e!v��Q�S��l-����;-X܄5��6����*�RJJ#O��C2�ظ�8���qbp�w�ċ)y�ˋ�1����E��z��C7��@}��t�Lӕ����y���^�-'a'��~r�'��<�N{� l�>�#Z>�6���̥d���t@ 7kS�?zU8��Y�v*���\e���Me��}��y�C��\z�uz���r�����Q��)Q"�) ����!y�'CNP�7@��b����/D��:�o�4�<��ݤ��Q'�7@[�_�%M�B�����l�a,��"��c����9�2E���p�9�Li]W��pM��0E���m�`��������v2H�g��`����"/�yHh��*��!��RS�<K78��_h)���*�0c���3��J|������<#�k�Mߔ�=�L/fD&"z�E�!����~����إ��R��B@����pǰ�Le������Ra���v���ڧhW�U�c}?���^���QP��}7{��OW�C��e�Jw<y��y6?A)�-	�e���=x����[���Q��ey��۫�ќ) ݆�8�C��\�b�<��h`��?DA�>'���sH.�%���^�UR�h=b��m͏���B� �׏p�w��
D�K��{����c���h��>|�px�S�`v,��A��e�(#��fGqA��h4�s@�Y�B�m��ʿ��tY�&ô��$:K4XZ:�� .p�q�̬/'�S8� ֦���Ɖ<�C�a�a}��y �9Gk��Zy����KLE&�p�n1��y�d���8H��ߺZ�$0dQ�k,����\oJ���FP#�m��6
���v��!��wR�!w�f�o�$W�Gl�4�2�v��7rF�\֋r��J���X�,��"�8��-A��{�'O|�L��MV׭i���B����Vv\.U"`j�[�FSJ��@���K�-��S���p����q��ŠgL;z�݈�n�p5&yUX�Q@|	�-׏�R͜K����U�l�c9���4d5��I0�d��J7�(%�����+T� HjS
쪄O|;w��~�Vk�*R�o{;/��ߥ�PPQ�3:S7EWzX������r"�Ǧ��Lef�ŪJ�x�\]�%�2�C=��ߢ[F�c��7'�))�6�88.��uL
Ѿ'S�V,i%����|oǱ��d���ʃ(+����g�V>T�*�j+mwl�$�r�R��s�+A?��lW�CIy���,/�w�%�-����`����$^���l�c�{ �Z�8�in̥���ʘ�e	��dp�h�'�k5�8����|�@��KAf�)�ftLբz�~�GL*벼��{:�Z��UH��ϟ_(�+Ӽ�lv�&Y�ӝ��
c�)T6�ºgA�O��E�K�1�l�YQA���p�~� �#�f���I;��}����G�B��6i�J�F�+܀9N�b5�i�Bs�I:�O�ܷ�����&�2�5�^��1��CT<漓�Ll�$x>�<�$�|m�|ē��`�_L�^�����.-�pC��������%�]����<�d���pk�b{,�~�Rcܹ�E�Ig�Utʕ�!�3����Pb7��äѢ@`����Ý�?xʋ��`r��M�.�~ /Ύ�)΂lEQ�}*p��-��&��-/�i�j73IJ�u��N; ���o�j,wq�T�[Ȣ�Z}��N�S(��%Z�=�<o��T6B���ID�M;F3n�ϓ�ۍ��=��s�J��(�I�-�L2�?[������N��1� CG��[WIߛ�dL�W��eÿ؉��]C秤�p����G �r�6Oy�L~;�i�X�1�'���CY�d���?�)Lo��e�d��wZ0B��R2�|�H�K��Ӵ]�@P���� �0�4Թ��vG{��z���b�o~��84�M[�N�?%�]�� |붒DvRN��\S~W�rA�2�.l�˪�ø5�`�#�ά�8��X[�"�%N]r�J��卹?
�b��oW&<�cs_�'@e��`��	��DI�s�����"K7HSw�Cd���5�N��=����������J@k�0oi��b����<�v�ah7VIB��U���?�$(��������:݆ub�/�Y���G{`A%�Z�[�y<���߄�wѦa�[�U'�&��e�3J�O�{�.�έ���r��|E���M����Ks��$��ӜL3Ȇ<r �O���！�B�#[B�w�V$*G\nR�T�R��3�,7��#�?�O��C���7�u�O1Mcs��vB5'*u��T�0v�:u`H���zZ�p�̒����GL����4y &=*�Zeqr!�ꃇ�a{V{����E[�4�B�" d��~h�~+�v4#G^n�l&~ W_U�f�L3<^���b���|]d��b�07˩����_��B�~�M�/��BL����!k��0!������E_����"Ճ��"kl�.!�sv�,~�Ŏ�b-9���&g9��p�����F�ls��]`����B�i�!�[�ol�v����*�2޺���#\īGr��R6�+ w�uՑX�t���L�̳,�I�����v�M/#�G/ϊ���ϑ�8����D���kM��yyF�@�X/^n2ψ�f/zy�Cr��KL.��L�Oԝe��o/d]�
O���b�>�;��v�ZA��p���M�l��CU� ԋm_�P��JjG�=�L�I�QZϪ[B�'i�ToR�i���(8q�qo*aN�Z�r���V.o����W���N����Ws�|k\�G^�1' ;���;�_��ȿ�O}L�� ƋA�8QV��^�-kAw�*_ȝ���<	�����z3�3�����l����nT�� ����	>4'"�qL�Ŵp��E.���?�-YQ$�>e��q�-6_��B�X��ݗ�,s8g��wx�pmX֤��X����U#�+�q"/�錌����� �݆�NER�~*�*ڬ���s����w�����#��!�-��G������Gg(�<	^���}d�)�cA�?��O���|�hdx�[Q-m����^���l��i�ߤ#���˹<���RQ���fU���zo�$[!��"�h+��Rs_�gܗ,1;7t�k�Pq9�wG%{���I�(b^{ڦ3ϩ��切�Wf:e��"`,�R)����<L� �"�&N�ִ	(>'�g�������3v�`�G���V�
<�6��/�~�$q=�`�� 2=`�G��J���
��yڞ������b�H��< r�����6�b����[�,��hk|Zm�A���ځ���*�^�S�30��'��·�Kl�EB;A&�Rq���~�����~��:FB���ԧɢ��K)u�ڢ�8:T5RnAW2�a�G94G�d�U--�	4bR!C�aO� w7_LB;qcl���_��S �+����OjRJ�R�    ^��5������o_5�|�/�uT�d������ͅ�eb���Fq�T��a]Il�_5�r�i}�3�N9?���kd.�TcN]͙RCƔ�'b3�aD�� 9a7 I!�ɱ��y��i+s��7hg�e���X| �p0�p�~l��)��	�P���ę}C���99R7A��2
: X�P�r��uO
\������`H���!3��R�J�k��Z� ��YP��Y������'��,G� l:��ٙ�V���)݁70��Y���Cz��O�-�+��.O�m�B1����MD�-�v�5҇�m& Vu��&<��{?��#�o�Cr>o�������v�T��ڑ�v�k8O�J�}Q�!��c�K��Lf$��nY!ۛkT�a �ț���J�ZGƑ��:�$���P����0���k�L�����w���5A��,�$��b�܉� �:]��T[Qz��r�1#V��ˑu�VCPӱUW~��w��g=z#�/�z#�vj�c�}<	}ꌫGj�M�b�jKǬ"��v��l�;���h=/�q�{��Ss�}Ҡ�e��A��W�]TH�h�;�d�?5C�@õ8�	�ZW^N���t��]�ϫY�kmA�� �m�,n��~��Hc�&ݼF�>c��[�m�� ��ϭp������#i��+C�v�{�x������I�x
��jvdc7�j��-/+��Ԛ�9��,�� �j�����]H�B*�.��q~��~GJ���[#�`��&�1% j�0=��s�f����sZ#�Wb��n+,�z��������n��y)7���=��((��|�2]��&o�F�G62
��'�X'��{���@U6�[m�HR�=:^�K�^i9{��4��b�����2�-
ķڋx�� A����I/iͻ�o��u�Mb�yq9�7Q����P�����K��GQT�Yd���opD����]�!`��T8�B/��g��V�G}/��}	\��M�6�Mo]��0I�X܉~��h>�&V�9��[�)	UW�� &"�KJ�B��fN��T���J��%�=��xK��c�_<��A�Ѱg������V�o��m��򃢱I�pN�ۤ&,����=B������h�CI?j�3v01������� ��4�hG���}�V3O`�O2n������#OZo��b�>�}������TZx��T���2�Ss���;x}vT��Y�
k�s�MAŗ&�t/����#=�	V��W��H����H3i.Pxbqx��,���>�ș�����S�F�}��B+�rn��B,Z�GD掃Gv�H�|���������`��3�o�l����YS=�Va����o>�,٩V9�y�$�ۅ?E�a�Cɹs��s8E{\�k��Z-�E݈�&}�rl�u2�H,��N���t��8�=�b��!1f�7�!�W�8��#�����FN6OU`ǈ������ G |�iaO��KĢ:k�F峻�m�{5ќ\�y ��/���,�Br�{����j=Ͱ# ��|��k\��vf�z��гX�@� �o���>HN@Y&�y�l�L.�s���0l,�d�M�&���ԩ]7A��N����(R��ou�(�?�}�:������&��U���QI5qD�'��!�]�̰�g�����-=f�zĴgaNĦo��
,]��t��9j���S�^D.y�q(�?b�ax����V{׫;F�<�5����4ZW�~\&�	��9.�_)��S���}��`åGk��/}����W7���P�k�������c����}����63L+j��y�1=�M�7ܻo.7_d)\w����+�V��V���P�$�g$�ut��(��S�U�㑞V��I�Vf��G���2S�-�e�&�+�o�?�I�z8x`$�(�=�������jWg��a�]��2@�/N��r7�5�B.�=��\%�a9�Q��4݁���f����աN��
/ⴖ�y�P�W9����*����̃.����A������nZ��Eg�c&G�cB{N���Y�Ib`jǤ���9��o�ټQ i��3:�����8/Ʉ�q#ˠlp�9?(�?ԉ
T�ͤ�
�bsOD�h4�"9��O�O֛o:���w�I;T��ªu+�%q)���dL9vZ��e�"��\���3�S��x��m��+ۼ���
�"�h����ݧ4��D�I�i�>�P�X��Z�:r.�3��5]�{��ԯ��C�o�ɞ��]v��\�ګbF)M��X+�ol���.�M��p$#뗄���۲&�m�����_0���P��9�ʯZnt�~�ʓ�ֽ�0�v�nf*�A��^?��zp]�йY�1f48N�k~�����#���>	�B�Hr���4�娣X
����5��P(uӳ��k������iN*��Z$���:p��E����
��h-o���\d���Q캪D�5=��l&ݟ�;4�/�ٖ�|�C��諩�?/�������-Oj��k:��C�v�Jmy[o9�����+1�8�7� �Ƹ[L,c[H�#���~�ڼ���y�0�܈��A�z��=�M��R^k����9݊�|Co*�Rn?cb&p�Nd��B��V��}�	<�i��N�k�z���q��,�UsE߸��$E���all�ZR+�TH��2)2\�\��9̓ ��Q�F�'���B�
A���jo5���bC+�tj3_D�4�I�����ڙ�j���g3��3��OV��f�� ~��|G�7�5R��,�&�;��z #�л
�i��G�����ֺB�{G��V'�nm:���$͖9�J�zx�X~�vܩ;�{�F���d�}ޛ��,9�JpT=3-h��5����<Obu���Y���T��[v/j�B�����'g��Bl|�-%�k��Ӕ�rۑYm.�/� %��\?���n����&=/�b���HoD�8�Z2� @
^���w6�N��|�=���VK6�zwS4�����*łd����, �]�k���p�G��\PY\ie�>^�]с<�EV*�@��;�p8�>U�9�k��n��UԒAN�}�p&ϻ2]S��@�#�w���>x~꾭	��Ǽ}~=R�OpY�5��DSWy1>�G��*~ir��^'�)c|]S��ٺ�y���tpy��<�F�"o� �&�`�f�����#���&����,�D�=�MرRe y#w�'���1ʞI�Ǥy�D^׆lI��q����6����c�܈\�w�����䒯h�} �o���D�;��jG���� ,��6紶������oIܼcӂ�QԿ֫��m-0�/K�����\���8p{*߶�Po2�klg�j����rB���
��@���\�ܹ�6KJ�A�*j�#ܶ��������<5{ʥ��S�*pV+��@2��񉩥�����<�J�W|���1��8��:d&�`�P1����s����r#�l�(�Ȏ�=*���1�i�5J_o�e`�',��ߌ�8��?���������
�7���ǟ�o?^�_��g�Ƿ����׏_o 4��������l����&м�^8ww���1�jڮX�W�_�����q�HJ慉9�F�+�9I��5hQ��"��s����\�>7~/��9�C��E��Wu.�&a�t.%���Ƒ"k��^-lG�n��b�����vA��|�?�}j���oS��������9�]���� R�A=3V��� ���Wh�fC�V^v��S�Ds��YӼ8�g��~�y�>e`��n��c�����1�X�7��.EEm@p�&9�lQ��b�~,����YҜ���i�:��>��G%p�%�=�)-?�֒k���tGt�;J������@��7�:�zR���@�%�LN,#���-�35.�V I���U9ɋ��Z��䉺��=����Þ��]tԣ��]��U>W�W��x��m�S=���`ZX�ꎱÜ��֫�'~7ڮ��&�-��.#p�kk�֐9ř�=�����b��	'F����iR��lF��<<��Wr`�v�G(j�E�W����=�\�k2j;b ~  R�����pI�/o�g��ú�r�����j�ݽ��.�'��_�:�IW�|闯�p~�}��b��qi��i�)xa���脛E���|k8_�t�{>�M�ƞ�p�˖�-C屔��/`���Y���7.xB>v�Ȉ"��~��^���\W�a@�.���t��V���Z��w�p�w7g���ܗ��֜���~%'{�P�\��DpL�*R�>���{Z��_��Jg��*��F�&�;R�%i�'��'�t���m��e5��e�l{*	�d��&_dD�m���|"w�L~��
�Fϯ���J�����1=x���%�3P��\�ݦ%��|�
��̖�/|�OR�l�ƺ_TE��6ݺ�w�8�i�@�Q��דl(]��ج[��K�ܾ���n8��npJj�r.
���ʯl�v� h��=T*���.�s1M�qV���ռ^麒��/�s��]���n�IT�Ulv �J���EL6Lǭ��%�������[�F�E�K=�	o"9����9#<���޷?L�Iε1�Ě����(aƺ�
���+�l���}^W�i,nz�i�S���vժE����T{n.�I���5r���0�ŀǭ��`�8d�׷��sOP�¸na����1	��V��`I�#�U�$o�x�f���w��9��%j�WP��,�g�.Ő��h򌦕�@Ï���}�j��á4;F�l�SZj�H�y��y�Ȕ@���x�B���-��w�u��øz[C��L�E�h�-}ɟf�����6�ڍ<Isv&�(�������"���@��g�o+5��L�r����Y����0%�����'i���]�p���<�}}�&2����Q����"sq��5�P�')���7̱������a�+ � 8��%� \�E�T�� �ٞ'J:2�:B���Î����lx���B��g�����Dl�������dN�5���@������{	���5���d+��	kB�c�,�f�Jb��ʮ�\�$'�E��>�����9g�/ثEZ�?�x&
x/Vk�5͇�a����u�u��9��`�}W���������G�ꥯ2{ai6���S���6��t!h2���($RW���<'�z�O���������G�<�'�!/ʊZxJ�Y!�9BA|D&��C7M��T��ՠ{6Ƹ�\8���6>�$���Y#��b+��ԥy���c�%ğpq�[)�K��1��z ��=�c��S����}�LӡS�v��'	�d����^��Q�pr����S��<E̽�V�U\�,W�{��O�I�F�P���C��ѻ��ek��΍��=&&�z��z�ܤ���l�ǂF���ǻj�;G����L���]���Nq�c����u+|�l���o�Q-/"����f'�w֋��7���hl}7��K�w�ۯU}t���q�I2ݩ�9�8���>��T��Oz �윗���@:�"�����7q����c�	9��j�O$�P��n�ۂ�-�e$�ӠgO}�B6{j�ل�� �zk����V�征�T��	i�$��J�V�f.�#�؏,�לkN��Hh��y~�9o1tx�Z�^��[G�Lh`h�������f>���d�.E�_�=>��4#���T"�X���d���{m�9+�I�--B+� �bu�3� *�^����v�aC��P�R뫆:y��n�$����ٺ�ys�<�j�8��fI��#��u�5��9K%�	p`X%�3I�o��V1ѓZ�t�CZ�,L�C���}�&g�(��?Nz���V\�/��F�]�Um���!ZWh/��5��9v�89�5�������.c]ӁszfX(��$;���ũa��<�����%A��#�Z2���L��t���=��m�8�Vu�S���[a��ʋGm��*P�.,h�U�(ߵ��_O���1V&^)��@�d�B�w�lޭ���?��x���Ⱗ��/������x~"�"�o���k�Q�4�SJ�%�u���xD��u��B�/� 6��S�9*i's��'�0D�>�Z~!���e:������29$����o)�X�$$z���(��z��M�$���i��T���2�L��1%�͹1�2�y�-6��У 1ɡ[��=��Bo�x����9�I�)و���*ӌ����~ ��߳�i��~l��R*��!&J֢|��Vu���]�0S���&��$���?@Mw�|�S3�.�:� !�?���a��X�M�}��l���=;m�F=I���H�?�4�W��-���has��t��3���?"��'�Lc(I��� G�=?[��Bk7]�b��V���زx���ɑ�P�l&��/8�(�"�~��a������L�}��6aU8$r$�am���쬞����OxBY��b�4^Us���UN�;|ԭn�7H��ԛ ��x�o�r��"i���I§�6۬��J�u(��SQ�����-5;ߴ�7(����fl��׷C OQ<b�}'���z��H��|s��sv�'�j�q5\//��POD�VȲ���Q<�@������.:��©"�n(D��o��ZZ�����_�<n!=	D���o��t��{�����ե��U�WP�^���$�WT��ٳP��XP��Z�І�"��0ۤ� �d W6�;x8�k�Oq��L� su��n=�k874#�ь�F4�]	�8�w·�I�̇p=ƧG��izXV���C���`!�K��L��4s҉�|y\�#L�8[�j��Ky�OKY�]��ZD-�LU3�1��S���Q=�e'���kCzɋ� q�>c��z�(JL�h���<�����ruwyo�s`ר%w�C��b��P�f� �T�f�Z7O��SV���ٓ�o�2��l�ZO��e·Y)�Z?
��f-s&m�'�H�|^I{n��z@��&�Ir������w�^����YTc�
Wۭ|����l��^����iZ#D4���ᷓ��AU���݌�1�!�A�6?j:滱B�g1��H�!��x�5K��W����T-w��/,Ʊwln�I�����|
�X���<��U��*E����%���C(�m����P���C����;06��*��(�4X�`��p4v���TF���$��wX/M:�AM/Z��2�P�Y��ǈ�����8��z�������u�J$�i�o���S�5D�\9>_.�3�=��P�'9�����&�5Z5�溞�ΰ��k��H~�3_)��X=H���ի��Qg+�ث�I_���[�D�?6h��������������Kd�*�9!�<�~���Hb�q��ܧ�
9�v/jڣ�.���إ��\����p���,_�Z�Ӯ�e�o���zlsu͎����y�nԟQ9f� W{Y�[=�p���w��Q����/�U��HX�3�l�"�k�E}�v�������o����)      !      x��]�r۸ҾF�wsub�˹:r�-���Ɍ�\u
2)Ez�ĥ<��^����(ɞ8�	�IM"/D7��_�lP�1�� �lǶ�ز\۲�)���2ń�Q*
Qp��?�S!��)�	��Dє�C�b.2>�������҂�'���-|����a�I?7(�J�Ӏ�0�|�u��Ͳ쎨�tZKx�(�D��%���(Q?Y���J����ॅ����/O��Y:K+9��(^������عH҂��b��*�Ὺi��lT&�Rm˶} ց���R��7z%�8I�2��Cx���OW|糡Ld܈y�H~!�LT@
�Y��,�ǃ������v��^��{��sY7R��.e@���K��D���T�冽�Q�E{#�;}�8����ȳ����Ӷjs>��\�Ɓ�[x6Q m����T�l���B�/��'"��5�8�"�U��)]���.21�$�y��G���
����;�G��N��L�D�AŤc>�Ŭ�ǫ=�_�'�{3�~.il�����EM�6s�,1^�^�1����e���(�+��*�0�2ǝ�������F(�-&�3Q��31��g22]Θ�v~�Ӫ޹��t�N3��ܕմ���Y�۩�bg��e���&M�zG�7/'��ۅZ�:}X,��UiрN �;����
��H$�Qޤ����,�	������I���Qzu�^]�W���AV������UQ�H|�px#��}����oZ� �g�8�݋�M���/'g|���ހ����.p	%�tpL��H��*���y\��lw�џo��:��\6E1��^5Z1u��t�19��#���ٮ���zttdǞ6�Q5s2r�r�$����_��g�|� �e��),w��f!oE����B�I�'�0�ʯI�7 ��E9&���+���|�_V���`�������9Q��L�*b��o������nޓ�IL�l|��6'��E&�aZ5J��:,E�I��ih1`k
�/�p4+p�p��m�H���B��<]��sp8�k{�/��#4�mvނ����QM@�#C�X�p�5^;��y��� ���
H�6�a��ѷ���u��]�"��0vl��]v)�; ����S�p�Q�>�Ęǆ�,X)h���)�y�tHA�����I��}��G�Sl�s�'�O_��;lk�mxG1e�c�� �B�b1u�6J���IS;}�ߟ&Ua�N�i#��@2Vi]�Q��{��%�fy8a�H����a��L�Qda%�չ�X�Om�v��oO�Ϥ=�=�]���ڧ��*�Ԣ�wQ��D��b�l6��d.ۚ�$�QU,����K���T4i�"��ļ�*8�]
�������dvD.C��h}�N�
��`Ru����aҾy�s���P0����!�'���f���'�s(����֝�!�倁��4�l�C��(X����?u;V�i����cE�b�.*t�f�j�%�Rֵ3���Qw�=�Ta�t�G�9��<1���a�c�`����L0kIRx)E����i�T�-0$31� ��6��ǫ�1
��o��6����A<���S�-��(�j�I4�ݾ�ϨMt�lb&
���*V�jq���5���s�^�M�@e��"��������b�F堫D���؃��wA.d%Z)|�!_�/>';?6�[\6�W&mU�"�d�i#�#:~�B0)���n{Ϗ�)���e���V^BlG�rz{	&�`q�0oS�2,QTzt4���/�v0f{���w!؈��Me�z�9�9�v�^���m�!��T;z��#(�^.�Q"6�J��3~�E��D��P�KLk������F��=�{㴀�(�"O��Q�śA���1�t��l0�W�2S����$����M�B$i#(�u�G4d�E�9Z��L����������I[(�:�b�i��ب��na�`U�H�XYH5����c�<���x�<�S`�Dס������)�O�.cz7R�=�h�G�M�1;�-��b�W�S|�?s��|%<������2��VJ���۽���F��m���Y�|?���4d�����B�+PmVG�����$��wX��Zf=�O���e��F��vR����4sQ+ɣ>2_uE���&��AQ���hH�\*	�%�X��Q�C/Ш-��0��c��2Y���&�Rtv����j+~^f3�<GX��_O�`���I*�0㟩B�B6����:��i��Q'4b�(c�%ߕAS!�@G���y�c�|
��L��$ͧ����w;h?e��φT@l�5q�\�J%E=��X��KuD�탈�-r��m�P�D�CͲ�O�YF���4ìߥ��h��Oq�}���K�F 7� CG-Z�
EE���3I:�2��J�Ud�L�<(��^�Ϸ�n�.
���ێ�Γ�\��&��g?K�-AO�E�&��&��a1`��{�w˕&Y-:#���s��&5���]�<��$��n���N��}$3�u��?h#�(�{���J�j�sb(b�2Oߛ�n�+H��S �#%:k��Q�b��s~��*z�,�
����r$&���I:!��f7��lU
��Z�L�;��TF�ڮ�DS6��p�&`��,.��\�)ш�\d]������1�v�zU��Y����!�0M�-��ce.3-�m�	��A ����	�>�O�j�?����Xp����pv���(��\�s�N��d8��D	��D���B��,����ހ>"��6�[ �����:�x���R-X��`����{�Y�v�4@��;ȶAsy6�z��iC��
��9�*�U���۞��9W@ZX �ҡa8���J\��s�ikk�5/�&���c�8���E���ԇ�PH�)�Yi���q�Eŉ�LDl(��?�DX�. (�5��]�w,����Ή��o�x��0��ܚ���e֕��&)÷ʷ�?h)!:/�$e.
�9����w�����������;Y���}` �w�f�a�}z��:H{�m�.�� ̽	�.;���J}5X�D��5�΀nO���No�רFUR.��1Uٖ��6����3JDU�`ǉ����P�>�~��'e����,s��RL͆�*d�B��-3j�P<P���/�XN�n뎬��`��龅��k<OI�ϴ��] �x0�f;�H�Ů&��PLP���\���TL&�0ʍ���6	}*tNZ�T�v��,[N�X~W$NnU%�L�.�t���6V���N?/�Y'�|�҈��3 ~m>=x.�P�|�.vWn>u�(�VC�w����ک���nen[��}4��Z���V�� <�����n�Q�{��۸3ۻyB�����[��]�T�/��M���ǘ��i&ҜEK�1ō��:����^[�;�Q����� O������1�b!�%�j��+{g��''�egK����\T�Ւ��l���4�rӦ���p�2��<ky_��	�Ǵ(��L�1�6�d�|vD� ��4m��>"k��M�p$��]D���̅���
�l	7���h�K5��Y9T�۟a�]k(î����T0Fg{؈�>�i[�}Q���2oD�/��{�o�Y�I*����
��v,�Јlv�?ab�RG�m"1 ^R&"�pf1��{9�+�HA����FQ�	y���J$r�%U��ÌF%6j�Xꄄ��S���gI�8���Hı�m9��6�,\�]q'g#�F�8V䚔���:
�Q�wj6x����!Z��%�����X�!���ƅ�'Ѻ4t	%mC���|�T�����B~��&�d�)�8K�y��(��Ñ���SV��oe��݉2BI<�Nl@p5�R�Hm��3&E�8�R�����Cncm�Aه�Yp��]Q��n�7g��=6���p`�NEU��8_d��ks��9~���l��98u� O�q���?ӑ�ޡ{�b�D_��&��==ӕ�uH�r���>;b&���BN���_Z&_����OE�7R�q�H���Ɓ1�	x�l_d3�	�� �  ���������"��L�S��z0j���f�o���&�_"��!�ZU��V��NE;�O�v��y4���-oFc5��p���99�3D5\1�c�a�M�X>��u�V|?ui�C��� �ٜ�M;�2𭐺����m̳����X�ك����X	��X"[��n����`Aᩨqr�v]bDŰ-C���c6���6K�ewy[�!�^�I�-��+_L��-��jٶt����6¯��MQ�q�+|��ehv���ZǥB�f*�.�m0��じ��"!��M����1L���DĠUk�a����f���{X��ҩ5�����z�ӺiW��:�.�j���(^�� uʀ���B�h��C����J�d��a������@�H_+@�����3$��������!��b)f����2�D��)��LC�F֏�=��73�t,�����c����������E:�g��O��Î�B�CT�ΐ����x�V��1p_b!fW�%k���(D���f�_�Y-��k";�:X]����3������k�����<}j�k��X`���2�*�	7k�!Ճ��h�Š���DWO*�����ǭl���o�b)`�����^tל��Af0�]A�o���wb=�A�0eOە3ڢ� 8�FE/�ޣW����݉$�����Fa��\�i��kќʳJ�C��c�4hϓ���ؽx�HxE�	p�����̸I��>�1zǲ s@Y����֛�u��%��o�hPGD!��HC�����}�SB�J:C�����i}��"[ ��
�{V߃g̹��k�=M�.���{p,@�SL2�(Ạ��9�.}V���p����f����(4�����"�c�).y7'�.�=�X�f���b��<���i!�!L���p�?��� #^7T,�$��)��+N��Ŕ�T��Ӫ�3�����{# �5#[��vۺE�EY#�h��|��hS�A{]�|=��,��T��Gz���}}��u����rfPZ�S>��P������J*�4�WM<��x����HՋ�_BR9Pw?B�����z[��؛�'f21S�h�K�wC��>B׷�0��QS�(P��P L����s��X��D[��Щ:�Y=P�R*��O�H��ƍR�ƿy��{Qb[��H�\׫G+�s�/���g�D���g�<c)�����{Ns:/��������^�8���s����u�݋h:��\z�ҧ^��c�I�5� u���T�@/�#X`&&����q�7P�׋�x~p�_���a�*���m�p���o5�꤭�b<S�g����}���p�)~s]8D�ʺE�L`oZ�.¼I�Ab��Ez���T�L�r��d�v���ع���'�)�hS�rʏF� O����o�&�+>��(h8Ɲ<6��x��:^��'��Y�J��w����s�/���a�_h�kS����X�u��o�I�+{N�0)6��u򃘁C�(2yY��X�	� �LV�FR�u:�yf������׷R��u�ֆ:o�%����l2�?_7���yWm����uIw�+�)?�	<�щr�{�7�<N7��o���q���j�۲A&��R��Q� ���q��8+:3Tt��%x5K�0\5Im�H�}F�f7�0����7���\M��Jŋ��K�����<��H���Ё�it^�����;o��`���.����ok�s����_g!f઀����A>�:3@�gц��֤=�4�������p�^�2�<=�ٲ��SU��ʚI3N|a��#<
��ۙ��f;���O�!��,��Rds�ʻ�5��g}QН�	�e`��L��FI88�^���P�5W�h�mNg"oo��/��-:$7)���22�\��2U�?�����<���-|.�����ٿV)��?u?��8?�9�y���vFqhۊ7Ҍ��&���R�m6���vc�V�[�I��6;X�G5,�:���g�u\��u]V�� �[���̄��_�3fkN�<�YbM*��A��nD"ʻ���$v��*&��G,���\j�Z�e�� �]p>e��dp�����]5j5ԁo�������c4��ݖ��a�Z��4����͏��%�k��U"��Ʃ��"ف��L���_"�RNM{�1S�a�z�98|o7_�����_�Zؿ&�������(e�f�X/',~N񩨦%�P��_@�kY�̤[@��\>�#>��]��EE�cS_��ߡ�`mU�>�H���	!�/\:���2��'��U��KQ�9m�A>� ����T������iZF�(Y>�����DP����1�㼱����cY�������w����c����;�RD�4��R�שK�e�+�F\���싦�ʩ�KlKষ�*f�2�0N96+���Ƕ�Ѩh�9����H�J�ǔ�zKjA��k�ڌ +O�G���G����C�B'� ��j�Xa�X�O?�,��'�>�0��e���~]f8�Q5	�4��[�|��0�-��/�m�Zc��kJ{@�/�BTY��:<?���1�6"�� ���J�ZpMp��x��	|}��ң�m��d���4���^���Y@`Ĩx���������V��ɗ7�{����v̬G�/��������/8���c9��I�Rs�]����摧�)��c� ��9
�HU��x�oL;O19
𤜶���p��d�cp��*]p!<tn�����ר4�o��������?�����'�Q9���K�=Ϧ�a��U�!���Sm:]k�!t�LU@���<���U��r\�8�Ͻ����%�NDi�2�!/F&�%��_��A5��Z�_�#����:�����o<��JRS:?N��T�k�w^�K~�C
/�܅��y�D�N��~�qY/F0��|&h�����I`aL�����R6zn�L��a;R�n'��
��w@4 ��Zb��w���%��W ����Ģ��1ݑӯ?�BB_���R���f9��� \܂��V%?*�$���~>��k���]1-�@��z~�>�RF	��<{�|\�G~�1���7w~�Ӫ޹��t�~b箬�����S�x�ҝ�����&i}u��w����w���M��      "      x������ � �      #   j  x��\�r�8]3_�Ք]�n ER5��=����V���M6p�H4)J�G�<���O̷̧̗�@�u�������ء�� ���PܹZ��"L�$���2U��S�p�y�|��?�s�\,3v�N˘�ì��\������?�L�	ҹ�g���f}<U3E�.���t&�D��΋,�$��yV�a���L\�f�~����#v_����W�=��zR1�M%��:�2."v��E�D1�p���\��!\�Tq�h|��$D������o4)�rNT&76�������z*+�O����Q)���P,YƤ8Wa��DFKǞgLi��ѓ�Z��p�����X��i���d��0-�B�ZlҎԛ��I�G8������8�#��_h��,�s�p��\+sĶ�q�y�V�G�WҬ�Yޕ6m2)�a'w����?����9�-yTY�gzk�����o�6�hKV�$�Z��2�)Qu��IrNdo�\�hI�,���y���D2��fW�&>�M�n��eg7�K6Q�j�]�����琠�F��"��"���ŭ|�8�2uk�E�z���*����5���ǎc���`Z{v�x�%T��S
)m@��0�I*�����,�2s���2A�v�������|�Dܗ��c	qцף�)�Ž���#��=�>֮gp���q$D�Rp���M*.�<2vɎ�_�j�����x���|�q(U
��0^�N�FGZ��0!3����6���JcX�JR�V�N�� lr�G���{��$�i��I"p�1�Yᠻ�06��
F�>�ǲ0�2�Jӂ��$LԳZ���=r~2&���>��ɨz	mJ<�a�~�f�\#�:�&7�N���E�$��7u�{"�:��z��P�}	؃�^� ���c��O/S��8�;:���ޠ5ZTa������yrPdxC@��AO}=$��Q����w ��z������z0Ȼ��Ǳ`b_��A����VNb���,؏�T+>ֶNv����2>�7�3��zh�\��'��8���f[��8;[��j8 �V/j Q�M��i;�^���g��2�fe(~i	��Z6�Y���4qM��X�ѹ滹@G@��;�q��t+�
�?L�{S��ˣ���ְ�..\Pk����	�0��
����vM^�.�J$�u��hp����=ޭ F�ho�λ�������;���ل�z��笚��y����=uz��Q�ї�LD^cAq�,��*�F鬇<��>�@�y��>��Mn�k���*�A�X�Y�.�Oۨ��Z�.Y߹�e���AÅ5��D�I����=�~$�XWKϊP[�B�5�5�+�)����5�����&>�ߛ#�T�E�4�˖_���֑�sfE������咭�O^Ҥ2�2}*c-N�a��j��}�E��U:�����Pl����D1q��@	:)�����>ڰ�A��U`3iOtCTᭂ�fE/+h}Y�y+C���h\�$L&��4�Gu�n�[���~T{� �޴ P��	�� ���'�c�ݚ����AQ�)_nyӺ�[�c�,\h�+�����G��EK��_�&7�c��
w�j��N��ĸ������vL��w32
���>F���7��
���<��)2;���Ɯ�r�������� q�0$O��I :q�k�[J�v�4$ݣ֭����!K �υw��$ĥ���0�<Z<R�z�eZ�q=9�u�o)�;�ۊ��e��u>*���8��b���v ���sH8/�9oWr���,~��]�Υ�b�Υ|��Rsy�yv�4�M}�4��qXZ ,ͥ_���%9��y�å��Ղ�๬z��~V^cmM�� ,*�Հ�<���;�ul. xq9��������V�ca����������-"rP�0iqi�&��cf�r�{+*b�|�̖h�j��곫q��QnR����Ub����-���GfWr��*�g��Z�D���i[E��[E�WYE�c���̑V�C���!�W��B��	)^�=�Wv�t?�4ds��DU-�vn@P��ۜ�u�t�����%B����YB��#�8�YǑ���]Ⱥ3i�7B�;y#��{xC�����1ؕ������d�x��As ���Tȑç�O�ШeQ9ۚ�;��J�$l��ǵO��LMUŦ�P��V�� �(�iX�燠ĖI8�Y��osW)�j7���F#�[U����8��S]����p�4~�qP���^���uK�)���SGpZ6��g;���%�^!
�z�����O8�}��vA�kq3y��~uNS��Ua��|g/��O����=dY��ϲ�hUQ�k!x\����t�R��*�>A�COF{揶c�ή&�w��X#�X�j5�E�Z�xA�G�pQiB�@;S�O���{���Wv,��m��)��18����Ռ<\��drQQ^��zX4��nUL��l��z�Ƕ��x��������������.�J�5�]��ܼ��(,��G��b �$(���I�8ݠ�Y�λ ���8Yf��d�W�V��{U�'�y��+���~O������1�n����Ά9���|���r����I��ɦ�OA����X$��(�m��n��v<�w@�O�3��(�r��,�`�¹	uS�l�R��i�lE�ƹ��Tm��� X8��S�\r�+���@sI���1�����{���3f{'Ĵ�7J������l�x~ k�gD��g�.j~
w�+���{��S�m�m쿇�|s���=��{���*.zk�N�\t�"�Q�N��@�<Xʕ���s��&�����8�z�W��.[W�ĉ�����w�6|���^��z��ס���l��/}���/DVi\T~�E��w�(��;S�Pg�I�]LX����#.4we�Y��{2g��d,�s�Qػd��aㅽ���&P�[��^��E��Sm;y��a��4OG�)������^�닭qt��鷢L\��G5\;f�vcBU"�3W�����>�����{�f��'O��Y���D%Lyx����{'�J���FQ	s^�0���'���F%̅�0�Q	s�o�0g�����zf^Y�pc���}��Go,#C3}���%�c��{�ƚ{�HU��,�>���x~p���w"�'���8Q����C$���T!s�AJ��AJ'D�I��C$�"1���H�y4x��9�o�0_qp���=�,�]�+������p� \��߿��1����nޘ+�c�R�ƍZ<ؙ}���%9�#�e�z�����Ծ=������a3Bp3�u0��	F�7?��y�N��̾����O�F;2��=A�ǁ�@�\x��h{=�'| >1�s��m���Y���&y�Rzu����k���.�:��Wq*�.��C���G����~�q�9M�Z}����6k�.���!(���PZ���悃1)�PZt� {��	\���"���n�مp�\��n�\��n�]5��m�i�nl�I�}�B�n�~}��N��-s1Y�e�w�E��Wxǐ!�Q�v�bC��JDz���Cf࢘�A+p��!�u}$+�[b��v˃͝��7G�K�iYr�#�r�L?}��ݻ�~A��      $   '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
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
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�      .      x������ � �      /   �   x�U��� D��c�����G���3�/��M�:�n�ր�䲓�6�X]�����!�QJuN�}���J�NiGqa�"��L��(���iE	�V�����K]#��x+)�Lƫ�>��,v�h)�G0�k��6��]��V�X���{�
�3������ދ�j ��ĐD      0   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      1   K   x�3�LLNN-(IM�2���SHJ,I�P0T�.(HJ�2F���B&(���3s�LQ�A��8�R�R�A��qqq �	�      2   �  x��UMO�0='��G�P���~\WH-�B9T�˄�lp⍜X���qX2��Z�]���ｙ$K
㛟�'��C�%Y�J8 �Q�?�Ƃ7�wg|m���`C3��B@��ㅨ�]����{��I��eї�)G��k��^����up�x�P�l5�n�=Zq�~�V�8`�� ]&g��'��M��<����7�9��k�2L:�_~s()�_�v+
����|=k��E����8�6��d�%�I�Z��
I>ѭ�gCJ㡂eLaܓi����Y$�û�{(È��8:INC����$	���,)䚱	��0�t��4}��GF�E����uԭj�8S���U�0��9����oʀ�Ť��ykl�'��]Z�&t7k�"ש�B��I��N�ꯕ���q(M�1�O|��{��'P�g��C�{�t~��3�OA��OJ��Ӧ�|6v�~���!�·����f0���3���<��������q���ƣ��Mq}>ep��$	szG����K�O���k�x�^��2gU$EK^�fQ*V�n(5��r��q��08^����!#w��U���s�
�h�*g0��&:J%�L׷0qu��3.���͚O�^x���Y��&���)���~J�3�� :�8)����$Њ㤁�'��qU�U3���j�U�w6�("���.�횳U���S��� ��ч     