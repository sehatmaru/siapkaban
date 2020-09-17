PGDMP     :                    x         
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
    public          postgres    false    223   ȸ       !          0    23343    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    224   e�       "          0    23350    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    225   �      #          0    23357    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    226   �      $          0    23364    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    227   �!      %          0    23368    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    228   �!      &          0    23372    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    229   "      '          0    23376    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    230   #      (          0    23380    jenis_pengawas 
   TABLE DATA           8   COPY public.jenis_pengawas (id, keterangan) FROM stdin;
    public          postgres    false    231   P#      )          0    23384    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    232   ~#      *          0    23388    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    233   �#      +          0    23392    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    234   \$      ,          0    23396 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    235   �$      -          0    23400 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    236   s%      .          0    23404    layanan 
   TABLE DATA           �  COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal, kw_k_kantor, kw_penerima, kw_pemeriksa_p2, kw_k_s_intelijen, kw_k_b_fasilitas, kw_k_b_p2, kw_k_s_pf, kw_pemeriksa_dokumen, kw_k_b_pkc, kw_k_s_pkc, kw_pemeriksa_pkc, progress) FROM stdin;
    public          postgres    false    237   �)      /          0    23411    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    238   �)      0          0    23415    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    239   �*      1          0    23419    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    240   +      2          0    23423    sub_jenis_layanan 
   TABLE DATA           W   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan, pengawas) FROM stdin;
    public          postgres    false    241   \+      9           0    0    data_perusahaan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 400, false);
          public          postgres    false    203            :           0    0    data_pribadi_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 401, true);
          public          postgres    false    204            ;           0    0    dokumen_proses_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 216, true);
          public          postgres    false    205            <           0    0    jenis_dokumen_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 1, false);
          public          postgres    false    206            =           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 22, true);
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
          public          postgres    false    221            L           0    0    user_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.user_id_seq', 400, false);
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
       public          postgres    false    3163    231    241                 x���ͮe����J��.��dR�H(�Db�JJ�@C��O�U���d�v��õ��rղ�G�!J�c��b����?�%�y|�������w)���_��/?��%򊯯��Ko����Pbe�?B�!���d�u��c�㘓LJf�1�X���k̬d�C��:�,JV�JH�1;��3Y�l�[�No�N34ɦdWr�P>��"��ю�%���ȡd������*�l���c�S����"�00Il��U�8X�!B:GI���-�b��\_^������o~���|��?�������(4^�謼�� ����)��Q_�׾�t]�zRj�z�l7����|LT�b��C�������h����p���F��-`���oVa��0`]���OYd�h�o���ԇm@�GTf�V�w�3���� �@�Ij�1�4�~
