PGDMP                         x         
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
    status character varying(255)
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
       public          postgres    false    235    234    235            A           2604    19530    kabupaten id    DEFAULT     l   ALTER TABLE ONLY public.kabupaten ALTER COLUMN id SET DEFAULT nextval('public.kabupaten_id_seq'::regclass);
 ;   ALTER TABLE public.kabupaten ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            B           2604    19543    kecamatan id    DEFAULT     l   ALTER TABLE ONLY public.kecamatan ALTER COLUMN id SET DEFAULT nextval('public.kecamatan_id_seq'::regclass);
 ;   ALTER TABLE public.kecamatan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239            ?           2604    19442    status_layanan id    DEFAULT     v   ALTER TABLE ONLY public.status_layanan ALTER COLUMN id SET DEFAULT nextval('public.status_layanan_id_seq'::regclass);
 @   ALTER TABLE public.status_layanan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233                      0    19146    account 
   TABLE DATA           j   COPY public.account (id, username, password, role, status, d_perusahaan, d_pribadi, j_lokasi) FROM stdin;
    public          postgres    false    203   �                 0    19155    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab, kecamatan, kabupaten) FROM stdin;
    public          postgres    false    205   �                 0    19164    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    207   ��       	          0    19171    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    208   �                0    19179    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    210                   0    19189    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    213   [                0    19195    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    215   �                0    19201    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    217   �      $          0    19514    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    235   �                0    19209    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    220   �                0    19215    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    222   ?                 0    19221    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    224   �       &          0    19527 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    237   @!      (          0    19540 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    239   �!                0    19225    layanan 
   TABLE DATA           �   COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal) FROM stdin;
    public          postgres    false    225   #&                0    19231    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    227   �&                0    19237    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    229   0'      "          0    19439    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    233   q'                 0    19243    sub_jenis_layanan 
   TABLE DATA           M   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan) FROM stdin;
    public          postgres    false    231   �'      5           0    0    data_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 365, true);
          public          postgres    false    204            6           0    0    data_pribadi_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 291, true);
          public          postgres    false    206            7           0    0    dokumen_proses_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 80, true);
          public          postgres    false    209            8           0    0    jenis_dokumen_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 302, true);
          public          postgres    false    211            9           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 16, true);
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
          public          postgres    false    232            F           0    0    sub_jenis_layanan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sub_jenis_layanan_id_seq', 41, true);
          public          postgres    false    230            G           0    0    user_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.user_id_seq', 287, true);
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
       public          postgres    false    203    3142    205            j           2606    19282    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_pribadi_fkey FOREIGN KEY (d_pribadi) REFERENCES public.data_pribadi(id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_pribadi_fkey;
       public          postgres    false    3144    203    207            m           2606    19520    account account_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.account DROP CONSTRAINT account_j_lokasi_fkey;
       public          postgres    false    235    3172    203            k           2606    19287    account account_role_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 C   ALTER TABLE ONLY public.account DROP CONSTRAINT account_role_fkey;
       public          postgres    false    3164    227    203            l           2606    19292    account account_status_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT account_status_fkey;
       public          postgres    false    3166    229    203            n           2606    19297 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    3158    224    205            q           2606    19565 .   data_perusahaan data_perusahaan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kabupaten_fkey;
       public          postgres    false    3174    237    205            p           2606    19560 .   data_perusahaan data_perusahaan_kecamatan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_kecamatan_fkey FOREIGN KEY (kecamatan) REFERENCES public.kecamatan(id);
 X   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_kecamatan_fkey;
       public          postgres    false    3176    239    205            o           2606    19302 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    3166    229    205            r           2606    19307 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    207    3150    215            u           2606    19450    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    208    225    3160            s           2606    19312 )   dokumen dokumen_proses_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_proses_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 S   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_proses_jenis_dokumen_fkey;
       public          postgres    false    3146    210    208            t           2606    19317 #   dokumen dokumen_proses_pemohon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_proses_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 M   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_proses_pemohon_fkey;
       public          postgres    false    3140    208    203            v           2606    19570 %   jenis_dokumen jenis_dokumen_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 O   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_role_fkey;
       public          postgres    false    210    3164    227            w           2606    19322 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    3158    213    224            x           2606    19327 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    217    213    3148            y           2606    19332 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    3154    220    217            z           2606    19337 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    222    217    3156            {           2606    19342 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    3158    224    217            |           2606    19347 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    220    3158    224            }           2606    19352 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    222    3158    224            �           2606    19533 !   kabupaten kabupaten_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kabupaten
    ADD CONSTRAINT kabupaten_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 K   ALTER TABLE ONLY public.kabupaten DROP CONSTRAINT kabupaten_j_lokasi_fkey;
       public          postgres    false    237    235    3172            �           2606    19546 "   kecamatan kecamatan_kabupaten_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_kabupaten_fkey FOREIGN KEY (kabupaten) REFERENCES public.kabupaten(id);
 L   ALTER TABLE ONLY public.kecamatan DROP CONSTRAINT kecamatan_kabupaten_fkey;
       public          postgres    false    237    3174    239            �           2606    19555    layanan layanan_j_lokasi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_lokasi_fkey FOREIGN KEY (j_lokasi) REFERENCES public.jenis_lokasi(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_lokasi_fkey;
       public          postgres    false    225    235    3172                       2606    19404    layanan layanan_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemohon_fkey;
       public          postgres    false    225    203    3140            ~           2606    19382     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    3168    231    225            �           2606    19445    layanan layanan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_status_fkey FOREIGN KEY (status) REFERENCES public.status_layanan(id);
 E   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_status_fkey;
       public          postgres    false    3170    233    225            �           2606    19387 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    231    217    3152                 x���M�'7����*�K~?�@Ն�u+)T.�Z�ɒ%����#=���!mu�����dI�p�bb�P���?~������~��o^��ݯ�>z�T����$�b���࣊��R�B"���WL_�o߽��?�}�������Y�_�����ʃUF������{�$>޽����>�+�P�w�"�Ų���'q�E�>�����o�S\ �/뭇�I�YE�q�8�e9�"�$;.>t���kWq		����4���XC�*���x}�K�+%�jY�=��q�of�K�!h��پ�e%7�Y�J�	�C�e�틣Zb@R��mX&�-[�J�JX�AOyn�g� ���ɔ�1��ι�8d�W
1+JX������ٗ��ū���Z6+JX���t�AX�)��x�UK�J61��O��������|F�x"����2���7_�v�bV�ҀdI��&Ke9*��%a1LB:�!��c,1������s^b����Ŧ�c}�UK�r�`P�F��%a��nwJ�0�� ,+a��3��lXa�5�3�ݾ l�AX��la�l�e��0�W���b�A�����vlXaY	kE�g��$������r�n�� ,5�������T�,_��՝b�@���[�AX��U	���KJXU0]�&�j �1�Sc�o��åc���bM,FVre;L5 Kd��E�߸p�S�(K�-�ΧO50��*9�����{��Y��"#��9O5@�ղ��'&�۵�i�؉U�;��+_j��SG��Z�]��^j��̪��n�m��Z#-��Yܶ�ZD�_E�,6�X[j��%К�9�ָ۞���.5X�6H�S�Z9X�:�:��@~���Y8$O|����,�o��`�����C���`�#�"뷾��[\S>=�ʩk���4��t��9�5F~�y��X���`���ҬԻ��Q3/���E�p��UK���V1^ڞ�jT,�TjV1^���4BT��vٲ҇� �(���⸖�Q�9m��̈�-H�w��6)f(pK�*r�N��Yi/��EӝH���孠�,�����f�Ӷوp�YN�@q+�$����Iݦ�j[��4������U[m�E�z�m:P��'��|P�.�k%9�<l���t��F��6���[w�[t��-B1��	�C�ٚ$�:�gC�٪�����V
�,\�B��`�TyB%[5��wvXqB[�a,E��b>�[tHm�����?��~�ݗ/���?}�毟��/W�7=tKɰ_=��Ϳ�R�|���^�������o�G��(��Vj���%H��o���kТkzM�tRM�`4�n�"����9k?��m��n�EE��`�|�9-�n�����\E�Z4d�V1o<�.R
�m��U�j#�^ɫ/�;��t�p�So�TK����H����=Z=�6����{�x�Ѕ[��Wi�������x/m�����P5�u媇a��]�t�Ӵ�\e��*W�G�u����U�#A��ցw�����c���M4�rճ%�%�ݏ��U/�4HL�����O��Z%V��)��A����S*�uz��t��>r�����$�1�� ��Mx���v�Wŉ�B=:Dɵl
�h+'.wB��>��l'_b��yڎwB�����+h���W�FӁ����sJ��]tPO5A�*NU��r���W�L��T��$=j�F`M��n}v96X��Z����ʩ����\j��J)E�E*�5��ywJ^5X�<m�=�`�FP3�Z!�Λ����s��rk�Te�n��5�����5�f#߮��k��H@n�+w��:D��-����k�NiM������5]XFR��	�R�5q/C�~�R�5��ua���x���x��M��^b��.j��}˲��f�"��ws�.1(��N}��ϻz#Yb`�]"G���/�i���5�p��ˀl�ۋ��#c���B����F�ᑡhT�(���AX������	���J���sN ,Z,��K�e�xj&�o<nS�x��!�7���@��z����&���?s�}��� l<����@���4n�⊠HË���i���0�Պ����S�f	�D�5n,;�0{����s|b?@���x�&ީ� ,ϩ.����0��U�����0�!�^�L�Y6�	�^�1���e�� ��<�,�5�g�@�͛�Isg�й��5!3��I��0t&��<��wu��0�E+z�P�%J6W��qK�l�	��%v�6Z�d�Tr�����A��3��>�;C��ǀ�3˞oa6��Twc����2&����={��@6����|�2�4�x�:I�/7,�0<�8=�hr@<�`�s�e��Tf�A�oax/�EO���IT�;�g��:�X�Ao�A�M�f	B��G�l�W�9�%v�$Z�X�΃r�3I;��m��s�3$��	Ť��~8|�A��w�l�����٣��͓ĥ)$m����k���:�����$r�m�i�I�0�Guq�KHЧ<i.����}z,^��6�Yb@�N�$4ŗ�,1 icȰr�ܒKHz�GU=7��nɺ>�{"�#�[ߵ9v��G��C#��� �z4�N<=��o�0�&]b�����Qyg�Ѱ��UlG�e�Ѱ�⻕7�,��naH$}�+aX|G5vOF��W�]7~��1�Rѭض����[�֭/��u..�%Ɵ�Y���g3��bK��o��✗�C\FQ��� �et�x��Cp�����Bb�[b�x\t�\��� �a�ٔ��2�A��=aK��}���8���            x��}�v�H��3�+�Tc�EQ���<�b[�d�EU��W�@$L���v���?�?<_r�	d E�f���T�%뒑�#bG������Lw�s���l�������h��HD�(8��h���:��n�5~]�ݕ�s]��ƪ�L�t.��t�9��2���q9r.�b?޹N�;gr�\g��/i��W���t߱K��E��zֻl=��i �g�&�1��:�zW-�E��_V-�����Dx�闳��JW��׉�������o�G�g��yW�YZ���'F^�"������\����9u&Y	k:�b��A׷#'v��E���-�m
B��e�n����{;�L�M�������L��@�A|
?�������N����}Z}Q8��zޜ���#�r��˿-fYi�s���9�����:N�=��"]�2ԍz���6�e�u�`/r��F�$�j
 h�]C���V9����y�,��@�� �2y���N�Q%ҭs��Pr< (�NˬP��1��/qۯ��Q{�y!(����/��������X�N��V�:�V�����{~G��DHC�:O�pWն�f;P���Ya$G���?�A6ѽA��;�G��߮����e�p��p�N�4�S�z,�_g���B�c�7Ao��|�-����,�x������ɉpm�H�l����s�6]W_��*M���������S[�F�RL!���y�"���{����h�n����|�p "�t.V|"�!TLB��rޥ�e>MwE���Cw$�d�Ԃ�ӻ�J2D�A�Fʻj	7e��S�s��u�����Z�vDk���d.�G.��z�����k�'Y��b=���Ms�R%#!FFo�{̺w�~�J��BzJ����뤚�O�n�&��X��ш�B�uZ;�|������Y���:]�p3f�%XCr%�N@xaX��%ɟa��s^,��ܶ6�uG�H���hD'�uN���c%\�Xm�T��,����y���h��Z����]����� ���Z��,�74d(�e:_fΧ|���a<��?���3�&���2�F��k=_�8�)��o�,;��aƢ%-�;��C6}r�)�;�,�Q\��E[�LW�����&�X�i��Vh����2	G	� �1]�(�!���,�E>���wzv����d6� 4�X�`c>���l�e�����$H%�|�z{�"�ժ?V,�m��vmD�X���l��n`;SR�ǊP�3-�Χ;�5�߱���=C pi���:~ݥ��c�/�r#���|��y3P?g��d�C�  n�C���?�p��Y	+�땺�`���'$����)g�ۺ�1�ЏI��f��b�Iv���`�+Ȼ�,�f�7���� ��-Tp*���N�.�>'$���G�n��܍��0��c8�[�m[���}�s�}-�s��8�}J7�����=�	����G8D���ܐ#���h${���Ɲ㎈xH����X�q�����yi�z���|�h�u��w��]��x�n0�HӔj�N�߫lm�q�x#��p�n�;��PDʔ�x�B���QR���Y�˦�]���g���(�0��Y�"j���e��?���Z�n2����Y�x�p�k��|6_d�D�I�~�3nUD~���SV�ڗ��)cﯮ3�� Ā��n��G�����Y�sd��>ݦ9NX*�a��%BS8�5ܱA��v�$H�Z�œC^��_@���,`�Բ��;ubݩ#.Ms_ZH�Ԥ:�۰���ȭ��ţp16���o�9��� ���������^ח��8"7�y�Һ���BR�� �F�W��o:��&kU����j�'�F��	�+;N�� �9���~��/���9�! y�ޭ���WD�܁C��ݨrV��k�N�~�v #ѳ|�F���FcXU����q�GX&�D:�zC0����aDg{]���a-�D!$yB�ș�n-@�gΗ�\�9��	n��K��:u`�[��w�H�G,,���Po9K����&��Bw�F�6b+����+*4��`���w۹{�q���α�Cԉ,�H�>�_�ٟ�d�����l;�Y)�v��M	��Q)����#��O$��[����\����%��1y�I��f%�K0$�̶�~��b�"}����]�M�J��h�f���;9���t���ث��E�@i<+a^.���*�&=�=π�/nq�}⴫p�B�{n���* Z��K�b�œ,]-��ֹ�7Y��
��3�n"kL4^��M���1��yw�����M���Nņ���j��:��C��9/�
�a�4p��d`�����B��	�U]���
eP���Ҳ�(~[T�Y��Q0�1�rr�M���G2t{4�:���T3�œ��t�S���,�Œ?��<�P���/���F�� ��C@��� H���O�!Fc����t'[b��r9���-(�@:�r�] �U��>��	��e}���zH�(]�V�`���/�	����&�3m����F�[��#����|9�Q3FY�(	�C��C��iJI�+˫�-�Z߃��D�'�=�2����n+�[n .�[����H����s���k�!:�V����Fj'D�!�$�`:&��;��ᇹd��Q����{�5W�.^��x�KH����z$�s_t�@�we�H��sO��%����t8��r�ՙu�S2>���<1jD����!ºs��.�t�+��@	�}��5��D��Ex��܃h�X.9��؋|���9�yt��X��s����[2U�wQ����#u�&�'��06�?�=�
0hAE?
[�͎{"�J$��;ܷ̹Ϧ�S�p���e1�>\�����]�� >�_���.��,���;tz���ހ�{,��c>���Ͽ�Ά��T�0�Q�D�0!g=�#ƻ��N5�@�$z�c?�g�o�����J6<��t���opH�B��:�]T�s�N�׿�A�B�_Pʦګ��&C���ФP�]֕8�/&���张��z>x�  	�D�t��C#�Ò����w������~c��`�,^��bA�]��K�zg��I]Q��-W0�.�� �#�f[|�tV��e���k ��JY��(iĎIȫܥ�2C%�H�ق�Е��BW^��g\�W3bu��M����z řc��� _��_h��{������}�B)z���zB}��0-H:�BE�����CB��Mj�Uh��j~�����
~��<����aTp���\����t��Ӵ���+�����+�Fߐ|W�I�Ĝ�n��|,���C�r�ù��˧��)�v��v��.�R�|�M[)���ݠq:��A�Ր2@6<N�}�'��<W��B�f&�����������g�۲�s! �n��>[�X�E���ŮP��!�$4��̊�6�$7��Wm̂������!K��L𗀋Y.�a���mZܪ+��ޝ�,�Y(�|�!��-�Ϊx̗�J�iʃ���K�,_�<QVݢ�	[�L��5�1��+��j�a�:U�Տ�r|��#2�=�|`��ƚ��2�i��1�pA<��\���s�W�IυM~,fh�.��]'��s����4���y�ԾE�^j^�g.�ou�5-�b�������5��d��z\����0�r� /O�b�B��(�r4�`=�P����^a"���`�M`cJ�Y9Fw�C0�y�3��w;m]a���[�>��55o�m���|�,_�-�?m0l
�נ:|��S�l*M�n)B�Wu�/E�*�b}'Az^O}�&�������g���vg�#lom���r��T	��� [2�Zg��3�J!�lZT��װ(S�&�Ns���T�2���+-��k�VkF�͐��u1I+e"�W��&�d#r1�Bp�(\�*
��2Cn��DAo���q7_Ggt����Út]�ð�kȵ�1�ux��Z��|W�OKu��ˢd���^�@[�!|�#��nx�    Х�8����Z��)8��1����j�����v�/D�����l���+�'!ed��X/�D��|ݺ���f�AH��o��},�-���Y"� ����,v�L�E-��ǛoS����9O�*��˚��D�P!����X�؅PlT,��-{Ebc����|�l�|Mw�g����y��ʁ�~<`���~t�Y����Z�t��:�/���Y�ĩ�-9�5���;:F��^np%G$1&m���_d����x�mU�q(�����117���I�pr[NR��VhfR- I�wK���#,�e�����!c�7�1�
}V�~;�������:B��\���^�� ��bfd��έ��F�p���C}�f�e���'�?��]���d�q� 4� ��t;�IW���&P�Xk�0��l��� =}�m&��$|��!#F{5�[���9y�y��rW���&>^ڌ3�^*���"���[�l�>����oֳ���Gp�/0S�	���t��R�k�`��E̘�[^t-C]ϧ���5g�$H#c��*K�kz����x��#��P���la����իG��Y:":�I�ǅMA]� PG,�W�>� 4^�0<7�S�Q%1e ����i�QI�(nS�0�1r��QO6�?��`~X���'�3���=ˉK&����Ѷ^��H�A>�ը>��a~e����/�A,�/�u��Y�.z�C2#�)K�w;���E�<����\��k�Eb+�m�����k*�����*e�IXD|�DXJ^)*��l�%�n�A :i�P}kfq(E�2��[�_!B�g���I6㢚"]\�s��23MH`L����{�v���I]��T�6�����>�U���Sn�)CB�չ�_�Ǭd+���������+�@y��R�,���AqLv�q�F˺s+|!�3TI�|�5��Z�ͤ��F#�\�o{��l5KDF�4_%�LT�ZnS��[��(�����2س~�% aC7���Tq�E�O�4|*��kB����B|ǉ!�ߕ����d�./&F�[�6�H��C��H�_'j8pX1�#��_��W�.�:��[�F���~2I�'�Y��%�A!@}Ja�pmap��KB_3�@����_��W��<���N��X��U[��	�`�յ�C��ٛ8��N�`_��5���� J�"%J�]� �x (�`X2�t~�&xq>�4�}W������}�93q�G���n�9	���4n����HWT��%U=�l�;�X���k�5ڻ;�(�ǥ�l��O�cuu��E���G���5�?�"����70����1x���@�_�Q�4`>ńR1/v�<8N]���x�VC^8�����'&�R�g�e���A"�nZۄ��GW��D���󌂑�j�M�ۓ��bFF�^u�e(z����'?K�.��4�f��2ʦ��G؟h�5�6��KWV�����ַS�}�>C���Jl�
f m�~6�g����>]�we��J8W��๰A��o����	J3nH ,�b8Kڃ�YW��$�&�,��t�]�2������_�����?0��E� ��!
��9��̀��E���R���~Ow�HD~��'�j�,�����roW��"�b��D#�6��k!=��82�S0�`�|�x3p>T��3� ˅͎���=@6Q�u^�P`[��r�Dӻ�X�XJ��g��DK���)5�a����K�0��["��^��E�D�#�8CN��*@�~��z��j)�C��xLK0)��n���q�<t���Z`�xA�u�.I`Ȣ�]Xp�Lû��������z�F����5�Rj������X�I.կXϨQ�ڢz�p��\ыr�fl��}_�pY.IE�q�ܽ�%W�'�+;�6s]�	�/J=���+��pX�q�F�D�]�FSf�l@e�K��K�N�o8|L�p��A�h��v#����jL���Zꣀf�$�\ߴ75ʔ�1��L�:���	�< 8����c2��������V�r�%*N
� Hj�K������9'g�._��HYܾ�I�Z������^uW����H��H�r�LU5Ǚ/���@^�8�	~�^p����GtK�~�c4�)��C�F��Sv���ɣq+���@Ɖ�.ص���U2P��A���bcгn���l�CV�Y�a�[1I�\G��b��m1ed��J��e.6Ӣ���/Qn�}^vK�ˊf�b���e1�1�=r�FR�*�ca���4�B�;A(��@�E����	�y��d9�Eы4B/�U�$��1U��	���>a!JSy���1tX�Ω��ķ�=�@�Q�y��M�2֧[3��^Cnh �u�x*ׇl��jZ6�%N6�4��`��gOp�s �рa�
�SBr��d����!�_M
��Jؤ�2K�J]�̰s~�o��J�Gx}@��M'E�l�;�0�h������m������)���H<��.�JB�|��#���s�bbx�����_�َ��~�c�k$kg�;���ٙyL���������D4
��%2-ܹ�Vפ3k��JĐҙ�t�?A�1�h�3}�56E���w<3�GQ.�u{���>jcM�xG^\�S8�٤��S��@l�����N�2���f� �c�(ֽ�� �b���D�Pc�{Ϥ�^S��D�W#��ֹ��!�P,�K�b��y�{ʘ<��o$�!�0͸�rCn;���d��x5��GqO�n�<����"}��Oȑ�)^���%��}���Y�E�*���E�N�:�x��@J?�ؽ�>��u��Q�䗳2m �dڞ(����pۍ���L1S�^��2�2`�;���&g3+�cN�\b��e�r�B���� �0�4Թ�)�vG{��zϟ��5-�߳gl4Z��-N�?�.�y� |���";)�4�k�玲\Ī¯��*�0n�@Y�ȣ3+F*N�Þ4-�E0c� ,���8ɮ����?
�o��߮Lx�����? �)��@Z]szz``g�'p��R���e��q��]�1RR�I#u2N�d6+������Z���B�5|�	��C��ɔ��e���?�1)�����@.�n�:1Z��u�t�ɓ��]����잎���7���;����XuBk�^������T��G�*������A���fO�T���4�L�{=4�������C�}�!,���:��#[xO��0�{P��к9G\������ؠi^������{�6Ol<�
�d��Q�&[A3w��dԈ�HM�x=G��J��RS�K�% 3�5����J�x��¶��ʷ��^+͇K��1H�nqX��`�AOŒ���=�6��$�m:�^�j�V���#�R�!��jo��#�	+60�d����m�f��/��M���+�+ R˨�1�sU�T�t��\W%ٟ���1�T�}�����<]~O��������vȞY�x&:熿[8\t۰���*3����Y�.�k}.T����ؐQ�xd�3�����m[�w�?ϩO#_�"s��u�m��-}#�~���V=�oS�'��D6���ZTOpQZk�+-.9�)�w3�Ցa��YU ��H��wȥc���e1�n�9g�	F�c���9|�$�K��K�~p���GzG�Au�����o���F{�Ek/��=�ȝ���t&���"���O��Ͱ~?�q��B9e�;3�v�ZB�֌���t��.7��* BT۾������L-3&AGi=��
�(OT�Ff.�z��Cl�ޛ� R�u�,x��P�3o�K��W���N��}-�3j��1��ע\a��ɀa/�l��.���}�V� �A�8���V��d�2?�U}!�oNS�I4�qGAa����|�E�{����4e5�	g�l
�C�ềǐu�,f�Cec���N�#ْ������n�4�ְr��B�E����#���'H�,k�3�]�'-b�>��l�M�M�h:�i���ی�TA_��%]5p(�ѹ���7����#���HoQ���q1�2ۏN�6���x��<�#�L	�pPHw    �{!����b�d$���mZ-�I04�i7Y]�9&O�ƿI?F4��c�d����%xY=4Vg|��gz�%�����Ys_�ݗ�1I&:B�g�In=��j�=;��^�(^��Ӯ���ι���+-�!�f��t'ņ�p�1�g_������T� _�,{��_��)�ÎL򈈫�b���#o�N����'AO��հ���8��QjZ �������S��!/^�{���v�B ��@�K%�cv�N�7�M��@���Ǡ�V'4�W[�I���L�$g`v_�Y�e�_��X�C;A���%��������Y@u������� U�X H�C�֤��CU#;�G1L��=�T���ۊ}���A�
�O�B��n>��f����/nmN$/��?�*+w����	]��?xC�����~��
x���·|���91
}oG�K5�Eφ9���k�@���vr{0RCW8�1W����HܑG*���� �q�$H
QL�|c�z�ZI^�6�A;���2c���l�����fև"[����&΄���x9���	:��Q{��=��y�X��q����C��?�����j����#���;���C|����� �͆�>;�2�(c25?�ɂ�-�Pm8�A��8oM���ʤ�(�Դ�4���ۏaۡ��H�i
���6�)-a�۷�0
;��v<��Ǔ,�r�Wm6K|	�[���v�uY��Uu�/J?$��ra58�rF�1�.*f�$�B��
��Ɠ:R)X��$�X���Ɨ�H~��c�Ccb���4�:��!��҃o5HKn5�dZ�}=F�?�ģQ��yM�l�g"nH�30b嫳�=ܥ�\V���j�0��z�;E�z�I;��1c��O�qUx�Hͱ�<Y����	+_/�3p򔯟
gR|K[�'Ilё^����dz�����yP��%�J��7b�|(��):, ���qO�ֺ��\�R��ҔȻ��U�ݶ�Q2�(�]��������bc���F??#7�g�m�%�D�פ�E���n8y"|G8|���B� \���'��)�z+�H�4�l�Ű�,��5���n�d�X4����4�]�Y�*��#�����\��9� ?���1���C�)��-bf)n��70�5*��jP�\b	��F~��H)�[6�^��}#m}���{'�l	F�Gj�&r��80����?�	�(��ވ� Xe��ł�9|Q۫ㅰL2{�]���O�f��j"2�1����� �՞��E�"���h��zIk�|+�yB��J��n8Q��=P���K����P�z,q�p���#BPl�UO�_>���¾zT�>Sw�:2�{�ѦQHnK��{� ��-xP���r���Hĝh_���ib��C�5{�=�Pu���F�Iv0��*]�h�M�S��W�<��*=�Ę˺����ZyR�q�_h�O�UX��>�[�`�wjRWf�tz�WfB�=�d�:xHi� �w���Ă��/;��|]
�Àw����f�G�H�дx�{����G���2��	�l�I�>���L���ׯ�����ӗ�����?�8QMgq�p싣��fY*���y�*�0_ya:��=}�8{�,^�+Q[���#��L��'�X#<}m���~�,�|U�BpS��Q�~]��ъ-��j>O�n)z���l�H�|�����
����gրi��j?��:g=�·�������g�����I��'��.��� &@�b��>�S��u�Vͦ�	��%����s�%wY�N��������[6o�Dѱ���������+�V�	���MDÍ�_2@�I�0c� .� ��?���d��Q���x?+t�&�����F����a@�D�Ok!n�����"�j��#+ ��1��7;�k\'�vv�z��ҋX�g���J���}7lY&�y�qO���`��=��g�g�F�צ7u��M���C�{���I�[Z5��x�N�
���m��>�2W~7W5H�	!p�em�����[������ٵ��i��Q��k���@��C;eb�G��M��p�݋(y�<�����B�a���j��^�#⪭�u%�����n���&�Jٹ��~�K��7i.=Z�e0lZ*WV__�8^f�Ca���dL���S����,�Ѽ_��A6���7=
S��Tx3^��K�y�Ҷ�~�->�=�?T�`�3<�?�4j 
&��6�>��U�x�ʎ��(�F03-��s4a]]��v��l�{�F@w��]��;���Ö�:��W���w`�������g�hh�����{(��{�ϰ����8CЃ�>���R��c�=��!��T�ѯ��;�g�z�Ars4=��ЪEC�`�R� L��^���3뽦#�j�=�w؂�w�,�x�9Q2�TC��z����;?)ۯ�G'�����LАŰm�[/��@M)D��@5[�]t�G�{"�F�	q�,�nX�S|�BCY����W�Ȏ1i�J�۬*R�i���O�t2��~i�,�: n�L��E�Z��s�d���o���h��O�5�}�V3%�MF��I��%���"�p�G��+����W*�g'$	i<�ɼ��pq�Mp�ګF9M��X+�g����:�T�cd��p
z>���~ż~&�G���'eo?d����_�����wf���U^�7���JЪ7��e��cN}�4%�Op2����{�R�g#�Wȋ$7x_<��u�Aa@�.|�{ͤ6J�tk���Z�8�W#�2+hC���-�w�A9��4��BiP�	�\��n3��(v]U���Eh6������эG>mK�p_S>{JA_M�'6�Y��/9��b�[�/�4�>�i��z����=?\��ݿ�a5 1��n1���,�4�G���~�y^���&k��A�z�*?�M��R^k����n�-?��7�n��_j2���jh�E:K7jN��GN��g���Q�;g�m�Rk�I�?V������Lp�-E���)���N���|��1N@1qk� ܃lå$=�b1�Ĭ!]���B�P7!/��O�+{`Kja��=j#}�b���n�Ց�AXﷆ "H��EĽ1`|��s[M����y����Di+j~}vE��NM���1��6�G��5oQ?�s(��ep��D-����3y�����pB��Ó��U��?Gj%u����F���,����FO��b|��&6*,����x'%�x]��Y��yM��'v�H�և��/ȿ�$���#r[~7���o"�+K�#J�@��J�i��#?qG�E�<��������͜���q;�m@�10���F�)��O�j�/������P3�/��#f��=+]T[j��e`M�l��ն���}*���yv��D����n����e���SlGnO˶�	I|<�Z.�5`��;>pYHO���p-N�u~/���fi�- lX/(�����Up۪��:�Yf�t��oa��e`���<4G�n��SKc�q��y���a��n}�|w�x`�hI�;XF��@J�ڙ|��T�N,Q�#�FyF��7�>��#c�SD+���nݚ�:#I�wtL9�r�ǿ������5�+z��������������[����v���������쫛���?�Ɵ.?a0���¥۸�=�d̩��;T,?\,�C����H��en�w�-
�\d�b眽��1}.R������Ր4�}Y̋e��_<E~{��"`�5y��E��2�,&+B�'�BX��$���r��	r3N]�(�����_���m�jcʯ6R���+�ӯ6��ٗ�k�f3Sf���$[e�Ei�o���?e�>��KP̛�GvaUm�{r��ʼ�V��nK�yp^�]ZQI�t��I�x�S���s��N&ܦ�8�ə��00^���4��Nn��1��T�[��dZK�ۡ�-M��R
��G������c�'�[��e�"
�0�!���>SR�E�CG\�fPYТ,L��^����
�/���Y艤�����J�r3�j���� �  �W�x%D��Jl4����cd�ҝ��ܳ����#��z��3�ڊ�NBp�{Oe |?耰ؚz/���;�U����m5@��A���?%�nG}��gpd�2���֘X�^ź�J�@�J_���'���_ތ�~E�u��������zo�.�'����:���k���g��=��2�t1�Ը4�}��t
^v�4:�f=!�[�1���Uz���|�@�ƞ�p�e3Y}�<��V�����=^_&�c�󜦓��"�u�	��:ú��m��*hh@ؓ[���Z��k�ü��9{ۿ�w�ؚw� �gr�'�� �ej(���:��Ib_�]�a�)�/���C�
�����Ѽ��9������p"�}݌Ӽ�imYͩ嵬�mOy���n�yNSy�g���Ose;�=��V��s���/���4��Z"�>e?)yN�m���#�����p�xlS�8��o����K�)�U��Qn�˿A֔� �|J���J�;6�E��R��I(��<�	�����E��OU��O��- ..d�C��9O3g��_�l9�W��x���\xqwDjd��UFI�[�i�4_�+����atI�v�/
Rj'��[瀥�̈́7-;��ӥ�P�>;`�8�g(�!$֍��֣���6HO��׽��S�E]}�~���R�����2�Ԣ�^[k��4�/ع��b���V�R��b��V���h0F���?��'�a\�Q'`8��1h@vc��b���y���y<i���P���l��5�3��Y^��l�aH�SxF�*@�$4�]IT5F����#j��)�G���?�)��m�D\V3��[
l�t��R��W��I5ϟ츥/�ӬR�yB��&u��EgF�̭I	�[� ��?�óF��ۊJS՟����=~����Ԇ��=x��xL�Y������8�^�>L��M�>���Y\d.Ns��z<r�|����b��<��k ���+z�HeՔr�-̳=�#tdu�}s��Ł���x��E�-��&�O��>�g9�u��I�&�r輹��<�0n�_�����+�5]��&D@N�gA4�TC �>�k%<�1tQ,7O�A�a��/�Y��j��V�u<��5ԫ���K��?��Qs(;���Ax^w� �����G�X=��D�(���e�2{a�*$�����1��6�����zD�ք���`t�N�#͇���4LQ�(�o:��~����客׸w��^�e���~EH�&@��T��E�;c�A.Wk2�Yj�pDl���4o�$=�a���Ȑ��`u�h2`�9c�k�`�6x������o��i:t
٦=z<�KE�o���I`��֤�Pў���)bj��
a��?�9��a�F�P���C��ѓ��ek�9!���	���W��^Ћ^��&]�(�<4�\�=�U��9z�j�(��֠��Nd�Q�/�r,z=��4�~U~`>}�߷˨���LEnw{��ʷ�8�`h�WY��}V������kU�6��K�I
��x�\bަ�>1VR��6�$̂��R��6���2��:6����~���'������3�8v�}�v(i�/�5�=z��7/d����`RV�諍���������DV&�MI��UʴԆc�~�{�#'�z��6RZ����c�[���ʩ�=�hq��'HD���+��MM����(�������8�����d%R�Վ�O�[N��֘}���"�� O!V�:dPy�XU�ү�q�mq���Xy]x+\�k������ܦ�Es�<��pA=�G��l��M��}��h$ccX��z�$���Z�D��|�Y�wY�ò0I�����(8㢨n�?遣[qݾ,vl;�^�K|R�"�B���^�"��9v�8�ֽG}F��BW�����3,�I4<�Y���@��2�'�����~�������::3��0�s�e��u[&����b���&�r��ţ6�h�b�ʫ�-�:��_#��*��t+���ZU �����f4�Ŷ�F�'��K㉂��Þ.�|����`r��ps�g��[�~x�ZvTO�Ŏ��<ȶ�IL<"��:ՅZ!����L%��)*i�9�׷��~"yA�{-���y��l�M䀤��$�p}��3(����	8�^�8>ʲ�� l��d�_n3s��-�:��a|SR��Q)S��o�q��@i$&94ex߫M/p;������n�G��Uܽ�-�_���I���Y���q�ؗ|�B"�Q����+*�½b�d��~C�U��%>�Ճ2�T�f ك;<	s�OP���X��¸�K-� DE��Q���#k3z���G�?H�����K��z��X��*=�'�zqS��y��9�Ck:��2�]}D�/�O�Ɛ�`��9?���n������ѱe��e���]&�4�/(��"�����]���A�>?����;J�!	��	tG6Q�&������(��v�x�ʒ�9����xU�V���a���{R5y�:���Q�'�~K���I����L6�z�/�*`�Ca�G�Gm�2.k�[f2ߴ�7�o����|�'�o� �׆�-����d)#�$� ���]9�p7�v�������ZV�'"@+d�{=�-����E�{��穮��u"�����?��ҢX�=p�-�j`ۦLٓ@tK��o*������.�x�K9�����.���$�W����Y���VR���shCp`n����wr��)�ͻVد�k�Oq�oL� su�֦����Hz4#l��F��8+�λ�Ik���z��j�pX���i�8�-(�<�7T�9*�~?iz�����&{���6�񰔇"ǧbZOO�#?�z�#7z� ��/�!���^,�8�gT\�������S&���FQbbG������.�_��OWw���:v���<��v�n����dx�~'n�l�u�*<e%��{��-S&� �=�����in5yo�j��mB5R���*�j��t�õ��<0��7��Ǭf��� �hGۑ��wV���c7h4<�k�裆���Qd�K$d�un_���G�o4Т^�/�4k�S���/$�8�f��{&� l:� 87�������Dc͌��P~��=_O�5M��˖�0g�Ku7�2Ȗ<���8c���!f]�b)�A�1
O����6�|j��ϥ�N���ꮉ;bo���}��U$���__;㻞g���ٝ�# ��cK5�B��ot�ݎ�n����F��z<d��/ꉊ�n��iʃ�\�+��ߊ��%����������Z�|��'}��o�A�?H���A�E�ׄ�`V�/4 >�_�LPw�Ø���,F�B�>�+p��}Z���5�kP�m���ViY��9x��hZ�h Q�ۮ�E�o5��1�������^�m            x��]�V�H־�<E����t�C8���t��k�*#�*�-���<����b��U%ې@3��J����]���Ed,�i**�&!sB�I�9��8.9�ny��DN�l�
:JKQ��k8��Ȫ�%�M���?��w��;�UW7�Q�%���d�݇�eU�O�.s~�[�.~'��~��W>�����/��g��L=Y3ͪ��2޹,&G�H9=Xp:��  V8��n���^k��rY/�eV�<D��xN�X\��~���E���UNy!��,�!Y �����"WG 1}��x ��/�1��7���n������� �K>���F��f���) �d9
FF�+�怓��(�=�i��!o���</���>D���!�ɤ.Dnd��h���w����0k�%=�����:� �,G��TE�.���3������D���� r5��!������r�}��O�@u�8 �v��&d4MeA?��L6 r\�=	ۉ�w�>�Y�K-�#�,V�����.���W��1��N�.��T�FI��qb�ߝ���b�>v�P�piw�t_�ن_�e//}P��b���,�����A�70$>�-0v�l��m�"�@�b��L@v�"r��s��_D���b|�x0; "&c��t4�-�d��'�m�C'Vfs�0�������W7����3���&�	g`M�5�鹜7u�+��Ƴ��nV��h�=��?�%��u]����͚��]�e��,�����Y���^~��S`�4{?E�^�|������z^�����B���z|�����O �YV�l��O.dSե�"���S踛�'��	7ޅ��dI�˺��鲞6�2/"-#���Q�&��o����	��Q1����G��������	8��Tf����z�����Ο*z�p8!7=�)O�{	7�Z�- '��5"K�Q�u��3�a~n�<Bq��1�|'r|e)h�>�M�7$gu�K��I=�EG{갂�+���Z�/"�YƩ��'V���lB�N�oW�ӮN�nދ�M�r����Xz��E.�Q�tZ�E1(�2��"�!�����뼑:��.��q���Y�*�=�R�^�)�Ghx�UuL?ʶ�|Y��q�Ɨ�0mlm$�n�.9���w����g  �g�[��� ^�&{��p�g�N�G�K^�CѤ\�D�O�tWK���ˬJ�i�n���� �V�8�0�V�����\����7�	&p�T���D�!ɥ�� [�3��%{Ay��_���TE䐋��ot�0�I�;b򥞉�m `"�
D�a{�9�R�k<Oi޷�	Ҟ�0�~�C�\��F��n��<�A�����]O�|.��漡9�l��R�;6��h701�Ax�����ﺴ��x;x�`|!��E�؛�����(GD��2��V��I�z�������K��n	�����F�9H��lk�GnV����T��,oEa�F�>��^��P���N��0�8��"���J���������/R�.�_� �j�Xb:��n0��Q�	9��g=�%����ND��`'|��!c ���,�l0A7J�+�"5<�K��bE`"��ک�w�^= �18�+�a]�c��� �O�;���
�ܢ���"`�W.6� �w��%�M��Ĉrz�K^`���n�J���k�IЭ��s�q��]��|D���p�L�y�t@fG�`��:�Q��q��Z+�m�?��\J%î�;��m�ԗ=�݁��}�s��Cފ�k@�O�%	�7�N�g�C��k�ͯ�U��.[A�=��2L�HL ��� cƪ�% �������z�{�L�2G��cz�	���5�����~��,I���:��2,Na��R�`X�nR}�.�"h��
2��U>��3h���0|l,2�۹�TYǽ�(���*$?�a{���N���m��Rv�&Y@.�=S�'��&D� ��id�-�;�#�9��෮�f	Đ��i�tt��N��E�uq^�a�w}��,�Mf	�%���+m�a�ԕ��yW�ھΖa �����'�����T�I���L����}�dՂ�#���g��r��P�r�Z�҃?�l�׷oV�l�NL&���0�����@\6�Z�<��k�(nZ�jp����S���C�M�}���Ss�.d3嚗���c��ɻg���O��J�"�<�D���#�	��ef�u\��;��-9����k�]E��j]�t��r�C;���u�y�N���c7��<̲
�P�`��n��?v�?�&h.9풗 MӜo�pb��3Q�� �vQ�3pm*4Uu�`�-ں�[A����f�v�Ex�N���ò0��-�7Oл�L� ��WUY+8VٖYQ}VS��cp�j>��H �r��\P����6Acd_b�^vbY��n�H6�z��C�+^����mm���i��|l���
�Î�J��&�����i:O�5����!�ǔ�67C�XdV��QH�d�{Fau�����"H�Ҡ<l;��zBz�����D19�P׺3$c��}��b��]&�J5��Ǣ�+| (��!�-��\U�S�ʾ�'p�᳉g�KF���:l��U4�غ����H� �-��8m��&�И�*��c6u���*p�OLS��UU���H�]Ӎ}r.
��6H3:ZJ8�5�������Z�	|G�u@�T?4������]R?TW��Y1�s�'�D8,�S��6]��|Ȋ�#��uE/y+� ���zzؠh�E#�Ya5��3Ƥ�&��H�!�EȰ97s�bP���ЙAb�&P	�a6�kdF�D
߯Z��o$zY�.��8벥K>�J@��4ơkJ�6�-���f�޵��e*�.�g���B�Y61��Kњ�9�%�s����C�Kr�6ɖ�#�ߢ�|d!��5U�&��������x�ć�X�q.��TMʓI����d����e����U��*S���/K�Z*O"��G?�6O���#��b�����d�%1�q"5�^�cX���Ma��ܱE r�U�>
+cE7��1m��n@��w"�ʽ��^:����@9�7�l(�Һc1F�<Q���X�Hd�.�LL��~V�&��e��������Xt�\7&�0Sn��@ՠeKh̰h�C��*e�	9��_,�YV,�U?�Y�|�<�Q��D\搱����m0�>QYW�|Vs1T�5� �:��%� b<S���a{�)����12Z�F�+��pp��\����1�\������yS���XY�/�M�0Q����>��T+L�{6��~�j=����w\��`���پ��J��1�W�"�_�5>�H�>t�Mݚ�w�Zҽ�8�D��ʞ�Q��4�;;[wEm��Q�c���B�Ӽ.�_�+��O�}]�#��+��R#�<<�E������EUFsc>��;@,��8ό���\=(��Gk�=N�OFpr�<0�a�Tu/N�{�OlE��~��`9��%�rȢ����	���
<�s'�q�;�m��=��a�H��췞�숒����X�X[6_�����xKG7�ث:R
�MR�V�	�C���f�9��[�F�Z��v!p��V�S�x�]�$6r�v3���{^���x�)CB���[Av�9�rğײ�������m�5GM��-I��q�cKˆA�� ��6srU�U���l�����b�g�2[҃E�Y���m�����Y��C�Ks���%ߘꀻH�:۲���(�����'��%���X��P����ೞ�<[Of���,>{�d�Qc���狼��Xc"���_f���j����.����q�+�|-����TT�~�׭�KEz|��{�QY���TEB����dy= �'8��.fFn�T��H[��4j�GYa1��EE@���`�z|@z�V\fm'7���\{*Ts/ޯIx5zπ��"2�+A��}oB/E{W���j�S4h��x��WLEh� �  ��gn.�i��>�a�?��L��y)!W�m�eؤ��^��}�pJ�7;?���,���9��k_�U:|�R�T���
�����E�F�����7d���ET=�w���O��� ܗX��L��g�Z7��L�����ۭ��kV�:X��qg�h�m�~6��̷��L���ٍ�NSI������Y�- �f�� ��S�MkM�a=/K����+3)$�﹞����>��g�Av���>W�oܱj�g��7@ف)&��TU��78q:z1��b}� H�v����Zs���݂�-K����hvш���c���Gel���,��IE����]�*��_$;n���	��w,*�7G*+�~A����3�.a����S�+�
Q�D:X�'��n�Z���t��	�J����:�y�*�\D���Ϛs���py�yVm_���� ��b�Q�F��[�sڽ�Lx�i�������v��ɤ�tqg�xCZ 6�%�<QM�����Ӱ%1z���B��?Cd�f�]Ԯ����q��%��C*���5�!ĉ�K<�Wl��#z樳�3us����{�Q�όl�>ٗ8?Ej7���Ƹ`�>��;(������bL��y]7w����l�
}����%?��n֫$��a*���� ����w�گ�q�"���f�Yֈ��v�K[���1������\��9:�}P{��S�s}��'!r^��K���ޖ��C�n��qG�Ue�@@������+�p��[�>Ap�L��2���m(k)g�)�N��He�Yc�rY��{��*�n<�i^�z�x#sn���G\,����:>=�+��
k)~�]K�Z��g�]K5��q��RMe�-��s!u7��Ì����O���I�I3�@��g�J-m�M`�1<�S��&R�Q˵�-��<Y�b<ۣW5�8�w�����,�;���F'<��80�i}gQ�nk� �z�nJ>���f|�Y��˨�v� �����f��������p#i-�\⺥��&�m�T��Yj�T7�l�hp�\�9��p��z��Q!�x�p0Tu��9�-T�� l��= �鷺9بF����β�s��޿W�l�9�ȗ�\*����������b�A�Ǥ����=%�[�g��V���h�"L�帚�cQ7Y�ƅ\M}��r*tu*3-@�wqŢ6��]�8M4Gm���D�j�^�s����í]�5�۪r.���Z.6gu��de��I7x�5Y,�'��N��ۺC�+���8�18�c��q(>�d�t��k��t󼉗n֮c%�Q}��`?kԼo�c}��� ��j���3��Fݎ�Gk��]��B� 	�n�w���<�1�k)SN�`��MWxdZ�;�����_��pU@�`�ʨ����"��
�Q�c�� 7u����YXr�+OO�VS���_�N�+k'�s��=��қ:8u%p@K�`c6��p�T��dE.AQ�,?뫲��N�.�X,J~g�=��xVxU��[1V�a�$6k]�Bުr�D/�4}�۔���W�@.��ϴ��u��6��b#r��u�_\�MJ��������������&(:t(�7�MǕ��h��u+`��(ݸ��ۍ�g�o�)��m�5U��ĉ�L���	\�y>��#m�s������ػ�K�$���?�޽{��ht�|      	   n  x����N�0@g�+<����M�d�t@EB˥q�I�Dv����_�%�m�F�
��z;�w��~2�h\fM!�
]�i�@!�h�6d�
A�H�&�Rg����%TĠH,�B�$�ܐ�0������U�@t�#�#���� =����0WB�!njP8-���Զ@op,N�F-(߃���&���Id�Ǔ���"x"^ #8]oW�Zfle#�S[�(쿷m��CD�'������FCm�gi�+<j�Z�.�Q`Vד�'��W�=ܡ�줌2F]N�(t�b��\~�V/@,V�	��z���^�g��ӎ'��'g���}3B�ax>wu��˾�%t�&���'%]�6���X�����y8�����m         J  x��\�r�F]�_ѫ)�J�� �5+1�I�+�k6޴L�� �,<�Ҭf??1�2�2_2����$(�JRG6��꾏so7ĭw��\�)[��z�IE�)��Z�j?�>}����և�z���tY�lfe.{��j~V=�?�L�c]�3J�G�}�+A�.����*L6��b�Y�H��I�+V�Y,�
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
�0�s��L���p�Е���oL����'��)�{,��w\��~<L�\H�+7��\��9�N�_�y�t0���s��A�NJ�K`O��C�d������}�ᰩǢ��)uF͵~�3g�ܲo�d��mr������l����k��=8��a4m�}b���      $      x�3�I�KO-\F��@F6W� aA�         m   x�3�tJLI�S-N�H�4�2��I�MJLOTH�M-��+I� 
s:�E��Ss�sBRsK|3�&X��Tl�j�wbyb1�~�Hi^Vb^:P�~�i����� rA�         Q   x�3�tJ�K/�K�SHI��O,I,U�I, �%�q�rq� �ٙ
�y��I u@Qc�м��l$A��t�Ң��t� ��         �   x�M�M
�0�יS�	�z�@)%]���)5��%?���N�����U�o4��L-ML.��Q��QA�ч�F	�8J�2�k�.�z���}�ք�>��vɢ��%ek��a�}.~A��/Tऺ��d!�?zTF����� >:�9      &   g   x����NL*-H,I�S�IMJ��4�2GH�KIM�I�KJ�qz�$*8g椦��L�T�AT�@T���H�B�BqC.#�:d!C4!�!9�%�y@�=... �H5`      (   \  x�M��n�8���S�	��^�P���f6L,��ElA�~��r:��G�E������&�I��>��x2�&S�w�ܼ;����zpa��r�u�|�ǿ7Y�
�-���w�����b�Cc�[�
���.s++!��A�^����ͅ{𺘛g����N�B=w�:Ri^t]<�2�n�U]�͛]\h7��yѠ�ɜa�e�9��ҋ�)��M��* ;�=�/̏� {��y
�2��pT8�t�4k���7Gh̳�&ǟ�1�xrײ�<�+�RH��bW�M�����vn^l7��0�1��4�v��"K V��ζ� `T@��!�FF���Z~�R�Xɉ�Kz�C�)��&[�.{�.�r��<w9��@�hEW!�0HϖWJ�U��6g;��K�ؘ��P�a%'�������H�R�Dad��`Vz��s��� �R�߸NO&���Dbš�pѾ�� P��A"@���+���?	i���-S$C�~�W)l�Z�1ذ�H�BTn��V��I4~{	Ѯw�ߩX8(��=��B�ũI��fZT�t�O��d������E��ol̀��2�.q�-6k��2�d�1�es�Tհ���Y��q>~�n�g��O,H����V�̜��y���Փ�6�e���{�Y����_�C]�,�fO`q���Fb��Fj̓]�n�Rs2����I����)x�C H��J�:4��	�u�������\ܶS�ߨH̥�aD����\L��t;A�_��WVaTH��nE���G��'�.LZw��E\4���Jg�����Z^��lN�0i�p_�1l_�⇉
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�         �   x�m���0���St�Tp6�cv����R)���{�5X8��n�oʍ�Z�W��@�ߪ`��C�\�E#r�1��T]fK��/���;���q�}Pd�x���6D����ߋa�Z�����帗R���1�         m   x�M�K
� ׾�ȴ�_F����?Q�
�=2���O��[Yj����5�(��,?�f河<g�4Ԑ��pD�w��:LۤG��I4󝐛e��&��
6���=         1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      "   /   x�3�LLNN-(IM�2���S((�O/J-.�2�,J�JMI��qqq �i          O  x��T�n�0<k�����_W#@k�t(�K.+��iJ�@�(ܯ�R�]Ul� -|����ݝ!-�\Z_�3� +���Ri��`xn���e��S�W=}�քww�Ds?�|̿牀t*y�������度�*o*v�X7qk�=�[��b�k��@Z��8����[v��C����1��r�D��y�fZv�R7C����b�AhC������}!��-���^�ZI��!˩)�����]f��*��t&��Na��w ��X��Ks���InQ>������I
���C�>%DN_9&�}���]@fQ4/!���y������Ў3r�臕{gU�)�,�-TRXM�^ _�T�^\t'N��$K��J�qʅn���B��M@��[^�T���΃F��-_H�\8�g�"��n^���Z��3cB�3ֲR�ʰ^��Rb�N�����6h��mM���Z۳�]���p����d���1Nu������9�|J���*"~
i��PEt��sH���tא.�EA�/�"��.h�uT� �MsXGc
Y��X@&���4*� ˒o��jt�=��7�$O���	 ~�Ua     