PGDMP                         x         
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
    public          postgres    false    205   ι                 0    19164    data_pribadi 
   TABLE DATA           �   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar, eselon_2, eselon_3, eselon_4) FROM stdin;
    public          postgres    false    207   r�       	          0    19171    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    208   J                0    19179    jenis_dokumen 
   TABLE DATA           n   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen, role, status) FROM stdin;
    public          postgres    false    210   �                0    19189    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    213                   0    19195    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    215   =                0    19201    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    217   �      $          0    19514    jenis_lokasi 
   TABLE DATA           6   COPY public.jenis_lokasi (id, keterangan) FROM stdin;
    public          postgres    false    235   ?                0    19209    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    220   m                0    19215    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    222   �                0    19221    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    224   K       &          0    19527 	   kabupaten 
   TABLE DATA           =   COPY public.kabupaten (id, keterangan, j_lokasi) FROM stdin;
    public          postgres    false    237   �       (          0    19540 	   kecamatan 
   TABLE DATA           >   COPY public.kecamatan (id, keterangan, kabupaten) FROM stdin;
    public          postgres    false    239   b!                0    19225    layanan 
   TABLE DATA           �   COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa_p2, pemeriksa_perbend, pemeriksa_pkc, k_seksi_p2, k_seksi_perbend, k_seksi_pkc, k_s_seksi_p2, k_s_seksi_perbend, k_s_seksi_pkc, k_kantor, status, nomor, j_lokasi, tanggal) FROM stdin;
    public          postgres    false    225   �%                0    19231    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    227   �&                0    19237    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    229   T'      "          0    19439    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    233   �'                 0    19243    sub_jenis_layanan 
   TABLE DATA           M   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan) FROM stdin;
    public          postgres    false    231   �'      5           0    0    data_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 365, true);
          public          postgres    false    204            6           0    0    data_pribadi_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 291, true);
          public          postgres    false    206            7           0    0    dokumen_proses_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 109, true);
          public          postgres    false    209            8           0    0    jenis_dokumen_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 302, true);
          public          postgres    false    211            9           0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 18, true);
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
          public          postgres    false    228            E           0    0    status_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.status_layanan_id_seq', 1, true);
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
       public          postgres    false    231    217    3152               �
  x���K�n7����+H(v�N��	���
�J�S.��{�׉�͠k9�L:��vV�رo�EL̔�9��ǯϿ������~���~�駿�������^$�r�/��⫋v��JN�B�{1���߾����G{��(͟�S�L"�K1S�_!s{�#�����������l�N��,�͇�b�&��ҝk�9�Hķ�P��A,�c��E�UE�q�8�e9:�"�${�n>��E�}����e��{q���Г�R�_�S�?y3ĊM+�Z�o/a1A�웙t�
=0��q�ofY��7�V���r*�l�}sT.$=�݆e�زe�T��������E��:�L��AXOv�Mũ��S
�AXS�FO�?���¦x�ܖC�aM	�][����E�򙈟��� �U����kJب��g$�'"�1k�0|�~��n�-a1�,H#��AXa�T����k�� �!��%@zH��1\��4��|@��]ª֦�ԛo>y��AX���H���� �6��I%�\ª&||p�ȆUVA�:���a.a5۲	�ٲ#�AXU�$t\����5�bVA����l6������&�3�rq�AX�fy���WUV�A2b��� �tó�׫w͠�&.E��2+ռ���	saE	�
fh�D[Ċ"&xj���]F�j0V�n+��be%w��V�B��Z$����~�AYee�e{���e\��p�/�w��jp�W$��������n�E�}�5W�����:�E�+w5P���Sg���Z�]���v5X�ygUÿ;d�e�6HK'u��m����w#�MO����d	�f�''��O�s1�{R�5�Tz�C+k�WV��)���`��.J$~����lʏha���V>��]c��j�ͣ�f��ה�H��V�5V�ZM��h:��#?�<XS��n�F�ZV�D&k4�K@�}W���Q�Di��g���j`�F�BK�a㽸o1H#D��j�GV�@#��EV��o�������i�:��e`Fl��oAJ��n��b��u��#���T|���.�oQ4�Dbm\(oMd���ψ��6�v�FDp�rB�[�&Eo��O�6]V�fmd��+�e�v[sӻ>u�.T�M�I=B��ԺK�ZI�:�H [`�&]�3�2�ҡ҅3B��A�u�.T�M(�G=Aw�B=ۋ�S��y�@ݡ�l�~�~k�~��Z�k���`�TyB%�5��';�8��m�0�"��bZ>�[tI��������7����V���_����_�o�G�,E��_������w�u�����$GT�W7l���SX�ܢ�(k�Z�ǵ�;-[�c·����禵�Ad
��]��@k���+�"O�(|�p���X��g��H���.\s�����{r���+3�Ї�h�|Ǫ\*�����)BnuK�z-`w�ی��,��c��P�M�j�e1\�L�jҶ[B���*W�W*uV�M�j�u�@? ����,�ű�s�f�S���2τ��.��]�j6��Hwk�Tܭ�j��W� �h�)��9}�h�Ċ�\	�@�&|L�&��G���X&<AMf{��f�P��OG��R�:�ʉ�I�߇�������uݶ�I(�'SU7c}�xIJ�=���9�z#I8����[MP�4S��a(��υ��kmO�Z��5X#���ݴ�	����b���#"��ih ���\�P�!��G�XCe�F���U�5��6��k����ֲ'v��P�m������ЕQ:�1k�^!'���5^��خ��kh�H@�+��`m��)Ě��ZNZ(~ho��`�Wk����Ǆ��`�W\�sO�I�j�fm>���s2��(5^��}�]��m���,*cw"*^qn_�Rk��(G�M����l=9r�f��q1(�>\�N�#���71}"ch߷F�b9��E���iT��y��AX�F�������d,���9�-���dزA<5��/�T�'���G�͸c���Y�u=�?��Ra�?8�s��b�^׋�zu�AXY7�H�#h ����y<l��� �b�2Gb��Y��kѷ��eWf�������x~�
��;�!��(UV�(�H��� ̞�e� �q��� �:���4G��l���Ws a����8*�kX�YG6��	�4'��H,^2c�1)r1C�qj̓����p1��)Z��O��d�BY�GbfcJ�ɺ8����H�E������d�Y��gC����ˑoa6�VTw0�C��S[cJ����z��^@6���|b�X�f���� /3".Ɣ/3X<�\�,�0��k�'�� �`"����=^�|2QFx}#lE�H�l��Jz�F� ̆y�#vq�%�b��uȓ���#a������\W��� A}�-o�'�]�lh[[�EϠ����o�$�l1 +�^[�� 3�I�hL"'yl6���	���n��ŀ}z������y�ѧ��5�!�>&4.$��KB�b9���X���k�t1 �iU��.$Ӓu}M�D#�[?�9�vɈ���V�A��hȽ�l�kf���ㄨ�A:�"^GTG��W�U�mF���V�Ya�H�+aX�D5v�'�_�ūخ���
�3��V<���_��[�֭o���:7����=h�k��àz��ؒ����9gO��*�R�?�	XF���_3��_3�f����u�u
9��A-����eF�0��τ�X	���u��&�F            x��}�v�8���)x�;YK�	�����?Iى�rw�g�%12�j�bҞ���ϓ��@$%��מ��t�86
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
�{�%�pk=zw���Ӗm.�=��� [��W�cv`��1�K�Z�	P��/�^l���&jpP��(�����&�O�0Q���[E9[������<\��h��14�+��z�C����vv�Ľ�0�~:T�!��POT4��ps]�)Vfp�l <�~��j�X���kR�z��7�k��:�E��� ��a�F���	����'4 >�_"��4��13�E1X�8�<�=�W�^I=d�����A=��)�o����K�h��<�� ���M�U����q�KT�Or�aM��>��a�Yx%�ze��v��U�{���<2�Z�/dd�����������ع�            x��]�V�H־�<E����t�C8���t��k�*#�*�-���<����b��U%ې@3��J����]���Ed,�i**�&!sB�I�9��8.9�ny��DN�l�
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
�Q�c�� 7u����YXr�+OO�VS���_�N�+k'�s��=��қ:8u%p@K�`c6��p�T��dE.AQ�,?뫲��N�.�X,J~g�=��xVxU��[1V�a�$6k]�Bުr�D/�4}�۔���W�@.��ϴ��u��6��b#r��u�_\�MJ��������������&(:t(�7�MǕ��h��u+`��(ݸ��ۍ�g�o�)��m�5U��ĉ�L���	\�y>��#m�s������ػ�K�$���?�޽{��ht�|      	   R  x��ӿN�0��y
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
�0�s��L���p�Е���oL����'��)�{,��w\��~<L�\H�+7��\��9�N�_�y�t0���s��A�NJ�K`O��C�d������}�ᰩǢ��)uF͵~�3g�ܲo�d��mr������l����k��=8��a4m�}b���      $      x�3�I�KO-\F��@F6W� aA�         m   x�3�tJLI�S-N�H�4�2��I�MJLOTH�M-��+I� 
s:�E��Ss�sBRsK|3�&X��Tl�j�wbyb1�~�Hi^Vb^:P�~�i����� rA�         Q   x�3�tJ�K/�K�SHI��O,I,U�I, �%�q�rq� �ٙ
�y��I u@Qc�м��l$A��t�Ң��t� ��         �   x�M�M
�0�יS�	�z�@)%]���)5��%?���N�����U�o4��L-ML.��Q��QA�ч�F	�8J�2�k�.�z���}�ք�>��vɢ��%ek��a�}.~A��/Tऺ��d!�?zTF����� >:�9      &   g   x����NL*-H,I�S�IMJ��4�2GH�KIM�I�KJ�qz�$*8g椦��L�T�AT�@T���H�B�BqC.#�:d!C4!�!9�%�y@�=... �H5`      (   \  x�M��n�8���S�	��^�P���f6L,��ElA�~��r:��G�E������&�I��>��x2�&S�w�ܼ;����zpa��r�u�|�ǿ7Y�
�-���w�����b�Cc�[�
���.s++!��A�^����ͅ{𺘛g����N�B=w�:Ri^t]<�2�n�U]�͛]\h7��yѠ�ɜa�e�9��ҋ�)��M��* ;�=�/̏� {��y
�2��pT8�t�4k���7Gh̳�&ǟ�1�xrײ�<�+�RH��bW�M�����vn^l7��0�1��4�v��"K V��ζ� `T@��!�FF���Z~�R�Xɉ�Kz�C�)��&[�.{�.�r��<w9��@�hEW!�0HϖWJ�U��6g;��K�ؘ��P�a%'�������H�R�Dad��`Vz��s��� �R�߸NO&���Dbš�pѾ�� P��A"@���+���?	i���-S$C�~�W)l�Z�1ذ�H�BTn��V��I4~{	Ѯw�ߩX8(��=��B�ũI��fZT�t�O��d������E��ol̀��2�.q�-6k��2�d�1�es�Tհ���Y��q>~�n�g��O,H����V�̜��y���Փ�6�e���{�Y����_�C]�,�fO`q���Fb��Fj̓]�n�Rs2����I����)x�C H��J�:4��	�u�������\ܶS�ߨH̥�aD����\L��t;A�_��WVaTH��nE���G��'�.LZw��E\4���Jg�����Z^��lN�0i�p_�1l_�⇉
��(��|Ԏ�mE�Ɛ}�ޮj�Z\��Ċ��w��]u�i���׽���^Y��a1҈i_=���'�ԍ��s���cs^H���u8B��^B��C�W1�����6�'ؘ±�H�LO��h%R�%UR��.#c���}�S�q�P�32��c�"QQ�5Ν�/r��[:���^�ۜ���)�q�"�'{<@�}C��d	�q��U��ɶ{��/6�]���J��fsD����qCM_������K�λ���0������pb�!p,���rR���x��,p����p�ϩc�         �   x�m�э!D���k '{LWA�����D�.c?��\�����I� ��F���|H0��vv��&	Y�)�I��۔x&g�%�n�Yj��b�v��F�Z�l@��2�r ��eg�j��0��C9�\<)O���kdiT��a|_K�(2��_T�\������*?kEz_����|�ǔ���^SR���J�FoRH��{�%��:���U�	�ߣ���Ň���b'�CF��U��%>c���7��         m   x�M�K
� ׾�ȴ�_F����?Q�
�=2���O��[Yj����5�(��,?�f河<g�4Ԑ��pD�w��:LۤG��I4󝐛e��&��
6���=         1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      "   2   x�3�LLNN-(IM�2���SHJ,I�P0�2Bp�L8�R�R�A�b���� �q�          O  x��T�n�0<k�����_W#@k�t(�K.+��iJ�@�(ܯ�R�]Ul� -|����ݝ!-�\Z_�3� +���Ri��`xn���e��S�W=}�քww�Ds?�|̿牀t*y�������度�*o*v�X7qk�=�[��b�k��@Z��8����[v��C����1��r�D��y�fZv�R7C����b�AhC������}!��-���^�ZI��!˩)�����]f��*��t&��Na��w ��X��Ks���InQ>������I
���C�>%DN_9&�}���]@fQ4/!���y������Ў3r�臕{gU�)�,�-TRXM�^ _�T�^\t'N��$K��J�qʅn���B��M@��[^�T���΃F��-_H�\8�g�"��n^���Z��3cB�3ֲR�ʰ^��Rb�N�����6h��mM���Z۳�]���p����d���1Nu������9�|J���*"~
i��PEt��sH���tא.�EA�/�"��.h�uT� �MsXGc
Y��X@&���4*� ˒o��jt�=��7�$O���	 ~�Ua     