��t 9U�IB��䰮q��9�n;ޭ����*�I5�T�a!(���L�T�Y(
��ߛ��(j��T���<��t�l�j�Tӹj�8c����8\@����BU�T�۠@Un�j�YB}�v�
��XL��=,tպ�\��f��6�)�;f�<w�+<4�'���Ug�RBTW��Y���d[W7��f��N]%KϞq�+��� 	<�<,tթ+TL�g��{�+>T�%�J���
��m�s���U��ɰ����06b�f���a�ˣ�X�m�q����&]�E��x�F���ш]p�y���W�1�93��f����R��Bϸ�ՠ���*�ʘ�H�`
KB��ǐ�
p�ي8Uf�p��֘G�&�'����q8t��h�'����H"�wI�N��kr;�J:Y�Q�T�{�t��3�v1t�e��������i�0�Dw�h����E�^WL��k:��\�	�zD�yc�ؚ��u���CSkl�:jj���E�cc�H�ũ��,iKNZ�H�eonM��d)�)5Rkl�ײ��y���X������Z�I��F��[o��b�Y��ȅZ�Lk�h|�ǄZ���gcSk2�}�M�I�n����4�&bs�Stim�Ԛ��R�COǱ㢩5�vh�+T�ݦ�5�y-��3��A�ijM�lp�UL��Pj2;���������e��t�n�B�aa�¦�R��4�Vύ�7L�%�&u��7k0g�*Kb�{��i'7L��Y�W�q`j,���͜�\*J������R��TX2��ܰc�L��f��m�$Sa�r�f��hd*,Qa�d��3�0��-Uƹ���
��?����No��SaY���s��a*,�<��Qva適�<O���XO�݆��\f�1��
��F."�ܽ`���Gv��2����U�KusRo�
C�؊���/�0Vh�kq�J:�Sõa*�Pa5&^�*�c7et��M��d0��0V��ɠPa^�Y��0*��A��Ʉѽg�(�L�Ǣh�T�����u����0F_?����7�
����F~�
��o����M����Uɻ�4�<��V�|��a*�^����nd�7Sat����śIh�3x���;���>�ܑ �#��g�:#�#Sa�����fG����	3��G����+�óo��h�2�����돊�d����g�:2R�#�
���a�~.�d@g��#�eÎ-Ik��kBջ�dFo���#�86�Xg��pF{3�X��T�}=c��3{:a*ly�Z�y���`���4ԙz-�o�0EB��$k��ٴa��O��\Ku���H�ӫ<�
�~�L������0��͆):�Z�T_M�a��V=�ؓ�Ѫg�T�sbl�"V��~ГI6�4D�~�������LC3��a*�~=�K��	��h�떴4�ONꆩ0:�
�w�;�a{ؖʫm�a����7�F��!E�V����`7�D�B������?r!�VB�[q��ʂ+�d}U$f�:7����l�`�ČG�}Ý�뺛��|�� \gSfA��f:�]`�r������<���<�x�y�熩�8f�}ܒ���T���6L�ũ0���d��{��������Ɏ�F��i�/��^��;�i������ \ͱm�����|}��K��$d�R����#a�5����9���I������^tM��ty.:��&{�м7"���;�y�Po�@�ն�ڣg "ԙ����O�wSh��q���U�J3>�1���Z�(5�y�3���D�ѡﲌ@�C-�H�.���Ѭ%j�<�|=r���Mz�%vf�Sgy��]���N�{'�Z[6}zw��y����kfI�nL%Qk4��T�r�M����љZ3�>i�V�X����W<⪏2S��h�C�ܡ�yX4�F���{��3o�Z�����Φ��<�S��y�7M�M�>>��w�M�ѱ�����MSk���<=�$Sj��1c|���dH��h�W�+��7L��e/�7�L���g�we��eF˞O
�D�ƻG ��̲��Ȟo�-���-��#�3�>���{eR(1Z����qj!6L�Ѳטm_�lSae�#>q�Ra����/���XI��J_5m��*������?����b*�4�a*�,�`/���QR�0����4l����:�����R�0Z�	�y^ ���Rau^
E_2�0f�=����4*��>3���Sau�=��]�Ӏ�	"<��t>�n^�Qam��~�%�H:�T�Y�}����TX�O'���0�,{\���2iT�Y���:{����0��qY�=ih�TX�
�l�t�ݩ��V� {�<0f���뭷��̲�l˓o�T�Y�x��<�d��
��>�e�~n�j�T�~�g�{�A:������}��&�e}��G�F܌�	j��_��I��.�%ϡ��Ȳ��������>(s��z3zz"�>�5���1��c��k>G&-�.�Ui]t%=o_�\w�.���&��;�/��.�A�t'���i:K����L:�@z�T���;>�h�w��X\�E�a�G�]�\4Ԓ�"�OҮ}��uә�|n��u�х��N�u1pѕt�[tY��H�ur��.��.�V��C�� =�6X:�wh�t�rx��ª[���n
V�̷��j���o{��~.v���򆮷��X]4��޴��x�ۢ�5��+6�뷼}�Ԛ��1^I��{,�Z[~���M�ٛv�i[�w?��4�FǼV�AB��B�i�vV~���/����⠲��n��s`�`��4��C��s�zϿl�U$$�)r�Bz>�c�}~�v��?���..��e�_�����"]H��c�����J�=j�/
�q>
��lΙ�r�u�7O&�h�X�=F�%oq�sR���@��}t�/+��o�����]�             x��}[w�:���W�i�d-Y&��<�|I��N|,�w�~�$Fft��"��~��0�p~�T  )Y�>gM�>;��F���nop����������S*
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
9�v/jڣ�.���إ��\����p���,_�Z�Ӯ�e�o���zlsu͎����y�nԟQ9f� W{Y�[=�p���w��Q����/�U��HX�3�l�"�k�E}�v�������o����)      !      x��]Ys۸�~F~���$ܗ�t��[b;);gf2�[�I���x�ĥ������P�=qbz����$�Bt@����F��2;"�vl;�-˵-�a���'Q�8~���%���}7�]�� ��Q�mU�?d."��{��|--�~�������8l4���FeRK|��o���Y��u��	ϙ��h�c`�D��%�'�q�_i	��#���^^|�����i-��+P���7;IZ��@�(��Zf��z^�#QL��^�mٶ�:��?^�約�B�gi^��y��U��o|6��l����/d��HV"�s�����ޑ��r�ͻ����7;�M+�-�2P9��N�����I�Xm�Ǝj�.�kQ��[�i�7G��l����uu��Q!r�{�o��D��m�bvZóE��JɿԒ���J��؊W��R�~�m�]dbRKX�0,��š����;�C��N��L"�b�)�h��j�=�W��	�6F��%����t2Y��i�v��%ƫ�k�5R��zW��{�����F	/s�+I�+.�S�l�B�bB�W�������߳B���UU0���O��ͻ�,M�5i&�w�U=on�|��f.&�|7I�Me���M���;�y5���,���ٛ�b���N�tHݹ����./A�MD"��uz�^^^�2q���B4mZ_^N��K\��R�����;�����W�sW�UA�Ӈ�����O�^������~6�ٿ��T��8�r������Q�2�#���iY�ɢ��U�5<#k���.?�s#,<��7��Ƣ,xܫ�A+���N]+f"�w$�b0 z�u��ı��`A킌��.I�'�����]>e�������w��7�V�th��̓�?�פ��T
𢚒�~K��t���G>�/�A��l4��U���FȜ(~[&q��귯�œ��nޓ�IL�l|��]NFj�L�n�J?
tX�֓5���b��>_,�h��0��m��E?>��/y�2�p����[��&��yR��G=e�9V`����xݤ����g��W�. M�,��GߵrQ5�Rv���؉I�.t�WQ����,��0P����� �<6�e�JA�<O��c�C
�~<k��k>;}�<�6�1�xr���Q"1`G]#���(��aL��R�T,�i�V	x!ijg����$�*��i7o%W^ H�:mJt"�r"s�b��d�,'���k��X�1��1�)�8�,L��s�:� +��k�ް��I���g���SX��YM�Z��2���(�&v�f��Z�k��V���2ZY����HE��){J,:���cا�@/[?JM=�5�̎�e��ډQ�L��v�:L�7~.E��h��a|��xb�ȏ|r?Ǣ.�n���-��ΠQg3`�ӼA��gQ��\4�X�V�/.�i�!���Q+D�jKҥ�ko�=���{2���j�Bs�pybS1ì���)2�G2��%I�-���K��YR%����D��s1�]"1�W�kb,K��Qm���e�x��q=���[�GQ�9��<h:�C��Q��`�D!J���*��jq���G8;1����l��:�e|SmWKŦ��AW�q��1�\�J�V�2@��%^|
N�~*l���l� �Lڪ@E\��F�Ft�4�`R091����ts`��:]���؎���L���aަ�?�*dX����hzC_&�`��1ٿ?�C�+���NJs�s�-좻ҹ7���C^��v�"DFP:��\�D&l;���~�E��Tt�P�KLk�����F��}��Ӵ��(�"O��QěA���1�t��l1�W��*S����$����K�R$i+(�u�G4d�E�9Z�L������F����iW*�:�b�i��Ĩا	na�`U�D�XYH5�í��<���x�<�s`�Bס��3����)�O�.cz7R�=�h�G�M�1;�-[�r�W�S|�?s��|%<����s�~Ok��}r���a��P۶٧���O~��U	V2��j��j!�6�?����L�t����;���-�֧a{�xv+�Y7�E{X�څh���Q���"�\A�X�ب,�F
J4�y.����R,R���a�h��l��U��C�L�,�ScF):;�q�q]w5?���2�����7P9u8Cv�J0��'�п�mWT� ]>�>3�F�e̼�{#h*�hu88otb���AA�������3���׋~���Auc ��Xb�����&����RR�ӻ�e���QGԱ��l�"g^�t-��A�8�,;���e�8�3��}UQ�3�)��a��q�y����~d�Ck�B����{&iB��A��]���쟉�{����+���m�B�E�����-��Yo����ϒa�G����v��|m5CX�(���j�IV��ȵb����NMa%d"O�.Id��)���}`�FI��i���{m�|�ެ$�')0���!�"v$�D��9�o��T�=B�?P��(���Wq��ӲQE��Z�2���P�}��!0�0K�	�lw�\�Q�0����ta��^Net1����P�U���`!�`�� ���"�����E��{���i�iw�W���"��ۅ:D�iv�y��e�e�m9!:d�������CW
]>��<� �� `�)����/T=���k�A�S�L��\M��,Ȳ+,`��5�#�>�mS��Rh�n����Y5�jՂe[
Vj^�g�=��]I仺�l4�g��h��N�6���P]�è�\��,��y�.�>����k���ѝ�ŕ>��v�Z�lB�j9U��^[V�N}Ȏ��_����Fꊰ�_V��D�Ʋ���N��A�2 ��_o�{'���ZQ�;X�m�1�`X\�[SQ2���2=�$�c`�V�;�%D�Ģ�E���՞����1��=��Qs+����Dw���l8�O/�Fib϶�`�E�������Bk��`��v�<k8�=e�;��_�UIu�`w�XTe[���pF|�O!Z>���l��ue;;�}�M�>_ N�TG�Y标����OU��l�[f�\�x���]�!b_������Y=��	�}#�Wx����:"vt������X�3XG.v=���b���w�b6��r6�|�QnLM
��I�S�s�ʦ
w�'g�rz$��� qr�j�,d��wA��F�w��
\6�t�y��z��cǔF�5��k�)��s�Ȗ��Sua��rw��DY�z�Þ~��Nջ/�`q#s��
�`D�]�E�
��uwB�๧��w3ňR�܁\�ŝ������՝,��2�j�ۨV~�e�m���<��T�3����(;��)��l�A��=,��	�1����h0� F`��WFy��L],ŏ��-AT�\�;+�8�08�+;�0X:G/F�b��wg+\L�����]�l/�Õɵ0�Y����L=�E9�(
�k���ܑ���1M�k�v�/����6;�� ��2Rd��C* �#�`��r�Q.Քg�P�n�v���"w�?7���A0:��F���κ��F^eT�y-}I|�'���ZMRͯ�U`E��d��Fd�c��3�:��%�e"�g��`L��Î�r�$_��(�1A /�0]�D.�J���0�Q���:ņ�5�:!a�nx�L�]�Y��j�1qla[Eav�� ;�D�cO��b"�hǊ\�R��TG!�"��V��9��:D�wa�D�ұ�?��.�p�#�	B�.]B	F�u�01�$b}�߱�I$YoJ9�J�n_a<�Dl�p��/��U��[�!v��Ps�FM�T)R���I�>L��Ɣ��$���X[iP��a\=BiO4ݼ���͙~�c����X�sQ�U/N�������S�_�s�XLT8���=L�0��g>Q�;t/W���+��dB���g�6��W����G`G��*�����5a����T4|t-u�.̈��iS��7�DV�O�~ d  ��j4�'p���4�9D'd����5ЃQ#-GM7�x�g�7��)X�`Iժ�*Fwb\v&�)Vu���Hj8J74��ՠ_�E���8��p͠�p��6�c���7eZ�t���M���Pf�?�=���B�����5��N�ca�dz�ub-D�3c�lֺ�b�{�Gl��g���y�u�ö�Z�(��X��/�,]��9�m��T{�%ٶ�n�|1�ꮄ�Md��	C#l�{T�l�v��eEƽr���d�ݣ�!�~��
�����QQ�じ��"!��M����1L�U�DĠkUk�a��{�f���{X��ҩ5��x��z�Ӧ�ֲ�:�.�j���(^��S u΀����R��Ѿ���s��VT�F��A3���5^�B��� �cG�R�C{̐��~W��^�gK1�*��,�:A���q(�.�4�~����}3�IǢY�{�<K�
�{@�<�1k�[��;�xz�v�~��F_�p��������.>6��]���]	��-[���N֚m~�g�:W���8�`�u��>� ������h�^�lO���cW^������_ӹ��p�VR|M��A�l��t��Қj@[�8���M{=��A,l�=S �8݋N�#g�o�̄lOP��o��DŀaPkL��S��dAC[t GҨ���{�`��XB�;���!4��(̓��5�r-�S����P���':��&8� �(^b��:��_$3n��b�ޱ,��QV"rz����溻I���ʿw�4�#��S��!�x�3��k}��SB�J:C�����is��"["��
�{�Ѓg̹��k�=K����[p,@�SL2�(�cA��s�]��[-��,Z�"(�`'bUYjlOw4���3D��4S\�~N4]�{��Ͱ<��82F3y6j��B2�G�,���aP��!F���X8�I��S<�W�9�)���3�Q�u�g�)P��ӷ! �GF�<��uM+�.'0��F������'ЦlA����z��YUշ�F�,�l*���ُ%?�g׫�Aah9fxH���C��
�g+���0_5����!Xl<`{+QT/b	I�@����'��@l�^bo�����D������(�C��o�qG��2Q �&-�@�8e#�צs��X��DW��ԩ:�Y?P�R��:��O�H��ƍR�ƿy��{Qb[��H�\׫Gk�s�/���g	�D���g�<c)������5Ns:���������A�8���s����u�݋h:��\�l�� �C��¤��P����am�M`�,P��I%d�q\�-��<^����_+t�S�FVƶo��	TK4�HK�A��e8F��V���V�� .�U���u�51���Rd��B�l7� 6v�_ÌN5��>pY����ă�`u���صt����,uW(�T5�l�hp;�3�3�$��-�\���`�j�S�9�-T�b�V��ѓ��U5��V�l0��U^4�v�U�{w
�>G!�R�눷�BcNX�BiD}���a8��
%�s¥a�M��`�"��刅s�Wu��M� ,��dU1��:��-@�wq䅠ʾU���`���?�X��ο�6��U+���]�5�۪r,�z�U7�G2���:�O՛�֝���/�&�?鲮��3qS���D�ժ ;
qb�.{f�C��JG���l���놵mI�ϨOBw�5�[����_� ���Y�YD��X��1��pe���w�_� �� q;�ڏe b�t-�D�18�N5�-|[���ܾ��01W�v�����Bn��p!�=�4p��5$xw�ЫW���'B��&[gx�vZ_Y3iƹU�~�Ga5{W>j�%�}�r	f�e_E��dE.AQ�~֗e�Y��]����V�{��q��"��vIl��,���c�޲�s�r���]�@��R�J�֪]r�G��!���՜��6��:%����������?� oѡ��4�(�n[�VZj~�
[;J��F79�n�?Kq�?�	�f��'�2e������¸�� ��˚4 q��߳B���UU0[sB���
1sT�t
�]�Qޭ��<'E��V9�E<b%�֧kS�=�rUV�
 ��S6��mG�o�ՓN6���D3|��{Y�=F3{����h~���.��z������"�/��?PT���#\�3��I
��j{���K��D&50��Yc�o5��$j#�sp��n��#����4�8&���d 5.;H)k5	�z9a�s��D=�ЅZ'���B]�B|)�Ȫ쟐@�	����#i\֥=6u��y�=FVXQ���Z>�$ϛ~�ҥ���/|IX��~�!��6����ؘ
��D�;��ѸF��U��9��'��3P�M���	�S��1Ft�����@Y�>TM'8���+��H;P��뤅l��
~�"�1��E��x ���_��i�Ej�ρh������$����<U1;�9��i��Ա�*�=�Ŏ'e��i�?�&�Q�=���&�%YHHw���2��<���#
 I���T9���aR�5ɱB����~"Y��~"a;����g�u���e�%h���5���8�}�̷}0k1��>t2t(�Q�|�Q	d�C���h
�6��ڄ`�#��:qj�G��K���[��T����m��$�4�\����b��#F�t�T�XWt��7�N����SV�l������Z@6�)��e}~"�IE�D,�w�%�?`{x�FY k�F��Q�F��p���0�H<��(p��j�i��V��\���u��Bx�����9�=(�Q�Q���>�3���P$���f��K�۠�D��/��<�R��T%��O�ϵQ�����2U��S���ZWAګ��/��?�j�6g_qdx"z`���y1�0�/��b!@�A�������ń���.���ՒZ��IZ��J\���%���;�L��f�(/͍8�5:	,�)o^�I*eӡ����uU�v
~���0k�xD"y/�%FXv�wO_ҹ}��i�\I,�?��7��+$i��r�4���{���5\a�Q%�����_��˷o޼�<0�      "      x������ � �      #   �  x��\�r�8>3O��V\� �T{�ƻ3;�ة��G�DS�T������}�}�}�}�m �HQ�c+���$v(���蟯��s�L�E��q�-��e��O٧��N���tG�	�n�Xf�:��	EY���b��Ggv|��2U�'H���q�>�a��DM��`��i4_ΕJ���j�\�?�*��"�����,�/q�Py��U�9����G�RO*a��y<�3=gT&E�n�U���qB"ܨ�*W�9{�+U�3_�	QjE 2�s_���Jʤ���͘M�����=����
�S�D%�8��zV(6_&�8"t��T͈���=O��RO�'5��༡��e�L�+Z�ʊ�]O����k�iu��)�����~�>�#b�Dy�V��-��$�wH�%�2Gl[w�ˤ0�R>*�I�E�ޕ6m2)�a'w�x���V��zNkKUV��Z�B-,���7k
�%�J�U-�_��4Wu�&����%sբU$�f	��5�7V+��C���U��Oz������7�6V�j�]�����3HP�V����Q��H	.-ҡxBKa��I(�6,;�+�[��q:e�� �U>�k�,I����G�z@ذb�j�[�����n<V�$�9�*eg��SB���bJaï��q[��#I��1S��%[�Q�P���J��M���$6���o������ E\�5�,�C���� ��=�c���BU7N8#�azH�=�2�WTR�yl����JyAGy� )/�V��ww��pZ^e�H�~��D`���r��6���JcX��y�ؕ��u6�`�>R��/�A�M��N��'��]À?7F�>�ǲ0�2��ӂ@�8��g�&ѕ{��dL����he$��%�)�Ò1�BM㙆Au����;a��!�,f�\��CZ�9@H�$�=B��G8�%z!���:(���H����q�3wx0D��A?�P�B�K��!��r�ƕ"���%��zdIt;�F��:�����#P�`B���&��� � �ً9�Á[9�q`
�˲`?��pV��<z�и����ᬑ����C�;R�lO��qt^%&�E���� @qv��]E��[E��DM(6	>��Lzi�b��fƍf(~I��uZ�Ms�!�|*M\Ӣ=�y|��n*(����r�8n�n_A��ho
{uy�
�oy]��P/�����B�	�0��
���vM_��n%�^@)2��8*��`�w+��x!�ۦ��.(&��sw}C��b�u6!��#-��&v��7��jO�^hn��fS��X�F�/���&q:�!O��6P�D���O�g�[��ڽ�}�!�~V����6�Y�^n�l���2f���?͘Ǧ�I����=�~$�XWKϊP[�B��5�5�+�	-wa�kL1F' ���M|��7�F��4�1i> ��-�3ݽF>��}���C/���[����Idbe�T&Z�$N��I��#N���V�4tH�UO�6��rJ�'���%�y�7�7�ц-�<>���H{�����
oD7����Ee�]'#��b'a2�m�Q=��wcG�b�`���������N�w���\<Q�:ѭ)xO��{�޴����툸�	.�����%YL�c���%Z�/`�r�1��
����N��Ĥ������vL��w32
�a'M���v:n%�P�<��)6;���Ɯ�r�m.�Z����LaH�rO� t�L֌�)�}�Ӑt��[�sC� ���p�I�c)�a�y�x�$T��˴(�zr��^1�Zd�|X~<l+*�����]�Q����\�@���#�y��y���Hm����Bu.`u.��F����̳��9n� �����ai.�
L_��|������V�sD���շ�Yy��5��`Qq ����\�����x���Q��7Xl�6/�'���J��߿��(�"&Us&-.���$�~�LT��ފ��-�8�%Z�2]�C���(��87���r5����h�i�y�#�+��fg���wLV! �wZ�� ��V�3��V���UV�C�X��!s�U�P9�*zH�D[n�??��՚�4�O0ٜ�;Q�F
���ju{����`;wg��l vr����u�q$�x��L��P�N����`��#hFve>��,�Ag�25Y�v���%B�!r����"2K�����m���x%]�������'�n�&�b�]X��V�� �8�iX�燠Ė�hV���:� R=R�nm�F��,.�!!qf'�Jy!7o�4~�qP���^��i��	�(�&�SGpR��3��O��%���v=uV�e~�'�߾[`� k]܌_��:��J0WI��J�'Z���=dY��ϲ���,��B�L�I]���fYU6}�������n�t�]M�:LǱ�رP�2l�|�,���2�9)�v��>���jU���X�9�4)S��cp���y�P����<߿��h��K1�C�O��ۂS�������#�s�o���BҺp�*��@�v�r��ޣ� ����<ؓ�(�'}�t�
f@8�|.�d�	�2��f\m[�gL�U}>�t8��6O� �Xa���{z=�O$�����p�+���;8�pg��9v6����S�'	�'��>a����b��o��07�����6x>���g('�Q��$?Y���s馰�2��(�%����BR}��#�`��WfL�wp,�ᮀ�cW �%!��Z^B�I��� ��i�Ӗ�(`n���?�;�������(�����]���W~����姰�����7����#�{���̇�U\�*��
��E������� L�Xʕ���s��&�����8�z�W��.ZW�ĉ�����w�6|���^��z��ס���l��/}���/DV�����>��Q 3w�����=������=���O\h��޳\5�d�^�����GQ���c��{G!f�M�2�>�ٽJ����m;y��a��4OG�	������^�닭It��鷢L\��G5\�:vL�%�Ƅ�DPg��]+66'N}�~a	����<
_�<*��J�'�J��w�����'�J�K�FQ	s_�0���'���F%̅�0�Q	s�o�0g�����zf^Y�pcZ�Wt��3��XF�f�x�3|KT�#�΍5��&����Yj}|������=,~�E�O"1eq�����H�e�9˩B$��ʃ��݃�N�ē��H�%<"Db
�7���p�!s��<�a�����o}��h����q|��0߹#�fW�1d�n��ۧ綇�_�=s3r��ZCJҸa�{o_�:�F�DI{)�DI��{��&�Rb/)ϐ���Ծ���D�͌��R�swe�w6����V�����}eF?���`d}I{��'t(�Q�ؤ3���	�O�69o�O�N�\�ؠ�|�]A�۷���Ȏ�J_
w��m�CTQu�7�p���@Gn�{�9,V�mM~���G�.����d]��:Vv�줐PZq���=)<(-:�=�On�H@iQ��7����p�\�˖n�nzJ	��Cw�$~��ȥ�[;�Rb�礄[������� Y�e.&����������2�#��\�c�u]��B�u�~��\}h.�0�n�d�~����QLt�n�($~��ݻw�q!�      $   '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
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