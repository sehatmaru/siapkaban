PGDMP     3                    x         
   siapkaban2    12.3    12.3 i    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    19143 
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
    tgl_skep character varying(255)
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
       public         heap    postgres    false    206            �            1259    19171    dokumen_proses    TABLE     �   CREATE TABLE public.dokumen_proses (
    id integer NOT NULL,
    nama_dokumen character varying(255),
    path character varying(255),
    jenis_dokumen integer,
    pemohon integer
);
 "   DROP TABLE public.dokumen_proses;
       public         heap    postgres    false            �            1259    19177    dokumen_proses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dokumen_proses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.dokumen_proses_id_seq;
       public          postgres    false    208            �           0    0    dokumen_proses_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.dokumen_proses_id_seq OWNED BY public.dokumen_proses.id;
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
       public          postgres    false    210            �           0    0    jenis_dokumen_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.jenis_dokumen_id_seq OWNED BY public.jenis_dokumen.id;
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
       public         heap    postgres    false    223            �            1259    19225    layanan    TABLE       CREATE TABLE public.layanan (
    id integer DEFAULT nextval('public.jenis_layanan_id_seq'::regclass) NOT NULL,
    j_perusahaan integer,
    s_j_layanan integer,
    j_layanan integer,
    j_pengelola integer,
    j_fasilitas integer,
    j_penimbunan integer
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
       public         heap    postgres    false    228            �            1259    19241    sub_jenis_layanan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_jenis_layanan_id_seq
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
       public         heap    postgres    false    230                       2604    19247    dokumen_proses id    DEFAULT     v   ALTER TABLE ONLY public.dokumen_proses ALTER COLUMN id SET DEFAULT nextval('public.dokumen_proses_id_seq'::regclass);
 @   ALTER TABLE public.dokumen_proses ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208                       2604    19248    jenis_dokumen id    DEFAULT     t   ALTER TABLE ONLY public.jenis_dokumen ALTER COLUMN id SET DEFAULT nextval('public.jenis_dokumen_id_seq'::regclass);
 ?   ALTER TABLE public.jenis_dokumen ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210            �          0    19146    account 
   TABLE DATA           `   COPY public.account (id, username, password, role, status, d_perusahaan, d_pribadi) FROM stdin;
    public          postgres    false    203   ʄ       �          0    19155    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep) FROM stdin;
    public          postgres    false    205   ��       �          0    19164    data_pribadi 
   TABLE DATA           k   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar) FROM stdin;
    public          postgres    false    207   ��       �          0    19171    dokumen_proses 
   TABLE DATA           X   COPY public.dokumen_proses (id, nama_dokumen, path, jenis_dokumen, pemohon) FROM stdin;
    public          postgres    false    208   2�       �          0    19179    jenis_dokumen 
   TABLE DATA           `   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen) FROM stdin;
    public          postgres    false    210   O�       �          0    19189    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    213   !�       �          0    19195    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    215   X�       �          0    19201    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    217   ��       �          0    19209    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    220   T�       �          0    19215    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    222   ��       �          0    19221    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    224   2�       �          0    19225    layanan 
   TABLE DATA           s   COPY public.layanan (id, j_perusahaan, s_j_layanan, j_layanan, j_pengelola, j_fasilitas, j_penimbunan) FROM stdin;
    public          postgres    false    225   ��       �          0    19231    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    227   ��       �          0    19237    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    229   [�       �          0    19243    sub_jenis_layanan 
   TABLE DATA           M   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan) FROM stdin;
    public          postgres    false    231   ��       �           0    0    data_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 354, true);
          public          postgres    false    204            �           0    0    data_pribadi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 50, true);
          public          postgres    false    206            �           0    0    dokumen_proses_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.dokumen_proses_id_seq', 1, false);
          public          postgres    false    209                        0    0    jenis_dokumen_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_dokumen_id_seq', 294, true);
          public          postgres    false    211                       0    0    jenis_layanan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jenis_layanan_id_seq', 1, false);
          public          postgres    false    218                       0    0    jenis_layanan_id_seq1    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_layanan_id_seq1', 28, true);
          public          postgres    false    216                       0    0    jenis_pengelola_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq', 2, true);
          public          postgres    false    212                       0    0    jenis_pengelola_id_seq1    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jenis_pengelola_id_seq1', 6, true);
          public          postgres    false    219                       0    0    jenis_penimbunan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_penimbunan_id_seq', 1, false);
          public          postgres    false    221                       0    0    jenis_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.jenis_perusahaan_id_seq', 1, false);
          public          postgres    false    223                       0    0    m_identitas_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.m_identitas_id_seq', 5, true);
          public          postgres    false    214                       0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    226            	           0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 1, false);
          public          postgres    false    228            
           0    0    sub_jenis_layanan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sub_jenis_layanan_id_seq', 40, true);
          public          postgres    false    230                       0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 46, true);
          public          postgres    false    202            '           2606    19250    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    203            )           2606    19252 $   data_perusahaan data_perusahaan_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_pkey;
       public            postgres    false    205            +           2606    19254    data_pribadi data_pribadi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_pkey;
       public            postgres    false    207            -           2606    19256     jenis_dokumen jenis_dokumen_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_dokumen
    ADD CONSTRAINT jenis_dokumen_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_dokumen DROP CONSTRAINT jenis_dokumen_pkey;
       public            postgres    false    210            /           2606    19258 $   jenis_fasilitas jenis_fasilitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_pkey;
       public            postgres    false    213            1           2606    19260 $   jenis_identitas jenis_identitas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_identitas
    ADD CONSTRAINT jenis_identitas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_identitas DROP CONSTRAINT jenis_identitas_pkey;
       public            postgres    false    215            3           2606    19262     jenis_layanan jenis_layanan_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_pkey;
       public            postgres    false    217            5           2606    19264 $   jenis_pengelola jenis_pengelola_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_pkey;
       public            postgres    false    220            7           2606    19266 &   jenis_penimbunan jenis_penimbunan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_pkey;
       public            postgres    false    222            9           2606    19268 &   jenis_perusahaan jenis_perusahaan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.jenis_perusahaan
    ADD CONSTRAINT jenis_perusahaan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.jenis_perusahaan DROP CONSTRAINT jenis_perusahaan_pkey;
       public            postgres    false    224            ;           2606    19270    layanan layanan_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_pkey;
       public            postgres    false    225            =           2606    19272    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    227            ?           2606    19274    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    229            A           2606    19276 (   sub_jenis_layanan sub_jenis_layanan_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_pkey;
       public            postgres    false    231            B           2606    19277 !   account account_d_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_perusahaan_fkey FOREIGN KEY (d_perusahaan) REFERENCES public.data_perusahaan(id);
 K   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_perusahaan_fkey;
       public          postgres    false    3113    205    203            C           2606    19282    account account_d_pribadi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_d_pribadi_fkey FOREIGN KEY (d_pribadi) REFERENCES public.data_pribadi(id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_d_pribadi_fkey;
       public          postgres    false    3115    207    203            D           2606    19287    account account_role_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_role_fkey FOREIGN KEY (role) REFERENCES public.role(id);
 C   ALTER TABLE ONLY public.account DROP CONSTRAINT account_role_fkey;
       public          postgres    false    3133    227    203            E           2606    19292    account account_status_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT account_status_fkey;
       public          postgres    false    203    229    3135            F           2606    19297 1   data_perusahaan data_perusahaan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 [   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_j_perusahaan_fkey;
       public          postgres    false    224    3129    205            G           2606    19302 +   data_perusahaan data_perusahaan_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_perusahaan
    ADD CONSTRAINT data_perusahaan_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);
 U   ALTER TABLE ONLY public.data_perusahaan DROP CONSTRAINT data_perusahaan_status_fkey;
       public          postgres    false    3135    205    229            H           2606    19307 *   data_pribadi data_pribadi_j_identitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.data_pribadi
    ADD CONSTRAINT data_pribadi_j_identitas_fkey FOREIGN KEY (j_identitas) REFERENCES public.jenis_identitas(id);
 T   ALTER TABLE ONLY public.data_pribadi DROP CONSTRAINT data_pribadi_j_identitas_fkey;
       public          postgres    false    215    3121    207            I           2606    19312 0   dokumen_proses dokumen_proses_jenis_dokumen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen_proses
    ADD CONSTRAINT dokumen_proses_jenis_dokumen_fkey FOREIGN KEY (jenis_dokumen) REFERENCES public.jenis_dokumen(id);
 Z   ALTER TABLE ONLY public.dokumen_proses DROP CONSTRAINT dokumen_proses_jenis_dokumen_fkey;
       public          postgres    false    208    3117    210            J           2606    19317 *   dokumen_proses dokumen_proses_pemohon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dokumen_proses
    ADD CONSTRAINT dokumen_proses_pemohon_fkey FOREIGN KEY (pemohon) REFERENCES public.account(id);
 T   ALTER TABLE ONLY public.dokumen_proses DROP CONSTRAINT dokumen_proses_pemohon_fkey;
       public          postgres    false    208    203    3111            K           2606    19322 8   jenis_fasilitas jenis_fasilitas_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_fasilitas
    ADD CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_fasilitas DROP CONSTRAINT jenis_fasilitas_id_jenis_perusahaan_fkey;
       public          postgres    false    3129    224    213            L           2606    19327 3   jenis_layanan jenis_layanan_id_jenis_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey FOREIGN KEY (id_jenis_fasilitas) REFERENCES public.jenis_fasilitas(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_fasilitas_fkey;
       public          postgres    false    213    3119    217            M           2606    19332 3   jenis_layanan jenis_layanan_id_jenis_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey FOREIGN KEY (id_jenis_pengelola) REFERENCES public.jenis_pengelola(id);
 ]   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_pengelola_fkey;
       public          postgres    false    217    220    3125            N           2606    19337 4   jenis_layanan jenis_layanan_id_jenis_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey FOREIGN KEY (id_jenis_penimbunan) REFERENCES public.jenis_penimbunan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_penimbunan_fkey;
       public          postgres    false    217    222    3127            O           2606    19342 4   jenis_layanan jenis_layanan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_layanan
    ADD CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 ^   ALTER TABLE ONLY public.jenis_layanan DROP CONSTRAINT jenis_layanan_id_jenis_perusahaan_fkey;
       public          postgres    false    217    224    3129            P           2606    19347 8   jenis_pengelola jenis_pengelola_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_pengelola
    ADD CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 b   ALTER TABLE ONLY public.jenis_pengelola DROP CONSTRAINT jenis_pengelola_id_jenis_perusahaan_fkey;
       public          postgres    false    220    224    3129            Q           2606    19352 :   jenis_penimbunan jenis_penimbunan_id_jenis_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jenis_penimbunan
    ADD CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey FOREIGN KEY (id_jenis_perusahaan) REFERENCES public.jenis_perusahaan(id);
 d   ALTER TABLE ONLY public.jenis_penimbunan DROP CONSTRAINT jenis_penimbunan_id_jenis_perusahaan_fkey;
       public          postgres    false    222    224    3129            R           2606    19357     layanan layanan_j_fasilitas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_fasilitas_fkey FOREIGN KEY (j_fasilitas) REFERENCES public.jenis_fasilitas(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_fasilitas_fkey;
       public          postgres    false    225    213    3119            S           2606    19362    layanan layanan_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_layanan_fkey FOREIGN KEY (j_layanan) REFERENCES public.jenis_layanan(id);
 H   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_layanan_fkey;
       public          postgres    false    225    3123    217            T           2606    19367     layanan layanan_j_pengelola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_pengelola_fkey FOREIGN KEY (j_pengelola) REFERENCES public.jenis_pengelola(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_pengelola_fkey;
       public          postgres    false    3125    220    225            U           2606    19372 !   layanan layanan_j_penimbunan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_penimbunan_fkey FOREIGN KEY (j_penimbunan) REFERENCES public.jenis_penimbunan(id);
 K   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_penimbunan_fkey;
       public          postgres    false    3127    225    222            V           2606    19377 !   layanan layanan_j_perusahaan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_j_perusahaan_fkey FOREIGN KEY (j_perusahaan) REFERENCES public.jenis_perusahaan(id);
 K   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_j_perusahaan_fkey;
       public          postgres    false    3129    224    225            W           2606    19382     layanan layanan_s_j_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_s_j_layanan_fkey FOREIGN KEY (s_j_layanan) REFERENCES public.sub_jenis_layanan(id);
 J   ALTER TABLE ONLY public.layanan DROP CONSTRAINT layanan_s_j_layanan_fkey;
       public          postgres    false    225    3137    231            X           2606    19387 9   sub_jenis_layanan sub_jenis_layanan_id_jenis_layanan_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_jenis_layanan
    ADD CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey FOREIGN KEY (id_jenis_layanan) REFERENCES public.jenis_layanan(id);
 c   ALTER TABLE ONLY public.sub_jenis_layanan DROP CONSTRAINT sub_jenis_layanan_id_jenis_layanan_fkey;
       public          postgres    false    231    3123    217            �      x�31�LBC 465�45������ -�x      �      x��}�v�H��3�x�k�EQ���o�`[�$�J��V��$L��	;UO����%}� 0�����[U+m����3�3�Q���:��x[��Y�N�il�����z�����"pީk۶{��W�����b��Sk�����|%^ZW�]�K��t�̳u���XWy��_o��ֹ�[�^��k�uy�_O��x=_��>г�%�^�ϻ����M�$�[�zW,�E��+۴7�=Np���b`g�a�8��S�x�:I�և,��J�H�z�8�?�O�t�����z��ck��@��g8]�2�X�ݷ.�-|o�1��"͋xۯ��?�:�8�Ļ������x���g��]$�C��S�;މ��Yf���y�Tz��@��Ɂ[��6�%��`��_��l`����s������\��x=K�Jb��m���tk����S�Q�t�[�e�'�Gt�?#~�>.�I��I1�@Bz�N����|���:Owx`�n��)6�y�)��J�xɣx2h�4ЮȿBsxS�M���>b[�X�X�M�2{�u��9�S!O<�q?��K�Mv����}�@";����D[:�lu>�|����Η����qY�b��x5ɬ�g��5�g�'�K�ҺO�k�l��!�gHG��N�M��A�U�åέ�x]|���"75A n��t�J��yn��� ��x��$���ed���T��Gշ�
WO2j	Mx*ŉ�YX�X�I�N�]�o{H�o���~��T����Vu��b	R0��3�s��u���y�.	X-n�����K�l<��<h��6� ���l=���M���B�ԅ<^-w�e}���9�I�t�Q?k�q1O�J���X���Q���
2���
�&�W6�G�O�u�J��g�%(���9�3�ķ���@dn]dˬȷ�s�� �}��`:���֩աJ�~��O��:�(ۀR��𷴌��f
���j��z��Bf��v�.{Q 5k�h��/A����/�hW�|�Xw�41�zD��@�� �k��Ai~X����m�`�R�~M%���R�Ȏh�>��t�K��'��c2}��1n�-��{�����.p���ѹ?�'[��LV���&��G�:�#�x��a�c�k/�������n��%M �M6�c���5|���v5�|���H8��B0����y?T�~.�Lue����bR�ɖ�
��[���&Ak����w ���h`N��` �!he���w�*n)6x.����H�M@Q�
՘5\m��!E��T�����;��)��<Ɂ��$�F�ԩ�&{�	P��)e��T���2^u�
^3��mh�2�l��!�sP`���d�Ve]㝉(r{��)�9�
���_�!��	��al��Uҭa�m�a��q�C�=C����)�$3�70�O��M$X��,�gxR��� ?~v=�Vw ;4�F���a�d�H�fݳ�/BF��\/Ӽ&��Hu�ۨX�;L�.fư��S	J�l�(��(�u�� ��Gf{���R�E������0�#{>J�I�K��}�4��]��� W�ж�"h<:�:�.�|�.+�7	���Z��@`�� �-x5]��WA� �@���'Y��Ћ�$C�γ�S�6ZI(J��i�B '�/;��+@C��@������m��

