PGDMP         :                x         
   siapkaban2    12.3    12.3 s               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            	           1262    19143 
   siapkaban2    DATABASE     h   CREATE DATABASE siapkaban2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE siapkaban2;
                postgres    false            �            1259    19144    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false            �            1259    19146    account    TABLE     
  CREATE TABLE public.account (
    id integer DEFAULT nextval('public.user_id_seq'::regclass) NOT NULL,
    username character varying(255),
    password character varying(255),
    role integer,
    status integer,
    d_perusahaan integer,
    d_pribadi integer
);
    DROP TABLE public.account;
       public         heap    postgres    false    202            �            1259    19153    data_perusahaan_id_seq    SEQUENCE        CREATE SEQUENCE public.data_perusahaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.data_perusahaan_id_seq;
       public          postgres    false            �            1259    19155    data_perusahaan    TABLE     �  CREATE TABLE public.data_perusahaan (
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
    penanggung_jawab character varying(255)
);
 #   DROP TABLE public.data_perusahaan;
       public         heap    postgres    false    204            �            1259    19162    data_pribadi_id_seq    SEQUENCE     |   CREATE SEQUENCE public.data_pribadi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.data_pribadi_id_seq;
       public          postgres    false            �            1259    19164    data_pribadi    TABLE     e  CREATE TABLE public.data_pribadi (
    id integer DEFAULT nextval('public.data_pribadi_id_seq'::regclass) NOT NULL,
    nama character varying(255),
    n_identitas character varying(255),
    jabatan character varying(255),
    telepon character varying(255),
    email character varying(255),
    j_identitas integer,
    gambar character varying(255)
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
       public          postgres    false    208            
           0    0    dokumen_proses_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.dokumen_proses_id_seq OWNED BY public.dokumen.id;
          public          postgres    false    209            �            1259    19179    jenis_dokumen    TABLE     �   CREATE TABLE public.jenis_dokumen (
    id integer NOT NULL,
    keterangan character varying(255),
    id_sub_jenis_layanan integer,
    deskripsi_dokumen character varying(255)
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
       public          postgres    false    210                       0    0    jenis_dokumen_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.jenis_dokumen_id_seq OWNED BY public.jenis_dokumen.id;
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
       public          postgres    false            �            1259    19207    jenis_pengelola_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.jenis_pengelola_id_seq1
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
       public         heap    postgres    false    223            �            1259    19225    layanan    TABLE     �  CREATE TABLE public.layanan (
    id integer DEFAULT nextval('public.jenis_layanan_id_seq'::regclass) NOT NULL,
    pemohon integer,
    s_j_layanan integer,
    penerima integer,
    pemeriksa integer,
    k_seksi integer,
    k_s_seksi integer,
    k_kantor integer,
    tgl_request character varying(255),
    tgl_penerima character varying(255),
    tgl_k_seksi character varying(255),
    tgl_k_s_seksi character varying(255),
    tgl_k_kantor character varying(255),
    tgl_pemeriksa character varying(255),
    status_penerima boolean,
    status_pemeriksa boolean,
    status_k_seksi boolean,
    status_k_s_seksi boolean,
    status_k_kantor boolean,
    status integer,
    nomor integer
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
       public          postgres    false    233                       0    0    status_layanan_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.status_layanan_id_seq OWNED BY public.status_layanan.id;
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
       public         heap    postgres    false    230            !           2604    19247 
   dokumen id    DEFAULT     o   ALTER TABLE ONLY public.dokumen ALTER COLUMN id SET DEFAULT nextval('public.dokumen_proses_id_seq'::regclass);
 9   ALTER TABLE public.dokumen ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            "           2604    19248    jenis_dokumen id    DEFAULT     t   ALTER TABLE ONLY public.jenis_dokumen ALTER COLUMN id SET DEFAULT nextval('public.jenis_dokumen_id_seq'::regclass);
 ?   ALTER TABLE public.jenis_dokumen ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210            -           2604    19442    status_layanan id    DEFAULT     v   ALTER TABLE ONLY public.status_layanan ALTER COLUMN id SET DEFAULT nextval('public.status_layanan_id_seq'::regclass);
 @   ALTER TABLE public.status_layanan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            �          0    19146    account 
   TABLE DATA           `   COPY public.account (id, username, password, role, status, d_perusahaan, d_pribadi) FROM stdin;
    public          postgres    false    203   ��       �          0    19155    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab) FROM stdin;
    public          postgres    false    205   h�       �          0    19164    data_pribadi 
   TABLE DATA           k   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar) FROM stdin;
    public          postgres    false    207   u�       �          0    19171    dokumen 
   TABLE DATA           b   COPY public.dokumen (id, nama_dokumen, path, jenis_dokumen, pemohon, status, layanan) FROM stdin;
    public          postgres    false    208   ��       �          0    19179    jenis_dokumen 
   TABLE DATA           `   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen) FROM stdin;
    public          postgres    false    210   �       �          0    19189    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    213   ��       �          0    19195    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    215   �       �          0    19201    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    217   \�       �          0    19209    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    220   �       �          0    19215    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    222   ��       �          0    19221    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    224   ��       �          0    19225    layanan 
   TABLE DATA           '  COPY public.layanan (id, pemohon, s_j_layanan, penerima, pemeriksa, k_seksi, k_s_seksi, k_kantor, tgl_request, tgl_penerima, tgl_k_seksi, tgl_k_s_seksi, tgl_k_kantor, tgl_pemeriksa, status_penerima, status_pemeriksa, status_k_seksi, status_k_s_seksi, status_k_kantor, status, nomor) FROM stdin;
    public          postgres    false    225   ��       �          0    19231    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    227   ��       �          0    19237    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    229   [�                 0    19439    status_layanan 
   TABLE DATA           8   COPY public.status_layanan (id, keterangan) FROM stdin;
    public          postgres    false    233   ��                 0    19243    sub_jenis_layanan 
   TABLE DATA           M   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan) FROM stdin;
    public          postgres    false    231   ��                  0    0    data_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 364, true);
          public          postgres    false    204                       0    0    data_pribadi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 60, true);
          public          postgres    false    206                       0    0    dokumen_proses_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 49, true);
          public          postgres    false    209                       0    0    jenis_dokumen_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 294, true);
          public          postgres    false    211                       0    0    jenis_layanan_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 9, true);
          public          postgres    false    218                       0    0    jenis_layanan_id_seq1    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_layanan_id_seq1', 28, true);
          public          postgres    false    216                       0    0    jenis_pengelola_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq', 2, true);
          public          postgres    false    212                       0    0    jenis_pengelola_id_seq1    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq1', 6, true);
          public          postgres    false    219                       0    0    jenis_penimbunan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_penimbunan_id_seq', 1, false);
          public          postgres    false    221                       0    0    jenis_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_perusahaan_id_seq', 1, false);
          public          postgres    false    223                       0    0    m_identitas_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.m_identitas_id_seq', 5, true);
          public          postgres    false    214                       0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    226                       0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 1, false);
          public          postgres    false    228                       0    0    status_layanan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.status_layanan_id_seq', 1, false);
          public          postgres    false    232                       0    0    sub_jenis_layanan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sub_jenis_layanan_id_seq', 40, true);
          public          postgres    false    230                       0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 56, true);
          public          postgres    false    202            /           2606    19250    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    203            1           2606    19252 $   data_perusahaan data_perusahaan_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_pkey;
       public            postgres    false    205            3           2606    19254    data_pribadi data_pribadi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_pkey;
       public            postgres    false    207            5           2606    19256     jenis_dokumen jenis_dokumen_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_pkey;
       public            postgres    false    210            7           2606    19258 $   jenis_fasilitas jenis_fasilitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_pkey;
       public            postgres    false    213            9           2606    19260 $   jenis_identitas jenis_identitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_identitas
    ADD CONSTRAINT jenis_identitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_identitas DROP CONSTRAINT jenis_identitas_pkey;
       public            postgres    false    215            ;           2606    19262     jenis_layanan jenis_layanan_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_pkey;
       public            postgres    false    217            =           2606    19264 $   jenis_pengelola jenis_pengelola_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_pkey;
       public            postgres    false    220            ?           2606    19266 &   jenis_penimbunan jenis_penimbunan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_pkey;
       public            postgres    false    222            A           2606    19268 &   jenis_perusahaan jenis_perusahaan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_perusahaan
    ADD CONSTRAINT jenis_perusahaan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_perusahaan DROP CONSTRAINT jenis_perusahaan_pkey;
       public            postgres    false    224            C           2606    19270    layanan layanan_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pkey;
       public            postgres    false    225            E           2606    19272    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    227            K           2606    19444 "   status_layanan status_layanan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.status_layanan
    ADD CONSTRAINT status_layanan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.status_layanan DROP CONSTRAINT status_layanan_pkey;
       public            postgres    false    233            G           2606    19274    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    229            I           2606    19276 (   sub_jenis_layanan sub_jenis_layanan_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pkey;
       public            postgres    false    231            L           2606    19277 !   account account_d_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_perusahaan_fkey FOREIGN KEY (d_perusahaan) REFERENCES public.data_perusahaan(id);
 K   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_perusahaan_fkey;
       public          postgres    false    205    203    3121            M           2606    19282    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_pribadi_fkey FOREIGN KEY (d_pribadi) REFERENCES public.data_pribadi(id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_pribadi_fkey;
       public          postgres    false    203    207    3123            N           2606    19287    account account_role_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 C   ALTER TABLE ONLY public.account DROP CONSTRAINT account_role_fkey;
       public          postgres    false    3141    227    203            O           2606    19292    account account_status_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT account_status_fkey;
       public          postgres    false    229    203    3143            P           2606    19297 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    3137    205    224            Q           2606    19302 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    229    3143    205            R           2606    19307 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    3129    215    207            U           2606    19450    dokumen dokumen_layanan_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_layanan_fkey FOREIGN KEY (layanan) REFERENCES public.layanan(id);
 F   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_layanan_fkey;
       public          postgres    false    208    225    3139            S           2606    19312 )   dokumen dokumen_proses_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_proses_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 S   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_proses_jenis_dokumen_fkey;
       public          postgres    false    210    208    3125            T           2606    19317 #   dokumen dokumen_proses_pemohon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen
    ADD CONSTRAINT dokumen_proses_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 M   ALTER TABLE ONLY public.dokumen DROP CONSTRAINT dokumen_proses_pemohon_fkey;
       public          postgres    false    203    3119    208            V           2606    19322 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    3137    224    213            W           2606    19327 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    213    3127    217            X           2606    19332 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    217    3133    220            Y           2606    19337 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    217    222    3135            Z           2606    19342 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    217    224    3137            [           2606    19347 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    220    3137    224            \           2606    19352 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    224    3137    222            c           2606    19429    layanan layanan_k_kantor_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_k_kantor_fkey FOREIGN KEY (k_kantor) REFERENCES public.account(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_k_kantor_fkey;
       public          postgres    false    225    203    3119            b           2606    19424    layanan layanan_k_s_seksi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_k_s_seksi_fkey FOREIGN KEY (k_s_seksi) REFERENCES public.account(id);
 H   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_k_s_seksi_fkey;
       public          postgres    false    225    203    3119            a           2606    19419    layanan layanan_k_seksi_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_k_seksi_fkey FOREIGN KEY (k_seksi) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_k_seksi_fkey;
       public          postgres    false    225    3119    203            `           2606    19414    layanan layanan_pemeriksa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemeriksa_fkey FOREIGN KEY (pemeriksa) REFERENCES public.account(id);
 H   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemeriksa_fkey;
       public          postgres    false    203    225    3119            ^           2606    19404    layanan layanan_pemohon_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 F   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pemohon_fkey;
       public          postgres    false    225    203    3119            _           2606    19409    layanan layanan_penerima_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_penerima_fkey FOREIGN KEY (penerima) REFERENCES public.account(id);
 G   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_penerima_fkey;
       public          postgres    false    3119    203    225            ]           2606    19382     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    225    231    3145            d           2606    19445    layanan layanan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_status_fkey FOREIGN KEY (status) REFERENCES public.status_layanan(id);
 E   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_status_fkey;
       public          postgres    false    233    3147    225            e           2606    19387 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    3131    231    217            �   \   x�31�L�,�)O6O/M�63�v/�(2�(I5N���4�4�465�45�25�L�t7uɮ
�/�4�(��M��5*4)43�43������ ��      �      x��}�v�Ȗ�3�+�e�EQ���o�`[�d�De��]��0s  ��}��?�/�3D ���Zu�VfZ�u"���n4��.�<����v�m�"��?�?�}���(p����w���ȶ��$����,�yjM�x?XV����u����u���e�Z�#�:�v��[���u!��$�O~��-�uy��G��x�\��!г�'����O�� ��Y�-����\Y�l��\�`rw&�������Υ-���̎�d ?���������e��G�@�|4p����Q }:��~\oG�C�[�$j�>�s�����
��u��A\�Wc8�e��q1l|��s�i�����y?��2���/v�n���l���t�Dw�Yd�vY����#��=9r���e�$7��r��)Y��W��l=����to	�CE�xU$E���u���OդGAP�.�tAWn��^nR�5��~����@�� N�9M��o?{@��"����ݡ��e�I�x�c�#]�UO�٨}�@�:�=К�7�E��>&�+ֱ��M�M����s \��%8����Q.�'�IuUw��\_ ��Qd�#���\8��JJ������777��:[Y�	<��+~�of���"]U�BM����?��dmݧ�;y�EI��3$%³Fg���Y�M���.��x[~���27C Fn���M����n�� Y�x������2�Q!��5�����
>BA�@F
Ϥ��tVCֻx���x��� ����QTA��}���1oh��/� �X��8_��mc�.�7�'๸s��)�h3A
a2��D62����̌�ï���[�5�'	�lP �t]ݣ��A���$'	�Q�}_nQ,��2}�8��`E�����|\���J7�=��B>˶�&9X�נK�3;xf��-H��6���̭�l��y�:�m��J�G�&^��ά��Cu�xV�<�l:�_��jJ�)t�>�Uq�}���OV�>]�@j��8����}:���]��ub}J�q2P+�G�uG�A�D�*�����P��˕"�J����x���vD[
�*"W�߁1���u���sm�<���+\�p��xc�O.,�1PG�^�}�Aս4��<���qA�ū�c�d�X�x��g��_\⥻x�.)�tB��.�C�O�=��<3 ��?lg$�<2
��ھs���P����c55��Ʈ(g%n�l��;�Ș�nV��h�x���֡�H �U���7qG���DN\d|
��.�e�/Tl�x�K��TWB�C��� ��$ÊF�
X_7�� ��O)ϖ���|7$���{V��a�'��./����%yZ��r�����}�sE� �u<�6�'���G�mIf���{����t��({ �!6yH��`��� �-��]��~����;�E�� �ɞ�'�ߺM���ۮ��d�nјאJ?�-��=�"�T ����:�r�~������to�	�ǌ��Nv!�w&YM����e�mg9# |�p��;�)_JM�(7>ʶz>���d���dn�g?@�N�&�Ah�B�μ ͞+����[���V[Q�H�p���P#��u�ϺöXm�g��@z��;h����l�-��˧$C�γ�S�\	,* /�ᅀ^jf�^yd�G��@A��/����8�D�v�oZ#��[߂,��G��B/��$��(��~�_M���8@�e�P�s֐�����*6����vl��w�����m�]�NY�6?���w�#~�������-����#�e1� υ�&�M��`xa�M������6Yn�'颶�19?��O@��^�^�����~��"���9�  7������zTG܃Q^�]OoQ��	����=@�@��- k|?=�l����G o?޶�Α�[7e ���*��8F
�"_"��l�;d���������q�u���_[,ӫ@GE�Y{.x���H��*��zpn5_��G �q�g-ڐ�@t�B��Y���DE�v-Q���0��z��<�RN��A�+�GF�!�e_��_�:��d���� t5�J)öG�ĀVQ���r�t�O�jX�ś�t����\�"<ZH�to�EZ��6ijM�sF������I�١��-71�
i�):q��tN�F�B�b&�>̔�
&�.��%��pg� �/^k��ᠦ��B�In���%�O�cO#�[!��io�IQX��.�(O��,1jnG��2���>Pc	�f�ֻ�>3uء�o���_CWŧ�*�>�	cL ����4��!�����,0���� �O�q|��kchS��� `��������������#�D~8��@��;�o�X_��M�_��r�E���<[fk���7`A	
�?A�lE��:��#��n��EF��'eE9j��! �]�k��l��N���|P=���f���A���� :��T���_�����.�c?��'?��˙`%p�,�����A컹�Ädſ��ŏ,[0:�F�o��������iX��à�=�%�8�/�����#.J��Z��(���M�K�%3���M�������ل�$�6$������X@́��祘
[�-紮^vx�Y~�שUP�%���	`S��"2��y����=��.]����o�(u��H��<G����dK� �?�y���#����A���� ��!Jz� G�*�$�"��N���-��n~��yKj(�`����V?��ap��	#��#��.��s��UP��g��'�L�w���zH��s�d�з�:[>Bޣ�5�p�'@��n����;���h���?|��8�%`�f�I��)Fh_���[j�(�B&�&q�$����x���>�S��@�}�n�Q]�Ž�V S���Y��g�"m'��av�6��c�*��Z՗�櫎_�@I W�%C����P�YVy+�p�q��(��].�<�dC��� i߈�������HRa=�V���Q��\'�+���>+QW�����9R�ĭO��D���?"a��5ļC��.!e'�i����V^��Џ$.�}��d��x���]٘�'T��vw���e������ň��@��&K�B
�U.M}A�~fxH�3�(��h1��QR刌�s�)�OL�ӹ����yG<��v=]̱(	�kv)�ry���e	�V8��1�����Gv	�;ރ����u9�Ip�� �-_�Z�}N�Cg�8��+��oҨ�9�0����l�ҹU<%�~�8���`ă튪1JWE�
"Dp0��j#�j��r�7���N;�!��B#���_qG�\͂@�S�c��z�`6�+/�:��f��CVX��*�>�f�L��̍�-y����p�"�����:ʊ���L�lx�9`�^g�cP�J跩oU� ne���<d�/J@O�k/��d��6�,]�F�L��5�6��E��sx?/�����/m�)P?`�����$� y���W:��叒�i��ғ=��$^ء.~�WF�\�EV�_��ݼ�+�������D�c��β
ym��'��k8��\��<����J"�Qe+�o��2���r�6Γ���2���W��/�i���;�U؃�2�xx�˖�p�
o�|��u�)�@�'0K�����
)���m�iM�2r�G)z\�E�	�^=��c\9����΄W8�len��ܫ��k�i<+�	h�o	�� ��˰�Y�k���e�:>_���DA�\�˾dY+����K�z2#��d����z�-�
�]�3��J��w�O���1�LQ�r^ep�m��>���ߣU����ʇ@?/6��t��~;��;h|Yh��3�E-��d��NQT�
!����T���q����<�&�a V���T��pٛ3�P��U��w�O@�*�#�fl �G��;�T����a��Z��t_��k�
�X%I����{N'm*]W�F�[����)(�c,P3Ą���DL���[����a�    �1�`�@~�v�,�3��Oѐ����ŗ�1�Խ�bJǽ�%ম��5gyY���5B����[@�~7��Q��O�"�K��<%�t���ߧr��Hp�.��7�-��F�iJ�+B�}7��C�k��?�?/��s�	�@��t�����u�����8�KPʯ�J�.&	|��f���d`�d_Z������퐒�%�&�v�-`�ɤ_�-*��@�3�K7��ö*�(�^��@ �b�E��
��v_�_��~�vk�>hHP*{�� ���.E,�Ao�\�'$U@E���Ԛ<�u��E�1���d�ԔV�L�Cxj����|[�~�I�Vs���
�V�ř1u�x@�Ʊ���U��������)�"��{�>��j)#/���c���=�9������:3�ULo��gۊ�ȥ�E����EÈ���U��Q��9i���'����\��|Rm9�ҍ0�a��&ڥ�
]�Rk'�Bj�x�Tu~����E��!�%�>�F��ؙ .�$G��Y�r��s��M�� �u�j8����LE�oז�Eh��#Is`K�|���v�S-�ZR8T�1�d}? ����v����w�D��=lt���#}ʵ�<��w�R�Q�Xr�'/�s��N��� �-�����c#H����_�R���/6)�eM�N�9��Arg�������y���z����Pb=`��ɰw�^���/k���/\��=�:B��K.ߤ`�*��9��-��d�NA$M憐Z>��[�MC�R�~���l&\H�W�˘u"d�剩"0��ܺ{ؾ��\O��W9Moh���[�VbG�vO�^��I�z�}MgIκ-yp�G�}�m(��P�G����61kxN���ޚ�膂�e0�.�rU�xf�؂��Q��
���&�ܶ+��f�BV�
Y����� ��s��d�}����Pn�H'�!�`�v�YY���S|~	[��`��Ӱ��N;�n��������Si[�c�H�S_At̶��m���1���>f�(1��d����w�nb���n��>ƋD�@�e��w)@������6%�\]�G��k��?zU�Ǳ�=�uXS�
ul�\�I��J������A���9�Rg}.�kW�#�8<�Ǉ��a�	^��� ��^ N�P��K$k���d�v�.?����c��ѪC���~�'ܺ[7���?����sC����֑�T��9Ͼf�����.��U�O����T�%�l]e�B���c�l'�g�ہ:�
t�=��!Y��� �c�d�l�ހ�R��Vႏ`E7���	��d���}���X'D2膘�)�cU��;,p���1�,� ���f��=2��g�*Q���q2}�� �����<.����b>��v�5�~W_� ��h��QjL��� ���	j�U�c��Wt��+���������Q�����$����$�`����9�\.��}
���(��D��x�U;<��!��䴵��u+�0�¤׿�n0��7�x�<�t�`�a����#�}N�r�%��E'"��_�c<�}�v�Fn�y$P9^�J&�u;���'�bS�z��,�q+单�5#����3�%�n�x���y&`F(�O�NN��\4�����޴b���O�|'����l�b�EG�*��@Y��S+���t�ǐ����^���#�Z�+|p�}��&˃�|�:x���GR*�֟�9(�܊�"����C+��2����u��8�JaJ.Y0�m;#`�6*6��7;է޼ƥ�ې�
ܨt�l��^o�~�vA�W��@f��^,F���rˮp	���c�kb2�ڇ��`:aޙkˎ�������3	����wx�����U*/��Sco�A�[��H��=_5|L}�8	 ]8�g�֥�{��iV�f�����!�55J��dT���8-�bhycn�.z|�:4��W,J����T�x�HT��v·l��� ��c��O�~i]�q{��7�]� v��D:��?�$�WI��(��ipp,g���U6�Z����@zNW	Թy7RG]e��;����I7��A
�4���C�HW9��o2��̐�Q��0r��ڷ�lE=���Q$Bi`L�y=7rJ/?&e��;��a�s�?�	&2[?'��8�։Ea�l7�r���el�o�x�'����K���#��#.�f$����2�[�+����a<��.<���)�Y�]�,��#WD�cH�5R W�*�9=M�,��8��'L����{9֭��ՙ,�_(iQjw�Y�խR��i�C�N���@��V��lq�LU@��n�]2O���	��;�}��ZcLā䋅ٗ��������~�$�뙯�x���}��ՃPu70w������7���]���u��5�b�=�??��'C#ҭ���9<{�N|��Z�:�*G2�)�d�Ͱk�����_�d�D�U���!��Ϛ_b��/��|��w�^G#ߍ^*٪
���aUqB11���0��O�����י�R�<����=O���嫢j܅�W�W/�#{,N���G#vq��ɱ�!�_E,�8��)B���xy�� '�V��$?��H��1KA'�_r����U%]v'L���mQ3�4}��.����*�**�f��b�sXi����(<{�0��C�,%�O����>a��^�N;8�/��"��c��X$�m1���Y8�mh}�l)ݰ��}�<%�f�#ˬ�=���h��x��+��� ��>���fB���-��S���Nq��ˈ9K�1�S\��$�� �9�B����i1�3���9�OG��.��OX�4϶ߓglqY_��g�_�@��2� |u˫
���b�q+^�p�$���?[m7����# &��=�4�*��\:�LU�8q�U�Jw�j�U��ߘ��&=.�? M�ڜ�l�e��n���q�|�,b���y�lq��}�*�b�S&��< ���G���ݷ�r(�:�ϔ5|��ND8��6_r
~��vP����n���V��_� �֧N�n|xj6֨ S�h�dO'jӁtk���s�p�iyxDL����|ct˹.%��.U���3��N���&OhJK��#��NO�=u��I�=����;�W.��5�������·�Æ�� .W �3 ��c�����]���n���q'�r�A��*���nj��QY�5�.�l�'Լ�z�t9I�L� `�sx��+�Y�E�����X�K[�{��%�^O�&��:���{�"�	���e(�Qʺ6��d�,�H��A��6٠�A��P��Dpj���9�@�a�]"������+�K�Q�i�K�+TCKQ�LʜT��hN���3JW>%��gk�����_��e<X<�3��147���S�酻K�2Ot�w`�Ǧ���R�k���9 ��g2i���
쬶��.�g ݞc�e	�(���R+�"h}�%ƭ܂�.؞µQ�ݵ�rU>�@  ��T6ꝹE!k���'�{kS�M��c��+�(�P��/�a����P4|DgŖ=�PJ�\V ��߁��H�w���p`�ӛI����o���γl���M����e��௏9�>}N9���|>�e��qO�/��B�ㆹ�>�O��Rg�)�M_������Nƒ�G^�E��ϐ�©�W��l�j}l�=w���I�θ�\��*g����w�^&��߾f�5���d�k�o0��en~o��K����G_@S�4pC8a��
�V0Ӭ�j},r�B��쳗��չcK��\]i�j��*�]al�pZ�҃sQ�� ɡ�"\ÄSJU@�%�E�U�d��D�#i�MŖ��~�4�����|����O�bu�P�c�<G�a���=��UN�Q�z�v��3�l�]��I!Z�<O~<׮+*w�*s���޶�3��~��@��|k���HY:8 YTmX��Nt�&��5���N�\�L�y6�Q���O��f�.�?! ���..W��4�KO�*�qJt��X�~l�    �Ur�*ͩ�Qn��֩=|<��(K��q��TU��c��W��T�r�/�h�W�)g�쪧��;
���>�6�ΕK�N{3��s1���:}}�ܶ���W�l������K� n�������ļ`��E;�LU$�/��7�ҍG^O�*���T\�1 �M���*Vw;��=���0��XN�E��$��#�ПV�ܑ���]<_q$�.~�*��&��Ș�,��Xf��ͅ�d�<���v�5��b��8Ö��9�QQ�ZB�%��S��T>�鏁��`TZ`��r[�`Nv�8��3F���;J)����U퉪�����`p��c�~�ɜ/Ҍ�W��W��v�x��EDI����7��p�L����]��8��?�z��N�k�l}H1O
#�uFa`����~���_��5�h>��"7�b���楪v�J�̨~bF��x;�~�V~
��Nc���edX+k=���BE����!k��IE�G\��^������C�&�[ĳ�/�֔��x�8�gq��M���� ���S�Zo�y0)�B��� ��6�T��RQ���*7Kx!M�G���	�
<��<���S���|�y�S�bn~J��]B:hY/�`�^~�l�\]m˨]U���Jit������ֱ7֨�y�������@d�v�~�X��W�yu��{d�n��9����㙇��`��}>��|��K�9Gfi�*qĠm$�k�q�ݪ�׺�0g�$N�����&��X��TW�eUbb�Z��-#� ��0��k%7�N�u¡��I|ĠST8� ��*�I��	(���Q�j����J��$��j�+ūz��{�\�A2E򘑋����j*�x"�4��4:��*.��l��n�2k�}�[[b$6�H�-�=�r��M�,Q<z��5���<R9��
 ��9  ��H�a�#U	5���y�����<[��}�:|���l��o���?��U�S���g�(�Y�ר�����$7�M����Q����)���mv���O3O��:��D���}�^r���8c��������}����b�v��'���E_z>��$��<����e�6 �0<U�%�8�]�������S���q�kL�z����C����yI�H��7J��M���6�'kP�?bs�����  �j�p�]!���=���+���85-h[fd|�h�2��d?g1�vD���p�	�A<�-��������jq��5Q[�FDZW�D��JrC�Tm,�,*�'���s���{@��r�� v�Np�qS-Zb�|ؽ�Z}G��z:-�-���ߦ�/N�f�M �P�W��������|8�a]����'3:N}?�灆eQ&�}���i��,���+G�eJG������O����,�1E��m�ب�kN���5�h��l��Pߩ�KI���Ø�v�h�C�1�!q��"n��|7hw�u0,��{]��������U=4
