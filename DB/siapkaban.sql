PGDMP     9    :                x         
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
    public          postgres    false    223   �       !          0    23343    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    224   ��       "          0    23350    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    225   o      #          0    23357    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    226   �      $          0    23364    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    227   "      %          0    23368    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    228   P"      &          0    23372    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    229   �"      '          0    23376    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    230   �#      (          0    23380    jenis_pengawas 
   TABLE DATA           8   COPY public.jenis_pengawas (id, keterangan) FROM stdin;
    public          postgres    false    231   �#      )          0    23384    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    232   $      *          0    23388    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    233   ~$      +          0    23392    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    234   �$      ,          0    23396 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    235   %      -          0    23400 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    236   �%      .          0    23404    layanan 
   TABLE DATA           �  COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal, kw_k_kantor, kw_penerima, kw_pemeriksa_p2, kw_k_s_intelijen, kw_k_b_fasilitas, kw_k_b_p2, kw_k_s_pf, kw_pemeriksa_dokumen, kw_k_b_pkc, kw_k_s_pkc, kw_pemeriksa_pkc, progress) FROM stdin;
    public          postgres    false    237   b*      /          0    23411    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    238   �*      0          0    23415    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    239   �+      1          0    23419    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    240   �+      2          0    23423    sub_jenis_layanan 
   TABLE DATA           W   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan, pengawas) FROM stdin;
    public          postgres    false    241   7,      9           0    0    data_perusahaan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 500, false);
          public          postgres    false    203            :           0    0    data_pribadi_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 501, true);
          public          postgres    false    204            ;           0    0    dokumen_proses_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 220, true);
          public          postgres    false    205            <           0    0    jenis_dokumen_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 1, false);
          public          postgres    false    206            =           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 23, true);
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
       public          postgres    false    3163    231    241               X  x���K�e7�����H�.��	��/�IZyt��ɿ��*��29���B$�õ��rղO�G��(1�B�!��O����������������~����G||��#�迎�B�I�����2)J&�Y�j:�8�9ɤdC�EI��v���, {�";ZǘE�
R	�:fg����FV%�V�S�=��M�)ٕ5�����Ȯ�@�#tI6�>r(m�a8���)-�,�X���`��9L�uz�-z���QR|�ϖu�PD��7��������7_���'?~����ަ/�G��Eg�ԇ� a<�(���QIp�NH׵�'�Ʃ��vS�����D(���0T�k;;P�a��yL\�h����	��*,� ���)�,�M��]t���(�ʌ���t&]D�(2Im1F���O�� �J9I��2��5�4� ��maǫ���Se:�&㙪=,��s��6E!p�#�{�'��,$�()=�8n:/���5�t��!Θ!*��P�#f�PU3U�6(P����Z5E�P��B�<ӥf]�n��1�Y��cJ3Ǝ�1����
���&;tՙ����(n��25��Փsj��U����gϸ�G�VY��q���*�Ƴ����*�]%�bt���6�9y�w@W}�*��d��BW}�F�X��]�0��Qt,�6]�����{�����{a�Y�]�d�h�.8μ�]�+����f����R��Bϸ�ՠ���*�ʘ�H�`
KB��ǐ�
p�ي8Uf�p��֘G�&�;����q8t��h�'���rK"�wI�N��kr;�J:Y�Q�T�{�t��3�v1t�e�������i�0�Dw�h�^��E�^WL��k:��\�	�zD�ya�ؚ��u���CSkl�:jj���E�cc�H�ũ�z/iKNZ�H�eonM��d)�n)5Rkl�ײ��y���X������Z�I��F��[o��b�Y��ȅZ�Lk�h��ǄZ���{cSk2�}�M�I�n����4�&bs�Stim�Ԛ��R�COǱ㢩5�vh�+T�ݦ�5�y-��3ӳ�h�Ԛ��������/��dv�����7L�!zk�
r�� �0�&��8@o�M��0aiT+��'�0e����%�߬��a�,���I����0E�f�_a�݀���¿j>O4s�s�(1�N6�J�#Saɜ
�sÎ�3���+�5�+�L�%�e�򭑩�D�����p�TX�T�cd*,��D�O�;}r�n�
��jW��Sa��̎�KL��ybvn�z2�6L��2�x�ipu�TX�6r���Ӎe�H?�����g=��^�''���0��H,��Sa��w��c85\��
�QSa�I��<vSF�1aO�TXIӫ�Sa%/�nؑ
�������	���4i�L�{��̴},�6L�ѿ�yX����Sat��s:�y�ၩ0z���yo䇩0��f�o�1۴�<��]���L#��hUη8����kꍯF�|3F70J�X���v>�l�l��i�3x�	�?2}��3�~�12FO_��ov$@z��03�d*����=��f*���(3{�a*�����I6�	}}�##܂�0:�v���Mt�<��Q6�ؒ����!T��N�1a��<:2�cÎu����g�7���L����3}<���G�������H�LC����~���H��ØdMr4�6L��)�k����)��*ϸ�~���O��Q�D��f�	�z-h��&�0EB���ɀw�h�3x[��916L�+�q?��$f�[?`�][�Sac�����0F����%OτQa4�uKZ�''u�T{�۫�簅�=�lK�նаg��ڛ[#Sa�Ґ"c+�Ca~��#O�_���q��f+�ѭ8ZKe��p��*�K�'����l�`�ČG�}Ý�뺛��|�� \gSfA��f:�]`�r������܂��<�x�y�熩�8f�}ܒ���T���6L�ũ0���d��{�>����v�Ɏ�F��i�/��^��;�i������ \ͱm�����|}��K��$d�R����#a�5����9���I������^tM��ty.:��&{�м7"���;���Po�@�ն�ڭg "ԙ����O�wSh��q�{�U�J3>�1���Z�(5�y�3���D�ѡﲌ@�C-�H�.���֬%j�<�|=r���Mz�%vf�Sgy��]���N�{'�Z[6}zu��y����kfI�nL%Qk4��T�r�M����љZ3�>i�Vn�X����W<⪷2S��h�C�ܡ�yX4�F���{��3o�Z�����Φ��<�S��y�7M�M�>>��Ͼ;.�Z�cϗ��5盦�rY�y�a	H��h�c��N��ɐB�Ѳ��W\qo�B3�^�o��:˳���,�7ʌ�=���6���l�*3��#{
�Sd��;/����֏j�,����I��h��>o�Ʃ��0F�^c�}YܳM��i��xǥ�J�Ѳ�Ͽ��c%�
+}մ�S�l�
+�����Bl�
��R��h�����0�샽pr_GI��̲��Ӱy¦��t2z�c.J��h�w$��y���J��y)}�`�T�Y�t�n8VҨ������37L������w)NF'��|���L�ym�F���^�Ֆ�#�Saf��)�7Sam?��Bx�Tز�qE��ʤQafً���I��̲�eA���Sam*L8���v��Z[���	��T�������
3��-w��Saf��qN�d�eFt*�O�������y�T�����<k���ҩ0��������Ob]�M~Dlē16A-���1<�<���9~CYVw���C�OBB���c�==�U��N�	��E�1I�5�#��u�઴.����/M��k�HgB���IӠ]���G}у4�%�GϏJ&�B =*Q���\4�;Vi,��������.p.jIf��'iW�~��uә�|n��u�х��N�u1pѕt�[tY��H�ur��.��.�V��C�� =�6X:�wh�t�rx��ª[���n
V�̷��j���o{��~.v���򆮷��X]4��޴��x�ۢ�5��+6�뷼}�Ԛ��1^I��{,�Z[~���M�ٛv�i[��~�ij��y���(4�α�Z������ͻ������Ae9̫�]��:�2�i���@��9��3�HH�S䢅�|(�B��\���7���..��e�_�����"]H��c�����J��j�/
�q>
�roΙ�r�u�7O&�h�X�=F�%oq�sR��| ��>:�Ϳ�:��K}��׿,�Ƿ�-��<�x��?�/�Tz����o�}��?}�����O?�ҏ�_������5�	             x��}[w�:���W�i�d-Y&��<�|I��N|,�w�~�$Fft��"��~��0�p~�T  )Y�>gM�>;��F���nop����������S*
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
9�v/jڣ�.���إ��\����p���,_�Z�Ӯ�e�o���zlsu͎����y�nԟQ9f� W{Y�[=�p���w��Q����/�U��HX�3�l�"�k�E}�v�������o����)      !      x��]�r۸ҾF�wsub�˹:r�-�����L�\u
2)Ez�ĥ<��^����(ɞ(�	�IM"/D7��_�lP�1�� �lǶ�ز\۲�!����2ń�Q*
Qp��ߵS!��9�	�Dє�C�b.2>|������҂�'|J�[��>���~nP$�ħQah��� 9@�e�Q�鴖�QZ�F?VKd1yV�~������+9���K����_���O�,���x�V���c"I�	h3��������X�FeB/նl�b��/�SZ��fB�'i^��y��E��o|6��l�1o�/e��
HV"�s���x�ޑ��r�N��~��ov!�F�;�e�(r<x����a�
�ܰW;�!�loDu�oU ��Xy��u�"v�Vm�3�K��8�|�&
�mS��
�-�y[H����Ld�F��V��ֿ"��޶�e&F��5�2Q��HYZ!��W~��(��Yy���H8��t�����x�Ǟ�+��z�F��%����t4�����f��%ƫ�k�5R�W"��l�=�%y%�I�^�S�pW\ ����
��ń�o&��{&���LfB�o������uZ�{wY���i&�����ַ�>Kq;#Q�ҽ���=ؤIZ����|{�P�W�o�%��*-�	 u���b�_]���D�?ʛ������e>�2WW3Q7iuu5J��p��+���26;j�Ê���_�OmU�3�>��gp_�������#�Y/Nd���S�|����'>��ao@F��x8��h:8�E	k$�rT����`����?�]~�竰�	-o�EQ��E�VL]�%��FLD#�Hl�` t�k?~����ı��`A͜���.I�G���x���6�2H�qـ� m
�݂���Y�[Q)c:��tR��?���k��@*xY�Ih���
b:���#�旇� �B6��:ksu#dN?�-����E��W��I}O7�Qr�$�bv >��6'��E&�qZ5J��:,E�Q��ih1`k
�/�p4+p�p��m�H���B��<]��sp8�{����ބ6�h�BJ���&��!�
��\������cx�D Q�V�I��}���F�˺T�.^�};5Iׅ.�*�; ����S�p�Q�>�Ęǆ�,X)h���)�y�tHA����I��C��G�Sl�s�'�O_��;nk�mxG1e�c�� �B�b1u�6J���IS;}�ߟ&Ua���i#��@2Vi]�Q��{��%�fy8a�H����a��L�Qda%�չ�X�m�v��o��Ϥ=�=�]������*�Ԣ�wQƧD�^c�l6��d.ۚ�$�QU,����K���T4i�"��ļ�*8�]
�������dvD.C��h��N�
��`Ru����aҾy�s���P0����!�G���f���'�s(����֝�!�倁��4�l�]��(X�����u;V�i����cE�b�.+t�f�j�%�Rֵ3���Qw�=�Ta�t�G�9��<1���a�c_��c�`֒�
�R�����,�[`Hfb��1�m"1�W�b,K��Qm���e�x��I5���[�Q�9��<h:�}��Q��`��L����U����:��8;1粃�����*�E|SM[IŦ��AW��q��1�\�J�R��C��%^|
Nv~*l���ln/�Lڪ@E\��F�Ft�8�`R091�����S`��*m���؎����L���aަ�?�*dX����hz=C_&�`�0�0�B�+���N�Js�s�-첽ֹ7���C^��v�"DFP:��\�D&l;���g��4��hs������ɩ�'@�b�a @�iQF?D����ދ7�t��cV辅�`�,&e�RW��?VIu=��V�H�FP��h"��,+r����1�;�FI��P6u`�����Q;��#��*����P���j��[��&y����D%x!��`��C-(�	.e!&:d;�c"�f]��"n�T{����T��#bv[6�b�������Jx������e�=��n��Y�{��O�2@m�f��>�aZ�XiȠ&��?���W��(���B�3��I�&��#��zX����.�ٍ�����a1i�V>�G}d���sMb�c��Hk)(ѐ�TKJ�Hѣ�^.�Q[�a
V��-2e���M���@�q�M�V���f�y�0��/|��������T�a�?R���l�YI�u���3�Nh�NQ�LK�/1��B0��V���F��)�D1���Y�O1�	.|5�v�~�T7%���
k�����J�zz�L��"4�:6;�Z�̋۶�t;���e{�R���a�i�Y��*J�af?�q0��9.�(1��O��h�R(��v�$M�x:Ȕ6+�W��3��8�RTx�?�º��(/[�o;>�H�r?�t�K��,�|=q9�`���WV3�ŀr���/W�d��\�'V�	�˛�VBv)�4k�D���Z:�5�4Hf�+��F�^����ו$�(�280�PĎe�~0��V�*��@�5%:��U�b��s~��*z�,�
����r$&���I:!��v7��lU
��Z�L�;��TF�ڮ͎DS6��p�&`��,.��\�)ш�\d]������1�v�zU��Y����!�0M�+��c�e.3-�m�	��A ����
�>;L�j�߷���Xp����pv���(��\�s�N��d8��D	��D���B��,����ހ>"��6�[ �v���:�x���R-X��`�v��{�Y�v�4@��;�vAsy6�z��iC��	��9�*�U���۝��9W@ZX �ҡa8���J\��s�ikg�5/�&���c�8���E���ԇ�XH�)�gYi���q�Eŉ�LDl(��?�DX�. (�5��]�w*����ޙ��o�x��0��ܚ���e֕��&)÷ʷ�	?j)!:/�$e.
�9����w�����������;Y���}` �w�f�a�}z��:H{�m�.ڧ ̽
�.;���J}5X�D��5�΀nO���No�רFUR.��1Uٖ��6����3JDU�`ǉ����P�>�~��'e����,s��RL͆�*d�B��-3j�P<P�����XN�n뎬��`��龅��k<OI�?i;�@F�`��,�	�#	���zB1A��;s��S1�H>�(7�&�l�$���9ieS�����l9=c�]e�8�U���2Q軠�Q�ۻ`X.P:���g���cJ#�� ������HdCi�0�]�;l��Y�,[=��aG��k�j�3,8���Ilh0���,��kd�;�R��S��뺙bD�s�A.���D��N�	����o��w5�mP)�ĲW6��Qcv&��Hs�^-��7B6� z�{��ZlDq4�; #�s�+�<�{�.����Ж ��v�읥W�D�ؕ�q,���sQ1VK���.��@�M��^�����J���}�wS&�Ӣ�3�k���ܑ���	M�kӴŲ/����6;�� ��2�Rd��C* �#�`��r�A.Քg�P�n�v���&w���RM� ��a#^�h�m�E-�3*˼��$���Yd-'���W�*�"�Y�`z@#��	��I��J}m��2q��3�q0����a�X�G
���5�zL�6LW"�˾R�98�hT�`�V��a��NH�;�y��{��|���h�D[ؖCQ�]`#��"Q���wr6j��cE�I)��5�Q�>���S���C�(����]X-�5�t,�*��_�5.tL=A�֥�K(�h�.��SM"�7
�[�D�u���,E���Z&bK�#U}ه�������e��X�Nl@p5�R�Hm��3&E��v�)�	Ix�!���Ҡ��z\=Bi_������͙~�c���X�SQe'N�g������c�_�s�8�pN0ȓ[O�0��g:R�;t/W���K��dBv��g�2��W����G`G��!�U�)���Kk��3�����F�>N]�i�3�80�2o��l>A� �  ]����؞�A�2���C� ��	\`*V�@F��5�r�힗��K�`��1$U���݉=pٹh�@�y�ΰ5�FR�Q���͈`��.�8''y���+u��;��)�?�.Ҋ��� �uh��w�2��i�Y�R������y���;��7 {���+!"�Kd+���{>�<b,(<5N�ӮK���e��z@q̆��w}�f���!o�5���>ɶEu�`�iV��Xm"ۖNa�<��fC����)J2�c��� ������S�\�T�@�L��e�f3t<�S$D[^�I���=����2��t���b-9L�w����Q[`����@:�F��P�EZ7�Jv>@�ڥP�=E�{�NP�aYH��;x���]I�l4�;�5�x�X�(��;��a��X��#��Mxz9D�^,�쫨k���>h
Ǒ��0�Х��#dύ��&�fE�4�X,�*p�a�<Ĭyh��Y����Z{ر�Ah�
}�r���Ӫ�x%�K,��J�dmѲ��w��l�<��zId�^���vq� �����yzI�^<y��mq����M��z��ZvH�`�%�{1��2�ՓJk�m�f�q+��r�X
��{� �q���g�n�̄l_P��o��DE�aP+L��S��匆��0 ��Qы�����{��nw"	�)Chz�Q�'��k�=�Z4��S%犡�ñO
���{Ip�^<Q$�"�8vu|��Hf�$�a���cY��9��D�t�	��溿I���ʿ�w4�#��c��!�x���}�SB�J:C�����i}��"[ ��
�{V߃g̹��k�=O�.���[p,@�SL2�(ᦠ��9�.}V���p����f��˲(4�����"�c�).y7'�.�=�X�f���l��<���i!�!L���p�?���#^7T,�$��1��N��Ŕ�T��Ӫ�3����������-�c�m݈��	���v4�l>��	�)����)o���q^��]���#=��Ce_5{S�xv����Ca�u�Ǡ7*�8<T8=[Ie�����G���`��iX�DQ���%$�u�#D.���5��:�� ��?1{���zDS�X2�5��[Jv���ņ���D�����arp����^����ł�@'�J4�N����2�r�T9�p~�G*�5n��5�ͻ]�(؋��E��^=Zɜ|<v�H>�%���p ='�K���75?�p��E9�o>��-�,��?�I~�>�㔦?@�c�^D����>��?d�KLZh���xֶ�z��301�$���4�k��¾^�������k�n��a�������;�j��i�3(0��hT��C��j��Ņ��TWú��z.�c1U�,p��O��M܋����0c�SM��\���v �{��"X���$v-]��z6K�ΔA��g�Q4؋�]�	��p��r��Q.��dT	0T5�)���*�z��+��������_�F6�|�*���v�T�{�
�>G!�\��o��Ɯ����Ћ��u��p���J���h��ym�"��刅s��U��u� ,��d�l$Uu��[����兠ʾ����`���?�)����d�	�����λ��mU�oJ���d�N��L�a�N�S���ugf=��c�d:�m�6Tp&n�u�(�JdG!�` N��e�zV<tɨt�K�͖H�a�jXۖ�����$t��~Za\����o���)깚EDy���	����{K����	�Ӯ�)�k�&����au�!o����������,�\�:ؽ2��R�7�-2\K{di�|�kH>��ܡW�#OO� )u�,��T����fҌs�F�}��j�v&����()�S�Kh0.�*�9&+�p	���(K���20��t&�t�'���~z+��1l��f�O"oo�\1��-�<�)��/22�\��2U�?����<���-|.�����ٿV)��?u?��8?�9�y����F�tۊ��R��V���Q�m6���vc�Y�[�A��6;XoH�8�);���G�u\�u]V�� �[���̄��^�3fkN�<�Y"f*��A��n�#ʻ���H���*&��G,���tmʽ�e��
D��|�~������j�j�߲h�Or�K��hf��-�/��k�堒QO�?4�QKr�b ���b �:P��p�j��O�P�T���^����%2�������}�&Q�7��C��p��>S����1�4&�0�q��AJY�I(��	��S|.�i�.�*����Z�K�FVe���O�Ouv7�qQ����]���w-XaEu�O�j��4<oB���'�?O��$a��o�%B�zڜ�L��� �cC*\:9��4>G�p������A��@}�7��r"�cNu���q^Y�u�?����[�q`M\��GځzM��JZȆ��G)�SYd)�ЩK�y@8G\������ʩ<L@rK��ק*f2�0N�:�\�ۣǶ�ɨh����H�J�ǔ�zMjA��+�ڌ�+Owy��H����C��X�0����X!�XOO?�,���?�0��e������p�2b�4k������p�a�[��_��>���\::����_>�����!ux~0k�c~mD0�
�m�8���$�!.�<&9Vs5��G��?5�8�"�h�zm���ų���Q�]1�u�������/od����7��ٌ�_�d�1?��_$p���r6*)��󎻀"�lϚ��*��c�� ��9
�H��x��L;O19
𤜶���p��d�cp��*]p!<tn�����ר�(�~V��̃W$Y�W3���m�"�o��r{�L��e�C�gp���(t�C�t���D�)Hy�y�� ����gp��z5A���82<0��Ԇ<}�ȗ��~9 ՠ]j�~N���b�S�d���|*I���4-&S%�i��^�3��N��f� �	�)p,jtXS~}A�/��M���6�?s܎T���A�ì��佨�`���]<1|N�����y}-���tLw������0��W���觉pl�����
Ï�(�--����R<�`WL�)P븞����Qª2�� ��d�O�#���?����uZ�{wY���O�ݕ���5|��v���Q�7�y���$���`��.��z��͛�P�(q      "      x������ � �      #   }  x��\�r�F>�O1�-�J�83  ֞�h7Q$+�H���22a	������}�}�}�}����(R���ʶdp�������{�˴Z���b9[f*���<�5�O����n��eή�I���8�
5S����ŉ_<�\��	һ�g���f}<QSE�����lϗs�2C�(���+��IeSV�y��2��e�%��H�]�ʪ`_�c��V�Q��75O&p�л��2a��*^$�$%��WU���ǋ�*O���	QiE 2�wW���J�������M�����ݫ���J�S�D��$��BzV*6_��8"�.�L͈���=M��RO�G5��_�y#���r�.W�Z�����Y����b��hyS�3-����0{�G�$��D���[�'i�K`e�ض0�{�iil�zPZ�F�F�+m(�d2�N�z��X��9�-yPy�gkK�����]�m�)Ж��$�Z��2�i��M��"{C�Es$C�f	��5�7V+��#���U���z���������36V�j������HPV����Q��H	>-ңxBKa�I(�6,;�+��|�8�2xc�C G���ְ��;��U)�im�/�KBu�bJa#����Mp	������D˒/���?(�S�$3��bLf�NiͷK��ru�!.�P{>D��%Dr�τ������ǜ�C��i�۔��*)c7���pE:�����h[y>�a�J���5N�Dy���Y#��)����SJ7p��p"��a�R�UjWb~׉�	�Ɨ}�(K������N��'�G]�X>�6F�>���4�r�z����8��'�&ѕ{��dL���x�$��%�)��%c���&3�p� :'x�w�D�-B0$Y8����.xh!� ��}@�����¹/����!���pL"j5u@�=sG{�<4=��L�B,� �s�1� "F��`o��!x�3⩯�D��ni�� ��9»�k�#��<�.�q�:��p�#���I�S]V%����k����ƅ����g��Lg���5qʞI�?^���Ļ ;�����(�Nף���<]�K@Ԅb���δ�f/�ohf�h��wI�T��^�Nm����ce���*��wSAG@��{�qsT������gS��˃Uh}k�Ջ�j�h�G�A�B4��@Z��Y߮	��ҭD��(EF�ðGe��� ��n0/D{۔p�����n��	�Y̷�&���C��<anbw�����S����M:��|j"�ڈ�e�U�$ɦ=�	p�����ȓ����l|C�X��]�U�:��O�h>m�����vɆ��/cvG/��ӌybږ����C!�G�u����%�`CH}���Fpe2��.,~M(�脢�X�_������H��f	&�����c����ܻ��2�br���~9c����4�L���T��&Y�?�x$iq�*`�����1�;_Nis��8^~�=������>ڰ�A��.���LtC��� ��虃�g��[�NFf��N�db�H�=��wcG�b�`����ٟMU	�@��i{�x�8du�[S�64(*8��-oZ�Cu��悸�	.��U���yB����%Z�/`S�r�!��
w�j��N������B��E;&ZĻl���Y�V�w��[U����QCcNF9�������� q�0$O��I :q�k�[���>�qH�魋���!K ��E���$ę���0�<Y<Pr��*+����:�;�[��ˏ�m��jYiz���|�@1��`; �y�)&��ڀ\�+9Gj��$v�s)�� �s)_$6��\f�]$�qS_ (�ep�Ks:0}^��˟/~8ӵ�Z��c<g�W��g5��4��E���p5����/>G�R�`���<�j�80�s�V�߿����"!Us&-.���$�~�LT��ފJ��$�%Z�2}�C���ERdIaR����jn��=��-���GfWr��*�g��Z�D�$�i� [E��#[E�WYE�C���́V�C���!:AZ!Q턔 ��՚�4�O0ٜ�;Q�F
���ju{����`;wg��l(vr�����u��$�xB��L��P�N����3�!�u�GЌ��|rYF��De2j����9�K�F#*���3�el���I9ۚ�;��J�$l���ǵ���LM�c�]T��V�� �$+hX��燠Ė�xV���:�v���j7���F#�U�g���8��]����p�4~�qP������i��	�(���SGpR��3��O�����v=uVUq�'\о[`� k]\�_��НӸ��U�*�w�B�!�H��q���,���Y�<YUeR�Z���4�+���,]e�'H���h���vL��դ��tk�U-�Ʊ�W��/)�(.���I	�3N|�t�ޫU}�c��lӤL�f�����>��f�B}&�K������E�H�^�i�-xT���b�v_�^���֘c}Ӡ��օ�V)�b���[���	��(4_���E��=�#�T0��y�s1G�LP���5c�mnϘޫ�|N��pP�m�dA ��B���{z=�O$�����p�W�/L�wp6,����s�l��#8�3� �O��l��������E�Q��܆o�6X�`o���qt��>C9r�B-'!���/��X7�͖�/e57-��h�8���-��2�`���+`A�w<�h.	9�3f���d�����	1m��R�濽�cA�{�?��� ���ٿ����ƕ_m�=l�1쿇��6���M������k�=��e�e�GǆB>:g��}'�e S,egpk��(�I���w3�^���2�����'q��|!��׆�Q�+�Tw�:4�C��M6��oA0���j���o�胑�2sgJ��#i��	k�c��ą��=�UsO���%K��>�{UV�0^�;
	���*s��ݩL�z>ѶS��F{J�tę�^�/�ꕽ�ؚ6AW�~+���~T�u�c��\�nL�%�:s�w��؜8�q���%<?�7k|p�(y����*E�!*a��#E%L=8rT�\�7�J�{�ʨ���vG%8I��5*a.����)�7�J��|���9����yeyÍi_�훿�8zc�����-QK��;7����$��������]�����{X>����!Db��H!S�G���s�,�
���+Rz�vR:!O
�"1���)�� DBΣ��H̙�����C�x�d��\��������������!���t��\y���!%iܨŃ��o^��>Q��1��^F����}���s�� �276lFn�����Ƽ<�h����7o�ɛ��wW���Iج�� mO��q��S�!ޤ3�֧���'f���x�'b'o.w(�q���A{N���vwύ�X����l}����<������V��R����b�_���j���G_³��Κ���F�kJ,)$�a)����hM�!�SȞ/�W8���(lH�����C
�e>j*K	�l�\J	�l�.�I��	�UK	�� ��>�I	�l��Kb'�d���,�2�r�"��,�c�|��B;�!��%�
=ׇ� 3�QL���Ð��!���w+@1�G����h뻧�������w����B�L      $   '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
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
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�      .   e   x�u��	�0D��)\��\��6;8���a[EA0����2�&[y[��hY[N�c�S�����Zg=���Q�o8@٘$4�A�MM4J���	G!���#�      /   �   x�U��� D��c�����G���3�/��M�:�n�ր�䲓�6�X]�����!�QJuN�}���J�NiGqa�"��L��(���iE	�V�����K]#��x+)�Lƫ�>��,v�h)�G0�k��6��]��V�X���{�
�3������ދ�j ��ĐD      0   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      1   K   x�3�LLNN-(IM�2���SHJ,I�P0T�.(HJ�2F���B&(���3s�LQ�A��8�R�R�A��qqq �	�      2   �  x��UMO�0='��G�P���~\WH-�B9T�˄�lp⍜X���qX2��Z�]���ｙ$K
㛟�'��C�%Y�J8 �Q�?�Ƃ7�wg|m���`C3��B@��ㅨ�]����{��I��eї�)G��k��^����up�x�P�l5�n�=Zq�~�V�8`�� ]&g��'��M��<����7�9��k�2L:�_~s()�_�v+
����|=k��E����8�6��d�%�I�Z��
I>ѭ�gCJ㡂eLaܓi����Y$�û�{(È��8:INC����$	���,)䚱	��0�t��4}��GF�E����uԭj�8S���U�0��9����oʀ�Ť��ykl�'��]Z�&t7k�"ש�B��I��N�ꯕ���q(M�1�O|��{��'P�g��C�{�t~��3�OA��OJ��Ӧ�|6v�~���!�·����f0���3���<��������q���ƣ��Mq}>ep��$	szG����K�O���k�x�^��2gU$EK^�fQ*V�n(5��r��q��08^����!#w��U���s�
�h�*g0��&:J%�L׷0qu��3.���͚O�^x���Y��&���)���~J�3�� :�8)����$Њ㤁�'��qU�U3���j�U�w6�("���.�횳U���S��� ��ч     