I����� ?=/��五K�	O2����_�{ɜ�E �P�� J^Nk�r�@T����&���Ն�2�"vy�6^����c�d��<��;!P���W���l-�Ӷ$��/���\z �Bp���0\���j��3(�U�[�Q���iLnOW��)[�/V�dZ�L��!:9�c�9.  �΋�b�*S&܃ٝ�m�mV����?�`�@tPf+ {{?1�d��^�g��=~�������0����m�"�_�.�vI�n�L.���wf}���� _h]n��ߔ������*8Vn�1^��� �� �7��f�;�Y\�y 8Wz�p��D	���&�g*䦇��M�Ql��k�ar,VZX��Ňt�}_&���ˑ-�W <��`���Q;�:D�P>���� o��`3�W=��0-��IE'!��q�*f9(<P	뤮 ]��6:ZPG�j���X��<�B3�Њ:&ro0�:%�h�)ʅ>w(�J�����s�%u�x�ݚ�c�����M�{D��_�� )���Ō��B���$^-��ֺO7IKO
�_��m;�%N�w�ށK�kҷ>�v٢��	�9�)��.�c�&.+��� ���ۆJ����9	�ĎD�Z��zp�,>8�µ1�X� �f�rF���$$�Kv�����@Xo��b}���3�H|N��,�LT�o}̳y����>�J ��	�&��� Kб? ��vm=/2"�o��rÚP�?t�1��a�T��;���k@�貧�� ���B��O��C�������P�wA����>��g�NK�!�ה���9o��!	�NK��_Y6c��"�>���`�V~=�)�r]�{�A�G�BqdWd�#��G�-ȹjg��/kȸ3�C�-ݗlY��60x�b��9�k�B|��.�=	�����ˤ�p�c��y)�vwͩ���^ox�ejm)����vr�O"2��i����(�6].�:�,m�@H�hO��'p|�`P)�!-O�<�����.�&��_#��G`
#�b��x'������t���)f/t���=h�u����{R:��P<�ȶ�!2�c�<8�_����5P���
�>�I$�� B���L��p��b��e6�.0�G�c����>����u���w
���т�8{�9�`�&��A0y)�R_���Gjm(`�@����pNet�I�n�'�h�4���Ѝ�q�K��7� �6��9���$���<�M��k�.
�=}����;s�������*v�D��C�����2�f,"�;��%���9@�G .�Z(� ���3��>0�~���Z�����x��O�
n�󶥪�d��l��^z����8R��pU��zm�X��?0<�r�"R'}���i4eZ�v#��c�Fʓ�g�v�"O�S.�u� .!�cc:��v[�'&�ŌJ
��b#���<w�ѫ�jt��[��8�3�}�n�2x���Ѣ�K�!��nDfw�I�P%���P��	tԼ�{DԺ�.���5�y1?��鼀���̯*��(lS	��+�@�r�2���D�Y��Ah�Ow9=:(��]bh|�����D��ۭtjm��d�s�n�U0^�C����m܈Dp*��*c�jF�Rb3��湎;�>��B�����ly"l.#A;��n�>�9��ݖU���s=��)�Z�"�<]g�L��̊Х$y�Uʕp뺝�Ւ��,6ʇ��L�lx�9R?\.3��P$���7�v��2��p2�� ���W�5YέU6I�=��҉wª�&�>O�;��E;�b���5��,�xy�$�"�3��BGiዴ�UP�U�_z��)�Pą�b�]i6�	�e���wH����{�Z���L�;6\�$��TW&Xx�	�ʟ��Ȍ	��4N��e27�J� |��u�^Tp��q����9��ͮ4�g��"m$��a���0����#\�<�Wpb(����}?���@!�#��v�-�T�u"�mE��r�>)�N�E��I=� �c\6o��z��V �bn�~��+��+�q<)�]��������ɰ���d���*�^���Ax[尾eY#��i���:�7�����|.�3�:�'p��^�w7�S��0�%=����d�~�&$?�F1	��� =�ج�ҵAR�̈́;�Ƞye)�� ��B��:m���!��ܛT����A��rw�g�0p(�m	��I����sdqX������' n��3V���u�d��;a��^��tW�o����,3y�f���=��A�����!�F*2�mJ���	�
�ퟁo��>��MGϭC�P��BxL43���Y�    ��n�S,#�0hUi�#���g�#�Rd�6	8�K�x�����u��%}P���{��~;*�OÅ��6�K�T<%�t/�rߧj���<+��γ��n�Fh~nJ�+b�x� 
��Y���v�������x='��V� �n~������L�Knҹ�Qo�!��G���ʀɚ�HÌ�J��RҳDb����@4�K08�"��Wº�������8 3�����]5����zW;Uo?B�Մ�!h�VI��n�"�Z�����{��ő�,״F�x��d�>L��>�=嚥����0��a_��V,�߈��4��נV�33�-��K[�I��Lۂ��b�:��!Gd3u��^*�ť��G,P1\��@BSOu����ab��.[�4F.%��f�,�GL!���,���@�d?��K���)˷����xf�5��k��[�HUp���L��Ԟ�I��<3I�f�}�K �'�(�?���$����V����P}�P� �dQ�!G���D��o���Dh�T#=S`E�vd�c��@�,��
Q8T�d_?��	8�f�����tį��dt���3|̅�_�[ݸk)d꠩�\M�TÃD�8S��#�k�zP�Ay�D�}�����x���/յ/��ur|Y���^��5����w�n��s�Ȭ��x.��C�C�ՙ�6^�FG����[�
֡��'eGm��kɕ��QU``�%��ۅ䞌�G�tU�H�SPP���4Z�����TI�YL�$Xg)FY��� K�@�}���H36u������0z}3J�?ބ4R."�;��T�"$鏫i�=�$9��h��	�5�tu��H�C���O���,�9�XT�;kR�7	~��/���p��[�sF%-�g`�to�x�'�Yl�#�3�*�d���R~��n��#�����C�ՠ�Ԅ��(���/d_�˗��l�'K��qO��:�z)�6���I�\]��^�����6#��.?:d�]�w����鮹�� ���]���;A;G��<H6)�����,��+���]��5pv�+�f�M�-W���9ֻ
	�^�q�v�
A�P!�U��	p�]�A�Ch���{_9ge:���~��)a�8f����$�:�.�떀?�t��(�K�vpnd�#Xwf�>�|���o�:� �:�����m��}�U���F��	I�<�S�(~�
��v�y�=�l���u��`��]2���2iP����8��? Nǀ)�����t���u�2��7c����` �c�d�l�n�]K��V��g��+�_��y�ƞ�=пj��.t�{�ځ`��p�,���|��E�H�c_�U<L�c���*ٔ��p���%����i�MJj
?���V��\�6H�+����Bct���v��NP1.��*��d��]��Ǝ���[�T\b�y��rxx$�`h��ٯJ.��w��m��kDאX�S�.� ��{5t��˄0Rt�Į)��׻x���tȝ`�a�n�G��^S8��i-a�q�a@���f_ �-f���0�*\ɴ��r��]��6y4{+X�RIc	1� ��v涤��� ��=&`+(�N7N�W�%{4���@ٴ�����
N'����l�bbDG׭��u T���BR)���t��>��[*�е�����nW��꠿M6g���<m�$;*�>�s��o��j�|�[�z[,)�݋�[=� x�T�sdɢ��f� 6���;pYױN��5>q	��ඞ�d=���ܖ�#�3�T�[��n[b�):q���%��1�A����i'����A�o��-[�+�UP�_��w |u�g?�Ѥǥ�R��
;k|IoŒN �w|��5��c7<:c^Gw?x�%|		��8+�Z�q��P��̍�*�|R2��OÑ�s޷�!7M{��r�T�fY�!19\���!["��p|�9�]������낌؇t��wk�]�QB��~�H���Q6��pj� ��MU�/��}OzN[�U�܍�9<�� ��v��mc���QOA.T[�����2�c��u�?��� J=FN3뤼D�V�S������D��An-G���cR�I�a-֜���a
��s�����2�(����m�Y���(��|:��"<�GD�\�y����YpqV)�F�f��Eo��a�ǡx��-<�h�Nzң�Z*��ʁ+"p���(����J1/��,?�'L��NG9l闍���:��=�PK����99*W�v϶f���*�^��!�)Y�P��*�ƛd�.�=[���O��MtƐ�=�S#u��Ԉ�h�U���L�I�V<	l>Ö�^�zdk��mȳ�>!��vbW6��[�-�6P��Ǹ�{�dh��u�."$��>�|`,����r #�G�ߌ�n_#����6�1Qx�l�>gH#)����HE�F*�����zE�#���F/�Y�<��YU��������S�O���� F�b�f���s�>=��_Y�ؖ=4�������dt�����&�w +96�!�����cyZnC��;
�T��"�����
����5���rD��9��_�J��[�5G �E���y�{J�<��_J�׽M����	2L���:&���>Q�uv�Q�mB� �C����n���^xM1�2��yn,g����j(�2ַ~𘱞�n��`]8�^��2k��yG��'�e�>2���s���	�7��G�:�k���P .�U�Sm.g�?�t�+�e���G���Aєk:�#�b�:�9ň�`�;�&��	�����g��!`���$����2�ǫ`�v9S@Q,No�(�7�)�
���P���ѰR˩�0bWҜS���`�s�@/�\��F�w(݁/�ǦS�~�6���yXRR1=Ykd��<��q�z��b��/y��qd�}~'�AT3������>n��m��b�<�[*}j�HU�!a���O�{�
-�F���D��-�`�(N��/�e�P�{F�<�[RT���7��r��#gO���u�4Epz�����`��e�K���|FU�`��ƫ��L��X��)��#Aq@"��U�����:�y�3<����b��X?ֳ����ѭa�&G���|�nrSA[l�1�N���>x�MEc �� ��©0�R�D���&�n�	է[��a�*~BK��J�4��4�`�W:��ܚ��.��O��U��j��v�c=m��b�[�V�먍�g�G".�����)a�i���Ci�Z����%j��C��D�$+�,(�+�ɞ|b ⻟=�7������po�m<���q�YW:�:�LM?�����:dT�%ߢ$1�6�(����?��y������x
o��d��J�z���zuO�+�Z�-�D�=vxhle�IR/ā�qK���z&��f8Bj�����9Uާ�3,n, ����bd*B˷X��� ����1\%���,�bZ:e����7X���[q$��Y��cMh��k��.)xD���P}N��8��s�w���bk�դ�%�T��9��c��[�r�սH3��"������4�Y��X�*�������H7��cε�_�Sh�D���|�5k��à������j0.7�«�Ԁ1*�>_XW���UWR�h�XSx~�8��<!8x<�L�����,�s�c7����{��e���B�39��5��z9�B��-gT�?Գ}��Y��P ה��5eR����%��B�
�������o�H6f��Wa�C��"�fӹ�|�J�Z
�\i8��&�-2�F��	����48��`�웽�8�R\�[���4���zX��Ll7���O=YL�͔O��ܞ���C�-3�9��B���蘴��m���}��/�fGm�dJ���N��W�s�j:�򭸸H�j"� �ĺ�*ݬw�����jtp��([��y��Θ��G�+8�s/�����`�����u|�16W���Ɉ�eڷq������X���نc;M(u�6���{:i,ˆ2�W`��I����w�    H�%������;2{�*P�/"b�<h��}I�뼧�~�Ŝ�9� N������>.����;M�@�M�"jO���ƹ�ݠ� !��a�u9���4�ڬ����y��`��NP�����`@7I�tב�s�tn�ā�Q��<�do��^ݑ��.
�,eh_D_;�
��=R��>���9�����o�g�i��p�%�sI΋-�8���^�l��q�ΰ���_(XSq��Y�1��UK�A�ܻ�=��Ip�Kw��}�"�D�#ؘr�#hϼ�!�H=@9n���N�U�����B����D����͝9W��1.���.%�`���$��Jw�|��{�j`�O�H��w�Wv��c��x�>���g`���:�0�_�I�L�Uuw�jza��
X�{/��p�#�RU�R�S&T�0�DF��I�c�����q���+Q��b�4"���^3�̞;)����~�s?���g>e�7��@<��|l�i
���N�c���,��
�	n��ɡM:����k��?j�]Kf���?)I�۾^�*��J�8�4O�m�;��/��4C��a�G��ٚ��F釩��.>��kt��A7x�/>]4F��Z�eԬkhe_�4��_р�P����X�i�������@��}��֙\�?��s��[v���f�c���'lF ����V%4�\�CG���!L`�S��'�vQ�<�H�W��O$7s��&���$q`N�k�2|�:&��b�_U
���.���`��M���8�I�J`_�H���^�*�Q@W1������Q��oG�LU�T�S)O �<Jq���&�&sppK�;d`�0.)�
���Y5��e����%7k����Sf��qc3��^�4��#m�ay��/�����s�Ě��^#�o��F�4ECP��0���X���K�E����٬��� \�f�����w�(��X5L9�}y�bݷ��F�>
�Z$H� ?�}��*!�0��l�~8
?Qeud݇4�hU���(r��"��8cr�M��x�Z]���%��f"��R��)=� �F�`K�&/�"� �nD�t�ѿ-�?@'���~���<o���W�Xx��G֏)֙W�O
��]c0]��v��.Y�r��Wl�m�ސ�װ�=�������č\�\+��a`A��"��Neۻ˓��	ܾ�\D$#��M��Q�� ���7j�o��9��WD���BǺ$%�*'�`c��.�����R,3'��%�� g��I�<�O
_����aw��������x���M�^)-t�!����N�1�_�#��f#��y��(t"ly�"�΢Z��Π�Ʉ�R�ȏk�aP�`c�@_����Fy�;5���[	�	p.�΅�f"�:���8R6�[�:�>�c�MV+Q��5����f%u�I�JLpZ�P���ǘ���۸qr�ݠ��B��%�u��G��;n�3N�\$Psz;���е2�����Qc�r�6�����C ��sۥs̽}m������t���(�%�鄺���
TWU5kf[��l\�`߅� ��n���;:�q��	��<H�$��Ƣ?3f̃jdTk!w�H̓�&��U��i�6d�Կ�ӟ����M1���F�����z�B�i8efx�1�1}`O���t1���]ٷ�#��V��_S����S���!`���Q�63XjJ���x�љ�o�j�eT��o����	ڮ$��������4h�N�ɼ��QYHm���51⻞�+�^���eN��އ
p��\�%`�v!�ăYb����J�~O�KCUu�C5����
½�f��-h�Y��jk��F�c��u������m�����kC�h5�s���݌k�� �u?�v.|��r6m;�����=e��M�=���#����U���G��i�ܸ����ӭ�8O�ܼQ~�&&��(��l����e�b��Q��4����T�zn�#U�P�%|K�Hw"vT������ik����c�u@�{j��m[�$O��.l��R���)(���v���F��V5
4ĭ\I�w���� ���G���rf�Ғ�C\9Dʕ^��3� 7�>��QQ�����J\��ϧ��G�2ܡ�zW��w᫞���v8�.��,�e��(c��6[¯��m���K5O^��۾׮��@�{l��D+���Nr݁�m;f��qjs�e���].7�Jw���Z�"P��6�!��嶌���GbmWvN�1WO��������V�Ҕܠz�y�'U�Q�9�)�.�E���]�}V1�s�����1M]r�)�=W���^�QR�<;����xҽ���,8�-E9b
�0�/���x�1��Q!������kLy�9X�gp����=:/�O��7�(/擞��� �kT[�0;�A�p�*n%�������\��2��l��p�J������ؘc�IJL���i�<�n]�)sk�%  RU�N?�q�t��l���Mz��CLK�'��Nr��F��� ��C�s���~��]��>��)�K�t #��Ǝ˒������Z�m�׉FrHG�: !� S�@�,֩.�`�D�+��������&�rIC��Ph������**C����
wn��R�,g��!�c�V�u�������UJ��4�
�;�	DgNdI� k��q�'�a>d�t�!�a�������wU����+Vҽe���pૄ�y����+����+}����>���9��n��T#H��[�(�1m[���"�񴫫#�8|^����eG�(�.�t�/�ϙ��sCV`�W����vU�|��&�O��ӝ֘����D����ɭ�_1썸 k�n1��5?p�0t}�[�j���gѠ#k�c:���y�S���6��u������Oַ��>:vfũ�t���|���[zغ�ޞQ��Svmc����S.���nE�<[�1b��,�+����$g?���ch���a��%��v����o����/7��TAG۞[LQ:2X�O�coH�V��e~mg�uKx��뇒7�{�oA�l붘>a)Ek7<<G����5]�c��;5��Sŏ�y&lV� �,���C�M�U�"`ҹ3�˥^�(9� n���hU�(�췕;+;�i�]�ji�=��eU���8!.�!q
T�zۥm9�u ������mfhYB�m�bv^_�M�������|�#�1�C��	�� l�N �x�}_�@��6�=p#{�`�J�&LhV�X�y��Ǖ�i��,�1*.y}����Y��`J��]�Uջ��a`��Zg�E��>I�&��\��L��8��5���j��n���m���d����p�)������vG*�d^�L��J��r���=\���`%���8���#�X���6t�^�� 0.�H�%9���ղ>&�� ��Z�&��\K��vP�=v(��p��PE&����x��Eι���zؘW�N��>=���B]��?zq�gFd�&$��,v���w���4<ky�����p7�S�gÛ��0�ch�^=G�sh����Ç�'��ǫ��[|�bx;|��|�r�����㗻�������I'��+�J��{�%�
��~�P9U�4�(Ǐ�F�L.�c�V�*���d�����$�����=�4�̬�ĵ����:��-�un�Z,�ƛ%[u�ȱ0	3����M�.���R�բ���e����{O���I�����pʶ\W�2Jq��v �o^Wf�_W�K�_52c�l�8Y%z�)n����N��'[�l	�w��JA�WŶ�'�h�t�/�� ��˕�X�8�A�&<�&�\pdyQ�(����G�X��=:�kGW�р���aG��GI^^RZ6�>$[������$OH���fbC�#&���g���o3���Bn�V)]�d��)�J�� `�g&�j<x���|%`0��Ψզ5�`ɀr��aī%����cn��P�܉-�X>HbD{�����ֆs��s��Њ���[ӽϠ'\�k�!4�p��˜#@h�Â0��n�q�.e=�o��ai�tB�oE�Fz�[ �  �ʎA�k��:~��� p��������������z�U]���W_���e��z�%/���.�w����Le��~��S��d&�f�D*�R�'w\J������ذrr_e\J��)W��'�ɖj��<����u���2��Vϥ���o��H[���A�J$��K"<������ݤv-)b-LE�-��)<����*YP����8����>��d���9���p�5�VdΜfF�A"���B����^����#����#:�y�ǿn�yJS:�,���ɓ����]�Oo�����x{k�h���dx�r٥jh'���2���H�N���3��zǄp��So(�?��y����e��!Q����)����ର��������ã�5O���Qr޺�������4iM��U�<�9�k��E<I�a�O��$pU��DW8a{�b@��H%���.N�u��eqa#�>�"Q��N-0�}]��pz���g3�K#���ut�ؗ���P9<�e���5�(
#�vg�����\,�}���ʄ��U�"5�蒪�j*E�۩,M��@�`�0O�NgY��4�],6=�  ��������e~X�%�A�es��Z�=��ԋ�ky��POnn�4���6�YY�@���s�f�4�&�����gԍ���f�5s^�9E���ex�����g�C�`_F ��1��OT�h:�(x��N�v��N�YB�a�*�9.��S�=�
�T��d�o
b��j���3�[�h�(:�M��Nm��@�����CB_ﱆ�@\�67�t;h���>۶���!����,���_/�=����)0i��Mȣ@o�U>���q���µ k��Z{ޡ�R���kj�p}����	�-�-�}׼�j�#�x�w�q�xVW?Y�h����b�U�>)�f��e��z7���xψj��qt��5ŌNEɱ����%�D�9�fC�r���\f�.����*�Y��O��yR�`|�nC��N�T��[��J2��)8c����o]����J�Tk�-,	�Q3��J^�����8XDV��p��-����0 ��u�Ǻ��������h蠾8` d׬Z���D�Y�+h���w�89���	��\;��$�2��!�{��H�YJv �޽��"�a-�f�ya̀P�~�`a���<N̊Mk,٬���R�
�������J@M����&�栘���\0��F͕{rWg�q�
�^����u�!���T����n�2e�A���"MS~��T0�|���Kk�V9��� �m�h@?����0J��/�PT���_q��K�'������4�vK�c/����I�O`����}�dX�I���������}m4x��6�R���c��ۗ�l<8��K2eBo�M�+�vڴ�fb������T��OG���[9����JM\�t׋ 3��+\T�1�4��ͻ��D��C���tM�n���$t�1�^�"�oK� 1j�1h�$�"�bĪX�#|�G��+m���ĝ�,-��O8n���c��{�4p�7��*C�֘��\eS�(�0��uY���s4�4-���r�)���]��������7��)o�u�1>fFZե��j�K���
�U�Zb[W�@�VW
�n+e�x��m��U2�mP�zõ{e�7;a��W�".�um�y�M�X^�NK���s��5���.�Gx��n��$׾�Ed6mB����9Y�;�O;p`�ΔvW�6${��6��'� ��@�s�
�?Ae�]VW�ĕ����K�/�����\,���s\��8���&C�L��[ua��a�.�X��@k4�G;$Yv�M�u�˸��`�M\��z�����S	m�c�e_�(��7���yo�����-��pxN�eE��m;����8�gĤ,��b���8��Ǘ��oN�j��P�Eۨ���H,���+�{Ø��+/�mx��46Mx�x���W�+���%���8��uq��j<҃wɔj��v���w�rŀj�}aT���1�҈�C�v}��%���z �Hʰ���iH�O�,_	9���n�e�b���2�f��m�Bр�ڝ.����\��#�#�O\�z��Ux��Z��t�o�r��F�Xϵ.(���ǀ�*���dx#��J��a��(��_�)���'��v��;"�~����/�h�����f�	���n�I��޺nǽR����8�����cC�У]qr�e�5��H��8���j��.�;�ڌGP`��V�l@ǚs�o������~ǳ�*�H1N�q)s��@�B�[��x{qq�!���Z�Pj荠Co�l��	�t�J@����G���P��^��xQJ0Ვ��ژ+�'E>V<Q�C	����q�M�^�˥ruKoR���A>�&*1k���6&���.ʸj��#VH�Qc�0˻eO�\�J�.�x�ǵ�%h�!���E�/T�7�I�F}�zZO��-�M��@r�����u��xV���4w;�V	�߁���j�&�Y�H����#lk��.��i�V�Wf���j�c�:}j�SN�bΎ6����7�?I'��^W�^�+Itϐ�w&����~_/��+6���}^�C�n4ɶևѸ1r�G7�^Z[T5K������nOz�6c�G�O�����^�l�#��H���wx��eV[�v�N�v[�<�����A�c$ͺԃM��2<�G;A���ͲI�����+-ހ�l�_I�����C�U=J����<�n��Ty���i�����&�V��Hc)y�&�27t���64������� �Oro��jS���3�r�]*�X���az�������x�K2I�zl���y�_��ս�*u����CaFU:MUK<�ʈۀ7�L١U��D<��7QS~I�o�k�W�ؖ������~��Z�г	@>���Ӭ�oE+4.���y<f�o����Xk4�6P+y�\�����0j�x�9G�� ��Hm�P��(@�dbkQ:^P�K�%~���l�r˲�7�{���.cˑ~��hd�;V���13�=� ������m�7ȵK߆�o����@봎��� |�T�\3��@mG'�kѱU�s�#[�E����/�>�N������s��]r2<���=]����ɟ������f�      �   m   x�-ȡ�0P�~ž���A-�d	���Bt��H�~�q�^�	�q͌�c��TLe�5��>e������u��N������~�.p��N㨋�	��g��Z�=o&�      �      x������ � �      �   �  x��\Is�F>ӿ�OSV��Ԝ�8�(�V$�\ri�0YX�����-����t�C�DZ��%���o��5`g�n�5�� ˤ�l�-�,�,&�D}�Ɲ|�n�%�.VMFI�T�����be�LKZ�Ror��� ��bE�XL��q�N�mNi�YVu��9���i�&uRf4�{r�->��V)��i�T�}JȎ>ь�E�t�h�E��)�Iv�&�����/���%�O6;Z_Xِn@[� ��5�׻ɚG�_�,�
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
�0�יS�	�z�@)%]���)5��%?���N�����U�o4��L-ML.��Q��QA�ч�F	�8J�2�k�.�z���}�ք�>��vɢ��%ek��a�}.~A��/Tऺ��d!�?zTF����� >:�9      �      x������ � �      �   \   x�5�K� �5}
N`�q>��G23 &�?d�e=���zV�#xf��D�6٤��xTE��9I�x�����x1���ϝJ�֎}�}K ;      �   1   x�3�LL.�,K�2�,H�K��K�2��̃
�p�f�&���p��qqq P��      �   <  x��T�n�0<k�����_W�@k�(t륗���4%Z�D��w)�.+6A�>X^���ΐY��/�Yl����c�:e1<����1�S��=}6�X��q|���Vd�T��0X�Z�h��Q[����?�$nq�=kN{�v�����H�qv������Z��c�5�
�K,���3�S��Y����4یBZ���e ��3i7�p�ʛ^S�E��H}
YNM�����o2�VY��3�GZ��y}�R*�N1��g�(ʀ����0���/8�I����x�)!�|�|�U�vC2O�yq���Øw@��§]����~\��.=EB�ſ�J
�����H���Uw�d�&[����T"�)�j���_6%�n}xR��W�;����| Er��^lJ�׻yP��;����2�بZS+�zU)G�8ҝ:�qO'ע�+�����pr=���������AiKAf+I�kq�#��@�6� ����OU$|	R�|:T	x:�d� W �Iqr1-
~�i�duAc��b�l����:Spȓ��r���ˤ��� �N     