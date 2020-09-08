PGDMP     '                    x         
   siapkaban2    12.3    12.3 �    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            .           1262    19843 
   siapkaban2    DATABASE     h   CREATE DATABASE siapkaban2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE siapkaban2;
                postgres    false            �            1259    19844    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false            �            1259    19846    account    TABLE        CREATE TABLE public.account (
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
       public          postgres    false            �            1259    19855    data_perusahaan    TABLE     $  CREATE TABLE public.data_perusahaan (
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
       public         heap    postgres    false    204            �            1259    19862    data_pribadi_id_seq    SEQUENCE     |   CREATE SEQUENCE public.data_pribadi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.data_pribadi_id_seq;
       public          postgres    false            �            1259    19864    data_pribadi    TABLE     �  CREATE TABLE public.data_pribadi (
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
       public         heap    postgres    false    206            �            1259    19871    dokumen    TABLE     �   CREATE TABLE public.dokumen (
    id integer NOT NULL,
    nama_dokumen character varying(255),
    path character varying(255),
    jenis_dokumen integer,
    pemohon integer,
    status integer,
    layanan integer
);
    DROP TABLE public.dokumen;
       public         heap    postgres    false            �            1259    19877    dokumen_proses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dokumen_proses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.dokumen_proses_id_seq;
       public          postgres    false    208            /           0    0    dokumen_proses_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.dokumen_proses_id_seq OWNED BY public.dokumen.id;
          public          postgres    false    209            �            1259    19879    jenis_dokumen    TABLE     �   CREATE TABLE public.jenis_dokumen (
    id integer NOT NULL,
    keterangan character varying(255),
    id_sub_jenis_layanan integer,
    deskripsi_dokumen character varying(255),
    role integer,
    status character varying(255)
);
 !   DROP TABLE public.jenis_dokumen;
       public         heap    postgres    false            �            1259    19885    jenis_dokumen_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_dokumen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_dokumen_id_seq;
       public          postgres    false    210            0           0    0    jenis_dokumen_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.jenis_dokumen_id_seq OWNED BY public.jenis_dokumen.id;
          public          postgres    false    211            �            1259    19887    jenis_pengelola_id_seq    SEQUENCE        CREATE SEQUENCE public.jenis_pengelola_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.jenis_pengelola_id_seq;
       public          postgres    false            �            1259    19889    jenis_fasilitas    TABLE     �   CREATE TABLE public.jenis_fasilitas (
    id integer DEFAULT nextval('public.jenis_pengelola_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 #   DROP TABLE public.jenis_fasilitas;
       public         heap    postgres    false    212            �            1259    19893    m_identitas_id_seq    SEQUENCE     {   CREATE SEQUENCE public.m_identitas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.m_identitas_id_seq;
       public          postgres    false            �            1259    19895    jenis_identitas    TABLE     �   CREATE TABLE public.jenis_identitas (
    id integer DEFAULT nextval('public.m_identitas_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 #   DROP TABLE public.jenis_identitas;
       public         heap    postgres    false    214            �            1259    19899    jenis_layanan_id_seq1    SEQUENCE     ~   CREATE SEQUENCE public.jenis_layanan_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.jenis_layanan_id_seq1;
       public          postgres    false            �            1259    19901    jenis_layanan    TABLE     "  CREATE TABLE public.jenis_layanan (
    id integer DEFAULT nextval('public.jenis_layanan_id_seq1'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer,
    id_jenis_fasilitas integer,
    id_jenis_pengelola integer,
    id_jenis_penimbunan integer
);
 !   DROP TABLE public.jenis_layanan;
       public         heap    postgres    false    216            �            1259    19905    jenis_layanan_id_seq    SEQUENCE     }   CREATE SEQUENCE public.jenis_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_layanan_id_seq;
       public          postgres    false            �            1259    19907    jenis_lokasi    TABLE     e   CREATE TABLE public.jenis_lokasi (
    id integer NOT NULL,
    keterangan character varying(255)
);
     DROP TABLE public.jenis_lokasi;
       public         heap    postgres    false            �            1259    19910    jenis_lokasi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_lokasi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.jenis_lokasi_id_seq;
       public          postgres    false    219            1           0    0    jenis_lokasi_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.jenis_lokasi_id_seq OWNED BY public.jenis_lokasi.id;
          public          postgres    false    220            �            1259    19912    jenis_pengelola_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.jenis_pengelola_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_pengelola_id_seq1;
       public          postgres    false            �            1259    19914    jenis_pengelola    TABLE     �   CREATE TABLE public.jenis_pengelola (
    id integer DEFAULT nextval('public.jenis_pengelola_id_seq1'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 #   DROP TABLE public.jenis_pengelola;
       public         heap    postgres    false    221            �            1259    19918    jenis_penimbunan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_penimbunan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_penimbunan_id_seq;
       public          postgres    false            �            1259    19920    jenis_penimbunan    TABLE     �   CREATE TABLE public.jenis_penimbunan (
    id integer DEFAULT nextval('public.jenis_penimbunan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 $   DROP TABLE public.jenis_penimbunan;
       public         heap    postgres    false    223            �            1259    19924    jenis_perusahaan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_perusahaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_perusahaan_id_seq;
       public          postgres    false            �            1259    19926    jenis_perusahaan    TABLE     �   CREATE TABLE public.jenis_perusahaan (
    id integer DEFAULT nextval('public.jenis_perusahaan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 $   DROP TABLE public.jenis_perusahaan;
       public         heap    postgres    false    225            �            1259    19930 	   kabupaten    TABLE     x   CREATE TABLE public.kabupaten (
    id integer NOT NULL,
    keterangan character varying(255),
    j_lokasi integer
);
    DROP TABLE public.kabupaten;
       public         heap    postgres    false            �            1259    19933    kabupaten_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kabupaten_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kabupaten_id_seq;
       public          postgres    false    227            2           0    0    kabupaten_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.kabupaten_id_seq OWNED BY public.kabupaten.id;
          public          postgres    false    228            �            1259    19935 	   kecamatan    TABLE     y   CREATE TABLE public.kecamatan (
    id integer NOT NULL,
    keterangan character varying(225),
    kabupaten integer
);
    DROP TABLE public.kecamatan;
       public         heap    postgres    false            �            1259    19938    kecamatan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kecamatan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kecamatan_id_seq;
       public          postgres    false    229            3           0    0    kecamatan_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.kecamatan_id_seq OWNED BY public.kecamatan.id;
          public          postgres    false    230            �            1259    19940    layanan    TABLE     �  CREATE TABLE public.layanan (
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
    tanggal date
);
    DROP TABLE public.layanan;
       public         heap    postgres    false    218            �            1259    19947    role_id_seq    SEQUENCE     t   CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false            �            1259    19949    role    TABLE     �   CREATE TABLE public.role (
    id integer DEFAULT nextval('public.role_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.role;
       public         heap    postgres    false    232            �            1259    19953    status_id_seq    SEQUENCE     v   CREATE SEQUENCE public.status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public          postgres    false            �            1259    19955    status    TABLE     �   CREATE TABLE public.status (
    id integer DEFAULT nextval('public.status_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.status;
       public         heap    postgres    false    234            �            1259    19959    status_layanan    TABLE     g   CREATE TABLE public.status_layanan (
    id integer NOT NULL,
    keterangan character varying(255)
);
 "   DROP TABLE public.status_layanan;
       public         heap    postgres    false            �            1259    19962    status_layanan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.status_layanan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.status_layanan_id_seq;
       public          postgres    false    236            4           0    0    status_layanan_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.status_layanan_id_seq OWNED BY public.status_layanan.id;
          public          postgres    false    237            �            1259    19964    sub_jenis_layanan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_jenis_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.sub_jenis_layanan_id_seq;
       public          postgres    false            �            1259    19966    sub_jenis_layanan    TABLE     �   CREATE TABLE public.sub_jenis_layanan (
    id integer DEFAULT nextval('public.sub_jenis_layanan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_layanan integer
);
 %   DROP TABLE public.sub_jenis_layanan;
       public         heap    postgres    false    238            3           2604    19970 
   dokumen id    DEFAULT     o   ALTER TABLE ONLY public.dokumen ALTER COLUMN id SET DEFAULT nextval('public.dokumen_proses_id_seq'::regclass);
 9   ALTER TABLE public.dokumen ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            4           2604    19971    jenis_dokumen id    DEFAULT     t   ALTER TABLE ONLY public.jenis_dokumen ALTER COLUMN id SET DEFAULT nextval('public.jenis_dokumen_id_seq'::regclass);
 ?   ALTER TABLE public.jenis_dokumen ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210            8           2604    19972    jenis_lokasi id    DEFAULT     r   ALTER TABLE ONLY public.jenis_lokasi ALTER COLUMN id SET DEFAULT nextval('public.jenis_lokasi_id_seq'::regclass);
 >   ALTER TABLE public.jenis_lokasi ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            <           2604    19973    kabupaten id    DEFAULT     l   ALTER TABLE ONLY public.kabupaten ALTER COLUMN id SET DEFAULT nextval('public.kabupaten_id_seq'::regclass);
 ;   ALTER TABLE public.kabupaten ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227            =           2604    19974    kecamatan id    DEFAULT     l   ALTER TABLE ONLY public.kecamatan ALTER COLUMN id SET DEFAULT nextval('public.kecamatan_id_seq'::regclass);
 ;   ALTER TABLE public.kecamatan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229            A           2604    19975    status_layanan id    DEFAULT     v   ALTER TABLE ONLY public.status_layanan ALTER COLUMN id SET DEFAULT nextval('public.status_layanan_id_seq'::regclass);
 @   ALTER TABLE public.status_layanan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236                      0    19846    account 
   TABLE DATA           j   COPY public.account (id, username, password, role, status, d_perusahaan, d_pribadi, j_lokasi) FROM stdin;
    public          postgres    false    203   Ǯ                 0    19855    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab, kecamatan, kabupaten) FROM stdin;
    public          postgres    false    205   ��                 0    19864    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    207   ��       	          0    19871    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    208   �                0    19879    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    210   �                0    19889    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    213   @"                0    19895    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    215   w"                0    19901    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    217   �"                0    19907    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    219   y#                0    19914    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    222   �#                0    19920    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    224   -$                0    19926    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    226   �$                0    19930 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    227   .%                0    19935 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    229   �%                 0    19940    layanan 
   TABLE DATA           �   COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal) FROM stdin;
    public          postgres    false    231   *      "          0    19949    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    233   +      $          0    19955    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    235   �+      %          0    19959    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    236   ,      (          0    19966    sub_jenis_layanan 
   TABLE DATA           M   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan) FROM stdin;
    public          postgres    false    239   T,      5           0    0    data_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 365, true);
          public          postgres    false    204            6           0    0    data_pribadi_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 321, true);
          public          postgres    false    206            7           0    0    dokumen_proses_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 109, true);
          public          postgres    false    209            8           0    0    jenis_dokumen_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 302, true);
          public          postgres    false    211            9           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 18, true);
          public          postgres    false    218            :           0    0    jenis_layanan_id_seq1    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_layanan_id_seq1', 28, true);
          public          postgres    false    216            ;           0    0    jenis_lokasi_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.jenis_lokasi_id_seq', 3, true);
          public          postgres    false    220            <           0    0    jenis_pengelola_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq', 2, true);
          public          postgres    false    212            =           0    0    jenis_pengelola_id_seq1    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq1', 6, true);
          public          postgres    false    221            >           0    0    jenis_penimbunan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_penimbunan_id_seq', 1, false);
          public          postgres    false    223            ?           0    0    jenis_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_perusahaan_id_seq', 1, false);
          public          postgres    false    225            @           0    0    kabupaten_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.kabupaten_id_seq', 8, true);
          public          postgres    false    228            A           0    0    kecamatan_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.kecamatan_id_seq', 155, true);
          public          postgres    false    230            B           0    0    m_identitas_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.m_identitas_id_seq', 6, true);
          public          postgres    false    214            C           0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    232            D           0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 1, false);
          public          postgres    false    234            E           0    0    status_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.status_layanan_id_seq', 1, true);
          public          postgres    false    237            F           0    0    sub_jenis_layanan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sub_jenis_layanan_id_seq', 41, true);
          public          postgres    false    238            G           0    0    user_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.user_id_seq', 317, true);
          public          postgres    false    202            D           2606    19977    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    203            F           2606    19979 $   data_perusahaan data_perusahaan_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_pkey;
       public            postgres    false    205            H           2606    19981    data_pribadi data_pribadi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_pkey;
       public            postgres    false    207            J           2606    19983     jenis_dokumen jenis_dokumen_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_pkey;
       public            postgres    false    210            L           2606    19985 $   jenis_fasilitas jenis_fasilitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_pkey;
       public            postgres    false    213            N           2606    19987 $   jenis_identitas jenis_identitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_identitas
    ADD CONSTRAINT jenis_identitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_identitas DROP CONSTRAINT jenis_identitas_pkey;
       public            postgres    false    215            P           2606    19989     jenis_layanan jenis_layanan_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_pkey;
       public            postgres    false    217            R           2606    19991    jenis_lokasi jenis_lokasi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.jenis_lokasi
    ADD CONSTRAINT jenis_lokasi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.jenis_lokasi DROP CONSTRAINT jenis_lokasi_pkey;
       public            postgres    false    219            T           2606    19993 $   jenis_pengelola jenis_pengelola_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_pkey;
       public            postgres    false    222            V           2606    19995 &   jenis_penimbunan jenis_penimbunan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_pkey;
       public            postgres    false    224            X           2606    19997 &   jenis_perusahaan jenis_perusahaan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_perusahaan
    ADD CONSTRAINT jenis_perusahaan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_perusahaan DROP CONSTRAINT jenis_perusahaan_pkey;
       public            postgres    false    226            Z           2606    19999    kabupaten kabupaten_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_pkey;
       public            postgres    false    227            \           2606    20001    kecamatan kecamatan_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_pkey;
       public            postgres    false    229            ^           2606    20003    layanan layanan_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pkey;
       public            postgres    false    231            b           2606    20005    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    233            f           2606    20007 "   status_layanan status_layanan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.status_layanan
    ADD CONSTRAINT status_layanan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.status_layanan DROP CONSTRAINT status_layanan_pkey;
       public            postgres    false    236            d           2606    20009    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    235            h           2606    20011 (   sub_jenis_layanan sub_jenis_layanan_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pkey;
       public            postgres    false    239            `           2606    20013    layanan u_key 
   CONSTRAINT     I   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT u_key UNIQUE (nomor);
 7   ALTER TABLE ONLY public.layanan DROP CONSTRAINT u_key;
       public            postgres    false    231            i           2606    20014 !   account account_d_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_perusahaan_fkey FOREIGN KEY (d_perusahaan) REFERENCES public.data_perusahaan(id);
 K   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_perusahaan_fkey;
       public          postgres    false    205    3142    203            j           2606    20019    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_pribadi_fkey FOREIGN KEY (d_pribadi) REFERENCES public.data_pribadi(id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_pribadi_fkey;
       public          postgres    false    207    3144    203            k           2606    20024    account account_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.account DROP CONSTRAINT account_j_lokasi_fkey;
       public          postgres    false    203    3154    219            l           2606    20029    account account_role_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 C   ALTER TABLE ONLY public.account DROP CONSTRAINT account_role_fkey;
       public          postgres    false    203    3170    233            m           2606    20034    account account_status_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT account_status_fkey;
       public          postgres    false    235    203    3172            n           2606    20039 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    3160    226    205            o           2606    20044 .   data_perusahaan data_perusahaan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kabupaten_fkey;
       public          postgres    false    3162    227    205            p           2606    20049 .   data_perusahaan data_perusahaan_kecamatan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kecamatan_fkey FOREIGN KEY (kecamatan) REFERENCES public.kecamatan(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kecamatan_fkey;
       public          postgres    false    205    229    3164            q           2606    20054 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    3172    205    235            r           2606    20059 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    3150    207    215            s           2606    20064    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    231    208    3166            t           2606    20069 )   dokumen dokumen_proses_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_proses_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 S   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_proses_jenis_dokumen_fkey;
       public          postgres    false    208    3146    210            u           2606    20074 #   dokumen dokumen_proses_pemohon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_proses_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 M   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_proses_pemohon_fkey;
       public          postgres    false    3140    208    203            v           2606    20079 %   jenis_dokumen jenis_dokumen_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_role_fkey;
       public          postgres    false    210    3170    233            w           2606    20084 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    226    213    3160            x           2606    20089 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    3148    217    213            y           2606    20094 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    217    222    3156            z           2606    20099 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    3158    224    217            {           2606    20104 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    3160    217    226            |           2606    20109 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    3160    226    222            }           2606    20114 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    224    226    3160            ~           2606    20119 !   kabupaten kabupaten_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 K   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_j_lokasi_fkey;
       public          postgres    false    3154    227    219                       2606    20124 "   kecamatan kecamatan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 L   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_kabupaten_fkey;
       public          postgres    false    227    229    3162            �           2606    20129    layanan layanan_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_lokasi_fkey;
       public          postgres    false    219    3154    231            �           2606    20134    layanan layanan_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemohon_fkey;
       public          postgres    false    231    3140    203            �           2606    20139     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    3176    239    231            �           2606    20144    layanan layanan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_status_fkey FOREIGN KEY (status) REFERENCES public.status_layanan(id);
 E   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_status_fkey;
       public          postgres    false    231    236    3174            �           2606    20149 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    239    217    3152               (  x���;�uG���
{�E�D!!h��DE���[B�=���C�5^�kR�w���o�G3�Fs�$�����~������?�����*�O�鯿��'��H��V_<���.��G*9�
���,����+o��*�4^2L�3��.�L�~����ɯ�����}M?��k�	Q���Y�+�lY��\K̉F"�݅��b��3."��)��#��qq&��t�P���
�-#ߋ�g���|O���HO���]�+6��lY�^�b��ٚ�t�
�sq��ښYf�`ͲU*.9�l�}sT.$=����ıi�V�X	k9�)��L�u2<������윛�S�N) aM	=��~2.a�M�Us��6kJ��2��h� �-�D|�U.a���p�π��������,#�=q�AX[�a�����n[�lXY�-��AXa2U����3�b�`�� =�y�.au�S8g�����)c��7O��� �v3M_��1p1��v{R��!����	�dd�*� l��w��0���m��lڑ�AXU��t<����3�bVA����l6������&�3c�"���2m��÷���2�3.a��UV��k� ��0�R���J�[U����\@XQº��6�V���	�j�{s�Q���׊ձX^���i�Y!�f�e܍�+}�AYee]�v�ӗ�e<���Ư����jp��%����{�[�r7���=횫AZnvb��͢��]�r����e�Ve�f�]�r�^��u��k���I/Kxl����wËM'�\�r2Z��''��O�s��<�k<�t�C3kܗW���ɐ_j��m%�_j��x8���G�0X�b3����]c��j��G�f��fהψ�r��+k�&�t��r�`�៩�.V�����ֆ�z,�5vK@��.�w5X�n�Ґ��"�۱w���53-��E���� �`�R�]���%&�F -���a��������uj�����"����N��b� �u�����{W|�����"hzb�5�Fx+h�~F�U�ɴc'"�s�z#�kR����Iݦ�ŶYY+�iY��������@ݦ7"�&�Io�D1�u�ވk�9�"l����n�f���.�a���[�FDۄb\��M�z#��Eܩ�x�7Pw�h�k�Cך�kU���ꚩ<�*O�d�zQ��+N�c[5�%H:=L�����m����o~�S���_|��/>�������������%����m�B�g�G��b�"�nC�>~�#��n�
ꕧ�V�E�Q�\5ȏk�;�[�c¯���+禱��2"���(X#��*���%��`V�&7�Z�2c����,)R�:q���C�ɵz��.��C:���+r�����R�N����Z`ܩ�f������S��%D<#z��r5�1�L�j���b�U�&/W�Y�6�����M���>+W��Ǻ�%�=N�jV�<�R{�"�*W�Y&�0E��[+��n�Uӌ�\E5����R�ʙӇ�fH�h���$n��$n��1y��� ��a��dc�g���]�Wڧ�c�M�A�m��퉩��u��K�[�����OL��LU݌���!)i����QW�$��nҢ���Fh���0�\�����,��T��#j�F`M]�i�]l"�F�����5�HCa,��j���.ED*�5D�HdO3JQ5X��Ǧgc�5ZF��ְ'v���M��3XC�+���1X�U���l���z4�v-m5XC�E�>��kH�Ȟ�L!�\֐r�@�Cz3��'k�R���:W�5^v�@���`��|l�ճ3������x�>�l�4�F�G#*cg"*�����Š�R����w����b`�-"G�k曦��������z��������!X�V�(1T�Z���7:2˖Q>]��0���u58z��e�e;)� ����k*�*-�����66��PW��\���
�� �� lUW�zUbV֋9Rv���0�AՏǘ&n1CVF��۽�H�`�jA�V�`��Y�YK�WOĹ�O�Y�;�&�h+UVw+�H��� �J�2kv�q1Cs��f��f�ȴA��5��j�A* n.�
��j2G�đa�D�$͓C_$&���}t�\n���o?�.aֲ#A�F��N#B���Y(k���Y�r�.�6�dR���VE�}�d��,�����!��ɣ���ȑ5�0kG+�{вC��S[mJ��z*Ro1�d-x���OFF��W��4��`d�ʌ�ˇ6��De���ˣ�A��Z���_3CL�f=�b��K��t��od��H�>�0k��b���ֈ�Y3�<s�.\I��1ym������}��[W���8g$���â�͹��� ̚���5���A��ы�q�����Ѐ�i��	Iz���$|�c��ŀd,H����9g��O�Ӿ?�-F��W����zth\H�����|��:;��+�b@2�>�y1\H�9�ZM�X�![?59v]Ɉ��e���A��H�]xF6��ճhf��!�b�����QEՑ���UlGe����䧅7�Fa�̐H�+a��D4�OF��W�=7�+īͤ#[qL-��V��g��7�v������b|ۃd�&>4�GF���?-�7���	q[AY���O`dd�1y|͐B_3��Y���ď��z�:�.��A-������ �a��τ�X	���7\_����&���L�,:���UH�K�~Ɯ�:A]-�S9{��͔]MjeS;G8Tĺ��l9)�_p��4��CͶn��4���nP���}v�9�[]�N�h�H��m�������P����KW���\j����;N�g�j��Ћ܎���R�53F���g������{W���L�~tC�{}��Z��;�^�K�Ҋ�3�"�K����ι+V�+b�ZYc{n��y��:C����We���^�&��,�&�k�b]A�NP#:W�&�����R�b-�>Ѻ���t�O�[�Kռ����;��A��xg_,�o��X����]�>��/Y&h��Cˬ5�T^j���_����ck�I            x��}�v�8���)x�;YK�	�����?Iى�rw�g�%12�j�bҞ���ϓ��@$%��מ��t�86
(T}U�U�����ER$�Ĺ�.�mZf��G�Ƕ��/�^0b��g��\�L�I�l��r_dΤHV���3�ڹ.��>u.�u�̷C��z�\���3I�;|�LR�䗤�·+2�x>���O��U��z��t;��i���X�3K�%N��W+g�o�U�2L�ΘϿ\\���,�/gn|�C��������O��y���iR��磁`#���$'#9?��#�!yN�iZ���>��l��n�D�йJK� )�O�2+��Z���#�4�%����N��d���G���=\�����\�~۬ޣ���{^m��9\>ra��G����|��Q�87�9���	.p���T�2[%�E��Q�z�*�2/�ҹ����o5�aX�P F���$@����%O��u>K��Ft�q$��5�=�J$�s��Qr< o�+�$E�+�����ָ�d6j�\�q+.���2�:S���I�զ�f��|�:`��:�g�(�e򄻪��.݃���D�
B>��h�y��������=��vss�\��3��:���O�f�;�.�U}����o�ނO�*];��Q�o�q�7(F��3��:���&-`���]���&�}U�f#d#/�+%��S[�F�[RL���)y�"e���=�%h.��:xxCg���ǝ��qf�P�T9�Y�͓}^�\z�����Z}z�iA��8ȡ�Hy_��,uJ�b	o��3�ȿ�n�&�5=b�����E�\TO��;sM�$k�o�߲�i.P�x�X0r���ӭz�Y�⎷�iA7�q�d~_m�N�e�T�&l�BK�=���p���*ۀ&%��p�,�&�n�b�KcH.Prq�3��.I��-��|�WE�� ��,��7�\�H�9=vG#%\2�J%�$߁���{l�F�2:Zh�����:Bg���}��!�Z�3�w���e�N������SC>0:,�F��F�AwF҄���LJ�~ߵ��YX�T��o�";.X�b2�0cќ�T�1�?9��ĝk��(�O�*�-]'�~r��_��o�4ާ4�KS�L����z˘�^�ʐg�qV�*L��@�_\�xx �� M���ؘI�=-��l�܀P��pň�T<��7��8xA�V����ٶ\}a�FT�
D\��tۙ�"�*BQ�<;�����^���@0�҂Q�u��O6I��I�"�rC)��.�f�84~�x�K���[& ���4�;����/�V�+u��2�[OH�@��S&]n�~G`�/"m�=W�F��O��~^�]AޥE6��r�����B��,���rw��9A�?�m����n��8��q��oe�&)�C�� �>
�p���҅�8�[����~8xC���go3C�t��A���?Gw6�:"�!!{�c�^ĩ
J0t��
�֫E�G'�:�;�r���&��v�	�����P�$q~�ҭ�Y,F �]?�w0e�)�>x�$�0I�i�O��}���g�D�(���Yz,l���y��?���Z��R����Ygx�+p�[��|6���D!�I�~_�*$��?��)�Q�|��Jﯮ3�?�G���n��G�����YX����}�K20��T���Ek��p[�c?
p��I���'�
���?����YB�,��yfQw�̺S'\�澴���IuԷ��c#�>
����H,$O��sCD �p�D�J��T�1��%�=ɍ���.��0��Ե=ȃ�ջ��`>�����d���ɼ�&y����ƭ6@~HN��<�5��K��g��`�<X�V�iG��B�D���/�nT���l��S$ߪ= �,��!y���VU�f�G~�e�ID����1��OT#�8�~N�8j!8
���g@�vk:�p���za���Op���h_�ë֩�#�E���G��Gj-8<�`~d�� �z�ER/�l56����4d]�Y�����}^�ao�hyh����{��=nvN��N�`YGr��.��N�$��X(_?o ��`���r���nJ,�J	�'��`w~"id@�<��0r}�^C�7F䉧ɦZ`/��lS۾z�E.FE�VO��]�m�I�	�R�TI'wr|��d���H���"p�4��0��\.���*�&��B���-�O2���!��_Xp��۸�E�
�V�w|qli[D�x�&�uZ��}�K;f����1��Ƽ�D�����a3�wg}��p�_��Ul�a!�8^�6�3
h�����LW�Jf��yO+D(�����`Q�� �]L�*-���wy�^�U��>�/'��d�I�h�C�A�@'�> ���.��#�Ys��"_�k����!�X����h��a0�9�:�������RAa8�.N��.�dL�Z.������H�|C�มjx8�CU3�yH�@>�/���k�
w�e9!�?�rƤ�8�L�f����`��;R�|�֋y��(�Ł{,b��b �a;O(Itcy���X�{�]���/�c.����IYQ�r� p	�Z ���E�Ͻ����'0]{�i������ �l7��|�� �����VF�K��ѷ�Jw�����]�c�Μ��x�=֭��Q#aL�}</��������e�u�3��4�d|��y��AV9C�u�J�\��<S6���j#[ԩ�͛�����h�X.9��ثl�n��<� ����޹����-�����)sH�w��:h��'��HlR�{�`Ђ�^�,���
s���p�R�!�?�a�1?�����yyp|*�#�7v}�|��`��}�XGv����GH��7����a>���ϾeΎ��+T� �Qq�L��/�ݧ`��R \���ۉ�+�ַ�
��v���4<�Y����78�]��vʮ*�>C���_�� k!�(e��UD]��N�Ⱥ��$S��ו8�/�����2���v�x� 	�D�_t��#�#%��_�ǅ���l�����)��ʲx�2��ve�G/��-���`s[.�]�4�/�F�m�#�Y�����N^�i X�*e���;Ɓ\�>Y)*�U�MW�@��\��Q��^�r�Z��X�D�$�#(���R�|U#T�傿3<d�������p�c$���cr�c�xf�i��@�1
�J�G�1-��5�eQQ\��*��	K�-+��L�q��3*8q�].���Z��,Ӵ1��+����+�Fߐl_�I��2;�����X죣��弄s��/�;�S��Bn;M�Y�)�U�*�V
#�<�o�Ϋu�h5�� ��&ܡS0�1Ǖ�/��̄s%��ħ�@���>)���Ki�\����)�y�\�"O6�6���=9䞘��i��f��6������z]� �!ה"�Rl�G9S�!�b��bb�DA[������o��#)�E(�x�!�����&�e끰Rz��`#e��ȶ{Y�(�nQ�|��-\&
\����ed\���+�����GE9�W���@޷�s#M���´E�j� ���y W����B~�A��ɳ|�&�q��g"�:Y=G=M�̓��.�Gq�[X�ॖ��孮�&E�A�7^ bw�ڽ��Ɛ�l��*�B%&̯<<���s8�XJ�:>E��c�f��	�c��z�+L=C�l�)lL0+��.s����'O�
c��~���v_��;��C��XS���i2��)��o)����ˑ_���5]�w���,4��0F�_���y�H����y=���t	7����>O�G���Hf���5¯n�e�GP%,n���d�W9�M��g�˳iQ}L _#E��21�v���YЦ:H*:ny��_s��f�������IZ)�D���L�}���$�Ix#�w	�(#��}R$IC�L7�q�utF�)\�:�I��t��=q�8��o�7_�b��+�n����uY���[�_t
ԑ�`��;�y�V�7\����X    L����#�@�ϼ|�f(��@:j����r���^m2rŽ8��L��!�)�� _�n*3�٥��/��Ί��}:k���˷�E�n�	��%���fe�3U7�)�d�d]����*D��m <�ȷ� v!���y�^�ؘ�S8Ĺ_�:_���Y�~�~�c�r Bޏ,�!����'DV�AA��V4]{���e\�T1v�j�AiK���NѲ���d�8¤Ͱ�����VV���k�s�m�d>i'W�$���
�L� ���a�5_~��,XQ09{d�@��f�!�۠�J�o�ד��VR�����L�q땈1 M,fA�����i�	�/��x�/���Z?�$�_�O����{�$�: G,�ݎp�����bmD������=��o���C�����>d�h����u�qW6'~�\u����z��G��6��L��X.Siu\�O׭]:O���5�*�,/J��#|3�c�9�L�kH��v�]Č���E�2��|�-R}�����n$b���,I��е�y�j&b��
2���NWV�;����Tn�v���E&�6u��@��_��a�ɵ3�s�=e��*�)y���N��J�Q���጑{��{����=��:�?��?�ל��(\,,'�%y�g��uN#]	��0����a� ���3(��{D�~�bh�+�ͺt�PX.�MY�S��cܟ�r籀(��z�]�.b[��-�=�]S�4lЯ|_�P�{(L�"�sI��䕢ҀOײ$�m;�y�AG���o�RJѷL����W����xs���͸��H��I^��	�,�	ap�a��N�]<����C31:<�'��T,r{�6e�q�:���k6Ki���=V�3��|C(A	(��8�=(��n:m�hY�ά��"=C�4�̳X3�%��L�j42b�2�lx�ݧ�Eb 2J�y*�f��׊p���.q�à��XF�q����� d\��`��?P��?%�����!�&$;>-�w��y]9(Yk�A���jjt�em����(����:�tҠ��Ё����H��y�ﳯ�@��4�����I�>��,R,�
Z�Q
���k�{�\*z��m����*%�nh;��#�^6m��\���k�@�s0qp-��`_��53�H�� J�"�J�}��� ��0,r:�x�8�Lܡ+��A�~�>̜�8Xz���vAN'�5M�;�y�%���s����'?���N0���"��c���޹��q�>]����X]]�k�-?&��� ���;P$����n�Y�</���?*�� �'�Pʗ�^����sW�,>��`�Ր.�-v{�I��i�N151�y�M�c���At%�!I�k{�0
Fv��7�o�BӋ	3�z�E��	n���,-;/6�L�e��M	 ��?�>�	C� ėKWV�����ַS�}�>E���
l�
f m�
�7�g����e]�wE��8W��๰AQ6@����w$�r1�%��ˬ�+�V��O
[�G�]~f�L�6���=��o���y��V��G�����}N�~3 w�Cr�.����0�_��=b��m�	��6�B��'Op��M}�Х�� �ȫ�=�ZH�F��ß� ���L%��+OF�)8�@�P���f�QA���(|�:�Uȷ��I9���}�o3,%�ꃳB�U��x�۔�p��z�K�0��%qt�v�`��
a\ ���y R�Dk��Z��#��K̒LJ�$e�nf�硓m�jM��A,�~�j]ߐE�������w�������F2�N��7�	�k�7�Ԇl&�O��|'�V?b��F�YU�z�ʮ9�rY/�5���G(�}��e�&!ǩ#xp�K��<�w�m�u�&Ծ(�H��ȿ�ae��_$&��7��0{g*K_�T^X2v�����4�'@`������. k7B�)\�i^VK}�ӌ��ܖ���F��K��wS���:�X��/zb�&���,*Ɏ��r�xJI�x���'�} $��'�ĆO�v�\�3|��7�U�,n���v-ϋ�z�����+��"�H��H�r��U5�Y������kڌ/V�r8�K�I�-��W/r�1�	�⡍C#�KsDO);���lf܊�d5�Q,��v�JJÿ�<���Xl�{�m�P��~L�"�v�vGVL�/�	.5_?�%�����֩CIy���</��K�[j���R�|&eE3^I� ��l�a�{$�ڌ8U�Yn���4�1�;Aȷ0��E����	�y��d>�X�7B/�U�$��1U��	���<a!JSyd%OH�n�SW!�o�x~��L�+`�de��K3�D�!74�ºgr*ׇt��jZ6�%Nw�<��`��Op�� BЀf�
9PBr��d����!�M
�Iؤ�:M�J]�,�s~�o��JL�����}כN
=�&�w�a�'���۞�8�x�##/�S�����Ԯ��(	��Mb��xP�������i��_���^.
7T���9�����G�������c��^�����Q��/�i��մ�&�Y3o(W��d���	Z��D���;��)L����x/g��ȋUY�g1�A�Gm���ȋ�r
ǳ ����}*����r�	Z"�!o�	�r�ź��� [�����j,� L:���KI�x5B�o��Ib
�ҿ�.�M����T��z�m�8$>���[n������A��W#�}�$��&�p�?[%ϕ�	9�{�K8[2��WIߛ���(�ʹˆ�������79�o��u�^h���u��������2���dڞ(��d×m7*�W3�Laz�OR��A�[ߡm69[�>f$�5F�i�.g (��*k���HC�۝cnwt `���	�Z�|�=}�F�h��|��)��:_&���.�,��r�F0��n��A�ʼ��q(��V�U�<9�b��9�I�2Z3����'ٵ���F���^�ۍ	O�����2�Wp�kNO����	L�E�z����-����!2FJJ3i�N����feyC_�RO�=��Z��!dY�Q×a��w�dLI9�������I��R�� =rAtԉѺ%�Ә�[N��&'��j�d�g�t��p�	%4���$�U'����e�}��G�{{Ī"��Q�����_pho���M����Ks��Ğ�ih���<Bf���{a�5ԩ��*�Cz�j�3Z7�K�I�F.�<56h�WE���m�ѽo�'6E�'2ޢ�w���Yv�ݦԈ5�&g�]"��$Oh���%�	�����`�FW%U���Faۥ���Dq���å��$T�8,�{0�����b�F
t�s�sB��6p����U�'o�0��y��߳��t��m��+Y	���/0G[�=��Kv��%�y�� �e��㥪~�A�hy&UAF�gl,f�9�a������L�ߓm�/��2���,>�E��a�s��w��n�1+�"�}���E��r�֗�H�4(��F�l{&���8��Ğy���4��92W+�Ya'ن^��7�wH�n�C�6%~
[Hd^U��	.
Bky��%�}@
����bubرw6���hV��tҿ)(FY���aI�p�Q�)#e�#�����Ҥ�\k���ޡ0��c�:������h��h��}x���<_a|�,��~C�Ye;���,A�)�O�[��)���͠�3��h�5j�hlٚ��gRR@�J#�4�\6}տ���e&���(��J��ʩ�*�(��F��� [�f=��;�ֹ�.��L�t�������)X���zA�c=����L_H2`�K4�!�K�ç�G_�U�=G#�3��6���h5�u~�̏eU_H��x�Me�Q��Y�5w=5_q��=��p��愳z�6�����@�S�:`�¡�1��pR'��lɆ��bk�l?pkX�vw�͢�Ē�;Fx�qw��gH��-k�3�]�'-b�!��l�]���h:�H|�m�y���E�⮚
��4s�~�a�����dP��fu{ܡ�+����djq���aYhJh����#O�~���    ��'#e0��jeO���$H�I�"�)y�6���1���l;�IF;��_���Ccuf�c^�'[�p�e����Xj�R���:&�DG���=.[���a�N���7
�hw|t��U�Х�`s�J˺�Z�Q���b�d�1�g_�H����0>(>�Y�&7	���� 0v`�GD\U�}y�v⌗v?�{�ͭ��_��l0���Qt��:�z�9:d������/"�=�@�>9�c�R.{���K�+�7�K�e�m��A��<8Nh��J�I�R�%������!|f�u1|]�cKl��0:TKN��.ۋ�g�1�C��ҚC�TAc� �U[��NU���3
�0��	�B�V��W���T�P|������9o��1�����f�@���,���Ti����c_-�������7�����h�/��k��|���:�F�'FQ�TQ�A]�l���갛`��S�#5t��3�!�O3�̨Гl<��V$��	@R�br�;��,m%y1������6�����fο���7�>���|O�h|1u�4����ќ���C[�' ,�gb9A�uN
\�l��~�`H��琙�_����_`:̏�S(�Hq0�W����y�h�t�(��2&s�S�,80���	���=�����)~`�]�%��6��t�Wt�I�v�5҇�m�@�꼡MxJ
Xd�v�AG8ώ�d��4MJ�U��_�薹D�ε.�`����E��d��Y.�gs���e��a��ARh �Y���x��CG*k�K8����ɏr���!�ИX��6M�N/zy���Y�\�O�-ơ��q�ѰC��P2[������X��lww�!��Ej�|¹+L�����"m��I;���>BB�:��扚c�y�zﵥcV������S�}ʝi�-i��ıE�������4^'y%��\�k$Br,>ވR����� �c�E=�Z����B��ܔ�D�����������v�����W��4�)O4����?m,�8�&�-����'��wD���)p�-��5��{R8B��Xq'rp��f`�.��eek�HQO�2���CLr��p3ο����(�~��V�w���5�^=���!*XB	ҢɖR���
���{o�O�`&$�p���#��JYX�Á��"
l��)��=��x�8�.l�ET)˨I��/���	B��~���F:Cv��k%j[,t�BO�
��H'�^Ӛˁge�5�&�x]\6�M�˚�C��"w�tɚ��>�N�V�G��(z�`pB����!v\����+�<�g�3u/��þgm"��}S|�dS��& �"�Gq$F,���2�c+��n��錄�s��hи2��IMn�킆�${5��~wMX�P.��",��wP��9%8o��CϞ@�3Q)�8�}j��Ѷ�Ԭ�������(�\�}Lh|��LZ�Ph�������_��zD ����f*���Q?��4��b����r,?�;Ɇ�<i�I�>�d�L���ѯͯ��Ђ��и�����z �&��H���I|c�����2�����w:^�/�B�xOg;N/1]�z%j�$sn����S�rL���B_�ezz��23���-��(� �n��h���m�\&�V�����F6�}>�.���0��5FU��7m6ֽQS)�g;xVy��V��2|3�Y��[[�̖ǡ�.���&Ē���=}�h�뢧�������7ړ���S~�L��zmgɷt�T
��b��Ё%拷K��WT
�"@��'�MD#[����*�w�`i�$�.�� �p�����a��P=��m�~^�AM4[�V4��<�N����1�?�B���K�/t��f�a]�5��W/�k\��v~c2��Y�'�p� �?E��>H�<Y&�y��@.�����N0d�����B�PnB�o���e�]R�H�oqHԐP��:u��2�l��>֙��˗gU��� ���v]��N�e*}*�?�Ԛ�ҞƃE۾�i+��u�;��V|$��yN�{�֎]��	�#CN(�j��^ͻ��z�[5f��d�U��ڍ'\6Z�Rv٘\���%�ҫ.ׂ�t��������N��P�k��<�����)s�Ѣ����1�=
������c���Lnt�t��*K�cKW���[��֋�C5K>#��~��@������O��jU���K�7�e+���l�%;����O7ݦ�<0� �������y�l]��1t�j��#��g����>�CcY،<@b����O���p����eZ������N����fu'�	9u�؃\����B��t`,��C|
�/>��z�0��^<:�#�sz�����MN'R#�R�Wg�1��'������ߣ��g�$�4�0h��֛��Ws�P'*P�eD���Y�����hE���,�	>�������˫�yǘ�C%��j:wI���I�q2��
^q�ȿ:W n�L��E���o��M�e۷u{S_T*y�ݖ3j�R"ݦ��_�D�],�q-ʋl�?CW�!�J%i���!ƍ�1%��yh�yU���F���Q��)DD'֊�C��	ūj�i2��cd��`0z����~�~]%�g���$eo�?�����Y�~#�s�+̲��r}bE�'.���U����:�+8ƌ:�i����dh���ĥ2���tq�B�Hr��,�稣XQ	|���kfEHC��M7N6�,%3{5R/Ҝ64��P�"�29('�|ԁ��/�s� J��b	���%�"c�E��J]Cѣ�f��9��~��L�m�b��-��WS�
�H���V�/9��bӝ�^i |�ז���{�j�{��S����� � H/���2��@�(1����Fq�U� 4�=�2�<�}ԛƢ�R��zÁ�7��R>4�7�n)��:2�Q�dj��U�Hvj���G����?;0�wR�ۄ�֒�&��X����Vrhc�Sc)�t��t>^�&��p�q���[{F�-.%�yzˡ&f�R�&ڄ��o��������w����れ���ERD�c7����0?��[C �Ǉ�"��%`|�ʹ��O�����Di+j~?���yL�l�f���$��a#�pl��ӏ�K�hܸ�1aK���ʙ>��tC�=4�|q|�b��s��h��Cw4T�`���ji`���;~4�Pa�&�Ѝ�;)	��u}�Zd����z��A'��j�aA�M$AS��wD�A�H\[��Q�B�UJO���y�;�X��	֋�H�um&��?>���h*��C5$L�%yzVSZ�ohϽ ��3x��?bv����UUR3,�0�}k^c{`����J��$�'���kZ�)�a�Zo��V�Z`�_��:c��N�v���T�lK�a���.��
]f�d�.�)p������y	i�ea�vEa.�Ϥ�O��V�?���y�.R�S\|K�o�*�V&�@�2v���M-�T���1�S�kė�� �#�.k�K��2
,Rb����c��zwb��HY7J�n�D���/��NmP�z�us��9���1��v��y�>v��W�p�����������w������?�����[��7���?^�?=^�`XD�¹۸���<����;�OT<9\,NAl�t��Jn�7ـo��]�w.�R�>�ύ�ʽ��͐4�}�/�u�T���B��l$�[{M^�fU �+ˆ�Ŋ����vA=�|�Cj��ƟS�?�?�_�3��`����=L仇T/��(�J�����j���ڪ�Le�(/;M7�~��[P%�g��~�y����.l�rx �j�L�5�vcW$G����'���H�	��T�O
}�p�`,��	w�3�8r��{��tu��c�ɍ��1ƒ��*sk��k�uC�CZ�,ՒR �7�rLh ��W��4�gMW���S��4��w�LEH]vd>��p�AeA�"7�,{%���V� hN�2@O$�t��mh�W"��I6k�v���;�Y�c�F]� �#[���枝wg^��TaL�[��]�Яm�[�Y �  ������Ys�yy��J�<0t������y�������o����]Ig+�-f��ۯn`bD!`R�'�/�)�$�׷�_�a�|����zz3F�ޛ�����緀�oG��5_��3��^�|�j\�#}��t
":[�q3���-��W�*=>��(�����%�{�<��V����=����c�ˌ�{��"��A�uuznu�p�mOU�Ѐ�'��SZ����k�ü���xۿ澗̤5'�A���d�|��KWԒ�If8��G�������O�r��n�U6��7��=��!�R��NđGÏqv�o#�-�9���U��T�@�)��|��\[��%��d�N/D�3��s�sn֚��=QBc>z�81�%�3P�s�\N:�K���zdpp�;��lj��~��Z��~G��e�EUdzX�[��o�5�>$��o�����E��ͺeΏ��k��m�tw`O�	�P���|��ig W����u�4��s��Rg�_�t��W���h��9Qw�hh��cUFI�%��}��핅L���atM�v�o�Rj��9�� .K=�	o�ub�Х����7Q��S���Vp�G+(aƺ-�����}llW��}^Wߨ�#j����ir�9�(��֚j���3�\�Y��iAz��t1�q���A�#
X��q��T� ��S0���h�����,�{  ��mBN�Ҭ T�k�.��<_��պ��E��)�_�9�g4��#F�ەDPc�͠�1�f;�rx��1@���H7_&O�e5#����.�GW<��`|Uk�V��Ɏ[��?�*u�'0omlQ��s!�(��5+#�{+"{��2�5�V�VlP���$ݰD��Yͤ6%�@X�B�A?y�yEp�;�}n���C�<}R�^���\���*rh�%���q��:1y�!� ���w�0��,�9��k����0�x�;j�}+�!�`��$]=�MN��4�OO�q�����vM��(�y3���|+a��&�h77��49cM���aA4�TbC �ªk%���s��wO�A�a��/�E��j��#J�u<���5�+�%zX.�g��F͡�TB:!Dw� �����G�X=����0��ꥯ2{A�'$���S�ߑ���t��:d��#Ķ&l�6G��v�i><=��a����G�}��X����./��g�G���#� �?4�V�*M-����r�Z�9x����LQ#��"+��ԥy�&)�z���Bl#CZ��l%�U�l�փ��מ�~m����?���j}�t��M{r��,Q�Q�+Iӯ����~�o��s�U�1˕h���yrr�4o�
uk�ib&A�����y(��#'�j�_�xA��'̍�~��3��a&D���zv�^q6
��5(��3��z�����^��,����o�͟����2�E,B�ݡ���Ncἱ�{|kd��Ƌ���<��#���n�V��y�;��$��vg�5����/�b%�n�@"Y��:�K�5�H���k�l�O�������f=C�#�ݧNi�����d�S�gO=�B6{j�IBJs}�3cw�aV�垁��S��ʄ�)I�J$-�ᘿ������I���u��ԁV`9��z�y��^�a3�bd*ZG���{1����~��0���;�8?%K��4��i/��*�)�j��g�-��kk̾G!��hZQ�� �K
2��z�~+׉�͸�:��U�#��.�e��5Im*��%�ys�<��p~=�@�h�7�*���5��"��	���aU��1����+j�)C�Ig!ޥ�˂8&?�j`;4��BEu�Y؊��e�#����/��'U[!�(D�
�E�/#Bi�c׋��ú��ψ�[�2�5�sc��r������)b�VI��c��^\? E|DRK_�::S��0�s�y��u[&N>�f����ʉ���X�U��\X�&�궜IR�C�*)�P�����"�VHȩ38�Mc^��(����7��?b]�t��ᯭp��?@�WRn�$�����޻�ճW���[�$&�Nu�V��Ճr4�H������9�׷��~"	�O�E�/�z��>��&r@���~�=n���j#a��D/v�dYY�_`����d�K����y �J����:�����R�2��^�u�#�Q���Д�C����0o�7�6�Y�s_��o	��u�g0"�?̂~�S��d�i��?_Q)��%�d��
������a�"5��!�H�����e���Q�Z?@�����5�kSz1��Gt8H�����K�B�z����_Tz,���f%?�������8�T�f��	I��?�gC9�+pt��ف5O�v���(�;ju���-��ݗM���2��I}A�M�T�>�x4�{����L߽����*��vb�am���쬞�"'�]*���K|E`i|��f+Owz/���E���o��=Po�(G����&3E�z�D��-�]��d�
��P����a��������7m��[?�~36_����@�qmXq/e\?"M�2I|����y/�a��q����4���мвB=Z!���mɏ5h�~R-�G�p���fX'����X/}���Ez�X+Z����]�HO�-=�Y�J$]��\��<�;]��]|�u�� H��'���r�΁���kչ��m.�������Np5����y
��p��9.�d�on�����!¹�q�f�W�ȑ��y鼛L[�}<�#|7Pۘ�ò�M� ������D�Bb�Q������1�<��[_;��A���ۆ���g��J���`䅢�Eo�Gb������2��}Fŵ!��q�q�>�`Rj�����Wn~���za�n�,u����C�X��.)K�Ej�������jݼKJOY�f�Ɓt|˔�>@e�rz�k�[�C>؄�q{�P�Ԥ��
���8]�p�$�����W��YZ3�q����v���U�E���M�5\�QCC��0��%d��:��Y,�G�G�h�E��_@i��jU�o�(�f��{&�i:�3 ����r�d�
r��?��f���P9�
�{�%�pk=zw���Ӗm.�=��� [��W�cv`��1�K�Z�	P��/�^l���&jpP��(�����&�O�0Q���[E9[������<\��h��14�+��z�C����vv�Ľ�0�~:T�!��POT4��ps]�)Vfp�l <�~��j�X���kR�z��7�k��:�E��� ��a�F���	����'4 >�_"��4��13�E1X�8�<�=�W�^I=d�����A=��)�o����K�h��<�� ���M�U����q�KT�Or�aM��>��a�Yx%�ze��v��U�{���<2�Z�/dd�����������ع�            x��]�RI־N?E���ص/w#,6�`��MGGL���*Q-L-M�O0������,I`�)(^@ U��2���l"�4�D�̎�
�Ȏ#�rm˲���Z�O�i�.�GI!Kٴ��gi�ֲ��	�� �w����}���(۪��\,E�����=�YZ�����ōh�U�R|'^g/����BH��䌏�Q���c��,��i��L�@�ۉؑ�������;H����xv���<�Vq��Z��lD�"�r���,��SDb.�%p�b*r���r-6�r .!�y#3ڂ �Q[��
ﱀ
�|߿*����	OS�v�!�`�C�V-�R˛�^�-�A� �� ��a�V��B���>����鴻�@���W����Rm"��wgylR�2�<ض�h��ێ��� ��%�ЕB&R!p����e8���� *�fA{�L�:��?����e	��j,]A`vB��
�q�����8����э�h�t9?̪YW#�в����N<|�b{"���Y*��f�"�����l,��^�FZ�svBty(@���k�����<xh��%=v�P`�phw�t��l-.�����]��<�M�����ާ��kb�(;v:�ey�cC �|C猁w��
��H�s/��_d7���r|x�.X0; "bc�V|4�>I[	w��VDjs`9Z�i���v�(��V��ND&k�0�l��r4Ӭ�ݼ�2�X�'�Ya�^*�bB�i�}��b��y!d���*����ޤu��&K�wM����MU/�kq	���^�),�4}7�y�Nb�6���j^��*ҿO�K�������g�`0we�����`Mκ��
�"���)��M�z���o��dux�UY�=�e5�+R/B5#ѷ(|�"��?��P�Z�|V�MŏDS�����\�\	V$��.������=f#�?T���p��t-�,�)��� l>���Z�	?�ڶ�>,��,��E(�&�g��G����C�yvRe�	�T3�Y|��6+���6�A�B6�堜*�(�"rG�O�e*4���2u|:yO�&��������[���Gi�*�F 0��X֓��4��Z�kP�/��S��ж�f��o�R��X��)�2���Ua�C���c~�5��˪@h`��5���)E�w�J����o��.{�G͍,��[�# D��y�a8l|#a-��=�d�ʲ�M��eǅ(����5��'"�V\����yZ&`4���1�%�����@�������|����-�Lԭvư��S�섯�ع�� ]��3N�	�^���`��Bv d#rLJ���@%��R���6 �s�@��t�1���S����dD���+����bg���p��9�O(h��;s��S9�K>�􇹨���� ��^�$�#��
w��:�(�8;3�M�q���.ڡ({��pP.e��Zf=��mP�lw7V�c�|r�\$�]�~.g��X(�w����5ۊ������=����k��+@���v%]+ ���	��`�ʠ�(J��b�YxD�ȕ������N��2�j�hb*�fo,���cv"�Hs�A�!��B�j#z0�;a;�Qf�?v5�F	�d�'z���RxL?X!����v����UH"tN���8n�����b�O�;K�b�p�E�5E�l�Ln��g�ϋ��<!��f���(D�����#���2]�Mہl����#�v���W@{��@�Cf"E&�3�2;�} 5桏r���k��7]�#v��$s���j�=Zh�#^�h�]�D#/3��D���y��}Y줺TA���_Vd;+�;4l�+�d_C�>cJ'BA	@���8�kpF��4(rF>;�1�2W�F]"ѹ_Q�%1[\��w��E�RX�B���u���!��a���\vQ��O`?��e�)�`���PZǭ��0��o�װ�		NP�
��:�Z)3B���Γ�:3���2!��E#ӗ�+�!�9ڮ`���fĀ��iZ�|��N��F-Tr^�aw�����Uj�f�/�3m�AZW��TqW�ڞ��������OF1p�ӧ.E�������RL'��w�U	���� <���^�rW��J
~���s\�iTΆmElҕ}}:��U��3�I�V%Op����FP�X�z��.��jRr�m��T����
��!��}����g8_�O�t��$� ,ژBDÑ��S<3I[Ar��#m�<ǰ3#�{u����hV^���VS�A��'V���ZFT	7|-����E��gi	_(��1�V���
�����fG�Y��i���N�� ��dBh��>�:C���� m�Te_
⬵�f�iG�h�n�C,:L+ �s�",qs�3��!�iD���2m��,�"�s��j��W<t���W�����Q,����MY��6�P6j4��u��Z���J`�	�d�I�!tم(o��QV�ҶU̴*�}<6��yl��E�b�i)uo�u�~�a7�ΚI��S��c�Q��!C42�l�0`G]#���옍6ΗA�B��F~ش]���m������I�O��n�ZU�g�Ӧ�A8���v���Y*	�����ca�Q��=> �A�"��O\w���Ǯ��b�
��Ϥ5�l6S.�`�a!�ʢY��=w]�4��tf���PG� �C\e�{̤���4@f�]��lUJ��	3�aڑ�Ne�e �����L������͏Z�	��H[�`*��df?Ec�d׏|��c6+�unT������`uߤ#��i� D�*��h�)@ъ���6ț`ĐaT���Z�tQ%�h�7DC6�!g�O]���h:3�-�*f�L������L��Tj�u#��|�fq��Z�-���찮x��"�6]#�?Xe6�͎�]���et*�*�{���B�Y&-���e�k�����T��O����[b�����㑹,�פlMlw#L������1��\塜��&-�O���T���V�mX�ä�
�ӕT1m�`<-�j��<��[��[`�Ժ�>D�+�H�`c�$,�����܀i�Y��[Ǝ�}��؟�^؈�U�:P�4)`�>c=܇����>}�3Y��qUw5]ZU,F�1�r�d+�L�ƒ�iZ���m"ۮ����>-�Ơ�g����b0��$��[�����OF	sێ�\��'i�@S�Dt��_��҃��hPL�v,6����5�{�&*�R�ϪU��� �Q[Ա��	����u?#,�r��K�J�u6ZP!х�8�2���;}��Ω� (��o`�ժ�3"��i�g�$�䠢���'nd1U��I����Z�B�E�ՍPM�\�-X�}l��l��1�tt�"O�Wy�7:"އ��[�~g�!�k��iv�$}J~C.����t�uU�����[�;�J���U�������eD]��0�
�:�D3�7�oPǶ�iwؘ�iq�hn��q�A͐���ּ{��R�
��ј�@�����d�B�eճ��V�S��s�?�},���fTX~?��FS�~S���m�-�u��B���g���W���S�Q�<c�R��~��6a����T4|t%���<�`!�*�H%LO��� 0�&�y�h�< �|�p1�`��	`�z"eő棦�A<�����)h��I5RSMى5p٩�f@�i�8BV⬆�t�
�Ģnq��,Ɂ}r�gXҲ�P��Ai�N�X>���2��A:��XwJ1�� ̖|�[��o�4��n��,�[sH��\��t��Nltu�Y$D���l����#6��Ƨ�����t���g[�H�;�l,Kx֓.K�]���\C���&ٶ��4h�b��]	;V�ȶ�����ܡ�fc��yږ)�ʰ��k�^v�f�����n�_*T�L��e���L���	њ�m��u�l�a秣*��R]yc�9L�w�����î�d�ۃ��t��`�x�Cz@#�Ӧ�6�h\�䪹��W$��'@�U!W��_Q����s��T�X�?��f�W�x� �	  P�"�Qzǎ�������Cl������r��A�bv!��4�:����Fw(�,�n(�~ԓ�Q�fHǢz���F��HuL\�L��w5��-���0ݫ;v_����|�����u�d��6���d��?�ѺQ{�٘���z_�dˠ�շq�~� �V��Yӏ�����A�<��cW^��~�I�/҅Ҟp��[ |�z�A }6���u�����"|\�|c�^.�h����e����|d����&d{���8cUg���*dso�2S��dAY��7�q�{1��`~� Hhv'�� Z3l��*P���h�>�ZThvV˥n��a���[el켗L���<�5�~�mP����d�Ir�A��:�%؛#�JDN? �q���ɐUB_��W"rQ<�;�cg ���	Z���t������is��"[%��r�{�Ѝg̾�ap8��4�󦂟go�� �N>�0B%��ɭ��n�&�n57�R����Kn1
3�DlR�*�ӷ�!% ���fSQ0��}�4,Iߥ�8W�g="c$�g3�v�Dΐ�=���A�?�Q�!z����C�-��X�/X�5���$�Q�u�.��z����J�����<��a��.�٤�e�p��Cu@�+Т�v���b�u��iU�7���,�l�
}���%?�k��Qah9�f�O���A��ո���]��S5�������#����,��`D�lc+^T/b	I�@���� 㺋E��`���
��<1{��B]��+L��gF�[
va����l���D����eKÑF8k��c�� �jfW��ԡ:���P�R��:��OpK��c�r���~x���$�u�z�97� x���>Sŧ�jm�Qa,�>���6|�ƪ��j��|`{[�YD���ԕ�k�d��NU�8:L�K���4���}�0h�{H5�̣��v���
P1)%��Hm��k�[H�Dy���x�_Th`+ޙ
#+e�7��jB��p������Ս�D���)��P��T�(��k�b6%�g=��u���S��\�0�*?p��l�#���s��^b��$�n�����
����m$��s9G;vR[�P3��Ok��*�S6g��̶AP|����8��N�����ld����,0;7��[��}��%�e+��*!��mVD}���a����UxN�1�c{���bf9��=̫:MP��V]߲��J������8�b����T� N��Q۩~,�65�k3�?_��8��>g|[Y�%�Ak����:��q�R�̤�`��,��S�u-%���E&ʮV	�Q�m0����y��P<4�(u��+��T���n(ֶe$�>�:	]y�����[;䜾����]S6ˮ�#��Fގ��k�����B� I=nڳ������k�%��A�i8�.q�,÷<�۷_�30U��`��(���i�|d�	y/�
�7���֐l�W��x+����h�l����i}dͤ��X8�l?��Ԥ�Gm+������L8[*[b��w� �q�뫴��J@/�X.
q��=a�FXU��[f�a�$k�����t�X��u���w��W�@.��O���u��6��bCv����76��&%��?����q~�>�y����F�t鼍�����֎ҍS�r8����S<�8�ʦL�Ӕ�~�3��:���uY�f8n��{^����
fk$�.�{XP�Z�3���Ѝ��m41����Z��'��5w��4w��y����V ���]6��6�.�Ԏ�D��N7lГ6�_�^�=�F����2❛~Lm�_�?W4�#"����@��{����@%��v��q*d9�c�ɾU���^����%2���j3c�/~��`�Mm��0�S�c��4q�ɏ�����D�Hs~�ט`� %�}j<e=�x��SQ/*4�6	�D_�Pײ���.d�C�0EnsҋӸ�Kzl������-4<%\$e�v���dY!W�M:��g�?>�$���D!E�"1�35T|AS�ҩ��~�W����^{~�Q��|��/�9�ҕ�1zt�Wft���}��N�s9
���dB=�HP�)16I�8��0�vFp\�
�T{�gHhyq;�y���j���S#�u��ק*f�2�0KD�[���pۡǶ���p���ꦲQ�=���k*P+��.��a�e��*O� �x%ys�*�z,�6����Xu��~=4�D�\8�%MA�۲Dv�Z���'�c�U��1<��ˬ���YWSk����Q|R
�p�o��֢�z�j#-�+�Q?��3Q	d�y@!g���ԍ=�]���w�z�lA��ФD�O�F�2h���0P}�`ޭ��-py%���/�آ�����{٠i/g`����k�?�bZ�q(����}�S瞫�*��XM
���:P��0p��e�q��*�4���1p<�
���/v)�Ġ�z$��5�ɑ�'բ+Ғé�������W�����͛7�A      	   R  x��ӿN�0��y
�EBu��I<Ru@����ri\b%�#;Qac�-y�D��T��l7D�O���$k�7�2t�\i3k�����)żʠf�r_�gU	�(�ׅb��y���K.e�'X(gB��<�V��#"�p�〇!yT������2;H�M�iz��A��螸��}'�)0�TN���U�r��J�(�G��jj(@
�l5ί�k�j�ZM�\_Q\�
[�?�E؇�H��u���9jnv������oD��=-Ƀ���5��N6�bĸ�hAgR:Ϡ�h�yj�4��iE3<�(�.�����K��<�{�_�j���d���e�7�5�.         J  x��\�r�F]�_ѫ)�J�� �5+1�I�+�k6޴L�� �,<�Ҭf??1�2�2_2����$(�JRG6��꾏so7ĭw��\�)[��z�IE�)��Z�j?�>}����և�z���tY�lfe.{��j~V=�?�L�c]�3J�G�}�+A�.����*L6��b�Y�H��I�+V�Y,�
q��M�%��"��m!�2g_�ct϶�Q��7�DKH9��e\D�:܆�(�bR�Z|�H��]�ފ���%���\�ƳnK������Ⲹ^�%��]ܱ;� IY!JKD�e��O��%��l�Oֻ0�FjǞVLH��ѣXV��!������ě-Y+��dW�0-�B�Rm���[����{H�'���>"!q�GbK�u�(��{���2�zw�˸P�R���j��n��H�II���/fj}X��Z����lɽ�JL�5
b]I~{{����@[�՚lk��ʔ�D��9[&���!w��i�>��6��Ŏ��yf���m7�Qnb6�^���nq�"�n�v}uwy{ړ�A)�Y��6G������XTA$�C�T�"U�G�J*�3�&r�H[vF�{�zH�)P׷(��ʳ�Ϥ=��A�aٚ0E&��mkqB��&��<�koH�R滥�(���Jm�6�j������U�����-�w�.�cWE�����m�����1��%��a.P�!{ɣ�c+�^FJR\��3qO�#ç�p��k���bs�� e ��M�2I�3䯫0�����(���A���R/��[<w�/.���DG�P�m���)L��J�(UFH�蒪�"O��J���9���0)��F�y���YBZa�n�:9m�<��2��F�]�m���YB��I.�Nr�[��-�[��lY��$賸/%I&)��!-�hX���Y?)��|.ÌtFF�Oa�S�T�U� �]]l�fr'T�0�9��B��O�A�
NO ��b�z$,���Ɛ�3�1����><����?�����{3®X�� ܞ�����B����Q�Gq8��7�s��B���P����F9�
KЄx# 9G]��D9�/��ߘ�8������b �r�T�f`��wA9��j/-�T&&_Q�1�c���!���?��u����Ǉ����*�j��[X�:�|���-
~������-vVfѮU���5-#�_�e��eB/K�u�j�e�I��@,�A�p�8i�Kv�;����`�}w��%��s�_�h���D�Z��k�3,�Uz��>�}�3ץ�x3�.��M�C�u=6JD��P���3`.�7S3��8w�	�З�\���5��
�6Վ�����gL�m�v��xY��6ꍃ����
��ٗM�Ud�(]����}�Y?Q�ߧ߳�Ez�:nï����~�H��"�!n������_얂?\W�EI���X����!0c���O|�W��r�5��ZDK2w]!���,V�.$�'�xO�ϕ?PSa�|B87�|Qn��F>!�fE�EE���~�`Ϳ)�RD.V��e,Չ�4�E���������6)�?�1��lV�9QL߽��Kʼ������AX���{l�ई�֙OtBV��@VF}3�贬�[�a��!�AuU�Y�eL�;DH��:ѵ>�o��fm�Мڕ���F�'��xWSLhc��笠�`4T���i|�3�J��x��t�M�Z��n�kB%h-#�|�XL>K�*�_�=S����7Y�x�蘇��7ت��3�ք%g�<�<��������.�f{̝v��%������T
<��1R{)3��茼�J1�U�����'�A��-jč���NwL|��Q��S��%n{�'%.��t���=V}�P�E��a,A�<0ҷ�o>��
-�%��>*�z�VA�ĝ�0uԵ�)$\W� �v������v�����w�g��Z���΃�3����=l�{p���eI����<��B�f?��.�QNw:������7 6a#Z�
{��;�waĆ��娿4=l��A��a������U�E���H�Sam���ț� ��Vv�"b7�V���LWbky�9��4ʕC�X~p�M*�|uG���<���`tm��q;���8�@bwP��qH6�>� ����9������Aʋ|���X�3�9��\��9�s� �zc|�!��S@�ki����u��}{ܧ���{$;a��^���>jg�亦Y��|��dK�@���mΠ��P53n&R��*{E�
��?g� $���i`C� `P/L�%UI��IQu���}��I�n�M����=�GJ%L,�ӷ?��]�Ba�(��<�����m��m�߹��^ދ�P���F��Q���$��K�p=S�tx�d�sF���^t��uK�=P��T��-�`�ao��sI{$W��$}(�2?3)�uo�T��f-��5�דq=w���4�]uuJ1~$#�"SЇ,+��[�0��e��*���M���M~PJ��I3)�=�7Ѓu��+���^`�&�&�Q�pDm۬G��P*T"E�d�k'�t���h�����m}�����l�U�Z��`R����Q��grԨ(�;�g�~S�DXmܣ���
����ŎM�U�#��X_�ɫ�6q��Lg�`�:�)�{�8Ċ������p0Q��F�a�ʞ��g�!ly�qⲈf��>YY��c4���[��ק�	�Of���EkB �3�O���1q�Tr��+7}a��\��Ŋ��YL?>f��4{2&fT�,�ٜ�k'�������N,�w�X%�W,m�����F*�SC��g��<�;�C*<�b[�������m�W�߶�Cy�����R���*Z�N�����cTI����*�����|�~|���޶=&��T8��p�v&�*�F��s�࿼Jb��	{���F�Ks_?�"�����׿�d;{��l"nH��s�d�&�?_Ĺh\o��ǋ#� ��"���oqiΫG�Awl��c#���خw8� �h��X���.:���Y�V��%�<�T���7a)(
db��v<��=ێ�_t|�>���m�gJ/��Dk�� ��;/è�����&"�����E:R�����*�NukQ�E6o�uT%R�&)I!�mu{{��T{�yCΒ>�B�ո� x]����}��]�sv+R����R�N^d�1�S��9nI{�x��Q�z��i^�|�Te��}�Vj"��J�6Һ�.=u��_��Wl�G� ����<ؿl`{|DR��t.�`{��� �A`{�	� �<=Q�ܽ�A,��<��/̃��l�D�^�I� �ȃ���
yKv^!bɮ�{*�L�҉�0&�*0o�oj��XF��&��e����%J����.#���V�LrG�j��g5����I���a��]����w����R���� �c���8��8�c)�N,O����I���${	�'N�XJpD�f�������8�̿y�r��	Ӄw1	x�{�f_�dC*g­�_���U�B�/����I��]9�S���2��9�rH�����ٳ�	NO9y��C��׿�G$+�#l��/���ߥw��&fU��ʧ�߼y��X^�         '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
]         4   x�3��	�2����2�H,.�/�2���q�2Ӿ\f�~�\1z\\\ �
v         �   x�m�M
�0�s��L���p�Е���oL����'��)�{,��w\��~<L�\H�+7��\��9�N�_�y�t0���s��A�NJ�K`O��C�d������}�ᰩǢ��)uF͵~�3g�ܲo�d��mr������l����k��=8��a4m�}b���         '   x�3�I�KO-\F��@F6�1�wb^yfW� ��	e         m   x�3�tJLI�S-N�H�4�2��I�MJLOTH�M-��+I� 
s:�E��Ss�sBRsK|3�&X��Tl�j�wbyb1�~�Hi^Vb^:P�~�i����� rA�         Q   x�3�tJ�K/�K�SHI��O,I,U�I, �%�q�rq� �ٙ
�y��I u@Qc�м��l$A��t�Ң��t� ��         �   x�M�M
�0�יS�	�z�@)%]���)5��%?���N�����U�o4��L-ML.��Q��QA�ч�F	�8J�2�k�.�z���}�ք�>��vɢ��%ek��a�}.~A��/Tऺ��d!�?zTF����� >:�9         g   x����NL*-H,I�S�IMJ��4�2GH�KIM�I�KJ�qz�$*8g椦��L�T�AT�@T���H�B�BqC.#�:d!C4!�!9�%�y@�=... �H5`         \  x�M��n�8���S�	��^�P���f6L,��ElA�~��r:��G�E������&�I��>��x2�&S�w�ܼ;����zpa��r�u�|�ǿ7Y�
�-���w�����b�Cc�[�
���.s++!��A�^����ͅ{𺘛g����N�B=w�:Ri^t]<�2�n�U]�͛]\h7��yѠ�ɜa�e�9��ҋ�)��M��* ;�=�/̏� {��y
�2��pT8�t�4k���7Gh̳�&ǟ�1�xrײ�<�+�RH��bW�M�����vn^l7��0�1��4�v��"K V��ζ� `T@��!�FF���Z~�R�Xɉ�Kz�C�)��&[�.{�.�r��<w9��@�hEW!�0HϖWJ�U��6g;��K�ؘ��P�a%'�������H�R�Dad��`Vz��s��� �R�߸NO&���Dbš�pѾ�� P��A"@���+���?	i���-S$C�~�W)l�Z�1ذ�H�BTn��V��I4~{	Ѯw�ߩX8(��=��B�ũI��fZT�t�O��d������E��ol̀��2�.q�-6k��2�d�1�es�Tհ���Y��q>~�n�g��O,H����V�̜��y���Փ�6�e���{�Y����_�C]�,�fO`q���Fb��Fj̓]�n�Rs2����I����)x�C H��J�:4��	�u�������\ܶS�ߨH̥�aD����\L��t;A�_��WVaTH��nE���G��'�.LZw��E\4���Jg�����Z^��lN�0i�p_�1l_�⇉
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�          �   x�m�э!D���k '{LWA�����D�.c?��\�����I� ��F���|H0��vv��&	Y�)�I��۔x&g�%�n�Yj��b�v��F�Z�l@��2�r ��eg�j��0��C9�\<)O���kdiT��a|_K�(2��_T�\������*?kEz_����|�ǔ���^SR���J�FoRH��{�%��:���U�	�ߣ���Ň���b'�CF��U��%>c���7��      "   �   x�U��� D��c�����)���f(��d�lv���c�7Vxc=�]��9�z%v��[��1���LB$kgA6Jo�0���1nbe�D�u���atuXŧ; ����V���2�!�f���<�Ϥ��1Gd4��EyZ�T�7�myj���ߵ��� �/+6z;      $   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      %   2   x�3�LLNN-(IM�2���SHJ,I�P0�2Bp�L8�R�R�A�b���� �q�      (   O  x��T�n�0<k�����_W#@k�t(�K.+��iJ�@�(ܯ�R�]Ul� -|����ݝ!-�\Z_�3� +���Ri��`xn���e��S�W=}�քww�Ds?�|̿牀t*y�������度�*o*v�X7qk�=�[��b�k��@Z��8����[v��C����1��r�D��y�fZv�R7C����b�AhC������}!��-���^�ZI��!˩)�����]f��*��t&��Na��w ��X��Ks���InQ>������I
���C�>%DN_9&�}���]@fQ4/!���y������Ў3r�臕{gU�)�,�-TRXM�^ _�T�^\t'N��$K��J�qʅn���B��M@��[^�T���΃F��-_H�\8�g�"��n^���Z��3cB�3ֲR�ʰ^��Rb�N�����6h��mM���Z۳�]���p����d���1Nu������9�|J���*"~
i��PEt��sH���tא.�EA�/�"��.h�uT� �MsXGc
Y��X@&���4*� ˒o��jt�=��7�$O���	 ~�Ua     