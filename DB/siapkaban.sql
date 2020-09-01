PGDMP     !    &                 x         
   siapkaban2    12.3    12.3 �    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            .           1262    19143 
   siapkaban2    DATABASE     h   CREATE DATABASE siapkaban2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE siapkaban2;
                postgres    false            �            1259    19144    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false            �            1259    19146    account    TABLE        CREATE TABLE public.account (
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
       public         heap    postgres    false    202            �            1259    19153    data_perusahaan_id_seq    SEQUENCE        CREATE SEQUENCE public.data_perusahaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.data_perusahaan_id_seq;
       public          postgres    false            �            1259    19155    data_perusahaan    TABLE     $  CREATE TABLE public.data_perusahaan (
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
       public         heap    postgres    false    204            �            1259    19162    data_pribadi_id_seq    SEQUENCE     |   CREATE SEQUENCE public.data_pribadi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.data_pribadi_id_seq;
       public          postgres    false            �            1259    19164    data_pribadi    TABLE     �  CREATE TABLE public.data_pribadi (
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
       public         heap    postgres    false    206            �            1259    19171    dokumen    TABLE     �   CREATE TABLE public.dokumen (
    id integer NOT NULL,
    nama_dokumen character varying(255),
    path character varying(255),
    jenis_dokumen integer,
    pemohon integer,
    status integer,
    layanan integer
);
    DROP TABLE public.dokumen;
       public         heap    postgres    false            �            1259    19177    dokumen_proses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dokumen_proses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.dokumen_proses_id_seq;
       public          postgres    false    208            /           0    0    dokumen_proses_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.dokumen_proses_id_seq OWNED BY public.dokumen.id;
          public          postgres    false    209            �            1259    19179    jenis_dokumen    TABLE     �   CREATE TABLE public.jenis_dokumen (
    id integer NOT NULL,
    keterangan character varying(255),
    id_sub_jenis_layanan integer,
    deskripsi_dokumen character varying(255),
    role integer,
    status integer
);
 !   DROP TABLE public.jenis_dokumen;
       public         heap    postgres    false            �            1259    19185    jenis_dokumen_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_dokumen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_dokumen_id_seq;
       public          postgres    false    210            0           0    0    jenis_dokumen_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.jenis_dokumen_id_seq OWNED BY public.jenis_dokumen.id;
          public          postgres    false    211            �            1259    19187    jenis_pengelola_id_seq    SEQUENCE        CREATE SEQUENCE public.jenis_pengelola_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.jenis_pengelola_id_seq;
       public          postgres    false            �            1259    19189    jenis_fasilitas    TABLE     �   CREATE TABLE public.jenis_fasilitas (
    id integer DEFAULT nextval('public.jenis_pengelola_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 #   DROP TABLE public.jenis_fasilitas;
       public         heap    postgres    false    212            �            1259    19193    m_identitas_id_seq    SEQUENCE     {   CREATE SEQUENCE public.m_identitas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.m_identitas_id_seq;
       public          postgres    false            �            1259    19195    jenis_identitas    TABLE     �   CREATE TABLE public.jenis_identitas (
    id integer DEFAULT nextval('public.m_identitas_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 #   DROP TABLE public.jenis_identitas;
       public         heap    postgres    false    214            �            1259    19199    jenis_layanan_id_seq1    SEQUENCE     ~   CREATE SEQUENCE public.jenis_layanan_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.jenis_layanan_id_seq1;
       public          postgres    false            �            1259    19201    jenis_layanan    TABLE     "  CREATE TABLE public.jenis_layanan (
    id integer DEFAULT nextval('public.jenis_layanan_id_seq1'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer,
    id_jenis_fasilitas integer,
    id_jenis_pengelola integer,
    id_jenis_penimbunan integer
);
 !   DROP TABLE public.jenis_layanan;
       public         heap    postgres    false    216            �            1259    19205    jenis_layanan_id_seq    SEQUENCE     }   CREATE SEQUENCE public.jenis_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jenis_layanan_id_seq;
       public          postgres    false            �            1259    19514    jenis_lokasi    TABLE     e   CREATE TABLE public.jenis_lokasi (
    id integer NOT NULL,
    keterangan character varying(255)
);
     DROP TABLE public.jenis_lokasi;
       public         heap    postgres    false            �            1259    19512    jenis_lokasi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_lokasi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.jenis_lokasi_id_seq;
       public          postgres    false    235            1           0    0    jenis_lokasi_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.jenis_lokasi_id_seq OWNED BY public.jenis_lokasi.id;
          public          postgres    false    234            �            1259    19207    jenis_pengelola_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.jenis_pengelola_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_pengelola_id_seq1;
       public          postgres    false            �            1259    19209    jenis_pengelola    TABLE     �   CREATE TABLE public.jenis_pengelola (
    id integer DEFAULT nextval('public.jenis_pengelola_id_seq1'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 #   DROP TABLE public.jenis_pengelola;
       public         heap    postgres    false    219            �            1259    19213    jenis_penimbunan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_penimbunan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_penimbunan_id_seq;
       public          postgres    false            �            1259    19215    jenis_penimbunan    TABLE     �   CREATE TABLE public.jenis_penimbunan (
    id integer DEFAULT nextval('public.jenis_penimbunan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_perusahaan integer
);
 $   DROP TABLE public.jenis_penimbunan;
       public         heap    postgres    false    221            �            1259    19219    jenis_perusahaan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jenis_perusahaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jenis_perusahaan_id_seq;
       public          postgres    false            �            1259    19221    jenis_perusahaan    TABLE     �   CREATE TABLE public.jenis_perusahaan (
    id integer DEFAULT nextval('public.jenis_perusahaan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
 $   DROP TABLE public.jenis_perusahaan;
       public         heap    postgres    false    223            �            1259    19527 	   kabupaten    TABLE     x   CREATE TABLE public.kabupaten (
    id integer NOT NULL,
    keterangan character varying(255),
    j_lokasi integer
);
    DROP TABLE public.kabupaten;
       public         heap    postgres    false            �            1259    19525    kabupaten_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kabupaten_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kabupaten_id_seq;
       public          postgres    false    237            2           0    0    kabupaten_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.kabupaten_id_seq OWNED BY public.kabupaten.id;
          public          postgres    false    236            �            1259    19540 	   kecamatan    TABLE     y   CREATE TABLE public.kecamatan (
    id integer NOT NULL,
    keterangan character varying(225),
    kabupaten integer
);
    DROP TABLE public.kecamatan;
       public         heap    postgres    false            �            1259    19538    kecamatan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kecamatan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kecamatan_id_seq;
       public          postgres    false    239            3           0    0    kecamatan_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.kecamatan_id_seq OWNED BY public.kecamatan.id;
          public          postgres    false    238            �            1259    19225    layanan    TABLE     �  CREATE TABLE public.layanan (
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
       public         heap    postgres    false    218            �            1259    19229    role_id_seq    SEQUENCE     t   CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false            �            1259    19231    role    TABLE     �   CREATE TABLE public.role (
    id integer DEFAULT nextval('public.role_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.role;
       public         heap    postgres    false    226            �            1259    19235    status_id_seq    SEQUENCE     v   CREATE SEQUENCE public.status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public          postgres    false            �            1259    19237    status    TABLE     �   CREATE TABLE public.status (
    id integer DEFAULT nextval('public.status_id_seq'::regclass) NOT NULL,
    keterangan character varying(255)
);
    DROP TABLE public.status;
       public         heap    postgres    false    228            �            1259    19439    status_layanan    TABLE     g   CREATE TABLE public.status_layanan (
    id integer NOT NULL,
    keterangan character varying(255)
);
 "   DROP TABLE public.status_layanan;
       public         heap    postgres    false            �            1259    19437    status_layanan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.status_layanan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.status_layanan_id_seq;
       public          postgres    false    233            4           0    0    status_layanan_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.status_layanan_id_seq OWNED BY public.status_layanan.id;
          public          postgres    false    232            �            1259    19241    sub_jenis_layanan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_jenis_layanan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.sub_jenis_layanan_id_seq;
       public          postgres    false            �            1259    19243    sub_jenis_layanan    TABLE     �   CREATE TABLE public.sub_jenis_layanan (
    id integer DEFAULT nextval('public.sub_jenis_layanan_id_seq'::regclass) NOT NULL,
    keterangan character varying(255),
    id_jenis_layanan integer
);
 %   DROP TABLE public.sub_jenis_layanan;
       public         heap    postgres    false    230            3           2604    19247 
   dokumen id    DEFAULT     o   ALTER TABLE ONLY public.dokumen ALTER COLUMN id SET DEFAULT nextval('public.dokumen_proses_id_seq'::regclass);
 9   ALTER TABLE public.dokumen ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            4           2604    19248    jenis_dokumen id    DEFAULT     t   ALTER TABLE ONLY public.jenis_dokumen ALTER COLUMN id SET DEFAULT nextval('public.jenis_dokumen_id_seq'::regclass);
 ?   ALTER TABLE public.jenis_dokumen ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210            @           2604    19517    jenis_lokasi id    DEFAULT     r   ALTER TABLE ONLY public.jenis_lokasi ALTER COLUMN id SET DEFAULT nextval('public.jenis_lokasi_id_seq'::regclass);
 >   ALTER TABLE public.jenis_lokasi ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            A           2604    19530    kabupaten id    DEFAULT     l   ALTER TABLE ONLY public.kabupaten ALTER COLUMN id SET DEFAULT nextval('public.kabupaten_id_seq'::regclass);
 ;   ALTER TABLE public.kabupaten ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237            B           2604    19543    kecamatan id    DEFAULT     l   ALTER TABLE ONLY public.kecamatan ALTER COLUMN id SET DEFAULT nextval('public.kecamatan_id_seq'::regclass);
 ;   ALTER TABLE public.kecamatan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239            ?           2604    19442    status_layanan id    DEFAULT     v   ALTER TABLE ONLY public.status_layanan ALTER COLUMN id SET DEFAULT nextval('public.status_layanan_id_seq'::regclass);
 @   ALTER TABLE public.status_layanan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233                      0    19146    account 
   TABLE DATA           j   COPY public.account (id, username, password, role, status, d_perusahaan, d_pribadi, j_lokasi) FROM stdin;
    public          postgres    false    203   خ                 0    19155    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab, kecamatan, kabupaten) FROM stdin;
    public          postgres    false    205   ȹ                 0    19164    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    207   &�       	          0    19171    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    208   �                0    19179    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    210   �                0    19189    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    213   1                0    19195    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    215   h                0    19201    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    217   �      $          0    19514    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    235   j                0    19209    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    220   �                0    19215    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    222                   0    19221    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    224   v      &          0    19527 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    237          (          0    19540 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    239   �                 0    19225    layanan 
   TABLE DATA           �   COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal) FROM stdin;
    public          postgres    false    225   �$                0    19231    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    227   N%                0    19237    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    229   �%      "          0    19439    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    233   &                 0    19243    sub_jenis_layanan 
   TABLE DATA           M   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan) FROM stdin;
    public          postgres    false    231   K&      5           0    0    data_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 364, true);
          public          postgres    false    204            6           0    0    data_pribadi_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 290, true);
          public          postgres    false    206            7           0    0    dokumen_proses_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 69, true);
          public          postgres    false    209            8           0    0    jenis_dokumen_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 302, true);
          public          postgres    false    211            9           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 15, true);
          public          postgres    false    218            :           0    0    jenis_layanan_id_seq1    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_layanan_id_seq1', 28, true);
          public          postgres    false    216            ;           0    0    jenis_lokasi_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.jenis_lokasi_id_seq', 2, true);
          public          postgres    false    234            <           0    0    jenis_pengelola_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq', 2, true);
          public          postgres    false    212            =           0    0    jenis_pengelola_id_seq1    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq1', 6, true);
          public          postgres    false    219            >           0    0    jenis_penimbunan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_penimbunan_id_seq', 1, false);
          public          postgres    false    221            ?           0    0    jenis_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_perusahaan_id_seq', 1, false);
          public          postgres    false    223            @           0    0    kabupaten_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.kabupaten_id_seq', 8, true);
          public          postgres    false    236            A           0    0    kecamatan_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.kecamatan_id_seq', 155, true);
          public          postgres    false    238            B           0    0    m_identitas_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.m_identitas_id_seq', 6, true);
          public          postgres    false    214            C           0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    226            D           0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 1, false);
          public          postgres    false    228            E           0    0    status_layanan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.status_layanan_id_seq', 1, false);
          public          postgres    false    232            F           0    0    sub_jenis_layanan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sub_jenis_layanan_id_seq', 40, true);
          public          postgres    false    230            G           0    0    user_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.user_id_seq', 286, true);
          public          postgres    false    202            D           2606    19250    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    203            F           2606    19252 $   data_perusahaan data_perusahaan_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_pkey;
       public            postgres    false    205            H           2606    19254    data_pribadi data_pribadi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_pkey;
       public            postgres    false    207            J           2606    19256     jenis_dokumen jenis_dokumen_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_pkey;
       public            postgres    false    210            L           2606    19258 $   jenis_fasilitas jenis_fasilitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_pkey;
       public            postgres    false    213            N           2606    19260 $   jenis_identitas jenis_identitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_identitas
    ADD CONSTRAINT jenis_identitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_identitas DROP CONSTRAINT jenis_identitas_pkey;
       public            postgres    false    215            P           2606    19262     jenis_layanan jenis_layanan_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_pkey;
       public            postgres    false    217            d           2606    19519    jenis_lokasi jenis_lokasi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.jenis_lokasi
    ADD CONSTRAINT jenis_lokasi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.jenis_lokasi DROP CONSTRAINT jenis_lokasi_pkey;
       public            postgres    false    235            R           2606    19264 $   jenis_pengelola jenis_pengelola_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_pkey;
       public            postgres    false    220            T           2606    19266 &   jenis_penimbunan jenis_penimbunan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_pkey;
       public            postgres    false    222            V           2606    19268 &   jenis_perusahaan jenis_perusahaan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_perusahaan
    ADD CONSTRAINT jenis_perusahaan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_perusahaan DROP CONSTRAINT jenis_perusahaan_pkey;
       public            postgres    false    224            f           2606    19532    kabupaten kabupaten_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_pkey;
       public            postgres    false    237            h           2606    19545    kecamatan kecamatan_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_pkey;
       public            postgres    false    239            X           2606    19270    layanan layanan_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pkey;
       public            postgres    false    225            \           2606    19272    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    227            b           2606    19444 "   status_layanan status_layanan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.status_layanan
    ADD CONSTRAINT status_layanan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.status_layanan DROP CONSTRAINT status_layanan_pkey;
       public            postgres    false    233            ^           2606    19274    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    229            `           2606    19276 (   sub_jenis_layanan sub_jenis_layanan_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pkey;
       public            postgres    false    231            Z           2606    19460    layanan u_key 
   CONSTRAINT     I   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT u_key UNIQUE (nomor);
 7   ALTER TABLE ONLY public.layanan DROP CONSTRAINT u_key;
       public            postgres    false    225            i           2606    19277 !   account account_d_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_perusahaan_fkey FOREIGN KEY (d_perusahaan) REFERENCES public.data_perusahaan(id);
 K   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_perusahaan_fkey;
       public          postgres    false    3142    203    205            j           2606    19282    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_pribadi_fkey FOREIGN KEY (d_pribadi) REFERENCES public.data_pribadi(id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_pribadi_fkey;
       public          postgres    false    203    3144    207            m           2606    19520    account account_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.account DROP CONSTRAINT account_j_lokasi_fkey;
       public          postgres    false    203    3172    235            k           2606    19287    account account_role_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 C   ALTER TABLE ONLY public.account DROP CONSTRAINT account_role_fkey;
       public          postgres    false    3164    203    227            l           2606    19292    account account_status_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT account_status_fkey;
       public          postgres    false    203    229    3166            n           2606    19297 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    224    205    3158            q           2606    19565 .   data_perusahaan data_perusahaan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kabupaten_fkey;
       public          postgres    false    237    3174    205            p           2606    19560 .   data_perusahaan data_perusahaan_kecamatan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kecamatan_fkey FOREIGN KEY (kecamatan) REFERENCES public.kecamatan(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kecamatan_fkey;
       public          postgres    false    239    3176    205            o           2606    19302 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    229    3166    205            r           2606    19307 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    207    3150    215            u           2606    19450    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    208    3160    225            s           2606    19312 )   dokumen dokumen_proses_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_proses_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 S   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_proses_jenis_dokumen_fkey;
       public          postgres    false    3146    210    208            t           2606    19317 #   dokumen dokumen_proses_pemohon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_proses_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 M   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_proses_pemohon_fkey;
       public          postgres    false    203    208    3140            v           2606    19570 %   jenis_dokumen jenis_dokumen_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_role_fkey;
       public          postgres    false    3164    227    210            w           2606    19322 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    213    3158    224            x           2606    19327 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    3148    217    213            y           2606    19332 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    220    3154    217            z           2606    19337 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    3156    222    217            {           2606    19342 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    224    3158    217            |           2606    19347 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    224    3158    220            }           2606    19352 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    3158    224    222            �           2606    19533 !   kabupaten kabupaten_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 K   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_j_lokasi_fkey;
       public          postgres    false    237    3172    235            �           2606    19546 "   kecamatan kecamatan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 L   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_kabupaten_fkey;
       public          postgres    false    239    3174    237            �           2606    19555    layanan layanan_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_lokasi_fkey;
       public          postgres    false    3172    225    235                       2606    19404    layanan layanan_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemohon_fkey;
       public          postgres    false    3140    203    225            ~           2606    19382     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    231    225    3168            �           2606    19445    layanan layanan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_status_fkey FOREIGN KEY (status) REFERENCES public.status_layanan(id);
 E   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_status_fkey;
       public          postgres    false    3170    233    225            �           2606    19387 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    3152    217    231               �
  x���O�f7����*H;�ݠJS	��D���h5��С�@��؏��o=q�l���uN�c;��>��R�?������)�����o���ב~|��w_|��'�=��ݣу.n��*��^�L�=@���7߿��Wġh�47�Z��`Q�"{o��@-�~S���|Yo=4N"��+Bt�3�A-3�"�$;n>t���kWq		����4���XC�*���x�K�+%�jY�=��q�of�K�!h��پ�e%�,[���!�����Q-1 �q�6,��-[�b%�Ġ�<7̳lV��d�O���`�\T��+��%�����u��K�
��U}Zv-�%�WYl:�fVa�g �y����ML�*��!. �(a-�$�4��8;� �������]��İ4 �F�%a��RY���A}�AXA��NzH}�K�r7��|�㜗�e%�t�Y���W-1�ՂA�i���b��)y������	/.�ٰ�2kBg^�}C���m��l�� ,+a	*�pc;9� ,�0Ci��ذ²֊D��I��!a�����^�AXjI��%a��Y�^��;� ,�0q)�G�AX��U	���KJXU0]�&�j �1�Sc�o��åc���bM,FVrg;L5 Kd��E�߸q��%P��[��O?��,��;~ؾ��gqD2uϞ�T�X-�Hzb⡻][j���X%��h��j1���"X˲k�u�K�b�YU[����"Xk�d���m������Ylر��`-K�5>9�ָ۞���.5X�6H��ڵr��udu�v���k\f�<y�S�g�P~D�5N�����5�P��}7�5���|z2�����Vr�LG�q/�������b�w�5R�J�R� 21X�f^R�훜�kT-Qjr�Y�xk{6�Q��R�Y�x/�S�Q-���e�JbhТ��:��ZbpFq�u���20#6P� %߁2� ����-U(��y�>�g�����[M'�X[�[AY|��ӣͪ�m��\��Ѕ�V�I���M�նrki�i�+L-��ښ������t��-�O�R���]�P�JrT)x� K7�*+#� �)m*8#d���Y��BE[�b8��t�.Գ5I:�<���]�f��;�[��[(Բp]����R�	�l�,����:�d�X����4|^����G�?}��?���/?�/?���ۿ|�>�G�_�/�-�$�����������~W�/�|����~�ʏ*�Q�-��.k-�K"�l��j�נE����tRM^�`4�n�"����9k?��m��n�EE��`�|�9-��PS��y��`-�[��7A)��6�Ҫw��v���tѝׅk:Q8��7m����my$Q/-k�VϷ�"'�+��/� t�V��U�9�v��6|!���]}�u�������\�0�"x����\u�v����Z��Ⱥ�
��\�8tjhx�Y���18�}N�D�+W=[�P���豫\�bM���i�N�����UbE���-?���^���K�h���4�x��$���xd�< �el��d��Y'���U$�n�)�������j�}���N����nP�i;��}+Uu1VТ�W������-�甀��>�5�8U=ߐ<���\X��f�N���%�Q�5k�v볰˱����Y8"k(��B_Gp��*9���Tk("�����j�Fyڦ3�`�FP3�Z!�Λ����s>Z9�5t�2JG>�`�ƃe��]c����l�۵0�`]	��y�.5XC�H��Er���`�)�)_:���=1X�хe$ey��-5X���2��'.5X�� [v�L��
�@�G)�D���%i�\�G��6����w�A�uu��~����h�9���|3M�Ġ,�9�g���f����1C��"����0�@�E�BFy�¢�L��%vXN ̞V�p��sa�b��_�-$�S3�~�M	x�-K_����;FaxF�ɞ[Ǜ����K���o�A�x<����!aiܘ-�A�$�S��a���!ax�˙����,^#�>k,;�0{�������~�2���0�M�S�AX�S\<��%a6 �a��%a�C�).���سlfl��1���e�� ��<�,�5�g�@�͛�Is�a��a��ۤh�A:�]k����c�A�M�HѢ�{(��%�+���8�0�hB�v���0�,�\t�*�h��L6ťO�������1��b��� �&ג��{-~*c�ɾ9�޳�Od�z:�'���k�I�~9����#��2���x���!�td��Tf�A�oax/�EO���IT��3�C�,ڠGbfӷY��s�#a6�+��;\-v,^�A9��F�αx�}��9�TǄb��f?�� ��u6Z�t�A���K��I���6�PC�e�g�	Mz�Gc9ɶٴĀ�H��Gus�KHЧ<i.����}z,^��6�Yb@�N�$4ŗ�,1 icȰr�ܒKHz�GU=7��nɺ>�{"�#�[ߵ9�tI����Fs�A��h�=��l�c����v�t�A:�"G�iG��W���mF���V�Ya�H�"�#V°��j�OF��W�]7~��1�Rѭض����[�֭/��un.�%Ɵ�Y�����v���%�?���9�%��Q����"�a�z,�\������І��H������1��� ��LY{,�0��~���J�W����h���            x��}�v�H��3�+�Tm�EQ��}ި�mY��U�^��0�Hإ~��?�/��d� HQ�s��ӧ�,Y���Ȉ;"�dp����e�K����Xg�<u�(�X�}~�G��G"�F���F#�u��t������̝�2]�7V�gҥs�ݥ��9ϗټX��ˑsY���u��9�C�:�O~I�5��2Ǐ�#��]��/��ֳ�e����O�;�59��ԩֻj�,�5��j��׷'N������T�"�N��DF����<?˶λ������<<1�pɐ�$���z�ܧϩ3�JX��G����9�;t.�-|�n�oS�</�t;�>���f�m�]�|^�Oe:O��S��>�>��'nplV��������������0�#�^�m1�J�H��ߜO��	ǿ�g���q��9��z��nԫ/�ٶ(�s{��w5$QT P A��$@���O��e�.R�薐�ȳ���pr�*�n��|�����@i�uZf�Ҟ��|��~�>��{�A9�`�%|Q�����~�2u�e���y�:}�]��;E'B�(�y������6ہ���D�
#9J�x����������=��vuu�-��3��tB�����c��:���ӿ	z>�l���Ge��$e`ܠ%NN�k�`Dg���m�;����NwUi��H�������b7�ݐb
w����)��ߣ��EsvCo�,�#��ɤs��)�b�M��.},�i�+�� ��#$��D��]V�!2r�4R�UK�)�T�Ҹ����SuFg�7�-�´#Z��,� sq=rQ.����O\S=��_���|m��*	�\02�x��cֵ���sV���S2���x]'�<�u6a��R��Fl���Y�+Ф���΢|,��*��1[.���{(�w��҄.I��-��bYT嶵�;�DGo@#
� 8��s���o+���j���.6`�@,�+}���h^FG��z|��@G���v�/I$�ֺ��@e���!�@/��2s>��̐�����Q�ם�4Q�����4��]���RġeH�|Kg9�qO�-�@3-i��AU��s�LAܩ�`A���D.r��e�r���60Y�
N�}�B#?7�ϔI8J�����E�yưg�.���$�ӳs< �'�a ����r�!-�g�(۴0 ���7� �Lb��n��=�0V��X�p�-W_ص�c".�J���LI+BQδ ;����~����`�����u��Ҏ9��J��ʍXZ�m��@qh���j�-��L ��Y�s.��½�g%�4�W��e�������ӧ�]n�~�`�B?&m
�=W�A�'�E?/�ٮ ﲲ��p��v�b�P��H��:��`����Ç�uop7��8�o�m�&�)�}���>
���)�d3�p4�G����~$xC���w�sC�t�@����?Gw6�;"�!!��c!^ĩ
2�Z�u�կ"�գ���2�9�rv)G�]��Dp"MSF��:u~����E� >�!�A��`�B)S�}
��[GIH�:[g�.�:w�0�p��j��b� Bg鋨u��ߗ}n���Wk}�_��@F�Z;g��/���;��|=�AaDx&�}ϸU�����OY�j_�������h�\L�iԳ����#faΑž�t��`8a�d�ዖM��p�A��m� !j5Ox��G�D�Y S�̢�ԉu���4�}i!mS��o��c#�>
�����3 XD����(���{ �V��_��Bx]_b������J��cI]ۃ��^���� �#��UQ:�Q��m�����'X��8m�j�G�?O3�Uc����{椆 �!z��Oc$Z\i$r}�w��Yu`��8e��� �D��M?�'��aU��cfƑa�x1��I�D��'*���u	?�CR�����	�3 g�� �9_�r93��'�a�Q�/��U�Tԁ�"lm�#�u�#�\�<�� �3@��,�| ��|�
ݍ[�.؈�TKD����а��Y��22�m����6;��Q'v��#9��|S|]f��C,T,�W�#���f����[7%�G���XJ��;?�42�n���3r}�^C��4��'骚�`/���3۾��7�]�����NWt�7�*������N���j���c�V/���A,x����R���� ��<�������Ӯ�
9�E�{�_� h�ӎ/N,m��O�t�̶[�.�d3+��K�����1�x�7kr�LC��I�s�6�;bX*�ת�B��*��!������brޓ

&�Vu"X*�!@q��J����mQ-gd�nF��O�����7d"�H`�����T��R�xO���NEs����K����` B���b*y��@Clųǃ 1��?y�TP���S��l�	S��t�V���k �o�w7TG��j&<�C�����!]�t-[���,'���_N��Cδm��7�n-Ǝ�bB _���GQ�e�$tE�V?��)%��,���k}�=��K���$��{��(l�} �n-��[�"���K�����=��Zm�����l�4��|�� ����G!VF���;���\��x]���.�!]�Ζ�x�}ѭޕq#aB�}<-�����������Vg֥hL��4���ĨA�v��ΕR��?�i�l�%��F֨S�̛����Ѩ�\r����*[os,���;��;�ꗫ��d�b	�>��!���G�MO��alR�{�`Ђ�~�,��D
�H^�w�o�s�M����X�b�<�}�����~�|��a��]��s����������z���|h����?��;J�/Pm¨Gm�i`��x��.;Ք�轏��N�]���) w�Ӿ+����Y�.��!m
���PvQ��:�_��#Y	A)�>h�2 �u"��@�B9vYW�L���c��*������$@H���m����K��7��¶���B����S��-�x�2��ve�G/��-�'u	D��\���46���G�m�#�Y������^�i D�*e!���;&!�r�.���"]gR BW.�]yq�Ϟq�w^͈Ձk�6)�F�g�Q�V�|U#T����3�s�OT�k��
��1�r�	9�1V<s��Hp �
EJ�	-�4�eVQ\��*��K��+����cO�Q�I��ra�w����gN�&B�$BLB���8}C�]I'EsvN�5����GI�y���/�:ۧ,�</t�i"̺�~H����6m�0�w���Z�VC� ��8��E���H\�q��P.s{J|�K$:8����n�΅ �����Pl��bQ�*_�B�'�ܓ���2+�L�ܤ�^u�1"�K�;�R�,�|�3�_.f�,(�!�N�ehq�� 3~{w� g����[��;��1_<+��)6R.��|���DYu�Rn@$l�20Q��֠Ǩ6� kક�=_�T5|�W?*��ʏ�@��e�krخv��͊�P����p��OΝ_!�'<6����	h���w�W�QO3�'�4�����qR�:x�yឹp��\ִ�V����@�fW������q�R/Tb����l�<�#P�eQ�'b��x��L��8B}��#�{���g"\��6��)f���4��I\��~����u��W��<li�b<�Լ��u�>V�U�|������)�_���5[�OD��,4��A�_��E�H����y=���l7���>���Jڝ�����5¯n�e�GP%,n��lɌ/
h�����+��iQ}L _â`L��\;��"lS�ʄ�����k��Z�!p6C����$���^��\�}���$
�I�� p	�(#��},�!'S�Mt�|��]W�k�u���'�!��T����kU��]?-Ց��.���~[x�ul�����`��U��B    ����0VSDj醧�:P��3/����6���q���#ܫ�MBF�������z<dC`�d���u�2�M!��N������Cg�p|�z��h�M2��bo�M�vf��<e�|�.k�S�C�,�
³�b�bB��Q��������.�C�:�ճ��5��՟���)�+^$��e3���ѹ{BdeT�$kEӵ���l��g������Z��-{�{����Ę���~��z����U	ǡ�⚺����l�;�']��m9I�V[��I� $��5,��ˏ���e +
&g����lr�t+�Y�����{�R�J�Q�s��g�z%bH��aH�a;�6vm��������U�矄��kw�6���M�ЬH���']-ܶ��@�c]�MR<��^�����xRP��=҇��58Դn=�����/�UW�]����Txi3n�T`2Lx��J���:x�nm�i��^¿Yϊr��w��L='�zN0��Hů]��k1cjoyѵu=�n��֜}H�` �D��2��b�,���-��f����B�_ k,���^�W�Un�f��T�&�6u��@��_}���x����hO�GD�Ĕ�<�XJ��F%���M��p��=��F=������a�s��o��w.�,'.�<�ˇ3F�zN#]�p`W��0H��j����zD࿿P������f]�t�YɌئ,�)��0����PBGp=Ʈ@��ȷ���ﮩĿ6���/l��=&a�%a)y��4�ó%�D�m�L0�H�C���š}�j�n��~����7�/$ٌ�j�tq]ι.��4!	�0!N����ɷ�'u~Su�`h&F����V�J�nO���	IV�rZ|����`2
@��
~�_�(�QJ����1�Mǭ-��y�0��H�P%M$�-�Ăj�[6����7r�K6����,5%�|�H3Q�kE�M�foqϣ���ZFR�`���� d\��`��?P��?���rH�	ɎOC�'�~WJ֚r�1���ny��#a&��#9�|�4���!t`�8�`Fr^��� ��n	�W���$]�|Lg���� -�)��������.}���ֻ~�^����nh;�*c�^Vm�&\��W��bgo���;�K�}	����Fz���(U`��(�v����L^�a�P�A@�%����d���]�"
��9`������˻I�$p~�4���gX�#]Qy
�TU���M~�c�{.���h������?���Օ���c��w@`���R�+�l��#�_����vY�G����Jżة��p88uU��#x�FXy�,[c�瞘DKy�m��&���iql23h]�wH���3
Fv��7�oO"Ӌ	3�z�E���	nC���,-�(W�t����(�Ba�}�p� >/]Y�_T:fPZ�N��Y���*��+�����؞jܻ�&T�tޕY�+�\����Eo�:�g�'(͸!�����,i^f\鶒lzT�ز<^��wa��n�{��c��K�σ�cZ��F2`�C��s
���#��t	�E���'P���葈�n;Odմ�/Y�_?��ޮ�+E.�\{�F~m��Bz4�]��pd�-�`*��_��f�|�Ag@���5{<�l�� �V����G��3��we�α����V���1�lSj��>3�s�(a
��D�ѽ�ŋ���G(�q����U�H���<o�R��/�`RJ'�n����y���m�$�� �~�j]���E����-��w�(ioA3��W�	�k�7��7��e�y���\�_��Q��c�E���9F������'���L�\�����<�{K�O|Wv�m�Pj_�z QwW�����/������2��ـ�җ"�����;�p��&3�����`�FĻ��՘Ui��G�(I�m��ioj�)%c�8��u����y,@p��7)\5�dV1;�'ʽ�%(%��6��KT����z�">�۹sN��]�\�W���}ۓص<?���/���
O� ��弙�j�3_V�ہ��qh3�D	�(�P��7���^��5�h�S$(��6�88.�=��`_��G�V,h%����]�kǱ��d�4�;ʃ(+��Ơg�VE�*�jö;�b�~��p���9�b��f�9����\l�E��U_��R���*��x�x���b�c�{ �Z��U����e�iօnw�P`2�T���d}-��I�r��i�^
2�LI>�c����-}�B���p%�c�l�SW!�o3{~��L�+`%�de�O�f�+����� 
��T��մl�K�l�iQ���Ϟ��}� £'�����`��M?QCҿ�r���I�e������a�� V�*4�������}ۛN�|�&�w�a�'���[���x)c#/�S����xj�]���l�&1,G2	)�������i��_�n�/
7�����H���+vvI��3�<���íݿ�h��KdZ�s5��Ig��ʕ�!�3�����c4��Ag�Nkl���]�xfʏ�\l��,��}�ƚ�񎼸8"�p8�I�ܧ�1���	�!W��e��=��6��xQ�{�O
���H������r��I��������Fh��s;iCL�X���Ű��z��1y���&H"�C�a0�q���v�s7ȸ��jD���$��v#x
��E�\9��#�S�tgKFA�*�{��)�|UN]1���5��7t�񨿁�~ܱ{�}<_�j��(��/g=d�@�ɴ=Q<h�r#�٫�b�0��'�e�d��wh[�M�fV�ǜd��h;����X]m#@2=`i�s�S�������?!WkZ��g��h� M[�>2�]�t5 �֥�EvR�iה�M[� �U�_6�eU�a�j��ʑGgV�T�4�=iZF�`��X81kq�]��K
j��5��]��t��=|y *S|���������� 2O�:������<[�h˻"c��4�F�d���lV�?t/�u��V�3�,+6j�2�n��6�)��b��jcR�{�-(HƁ\݆ub�nI�4f間'��I%�Z-Y��=iw�oB	�w��	�!����v�������|o�XUd3J7>۝���͞
��:��siܙ��zhnA#��٩�2��CX�mu��G����a����&.8�us��4>�'0pQ婱AӼ*��׷���m��x�x���M��f��ɨ둚��z�g�>���֗'J f:k�+]�T�V��mg��oSŽV��~�c�P�������,��%)��{�mN	IN�t��Ք�
>y;GX��C\����d+�GhV4l`Z!�J!�}��9�B��i^��w�N��W0�W ��Q�c�����幮J2�?cc1c8-����ߟ�y������'��#��� �=�h�0Lt��p��a�mUf��?r�C�h\N��\��ű!�\�ȶgry�C۶�3��S�F�>E�j0+�$���[�F���ۭz�ߦ�O`�l���E���� �֐WZ\r�R��f�#Î���@.�f�K��MA1�b4�s΀�z�H)s�I�-�85�&�,�ZS��<���9֋���N_-��ڋ�^އ{�;-���W�L�7ԝE���r	j�a�~��#�rʾ4vf<�B��@��ͭ���]n %U ��4�}A3�e�W�;�Zf2L���zV�bQ�:���\4��G��½7�A���jY�t�Xg�H����x�]����Z,g��1�c���E�����^2��!]�>e?���
�A8��q����D�ɮd~(��B�ߜ� �0h*㎂�
������B�챛�i�j���=�&�f�w1�!�Y�J���X��I��G�%+�����?���i �a��݅6��;���;Fx�qw�'O��X֤g��OZ��}��%��l�2���t��2�1|�穂��K�j*�Pңs��o�[���G�Ñޢn���bxe6��Lm�#���z�y�G��᠐��    �BR?v{����HF��۴Zؓ`h(	�n��sL����~�h�_�m�4�hC��K�zh��,������Kn;��?��*%�/�c�Lt�n�ؓ�z|G�{vս�Q$�v�G�]]��s��WZ�9Ch�F"�N��3��c�ϾJa����0(��Y�&7	��S�!��W�vW�G�d�8��O��|s�a���q�f�Դ EW_�3.����C&^�<T�~�� � "ȁ*�J�)�2�&�.8o~�>s�m��A��<8Nh<�� -�tY��I�0������:�.˱&6�v��3:TKN���������	�!�gi�!A���@�R���IAG��Fv0��b���{��P�÷�F�U� &2�����|2���9&c�_���,�H^�,�$>UV���;�%>��)����Uϗ�2ZG���/���,�sb��(�ܗ*j2���s�Uv�X��=���`���p0c�8Du�鑸#�T�I�vAt+��I
������C������mp�v���d��)��ن�/�k�ͬD�8�%�M�	M�	"�r4��thK����{�!���!��I�↍�7�t��9�7��t��,@Gq=w
�����
Z��<--@ �1�}vfe�Q�dj~J��{[:��p܃<9�pޚ�VݕI�QҩiKiL'xE�öC筑>l�bU�m�SZ�"�oav���x�ۏ'Y�帯�l��D�����\���
����p_�~H�/���jp>��c�]T8��5H
�0k���'>t�R�֑I���.;�/���k�����r��i�uz�C$���j���j<�
��z�"$�G���J�Dܐ�g`��Wg�{�K��.R��)�Xaʟ��w�����vj�c�>C�:��摚c�y�zﵥV�^rg��)_?Τ���^O�آ#�����4^'y%��\�K$B�<oĖ�P�SStX �1\��p�u幹�&7�)�we1���mk�dQn�dqsw�+����\5�y�~~Fn��F�K"���II��!��p�D��(p�<N��xA�fsO
�S��Vܑi�ؼ�ayYn-Tk�=-x���0 �*h}Ai��R�vU�'G$H�O��(�us# ~*�Yc�"�S4I=Z��R�V�o`RkT@�ՠ\��ث�<�6��Rz�lr��t�F��v{?�Nv�����M�!�q`��Q<�cý�A��<w��s���W�a�d��2�M� 0���Dd$c�����A��=���8D����8���ּ�V�\���&��p��-j{�;H��)�����I�X�`���G���n��b�|QA�}3��$}���ud���M��ܖ8��(A65[��ճ�(����;о<͇��J?��k�>{$���q&4l�j��`��U��ш�t��ۯ�y�UzR	�1�u�+.F���l��О��3���}j�����Ԥ���� �̄�{��#t���A��6m�C�?jw_vp1>����;�$5i͸10���H�i��(���Ǐ
���e.?�z�4�}�����_�l5х�/5�I/PK�e�q����"��G��ͲTX����T|a�2��t�:�{��q��	X��W��H��G"��8�!O2�F"x��̳�s?��Y�����K���ο�[:7�|��[�R�^�Iٔ���xu	
����1hcϬ�fc�~7u�z2�o�%7R��㋇�<�oi�ߓ��O"�]�S�AL��c�N}}�h�뒭�M�tJzQ7��ZK�~�L��zm'��l��9��c�a1f��s��W�9�$�N�����d�*�5�ba�l? \�# >4b���:s�:�e�~V�^M44A�<�IuÀ̉���Bܺ�%��E���1GV �/jcxGov>׸N����������Ϡ���!Q� nزLH�J�b�m���>6�A�{�P����Mo�ԯ�@�[�&�r{���"�0jĩ�j��v�ۼ�}�e�*�n�j�"�B��ڮ����\%��3<�k���61�b���m�.χv�Ċ���Z?�ԻQ�y�!��o1<0��r���լn���G�U[I�J��g�=!��6#�M���s[u�H�FKo�\z���`شT�����q��h��^;deɘ������g�Y��y�pۃlZQ�oz:�����f��O��/��;6�m�%��[|�{V�&��gxJti� L��m��z��c�����Q��`fZ�%>�hº����R7�J�2�$��\��%wj��-�uv���e��*�Q=�Ͻ���D5C�Pp%�P�aI�IQq��A}�c��h-�~#z��C�өƣ_ݹw��?����hz8A�U��.����A�����Z5Fg�{MG<�D{N���Y���s�d��x}��s��w~R �_��N�|��%���!�a��^,���R�:Q�j�/�耏��D��F(�Y|ݰ���X���Ƴ�/�:�c����YU�n�rA���	�dL%�-���jY|u.@�ҙ@�\�
���6�������Y%|�V�s�"kx�H�fJ���^/��K�=��E��6���Wt��ӯTP'�NH�x֓y��3������6*�W%�r�N!":�V��� /�u��8���%�(�|�9Ļ��y�6L��4��sO��~�\-7:��V�����*̲�٫�>oǝ:&��Uo���:78Ɯ��iJ���dh�%��ȥ
��F�_��In�x̧�(փF]�z��Il(�������zqf�F�eVІ�+iZ�廙r��G8h�"�;��
���p��.2f�Q캪D�5=��l&ݟ�;4��|ږ,ᾦ|�����*@Olp �Z8_rR{Ŧ��	^i|}�Ӗ��\}�j�{~����j b$��bb�Y i�����j󼤷�M�02fU�2�<U~Л&^������/�ݦ[~&o*�Ri��d&�0��в�t�nԜ�������6���3��wζۄ���U����ϝ�9���[�>ݽSJ���W��n\c��b�֞�؆KIz��b��YC�7i�6�nB0^,��W���:��~2:{�F�����p�#�#���oD��;��{c��l+続>!������É�V������!+� (��c
�m���ckޢ~j�P*G��&��Z2pg��g��e+B�	���{�'�+^�<u��J��	o����Xl5q�������
!MlTX��7t��NJ��T�|��BWO:>6�d�Z���_��I���G��n���?D<W$�(�G���K����+rG~�<l��y@����)|]�9/ꯏ�v�+ڀ
c`�ů�S~I��Ռ^������f_��G��Q{V�����K�#���6�w�m%W)�T��$q��N�5�(�_����j[���_'"<Ч؎ܞ*�m)���x�Y�\�k�w|ಐ�wK�Z�@��^l!��r[@ذ^P��3����U%�)<t�g�� �����
��yh ����S���*�G����&��������8����� w��K����3�X��X�0RG֍�H�o�}lwG�B��V(}�ݺ5%�uF����r|3��܏;����kW����ͯ����������������?q������W7��?��?=\~�`؋�K�q'{�ȘS%�w��X~�X��䅉ّB���,��zZ���6��9{K�c�\�>7~�{��Y�!i�����:.��x:.�����E��k�W��eXY6L.V��OL����I����S�f����Q�A��߁��E���Ɣ_m�za�
V�_m4U�/��V�f��Jy�I�����z!�ʰ}�엠�7ُ�ª���T��y}���ݖ���ػ���>�$����(�!
��nE�L�M�q@�3�a`����i6y��8*c,9�2�f��8��\�C�g[�����$9���U�^Oηf�˘D45`�C���}�"�.;� ����͠��EY�X���57>_Z���I;�EG=j��X�f�����a ?  ���J�n���hRW)Hu���;w��g�݉�-)�G�����ug����5���L���@�~�a�5�^Ɖ�w:�8偡�j�$?������JLݎ�f�����e:[Y�1+�ֽ�u�� 
�`��O�%!�����������O���12���]�O.�?�t~3bW�|����{~�e��b��qi�����0�lit"�zB��bc8_���;��D���=E7��f��Py,���{�|�=j{��L�ǎ�9M'��E`��uu:�ub�pOU�Ѐ�'��3f��z{�
�yqws���}ﰱ5'�A���dO����P��3�u�Óľd����S6_��r�����ysD=+;�1�D�4��y��1�ڲ�S�kY=۞� 'N�����F#���v:9z1T����j��_���i�G�&&�D�}�~,R��l~�G��Q��ئ�q�������S�/�2ף��:��8�)�A ��~��/4�.�wl�-��ӥn_�P`�xN܁Q'��R=���=�f�	Z 4\\��u�4��s�>f�8/���rV�tU�`�������.q'����� �vi��W	&?�-�����_�0�N�9��K=�	oZvd��K���}v�Dq�PCH���G	3�m��<�]��{c�-��F�q�O�-M��eȩE����T{i._�s���
g��"�ŀǭ6�`�8���sOP%¸��N�pscЀ��V��I����o�x�x��%��_���9/�j�gP������6Ð�+>����U�@I,h8d���j��á4;F�l�S�� �={"Sv��􉸬f䏷4���%�芧#��j͓j�?�qK_�Y����M,��c���ҙ[�>��Ad�҇g��շ���?I7,��{��#Q3�E�{�,l�񘢳b�yÍq2��},���C�<}Ta���\��%*�x��9���q'�25y�� ��W�0��,�)��[�g{^G��0���;j�+���X��4[<�MN��4}P�r���!��vM��(�ys}uy��a��&��mWWLk�>M���ςhƩ$�@�}X�J.x<c�Xn� ���.�_���;��<��>�x&
d/Vk�WM7�%.�ܳq��Pv*!����F�w59:�رz��QN���^e�!TH3�'Ob��m6Oi�� ����	[���躝�	F�Oσi��>8�Qd�t,�����+�]E�q����!������M��թJS�lw6Ƹ�\8��d <�?��H���3:uiޤIzB=��n!��!-��q����d��s����~m����?�w�j�t��M{�x ��(ߨ������I���=��S��{o�^��r%�js<����\�n�3-���ɣ'����<sB̍�J�ѯx�����'�M�~Q�/x"h���!z����s�հQ|C1�A�ߝ�4ԣ�_��X�zDaiD��8��|���o�Q-/"�����4��7�c�o�q���x������������ת>:m��������ܹ�>�M�}b��b�m�H�����m���e��ulXg{�DKO�^W+|��g�q���)�PҲ_�kB{��o^�fOm��$�� �W3v�	,`5\���=e��LH������i���=���"�GN
����l���)<�ǜ���=�S/�{P�:�d#04�O��l=�WL�����=f�Q��)��ǧqM{=��J��7�췜~��1�=��EhE �B�.u(Ƞ�걪��_'6�����W���V�n�$��)�͹M����y�� �z��h�W�"���5��,��H�ư*���IR}�����!����R�ea��j5��Qp�EQ���G��}Y��v0<����j+D�h]���D(�s�zq�}1�{�������]Ӂ=7fXȓhxڳ��Z%e>O�3�U{q���I-�utf aa������LO���3P�Mj��ʋGm��*P�.,h�Wu[�u���4F��U�=@�6V&^)��@O����h�m��O����X�=]���'�'h��5��9�~����޵쨞�y�m���xD��u��B�/���J��SS0TҎs�oq%�0D�>�Z~!��@wٔ��I�I����s�gPT�p��q|�e=~A�&���;��f��p[du����:�����R����`/�2Ł�(HLrh��W�^�v���x��,�����{�[
�z��	�ȃ	��� E�̱/�r�D�����WTJ�{9�D�*�� �B���K|�e��H�@�wx<��_���m���q�Z?@��⇣$�-�G,�f�ރ9�h���=;m�F=���1�Uz,O������=ts
��t�e*H3���$_؟�3�!t��r~6`�S��"t)��Z���c����&��L�iZ_P|�ED	��� ��}~~��w��CV��l�6�M�c�����Q.<	�\�'�%�s���	𪚭<���T����j�1txO�	�Ov��.7�)��;,o�l��*_.U�^��R�n��Pe\�̷�d�ico���)����^O\�<5�+�[��'��RF I �Az�_�r=�n\��i!���/4/��POD�VȲ�zj[�c	���$����S]]�Dp3pO/}���E�{�X+Z����M��'����Tbk=e�]0�V�rW_A]z5/�I��(��ٳP5{��:W5�І�"��0�� �� WS,��w��_���2ߘ�A����M=�#����hF�z�)�qVl�wד�l��_=�6��,{�<�'p�[P�y�o�sT8�~��<&�|���#L�8[�m��a)E�OŴ��G~���Gn��AU_�CZսXFq�Ϩ�6��'�?��ç LJ�獢�Ď�=?�]��za���.�-u�5�!y(��&�n�7������N�L�V��UU2x�J4�7���[�L�*{ ���3^��j��&TՈ�ۄj�&��U`����
�k'�y`,z�oXe�Y���!DA�ю�#w���/���n�hx��p�G����֗H��ܾf	���'�h�E��_@i��j��_Hq��|I�L��*t(p*n����+(E��ƚ��<�
�{�&�pk�>zw�-�a�6��npe�-y��qƘX�1C̺ �R*��c���֋mp��D��K��^#�]w�ޤ�1&���y�H³5~��v�w=�.��1�;-G@�ǖjd�^s�$�>���nq�'��>�x���_>��#�\�Ӕ+3�JW��K5K,VS�5)W=��ʵp�^�O�"	������F���	����_8h@|�_���o������            x��]�R�H���<E��՟���61H ��I�_S�W�VcI�y��^���Z�-ې� ��k	�X���^���dʋ,�i**�&��Ds�;��8.�����ө��ٲt���m�p��"��F��W4��N9��zB�:�#��G^uuC����xNǧ��|/��?�OY�[ޚO���'�s2���^.��_�.�~��"k�d��ȚYV�<�����9E�����x� Xq�x^�&I��޳a�WB&��N���9 b��;1bq=`�����B�kJ�Y�b���2�	!�E+ru�����>c	���K`��Ui���,S�]�%�����;����Y�#�Eb ds�,G�Q�o�9�$n���v�v�}r�w�+ϋ�v����s�2���:^����]�v�Cr�5͊�ʊ�Th��>� �,G�I��n�����I�W�������@7�\MA�kp`o 0Pnנ���\�N��\݄�f�,臼��Ď��'����9�y#�v����Ś|����1oo{�ˌ����
<0�J�(�;s��y�>о+���BAd¥��ug~����@��d��g�>��p������q��؎!B9��Ŗ͙������{��_D��@sy!�|<�= ��Xt5-dK�Y'�IxX�0e6G�g�!��c7�>��Zv�zw�s�؄1!���)�f5=����Qb� n����ͪ�!���B���r�_�����U]����͚��m�e��,�ݻۺY�7�
��f�g��Y�n.��(�"k�����~{Th������������OJ���p�e�Ɇ��9��B6U]*-:�
>E��|�/�U��&��7 K�}X�U�HW����y�h)}�§0��|��@E>XM�4��y]�5=�m]����p����I�����lq0ޯ'�1{1����ǀr�w<�i����W����T�Fd)=��Nrz�߀[2�P�ptL����@Y
Z��k���Y��tZ�Ag��[uX�t`ʄ�qX-��Ѽ �T[F��T8"y,�P����%ﴫ���,9j��.kz)1��)m�z�5�Vi1�R�q��"��C ����*o���Ů�>+c�?���R�\�S�D*��W�� o\��N��v������3���
��������K�d����[X@�w�3d! `w�y�axd|+����%�h�ن�����H4)�-Q�"��R�zd�U)8M��5�%@�U(�@�&rB�X�caH&</yG�"�Mg��	')��"�Fd"~.�VoĜ*�D�^P���aX�br�E�
B�7:��$��|��b�w ����A�t���
�S����uD��'k����!��p��<�k褆{s�#�S�X:��o�� �D}U)��L�*�L� �D����O]ZDU�<o0��Q臢B��F�A�d�#�I��{��`R��~p% �bzp�Sѭ�>s}a��{#$��0�mM��͚���#����Q�+B���n�}'R&��*%��9Π��+s��[xB�J�0rxˋT�Gg+��(��Z���θ�[Lr�cB��2�YAOy%A	�f��1@x�1��1v���h0�Q6����Q��鋥��~�b0@T�T�;��0N�g<�.Ћ1EJI�'�V�XgRn��Ve0C�+[yE 8���L�bD9��K^`���n��J���k�IЭ���q0g��MD> ��p8d��缿C: �'h0�`��P�8�r�5��۟1#�dؕr���W�ң��?0���v.z�[q�c��橹$���M��s�Y}�3�������zk�4\�+H��!���*'BE	@~��8�:jp�>�N6Ӣ�8��~��B�]�T`p�VY�$�jq��ƀSخ��?��T��S4�v�|rY��O�<��e%5� �L��vnx���N�Z���
��{����S9�|�a���I/$����̓d"K {�����l��+����Y1"�b�5=�g�UoQs]��P"���q� ����,����U�`�=ʚ�W:�
R;��2�>]~�d� wp}��7)���S�g��D`�^�nA��K���KA9	�u�w�n�T��_j6����V�l�#SY��t�E��@\6�Z�<��k�(nZ�jp�����!#�P���\'"�g��]�f�5/c�ˇ4��w�&p�i�:��PE�x��JGf�@��4���RY[*r'���k�]E��j]�t��r�C;��u�y�T'�p^�ı����<γ
~Q�`��n���v�?�&h.9튗 MӜo�p�@��(�sB��(��2����Xh˶��Vocmp�m����)|v����aY��X�ư������0�&���UU�
�U�eVB���ԯ��;�ڃ�=��\j����8�:�CŨM�<r 1{/;���Z7`$[	�t�M�!��%�n��Q^���#�̴n�}:6��d��E�a�i%�l�u�y��4�G�M\���cJP���!C,2�|�8"ǲ�=��:fkĀ�e��|iP���t��=��z�����Č��%�kݙ����>��b��9�L�j�Z���k| (�1���ϖ�L���G�ʾ�'t�g᳉g�%#p�
N6b�*�ul=�7�LC$�U���|l��&��<%U���l��e�*p�OMS��UU���H�]�e9��A��$�L��"����g� �~��:�`&����~����.��B�9�jV����	%1�����MW,"ﳢE��>h]�	o��C��LM�bL0+��uƘ��$��7�B��!�fNul�$m���a�K�F��X�����F���`�*��)[���W2�_+���)�?�d��KN����+�1�`���1Åf�lb�G&�5�s�K^�:�����\m�-�O���|d!��5U�&��������x�$��X�q.��XMʣI����d����e����U��*S��!��K�Z*Ob��~�Kl��t��h1�����d�%��8��]�cX��La��ܱE r�U��>
˔���]ژ6�\7$c�;�}�^��3/�]�"c���F6liݱ�Pb����=*V,���%�����D���dY�01��y�7]=�e�f��M?��l��v�>Y��]7!����=ˊ%��g\6�����?�Ѣ���9d,0�5b���OT֕)��\��h�!����#1���6󌰁�{�)������h��.�����r}pڲ���d����k���d��>��>��=�4!�P������L+L��6��~�j���o�[��l��[����n_�^%c	�īx�ү�
t�d�ۦnM�;s-�^{G�vgeO��(�y��������}�ڃ �LGх���H�?QV�u=� �����J��J���Ml{�v���8-�2�[�\�b�0��!�f4�o�R��@1v>Z3�a�2���灁[�{qߙb+��|.�{xn�/�3=]+�,j,����)?˙��3>w����f19Dѳ������~�g`G��~�Ē�8�ƚ��'�~�[:��^ՑR�u<3I	[A�&G</��~r:�[�F�Z��<�B�"��f���T�D	3r�v3ȃ�{^����<��!�Wj� {���s9��kY�
I��EG������1�E���ȱ�eˠNt��z��sBrY�U�Уl�����b���@�����,�Љ�6��]�;�,��!�Ks���%ߚꀻH�:۲����(gd���y�ٍ�`��u,�Z�(N�XT�2�6S�=�m����K��1�`��e��
N�1�]��/��ƹG�K���&YW�ʸ׎�_��{4{*�M?�׭�K�z|����QY���TEB����dy�#; 8��.fF��T��H[��{4�j�Ya1��EE@���`�z�Gz�VL���[�#t�}����$��g@� U1ו�_Ѿ�����j��Z�ڥ3^?�S�� �  '�=��K�ﶏqX���_<��eAJ�%o[e6)n�Wet8܅��1�w3Y��7;@z���:�j�_�T��%Uiv���E:�c����a��2��}U���^ϧm��J �J,�M����^��b8S�����m��KV�:X��qg��h���5�dL/�o�)0�>��
d7�;M%�̖�zBfm� ���Z� �dOY�64�5u�E��,��^��h���~�z���Ħ�m�&&\%�qǪ��M@T���e&FD��.�=np�t�b�=z���A���NEGA��8&K3*һ�Z�h�=�;���+3*#�������:y/Y;���7j�#�HU:�Hv�$�#�|�ޱ��������O+���$K�����Vu�0�x�t�L@.@]��n�*�,A�g�U��|]8�:�8C�5������(�������I�����Z��1��3�[M����v�adZW��3t�!- ۇ�a���`p���iؒ?}J�u����Cd�f
\Ԯ���
p��%�<�M*���k5�!�s<�l��'z樳�3us����{�Q�O�l9�8?Ej7���2\��X��S^{F�S����鼮���tq1=ۇ�B_~.�Sɏ೛�*�8v<fxH�X�����5x���ݴ��n\���{�]G��5��思���N��#��B���#F�#��>�@��j/�r�q��n�$�}�K�]Sc�\�3��Q�s��2��h��Lh��P��p����� �ށ)�U&Uz��Z�=r���3<RYk�X�\ֿy�_^���-�G<�S�ζ2�_��|����Ϫ��׽�.���k�Zz�`�ꤞ�7���j�Ⴇ���&[p�B�n�W�s�uK�����f�Л��Z�M�� �<�S��&R�Q˵���<Y�b<{K/ktp�\����Z.w"���N3xJ�q`<F��������A(��*ݔ|&����R+���,�~�`�`x���03L��\��D[�Hk1�d����Z�f7�JM�od�R�<����A02�3�$u�-�B,�ɬ�`��6>�s&;�l%(��{@��Iu5r�U�l1���en�V�}p�0��s�/u�RnA��t�[Ș��Ŋ��g�����7�HT�@��[[9vG����(!���j�E�d)r=�-�˙�թ�iڽ�� �9�Gm�4�X�������{]��竎��[��k�wU��T�=�&k�ܞՉS���9g'��c�d���d.;Up�o�u�d��Y�c0p���e��Pt�T������y/�2�]�J�C��$L��A֨y�& ����^����]ɦ��:[u;6o���O��1$̺���l̶�3N�J�����i).����,��w%5w�<!!઀���Q1�ܫE��
�Aڙ�O����P����,�	�������T��8#е����I���pٞ�G�M���8��|�5�N�[*_a������,?����N�.�X,K~k�=���VxUw�[+ǰ]��.x!oT�b��u�>�]��{�F�Ȁ ��gZ�GΦ]r�G��1����%u�o\�mJ����ϱ��<���?���С��4CT4W:�[g/����7o��ճ      	   �   x���?O�0�g�S�X$�Sqۑ����X.�N��T��qQ�L��Ow~�w�Rl�I[xa?��Y������w��	#�Yk5d�a��Q�6��꾪+����ډ���(�B.�+��#ۖ�ɂ"��lt>��E��\4��3�R<�=<$�#l��G��HlyO��)�<��&Pv��w��*��NC,�C�N_ih(7��-y�Y�,oa�L��E$KḞ����+�(qB_��?�EQ|�D�         R  x��\�r�8>3O�Ӗ]� EJ�'k�;㱓Q���K.p�H4)JşIyO{ߗ�g�G�'���Q"m�3S����A���n ��7a��c6���f��e�)�[ܪX�>Пw���Yov/���$O�J��7��b|�,��l��A�>�a��B.%��d{��m")c�8͒��$��,�%��$�A�8��&�$k��>�Y����)xd[�$C�����[�<�v�o�u!�p+��T���_oev�h|�f�D��ظ�}N��3��|E\�s������ W��e꧚�WA9y�,�,ڄ48bb]��\�{^2��^OrQ�?�tS��ln�4[�d9�Y�qd2Uj��hzK�3M���z?�#�i ����O�0Uh͹1ѯ~�!_[�h}�e9HX�R���LԤW����� ���Z���ܱ��L�`�(�
���:m�*WԌRl}���X�tGS[�G����)��u!����osŁ�zk4ٖz��iI�\����sbۘ���l�9OМ�{����S�r�m�O�9�pT�eg��K6��v�\�ۛ���s�P�A+^3��0�����NUrXT� �m:�e��pǄ��H>o�D���K�G?�ׅG�i���鳈�`K�Z�,v�T�Ӓ��$c�sR�aMYs����Mab����Y ���	�m� !	�|>�A�#O�I�s3	u?m4c*�a*:��6�-��W���$�
�]��m}Ld�tI6��eZ�/��;|�@K
K�M&�I|�5�1��&����ٙYH9����jE.>C����"6e�i���7�1��0�3Bƛ�����1Aŏ�ZqA�~�#b�T1J$�Lͯog}�	2t*��is��D�aa��F�bFZfE����,j�b�H84�VK6i.L�S�d�� A��c�iI
�d�Q�<���rǢ����I�h}����OHG��h_�1�9I�\+UԖ�,��T��N�-F�
p��CA�E�P�ݧ/8�@�=�H��~ 2zaG y5z8��(35��g��ޅ="wGݍEQ �!�2F�sa��գKh��6�����'p�	�j0��;�l�\�aEX����/p�丯i G��o�MF5�8y�z�*u��i��Q��#�^2ހ���5\�k�����مI��ٙy���5�<�����YL,�U�W%
]~��a'��o�g�ye�.�5����/�ٔd��S�QW��������o�	�9�&�&�pin�N�a>;�`_��l�">�M�8�.����{ j�&n�0A�I=�}�&/�K��L�]@�5�D9�z���(o6<S��Z��	�n�;M���-՞EE��HT��G_�y�as����>P��R����d�yW���e�|��"�����}T?Q$����������{��d���O�]DO�(W�n�M��u�˜�S������"
�>:��h��0�S�^�YRM�\!�����̂Mw]T�a�J(�<���|�=�����@�c�Y�բ��v��s�#*+�$��z��_.���%U� ��<T�A�'O�,^�������R�1����Wm��8AH��S������������f��G��Mws8ho�Ȁ�.� '�m��@�iN�j]���҄P-���N[3;Șܷ]ŘGej�|����DV�\N-�є#Pĩ(?P�P��h�<��l4=�j��-V��@qK�q;�w}d��s7#]#*X�*2�U�B�YrT����c�!�d��9>4褈����TDQm�����v�|hp>U����|Q��=�N+<��c#|d"��Q�������
	U��
���/���@a�fjK(�VIM�Npk�v}+�4,�Avk�3\@�������=)q�=�6�>֏�X�vgyX��*J���$=���c��0RQ�_s`�cX�Gm�(s�O�kX$��ޝVM�|��������n�/R�	�����s�n�����n{�A��)���ϳ.U�k��OEܥ9n�� �e��x6' ��`�=�
���"`A�p�v�����f�)0�$�an������
P1�����TI�� .gj�H���*�tN�Q��:~�i��!e�\m��j�y ޿��a���*��rw�ŕ��E�$vZy�������lTf�}Ά���}�c��}�Cʫ|���P��`3��:�����VY���9@�|N��Q_Kog����ث�&Ms^p��dU؞8(ن寇� ��i���8ρ�D-٪X���mv�����93��H!Ԫ�(*�ɑ��Zٛ��h�H���N�M��	]b
���$A�	(ڧ�*���)Az�>�"(ar!����'eaW;OеQ�4,��g�I�6��*Ew�ݑ0�^�?ʥ��-�*~�d�]�f��>.T��Bi��ݐ��9ζzY��Q9�"��5Jd6ҡ�������HY��"]�i��w)��o�I;[��_:e���}��M�כ4�'�D�d2zȒ|w�j�G�6ςr��"�q/òiSr%�4i]�L��wЃ[o*�뚡0������2D���m�*)��L��Q���׎�t��f���j�����w��/ؾ#�^��y���Ń�6P��gr� �/�;�����a�pO�8��������u�`�%��[��NLX��Rۋ�Պe�P���q��z�!����֎�t�#�Tbχm�!��Ɖ�"ڣ#q����۝�`V�,=SK^^����*i�]�����<-��:��K%珑;�r�W�N��w�Y�H�����c���&F}b�E�q̂M8���1w��@����ϝX��X%�%W,m����q{*��$������h����n�!����mO
�O�\1a��� A;	����`ke�
NZEgo���%�r�+�$��;V��a�������O�p���Ia���Ym�
�H�}��bO��������}�aEƽ#ӻ�#�yWI�޼�E\�j�"�;よ�|��z��WG\�X~����-�M�uH��<�:q�F\��o�9�s��#P��f�2gr��Ag��o%���Ĝǣ��q�",$E����hù���֜�����i�0��_(�@���Z�5j�t�u5j�f�܋�."*l�b���f��H�����۫��֢:�ܽ�VP�*F���$�h����muS���%~6��&+�����P�f�+h�w�/ؽ����W�;i��a��D�0nAk=����S�r_)�`^��zT#Y�Nh%5Rh�ԯvT.dRO�+�o�0Wl;$�~Iӻ��8ؼl \��T�6���>9��uN�����D8���'�A,�{#��'��A�uz!��sR�R� ��� �l�bɎ�{��D1�^���b��~����2r4����R0UX��>�����"��o��Knｚ��{5���_�b��f��|]@xp��w����;���	?�c��D ���'p,�؉� K�d��d�1�wb �R& s���C��� 8�̿9 c��7 cz�.f ���nz�M�� ���_�.>�\�Ӑ��$��\�E��0N�>��>`g���f�C#���P��Q�!����ԗ�g
���8�ƍ��sh��{'�siܧ�߽{���         '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
]         4   x�3��	�2����2�H,.�/�2���q�2Ӿ\f�~�\1z\\\ �
v         �   x�m�M
�0�s��L���p�Е���oL����'��)�{,��w\��~<L�\H�+7��\��9�N�_�y�t0���s��A�NJ�K`O��C�d������}�ᰩǢ��)uF͵~�3g�ܲo�d��mr������l����k��=8��a4m�}b���      $      x�3�I�KO-\F��@F6W� aA�         m   x�3�tJLI�S-N�H�4�2��I�MJLOTH�M-��+I� 
s:�E��Ss�sBRsK|3�&X��Tl�j�wbyb1�~�Hi^Vb^:P�~�i����� rA�         Q   x�3�tJ�K/�K�SHI��O,I,U�I, �%�q�rq� �ٙ
�y��I u@Qc�м��l$A��t�Ң��t� ��         �   x�M�M
�0�יS�	�z�@)%]���)5��%?���N�����U�o4��L-ML.��Q��QA�ч�F	�8J�2�k�.�z���}�ք�>��vɢ��%ek��a�}.~A��/Tऺ��d!�?zTF����� >:�9      &   g   x����NL*-H,I�S�IMJ��4�2GH�KIM�I�KJ�qz�$*8g椦��L�T�AT�@T���H�B�BqC.#�:d!C4!�!9�%�y@�=... �H5`      (   \  x�M��n�8���S�	��^�P���f6L,��ElA�~��r:��G�E������&�I��>��x2�&S�w�ܼ;����zpa��r�u�|�ǿ7Y�
�-���w�����b�Cc�[�
���.s++!��A�^����ͅ{𺘛g����N�B=w�:Ri^t]<�2�n�U]�͛]\h7��yѠ�ɜa�e�9��ҋ�)��M��* ;�=�/̏� {��y
�2��pT8�t�4k���7Gh̳�&ǟ�1�xrײ�<�+�RH��bW�M�����vn^l7��0�1��4�v��"K V��ζ� `T@��!�FF���Z~�R�Xɉ�Kz�C�)��&[�.{�.�r��<w9��@�hEW!�0HϖWJ�U��6g;��K�ؘ��P�a%'�������H�R�Dad��`Vz��s��� �R�߸NO&���Dbš�pѾ�� P��A"@���+���?	i���-S$C�~�W)l�Z�1ذ�H�BTn��V��I4~{	Ѯw�ߩX8(��=��B�ũI��fZT�t�O��d������E��ol̀��2�.q�-6k��2�d�1�es�Tհ���Y��q>~�n�g��O,H����V�̜��y���Փ�6�e���{�Y����_�C]�,�fO`q���Fb��Fj̓]�n�Rs2����I����)x�C H��J�:4��	�u�������\ܶS�ߨH̥�aD����\L��t;A�_��WVaTH��nE���G��'�.LZw��E\4���Jg�����Z^��lN�0i�p_�1l_�⇉
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�         E   x�m���0���
:_� qT���@�#�>�1��{��&���Fɞ�/�_
M8꫟n�4�"�(         m   x�M�K
� ׾�ȴ�_F����?Q�
�=2���O��[Yj����5�(��,?�f河<g�4Ԑ��pD�w��:LۤG��I4󝐛e��&��
6���=         1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      "   /   x�3�LLNN-(IM�2���S((�O/J-.�2�,J�JMI��qqq �i          <  x��T�n�0<k�����_W�@k�(t륗���4%Z�D��w)�.+6A�>X^���ΐY��/�Yl����c�:e1<����1�S��=}6�X��q|���Vd�T��0X�Z�h��Q[����?�$nq�=kN{�v�����H�qv������Z��c�5�
�K,���3�S��Y����4یBZ���e ��3i7�p�ʛ^S�E��H}
YNM�����o2�VY��3�GZ��y}�R*�N1��g�(ʀ����0���/8�I����x�)!�|�|�U�vC2O�yq���Øw@��§]����~\��.=EB�ſ�J
�����H���Uw�d�&[����T"�)�j���_6%�n}xR��W�;����| Er��^lJ�׻yP��;����2�بZS+�zU)G�8ҝ:�qO'ע�+�����pr=���������AiKAf+I�kq�#��@�6� ����OU$|	R�|:T	x:�d� W �Iqr1-
~�i�duAc��b�l����:Spȓ��r���ˤ��� �N     