�^e't�v�������!�F�Ҝ��X'�9���+�S�GF	�6�j����lI�SD�`G]�ac��+N��5:~eN.����ܻ�B��=�==�8w������}�ڀcA����=2j��;Z<���q�~�+�(Q��s�����m�﨡��m�\��V�M���f�D�M�*yZ��h���p�#��Ę��u>��Vઔ��6��S������֍ii���Q�SejB�	�x8Թ����l��T�
~��� N��A��`�=��;Mk����!��,�| ��4�Ih'��ۥ�����Fr܆�ն�G���K� +'bLl�e�`�=��F��xiB�����9�[�_�x���ָM�"�BR=p�H����>7�~Iq�BQnf)f��Qa�;�&�\�1i�##�Q'�-Bݿ��F�T���)�$�P�F�N3���`�������vNOW��^����߷N��	�]�'X"ߪ�P�&���UXU�T7	�Ɔu�����S5�v�އ���z�p�-U�U�s��j����)�_����7࿧��~3h��n��Bx��I֍���	 �#C:(��(gzu�7NhE�jqh�^�!��q�u��&�W��[s�=	�BP��q�5�z:OJx��l��EM��j���>��?Z���p��b��-~׃�1 �1�#�:){�& ��Udk���p���PM����s�����g��M��|�]�e��֊I�����#3��:8GI�*#�Ӎ:��F���\wQ�>6�}�c�k�EMC3��ڮ�Gd.{q�9�A=ܮSD*���O���}s���]L��-B�;i�:0c�s4u'�9<o�p���Z1��vUӀNU� |���?�z�YQk�\p��Ns�b�g�+���R��I�T`H�$T�V��1r�'�º�?����n6z�4�0<��Y�]��S3�J`�V�����_��\�4�{�[��e��5�4V`�Lo$;��ve�3V�r��|E�}�yҤ"%���)�<�j]�Ask�% RU��F��4�W�}[5��Mz��CL��g�ؤs��ֵ�� /��G�W�*��~��!�Jif���,!���\A]/!G6[.��I�0RP:X��B��+Lղ��r���Q��"�Z�kFnoG�6d$�����(]r|A�"4�:��*oí��%Ƴ��K���agq��jK3*��u��GK�'��|�K�H͉���u��9}�#S����y����ߣ����z�+�V�an���"��Ux:O2��xC�L�gxS30!l|�J-���k�}���Y�� $cL��жU���z���@����ի����Z?E�K�.�b�K��i� ���z��cg�e��-�a��F�{�I[K����o����;�;��;`���j� 	��#�n�a�X/�sl��c
0�N�
�1rj��TtF��n����CY$9�͍4����fq�P]ŋx�&]_|�P�m��v`�o��b�v�]�K��D[u��x`ъt�����.{ �@�T�~a�˞��GӺ�q�zXb���%o���K���,ޘ��il��pG��`�)�L"�F� � v]�Ή,����+.��{����KQZw��	+::;��-�$�ly��'7��I���/O�gZ汰s�����KF�P4�vTÏ���;+>_Y��b�lUG�Y#x��­j2��s��֎p�R������cVz>���4���0D��w=�N8�񴎲��t�3q��;�w�6U>���?¿��ʨ��X�N�Y��&G�g�E�8�l«�Z�ʹ!
��#�pz�H`��"�Y��P_>�:Qa	�a�*�W�����4&�����A�PK�+���[�(^�5��.7�5&�ǌj�y�����(�W�T��yK}�ʛ�9:+������m?�����vO�Gk��W_]��*y�q�� =
}��O돬 L���"@�]��	P1��i�U�9���M��'�� ���%����9�(wP�=�G��Pv��PE8�!��x �ι��z�vX�T"��1YFAVW�������A���iȌc��}S�C�g���i����b������*ڷߎ?Y�?�����xBp�V \��6~����~����\��Ə�����?����~����b������N�$Yڵa�t�K^�}�a|�Z��	7���t�\uD'�l�g�7W�.�[o)K����o���h3$��㕯Ҝ��h_%p�c���_�d7�˥0�j�PZ��R�ޯd^����_�!���c�?�?��;�`d��v�ż[�2jU!聟�-g2b_ �f�zz�FY�i�I��Z\��S����[�r	lx��HA�7e1<�4hr�Z4}�����'ze=����1�؄��~0���#?�k:�GuK"��*�*�pR�� 6�ɺVS�$/����Zg��&pxpݑ�����Lo���\5W[����:ɧ)x�;�[J�锜�pԄ�r�*��噉����!�-q�b*� z�/ku�z�3�ɈP�B���t�c��1A7�Jlq�"�Ģc�q$������g�{�l]�W]3
4g��Bm�@a_�5?��^ �  6�jV�##�sQr��� ��P�z��y��<�M�ӫ?$ouǩ[�ȷ��j��@̺���������ohzn>]}�t=�c�ٛ�����緀�oGl��o���A/o��?]�?���b�40�����k�$�y�����0���T���R��q���-6�\>=T�GٝJ�z%�݇��ȥ�ݾLi*dO����ͤ��]�c��[L{re�{�=��穨tR	Owu{�ھ-R���B���g2�g�v� }%+j\Ñ���P_�}ե�)Y����cC���%-2{3S�pD�K�pq*��os��)͹��)�%y�n�eJSO��8�ȥ����Uk�q��nֺ�	����h��|�x٧|�;�3w�=X��-ߍσ#��f�G�p�7��(ǰ���y�ǰ�U,��S�
��)�v�B�`���D)i
���v_3����<sx}Oe�U��G c|O�Ig.�qr�J�X��.�Yb���k������ ��	�C)��T�!� ��q�n�.�[���5I������C.����/=�ac4ub���վ��θ��y8cpMu��Q��PPJt�h���7�`l���wV姨� ��)��G�{�Vz)��^j��d��e�mpn͆6��&�f�X� !��h�9��=���ê|r
�0[m���>�������N��6�]��`�+��u�e+����Hi�H�"A����?��p�(4���eS�-����t^-�{m1��=�{L��Mu?Qե�{��&�%-:h	�F����\�OM��/�Rӧ�"�)��J�;<�悁#�pc�C���u�';8�Q�Z�f�:`tK}|�V�x��m�E�C�����#g.����q���]KJU��fQ�I=j5Y�I�����tx|�%h�V�N�ulV�Xz�����B�@*e�f;7��]�ߡ~�!�w�[�Եz*������8Y=�����4Nϋ���W�TE;_��Of���\_�e�5��q�����L�D���i�*�%"�(z7��{���\e�.L�8�Z�w��eR�|֞F��^tU����P2��xq�毓=�\��t)���1:9J��eX�ԣx*]��J��=ヰ��m O��b��du f�eۓ�AҺm��F�*�ix�>8bd�D#�-��Y/�|_�f�=V�q$-�6���g�S�D��ȴ
�.���F:�z�#)��25���;�JLsY�#�
�o gؖ�E>����C��Z+S�{Bmf����������L��ñ�L���.�R�8�N7�\̤�EF�%,��爉��A�at����;<Å��3��eJ��(ǡ���8ի�Jad�R]�+�	�%s���B�Q׶	=��^}�I
^�}�ށ��m:Ú=pǛ_�f�;Qg�˾x���jB�����t�6��f�	"' ����Du�7�zo#��'�w�U�wh��yؽb�b��y��ZjC'���Ժ�^�]w*f�73��oN5��F
C��غ�'�^W�i�`���Eq�I��}R=bC�ݵL�~N�<�����G����j�$��nv�ߌ�5@#��5���xnF�e6ɶ��t��t~����x�j.ё
�}(�G=W]��=���~E�y8���t#,�m,%��z�ad�+����/�^����Q�V�1�(���\��C�W�p��ÃP4�-|p��,L�(X[-ܩv�Z�n�W���5<RQ��¶�ꦶ�<�.~�j�7�����۝8�ћdW�Ѻ��"�t,FW'��(?b�Q�Rl7!��}�wI��$?�Ȣ�����_p�P7r����A�A��Xp�MO"A�T&���SV�,�=��eMW��^�>Ѽ6[��Z�Nv�x�O�U#��sL���n���r�xZ-��9b?�c��5���m٣N�Jq�$�;�OV�ō��Gq堍Z)��R6iY5{L₾h=�˸8RXl��GN�T��'���[TuY�S��F�ȉ<c\�#f��W�~l��]�o>��w�=�z[�G�~�m+���qb}�GZ����8��|�x���i��Ԥ���[ ���8^�:������}2�fb@���E����Z��ډ_�c� ��.ԓ4����B�?�]�ܤd= �Z%U�A�6�Ъ�e���a��:�1�x��2���<�B���ڽN/wJ8<����o1��u�g�a��w�"�P.΃���7X(b��8�R� yCLl���ɷ�ڮ�>=����=������v,�l�g��zlԥ�S�i8��G�0m�м{s��a�u{nW�
ہ�虱/J=V�=��'�-ޤl�X��c�Lv�G��<���g��x8��ᡰ�e�9�\,|�<��F�oP(�S8�}L��i:�+ĝ"�({ؘ�p������;�����8��fZC�=�\�h����T��ruJ��%�B!h��l�No��né
ƍ��22�y8�k�tB�IT�&�1ݥ�M�^+g�rF�i�!�8����jK+oc@�OUn����58w��,�4�V+tI�pOT��o�-}6��
D����R������a���S��k���*���t8ts3�©�0���^�gB�� �
ǻj��.��&�I��0l&K��W��锇g+Wȫ��F1�\j!d
��jVN9�r��A; ����? NIT�D���x���tϑ�7&/����y�,}*x6� �����D��5�
��dښ�₫��5�?��5`c��cX��/c�a�����Y�q���M��H��c0u�Ã/�`����#7pzwN��X/nU��^#Yק0l�y^�#��3T[8��,�t�Q�8��m�'����W�������������L��<)vqQ���3?��@�@�f�zs#�1��
�-%� ����<�״=�Oz�=Q5g��'�>�F�l�v�|��C�<���֝d�TU�82���Ŷ׬�^U�Bo��׌�z���zT�Awr4�#�G�ւ�^FE�
*~��UQ͆���_Q��!�
�g3 ���嶺��I�SMCc��n�����:�[�\m�G�l���k��AFK�,��We�F�N*�2JUX�L�/@)�O�`
5�Z�(;��F��*F�Ƨh�0��UJ��%�1�X���u1�g��N~����$��Bh������!��6Pv{ �^���؄?�|����z ��������&ހ������l�PM-�ŢjX�c���y;����vM<wW�]qA���㻃E�? �.~�s��/��0�&�      �   r   x�����0�ݏ��A��7�m�Ҧ�!����̜�0�kgp�ўo�������R��T���EX���{iQ+��Ԉ�����C�eL��b����z�˿���D�%�A�@�      �     x����N�0�g�)<���$��"$D��r���rbG�����J�b)O�����W�ٽ�c��?a�}�8&^"�(-���Bl����`�'j{ӡо�B)~NZz��-�6l�dQ޲g��z4D�t�c�5��%(��;�����D(3a�(�QC���ܡ��R�y1'/:���Z��%�k� �ڍ�o��~7�d�F�x������I�>��efޜ�7��o��B� ���75�7�̄�R��?��V�U]�75�7��f~]E�t��\      �   �  x��\Is�F>ӿ�OSV��Ԝ�8�(�V$�\ri�0YX�����-����t�C�DZ��%���o��5`g�n�5�� ˤ�l�-�,�,&�D}�Ɲ|�n�%�.VMFI�T�����be�LKZ�Ror��� ��bE�XL��q�N�mNi�YVu��9���i�&uRf4�{r�->��V)��i�T�}JȎ>ь�E�t�h�E��)�Iv�&�����/���%�O6;Z_Xِn@[� ��5�׻ɚG�_�,�
��[ޓ{�ȈH��ez��1-�~�)ɷh���&>)Ӆ<�	e:��'��.E<�׶�f�XE˺!׫��ӚVLI��X����D��د�3����J�~ �$e�U�C���#��G�m!^Vb�-�0{�P�\}
�B�m�u�=K�M\=�r��<���<ν�5ر�a�Ę	2��|�a�o�7U�Z۴Z6�&�ԩ�FH{{w���¦���]��?	����$�<� ��m��6ϰ-�ٶ4��L������'��"]�]����rJ���m�)������@���hc����^g��،���q 0Zڕ
�T֓��3��ф�2�x��y��m��zYT�*yH�f#b#�����$9�Ǿ����䒰̄�`[�"�j��毹�p�����N�Kd�������|�%��r��{�K�VCU�ǆw�tF�9óO�;�sE7�&��B����˛|,i�$�[�`��+����O�Uʹg�,E�e�5�6C���x)M-�#n�
���nTu�6?�ѶNJ�G4k�*�����]%�v��g6�D�{|�@<G&0p'�H?>'9��Y&AE$��h,��,�T
��W�B�5<΀"o2a<��W#�?��� P�2~�%��ʈdl�R������؈��.0�D��sg%�5��eN���2���#L��.Y%%hD��h��[������G��6�c^�Jca�5�6��\��g&��u��[�t �ET/����Q.�p.�#]��uY������$f�a��J"Y0���
|�� _m��:�i+�}tN~1����Q�>���<�``Ǆ��) �
OG��������?������0^iC¿@�� �X$|�Ǖf7�eq)����;Ɓ"mUwݭS:GK�U0UxH�d޲+����m/�YX*@��J���v-��d�2�<5��1��*�`[GDVl�'�ș�� ���A�����h����*�Qse�o��8D�%Ą�Q�
��ى��B[ٗF/�\��j�qj�g�Иc���ysp���1����?�'�o 	T��~�8�!aZ]I�l��u�>��*E�r�kb��D-��-��r��c�G����W�7�c�#Y�B�Ix�|��=+r�'@	[D��8�0����$w�F�F�-��S>x��\�6ڏ��s�3���i�zC|�o���t�m���w�
8jKGa��ß�K.�'8�3TVn?��g�3���u��w������w�qU�!d��ɘ
YZ$�m���ٺ�	���]�C�z�v�O3���=4�������>Wφ	Չʙ��A���:)p�#�3�ŋ��#,F��&a7߃��S�Z'm�	�W��%�`��ˏڂ��,֌�V8�8�9 ��w�D��� Q~1�;�
W�xg��1����d}�L�ij��y؝{���4��mX,7�)� � �(�Ӿe���2Z��ۇۮ9���Fc��tQ�h*���k&�kŪ�F����5�c�6Ʒ��]s�/�=��)�;�jÏvW�=�Ȯ��� vC�R��5֬����üS�����i���,�7��O��k���t� Kp��n��8�Xk�"5������aΖ��I�7�����f@wǛ���n�	`�L��J?SI&�T���\��s�J��ދ����B,Д��Xh*���n��%�j QȻ�?MY���[ g*�����j�2�Ե����`b�;���}�������/�en�8�$�Jʜf���/4��I!�hN<�1��U�܏y��-�HД���'��Q>Ô�g�VEZ���j��x}\�JX <�j���b�>q�#-��� ��롖�N0�ƍg�`�x&���-;s����7=nc��`d�����M��7�Ђ!qc���v����Ww�L��Q��^���JH�Ld��y��6�n��v��g�AB�*-������v�DByʺ	����d��0:bB�a<� F��髭 �3Adg4���'j�p��2��8 �@ )� ������M�J�Ψ:�T�����`A���u�����c+��Y���J���A ����[��Sv/2��;8��3��~�y��7�1/�!�*��e�H��@��6K>5�#�+P��cS5�E_�@��C�����x3Cy�!�����/~ap�O��(�5|Hʦ{�c��鮩�v��-�Y{a4L�<r�U��^F�(-OܰFɻ0N�.E�ٱI1��S�<~�*� 3��+PC�� �P��9�W�8���۽]�'��Kb�?a��g�t��5TɆ~��K���x0��O�6�O	��<�qj�2#ph2w�#�j/�+�@���k'�e��;ZN���Ug��g�v����ֻ3�]�g��]6�>s�2����=[���q-�Tn(a�^,���	U;�I7��Up�OŔfo�������5?��a~� �
��Sϻ@ˣ!y��w�yg�\��;�9�r�#���N�~ӌ���_��a9��O9�B08�0���'�B-��)���O�����T������:gku��;�Iذ�o=�P79���*=0����=zV�?�ga~� ��
�SO 5Vu�!	���'�14s���س�Q��i���,,�<���z_��`9���Va>8w0e08w�s�w�M�.w���-w���;�w�;�9(v�#����	tΑ;=���ɝ���s���?4wz���I���s�Xo}0�7_���s7�A����/�l��|&x�`��yE!�YZ��۾[���T���^ҕ�L��oy!��5����zr��P_��\F~��H����������O�A��Op�{��M=�x�c�� �ډ'Jw������ų�*���ŀ{�m�s)Y�W�?�zI�h��$�Z����-�]:V�V���w\[�mg%�*�lg�;X�ވ�����U�54\��lm�j�l���d~a
S���J]"��3�Z��O��e�xg�V.2�?C��<�g�V�op�j����T�����j��Ň�ZΞ_8k�����
Ӻ�P��L�����'�|/�k�F*��_8 �Sv��m������a��� ������4�R*�i���z����|
���p� �W�-��u �ρ���'x>��3"���t�TZ1_�̥�?v�u�Ҋ�xe�㇯�Pi���3�V�?QZ1m�
�Ɍg�PZ�L�H,�\ 1�坪=R���/Z}��?�y����ʲ
      �   '   x�3�H�MJMJ,N��4�2r�ҁ"�9�`�=... Խ
]      �   .   x�3��	�2����2�H,.�/�2���q�2Ӿ\1z\\\ �	F      �   �   x�m�M
�0�s��L���p�Е���oL����'��)�{,��w\��~<L�\H�+7��\��9�N�_�y�t0���s��A�NJ�K`O��C�d������}�ᰩǢ��)uF͵~�3g�ܲo�d��mr������l����k��=8��a4m�}b���      �   m   x�3�tJLI�S-N�H�4�2��I�MJLOTH�M-��+I� 
s:�E��Ss�sBRsK|3�&X��Tl�j�wbyb1�~�Hi^Vb^:P�~�i����� rA�      �   Q   x�3�tJ�K/�K�SHI��O,I,U�I, �%�q�rq� �ٙ
�y��I u@Qc�м��l$A��t�Ң��t� ��      �   �   x�M�M
�0�יS�	�z�@)%]���)5��%?���N�����U�o4��L-ML.��Q��QA�ч�F	�8J�2�k�.�z���}�ք�>��vɢ��%ek��a�}.~A��/Tऺ��d!�?zTF����� >:�9      �   G   x���45���CAF���FF
�V��V�XŐ��p�A���%�\Cs�Xb�mp� ݬ#�      �   \   x�5�K� �5}
N`�q>��G23 &�?d�e=���zV�#xf��D�6٤��xTE��9I�x�����x1���ϝJ�֎}�}K ;      �   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��         /   x�3�LLNN-(IM�2���S((�O/J-.�2�,J�JMI��qqq �i         <  x��T�n�0<k�����_W�@k�(t륗���4%Z�D��w)�.+6A�>X^���ΐY��/�Yl����c�:e1<����1�S��=}6�X��q|���Vd�T��0X�Z�h��Q[����?�$nq�=kN{�v�����H�qv������Z��c�5�
�K,���3�S��Y����4یBZ���e ��3i7�p�ʛ^S�E��H}
YNM�����o2�VY��3�GZ��y}�R*�N1��g�(ʀ����0���/8�I����x�)!�|�|�U�vC2O�yq���Øw@��§]����~\��.=EB�ſ�J
�����H���Uw�d�&[����T"�)�j���_6%�n}xR��W�;����| Er��^lJ�׻yP��;����2�بZS+�zU)G�8ҝ:�qO'ע�+�����pr=���������AiKAf+I�kq�#��@�6� ����OU$|	R�|:T	x:�d� W �Iqr1-
~�i�duAc��b�l����:Spȓ��r���ˤ��� �N     