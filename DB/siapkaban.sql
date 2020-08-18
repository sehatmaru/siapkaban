PGDMP                         x         
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
    public          postgres    false    203   	�       �          0    19155    data_perusahaan 
   TABLE DATA           �   COPY public.data_perusahaan (id, nama, npwp, alamat, telepon, email, j_perusahaan, status, komoditi_utama, no_skep, tgl_skep, penanggung_jawab) FROM stdin;
    public          postgres    false    205   ��       �          0    19164    data_pribadi 
   TABLE DATA           k   COPY public.data_pribadi (id, nama, n_identitas, jabatan, telepon, email, j_identitas, gambar) FROM stdin;
    public          postgres    false    207   ��       �          0    19171    dokumen_proses 
   TABLE DATA           X   COPY public.dokumen_proses (id, nama_dokumen, path, jenis_dokumen, pemohon) FROM stdin;
    public          postgres    false    208   ��       �          0    19179    jenis_dokumen 
   TABLE DATA           `   COPY public.jenis_dokumen (id, keterangan, id_sub_jenis_layanan, deskripsi_dokumen) FROM stdin;
    public          postgres    false    210   ��       �          0    19189    jenis_fasilitas 
   TABLE DATA           N   COPY public.jenis_fasilitas (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    213   ��       �          0    19195    jenis_identitas 
   TABLE DATA           9   COPY public.jenis_identitas (id, keterangan) FROM stdin;
    public          postgres    false    215   ��       �          0    19201    jenis_layanan 
   TABLE DATA           �   COPY public.jenis_layanan (id, keterangan, id_jenis_perusahaan, id_jenis_fasilitas, id_jenis_pengelola, id_jenis_penimbunan) FROM stdin;
    public          postgres    false    217   �       �          0    19209    jenis_pengelola 
   TABLE DATA           N   COPY public.jenis_pengelola (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    220   ��       �          0    19215    jenis_penimbunan 
   TABLE DATA           O   COPY public.jenis_penimbunan (id, keterangan, id_jenis_perusahaan) FROM stdin;
    public          postgres    false    222   H�       �          0    19221    jenis_perusahaan 
   TABLE DATA           :   COPY public.jenis_perusahaan (id, keterangan) FROM stdin;
    public          postgres    false    224   ��       �          0    19225    layanan 
   TABLE DATA           s   COPY public.layanan (id, j_perusahaan, s_j_layanan, j_layanan, j_pengelola, j_fasilitas, j_penimbunan) FROM stdin;
    public          postgres    false    225   I�       �          0    19231    role 
   TABLE DATA           .   COPY public.role (id, keterangan) FROM stdin;
    public          postgres    false    227   f�       �          0    19237    status 
   TABLE DATA           0   COPY public.status (id, keterangan) FROM stdin;
    public          postgres    false    229   ��       �          0    19243    sub_jenis_layanan 
   TABLE DATA           M   COPY public.sub_jenis_layanan (id, keterangan, id_jenis_layanan) FROM stdin;
    public          postgres    false    231   �       �           0    0    data_perusahaan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.data_perusahaan_id_seq', 360, true);
          public          postgres    false    204            �           0    0    data_pribadi_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.data_pribadi_id_seq', 56, true);
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
          public          postgres    false    230                       0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 52, true);
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
       public          postgres    false    231    3123    217            �   �   x�-�11D�f0�"�I������k����cN�
� ���\M��j�~=�u�Kff3AٓD[B�f����8±� {#���h8����J(�����1	�P���������߫Hke��4�ݺ��B����_�+�      �      x��}�v�H��3�+�e�EQ���o�`[�d�De��V��$L��;UO����%}� 0�����[�nf�OD�a�ٍ���E���غ�.�mR���G�Ƕ��7�?�3��\;ٶ=��?�"��ו�>O�I����#�ں.��>�.�u�̶C��zd]��~�5��[rhM���8��S��|߱���U�=�}���4��ɚ��b���˕�ʶ���U�&wg�	ο\\���\�"����L���:x�ֻ,��H�����9�?
�O't���z��ck��@��G8`W3�Y�=�������w��e\���c���}i}^�Oy�����s��.��!�ޙ���n���2����.��rdѾ'Gn��l�����An~�>e#���_ ��'T�s����"A~���������R����(*��.��m"�#��M��&~�ޯ�Y�H1�IBz#�I���g� qa]�{<3^�;��L�<��|��k��I<���W'�Zs���H���~�:��u�)�i�9��}�븝�gB�Q|<�e��7���.���D>�9��p䟹��]Ii^���\�����ƺXg+k<�G�|�o���,�~]��JT���_�S�J��}
��g[�)=CR"<kt&l�q�5�$9\�Һ����x�/sS1b�F :N�ش\��P��<�g��0�,=,/�B�^Clh��o(hȨ#@�t����j�z��tﳼ Ѿ=^4��#��OrR2����|��$b���K��m���"��<wU3�m&H!LF6��Ff���3���t�U�]~K��B��D#!��
D���{��>�x���$�B:���-��\�O'����Ϩ����Z�t��;[�+�loR���z��8��gv��؂t�oә���ܺ��Y�����(�}��`R�
����,�0TǊge��3�v�c�@�)-��ԙBg��Z��'?аY�dU��� 
��Q�0((yۧ�	<�u�\'֧t�'�"�p$]w4Ot��2K,M|��~�\)B��$Y��)�hG���@�"r%���1�?Y���8���QX��U
׸�7���ou�m��'T�K����K��^�z�<�I�@���W�`z�����%^����b�K'D�>[/�2>�����k�3 �n;#	�QV�����ޏ%����v�@9+�p�d�g��E��v��0�5�@{�{����8���@�%�j���}��;�^'rB�";�S�w	�.}�b�ƛ]�>��2r0��xo]�9�^&9�V4�hV����	| p7J�x�$8��!�W߳�7?�.vy~v��.�s�
`ݖ�d? �e�㝋(r��3�y�!>��?�mK2#0����럌����]E���C�56 l���#\u��.,O��#<��mj� �v=�\w${t�Ƽ�T�a�p�0h����X���qen�iސk��H5��ݤ\�{L�>f�v���3�j�,�$�~/�m8��������?AM�"Pj�G��Q��󑵟$�$�'s�>�jw
�0�B{�w�h�\�дݲ�t�ڊ�G���N�io�S|��-�j>�nҫ�� �!@���d�o��^>%�w����J`Qx�/�R3c��#��	����!���SP�@$iW��5�I��-���}��)�<I"��20���h�tM� � �+{������ �\�P��7�?�c����]]���o���t
�Z����@�c�{����N�6hI��/k��x.7�nZ���n�7�`|u��r�=I�u����&~Je������~�'�K������a�A�^oHԣ"�8���2�zz��ȅO�߭<�V����p�hY����)g����>�x�!��Ht��wغ)\T�?�1R��ɗd���� ����֗,_/���m����by�^ :B(B��s����MEjp�Ty��[�s@��"�H=1��=k�І�B��b�g%*�k��N���H�k��q�r*�:�^�<2��.��N�Թ/%[?o ����TJ�=�n ��
ļ'���S~"Tc��,��cDմ����B���xS.rЂ�$�ISk��3
m�W��N����m���U�H3Lщ[�s�0�:3�h�)`�\�P0�ti.1��;�8p~�Z�u5�=r���Hr]�,|:�{)�
ɞN�x�N�ºOwIGy
g�Qs;��o����K�73�ޝ����|q�W��j��(>m�V��)�Nc��%�A&�a���Dd���M� ��_/\C���� �]V�$�nק�(H��w�%�Ñ:��~���ҵ�hz��Z�|�s.�'����2[���JP��	
f+�ȏ ]�) ��v�=/2b�?)+�Q����^3�pdÄt�Dw��[���񧀗 4��"\d,ѡϧ�����z��x��6pA��_>!���_�+�cf�-���b��eh&$+�%]/~dقё7�|����@w>`��<���M�J���A/axő}�&�L��qQ�W�2� F	�6`to���\�/����n�gp�w�f7pl����&�o$9�!����~��j|�,8/�T�*o9�u�������c�N���v(ɮ��O ��������58��A-Xw�z]�(��}E��=�@J��!8*F�/�d0'[*� ���S�o)�v(��E�{`�&�hD���D(��ɫt�l�$:9����޺����-��P��(:G�[�xx���V'�,���=wI����-��*�>�>�dʿ�D%�C2��%�������y������7=� :��p��>��)跇Gn�����a.6˴H�5L1B���RkG��2��0�s&	�Edp�KDe�	h�:e �;t�f��,�m����}�Je<�i;Y�˴��U�?ghU��uO��:|�%} \E�8u��S�BgY���Ed���2���v�X����#�4`�}#��g��7�#I��8[i;0�G}|�7py�,�L@�"��D]�����o�ȑ:�� n}"o�%����c�!�:uv	);�LSąo��J>�~$�s�����U� �\��dE�B���L<�"'췻N�.��4 u�.F�Gz6Y�Rh(�ri��D�=�C�o�9�@I�F��/E���(Gd�ǘLb���%`� @��;��GD���b�EI�]�K����~�.K���q��q���>��K(��T�����H�S�(�l���В��sz:+���]n|�F��ч�'���`{�έ�)I����vp#lWT�Q�*�V!����W�Ws���1�5�vڱy}��H������8��j������8��/Xyـ�Ae7�e�º�V9���6�g��Xdn��hɓ�ָt��X������&�QVl��g��`s�+�� ��:#��UB�M}���p+�w�!�~Qz�_{�%륵�f�z�4�g:��Q��I�/����y�M�ؾ~iO��#�~E&�ɻ�h�����_�KZ�()��*� =��P{J���}eT�uZd��ApH��K��}�Z���M�;6\�,[���Zx�	�F���ȕ	��<N᫫$rU�B��-��0�,���o�<� Z/s ��}e.@���F�I0��\�=(-����G�ly׮�F^�'��P����
�p�4n�ܮ�R�A�F��.#x��ǕZT� ��#�`;ƕcI�^�L�q���V�M�ʽ���ƜƳ�j�������
0��+J��&+�)�@����of'B�*_�%�Z	ĽDXr֓�M� �����C�l�Tx�"���V���}�f�u��?`����*��l�����������Y>�y�Y?�k�����~.�A��B+��y�(j�&�Xt���
W�Tߦ����,�#>(}w�y6����`���ޜ!�*ǵ�Z��}�W��6c�<b��A��&�����2ߦ�~Z�}*�c�8$���9��m�|t!\}9n%?ߦ��8��@���9(�1���oi��n��-    ��t�����E�X��F>EC�[W_^3�LS�:�)�f�����o�ל�e�7:��	@�o�o=����Gu �>M��/Q�l�y��j{|����#m�q�ȶ��� lq��)M�-L�	<�܂�^���~����\?�1&8p�oӕV�ӏ��"����.A)�b+���$�e��J��Z7��ْ}i��Sxj�CJ��B�����&�~��(sxUά�.ݐj۪��8x�������+@�}]U�	ڭ!��!A��R\�7���mP�};pݞP�T!��Rk�׭6Ĥ���?PSZ)2��ْ��Zx�e���'A:X�}��+�Z�:g��%�iǒ�>VQ�S\V�3#?���l����|ë����{��2����hj�����W1��z�m+2#��3�#&CWUjXG�N�]2����k�7sU��7�j��̐n�!�c6�.UU��Z;�R{ŋ�b���$�,�O�.���4� T��q�'9�5@�
�spF�C�oB�> )��U����Wof*�|��Dp.B�I�[��#G4�\}����jaX_Ԓ¡���'����4~�`l�K���0��Ӡ'2��a�S=��S�������°�2ĒK>�pxQԘ0��w2� mT@G�/�A���x�����|�I�/k�t��Q���8�d��t�G�;]e�c�<��+�DM�������w ~jX#�&H}���)��4\r�&�T�X�d�)�n	�'#t
"iz7}��A(��RlZ7�Z���n�e3�B�>�*�XƬ!�,OL���� �������xR����izC3�8<ݺ�;"�{���<FH�(���k:Kr�m�ȃC�=��3��lC�>ʭd�=��Y�s��/�֬D7�/�qt����D�3S�����_T ��6��]�O6���P�rU��D��%�.�-��'�+�'�w�r�E:)�[p����
7V�s�K�rHF�����v��p�'� (�������J�JKDB��
�c���n{ȅ����1E��	��&ۧ_�t�X]�('us}�1^$b-#8M�K�.��ޯ�)���:58�v_&��W�|��cX�5e�PǦ�倜��t���1�jtݯ��*u�碿�q��0Bp���x|�Hf��K�(����%]>�D�v+�Ofi�!!}���o�=ƨ�:����]p���u��c��	�<1T�/�h�:A���k����{�2��Z��dJ�O�HU^���U�!t��=�a�O�6p����s�@�!�#���_�Q�*`;� N�����-��m.�Vt�^O���H��1x�[��{H�u�a�A$�n��R8V���Ǯ^q#��p��l�Y`�##`z6�U�'�W�`+��,���"�J(��`�[��'p�E��V��������>흠�\�96�~AG�����@���w͵��%V�'�>�W$���n�a�r�.@�SoGG�'���+(������$���U��[��&���=v�1�������ѥw���Yw�s���1��M����8����@��������@�x�+�|����N�@|�M��A`�t��ƭ�7Vr׌�?����it�9R�癀�>�;9=6\pVpQ�����{ӊa��6?)�W�ϳm����V��r�b e`;L�����CB�Tt�{���$j����f�A��,��%��e��BI��Z�4r+.�d3[?�t[�kʤ"��יJ<�*5�)�d5�`�팀ۨ�p7���T�z���BlC
+p��}�]f[x�����_����{���^D�-��%D�>�A(��!�jL���H�yg�-;^/WwPc��x$v�g����2�V��t�WL	����/��S {��|��w���I ��y=��.]�C����L�2o4[M���ٮ�Q*\(%��Xⴜ��卹Uܻ���Ш�^�(���'R��50"Q��9�52K7 8h���f>�ۥuI��]���W��}�̗��x�^%�t��	�����z3W�k�.���9]%P���Hu��C^��o�&'��6)��(^�Z4�#]�xJ���g3CVD�j ��i��j�ҳ��~G���1)��P��A(����yR�X/�ϡ�D'��l����['�IXh��<���K��i��n���S��.��s�V�\�G��D���C#34ˌn���<��·�Ts��"��fm�wYo��V�\��!�H�\�H��4�|��|��0y��W8��0X�ަ�~Tg�x~��E��5f�rT�J�f���:�_C%O<[�C��A3U1v�Mw�<��Ƌ'���k!�1�/f_��'�/�W�m��g�N�bN���WB���t�!#x�d��PN��vYwׅz������`#��H��E���:�Hk�밫�ȧ��î�냮��~-�=�W�v�c�4�>k~��W�o�8b��><�5{	�|7z�d�*��U�	�,Đ��4�?Q�b4b�^g�J5,C����<)�G����Hpf_�^U����8��?�����&�V7��;|=���`���.��aL�>���h�[!���D�N#��,�P|�%��W�tٝ0�2�E�4��y�J�P���Ë�h:����-d����u|`�	Ƣ�� �	������>������{U;��Ŀ�k����O�c�8���/Vg�D����G��tÎN��󔤛�,���\��z�]��Y��>'<n�P޶�	e��̇O1:�;�I�.#�,�ǔNq�p��S�0)�bN�y�H�P�O�?p���^>aE�<�~O���e|�:�e2]g�x3 ��-�
t(�����ƭhx�­����0l��4�w'G8� �4���҄���s�@2U��ıV]z(ݑ/�Y�W��vc����x� 4�js�ї��y:b�y�I���?�i��Q��x�X�QO��B`� �j��COw�N�=���?Sv��]�:��c�|]T�)��:�a@�ZgR.��Zq�x�~��Z�:m@����X��L��V�=��Mҭ�����a���u0i
7 ���-纔�n�T���l|�;����<e�)u,�G8��F�:=%��ю'q82��'�S �Xh_��.ָ�"pK [���r�p�\I�� x*
�,�;�w�Gﻭz�wǝX���\X��M��gFe��x�Dh���P�R�E���$p2.�����)O��|��fu���Vb��x,�mUp��k��{=՛��T�.��1�8'�7o�� Fu(���k�ݲD#�w�����d���~Cm���Q�}�}���5��v��[�.���8��/iF͇�/U�P-E�2)sR�?�9167�(]���ߟ�e��o����T`1�d��O| ���LvO���.-�<�}ށ��Y�g�Kq$�}`��|�c�����*���K����t{���%����BK�������rn�`{
�F�wv׮�U�� X�S٨w���A0�W���M	'�f4v��bl���8B]_���}�O�;�B��7:+���R������8F��W����L�te�|8�t�e+�/o�%��o�/�t?>�D��9�fk�����}3Gt�4<��\�U��6f��>5p�J���65|=�cӗ7;K6T�yuTB<C��"{\�g�ѫ����`܁
R'�:��s�j���N_�z���~����d0�C���Y��0����en\�/mB���}M��E�a�+8[�L�z̫Q�����s��^F�W�-�ru����w�Lw����i�jH�E=ڂ$�f�pN)U����W1��3Ꮴ-64y[j����@6�>k���:P�?��1B���y���^C_��V9�FQ����H��vy2'�h�<�1�\���ܱ��I�jz�0�̺�J=�7����#e���dQ�a�;��1��OX֐�8�s�3��LGMH{�:>1���l�d�����\5��X
,=I�T�)ѡ6b���#    V�M�4�fG��k��zX���]��{�,�ǉ.SUy��O_v<S1�-���'�In\���A���2F�(N����ڬ:W.�S��+���k��"�N����s�*zN_c����j�.i�Y�_Ɵ��
0U��ۺK:��K7y=qܪ���Sqp	ƀT79��X������C�K�d�c9����g�BZQrG*&*w�|ő���S��G\t$���#c�˲�sb�)s72�Y�02��1� �����[�k��L8FE�j	��PHnN��R�08�?j�Qi�B��}lM�9�}4�p^�m< #>�(���2V�'����Bb���j�����'s�H3�c\�W^	�9 �5��Y�'U%������L��A3=v�jา�t�y<:��ճ�!]�<)L�|����RJ�Ur��|U���p[���\������ڙ*e3���%J��@�]�[�)�~:�>���a���XΒV�~�k����'q��z��_���>�x�8o�2��ZS�F�☟���S4Mk#kp�;N��rh�Q�u��p��[Dtk�,Ra�oJE�F���,�4IH�K�'8,�+����<C�Ne2D���Z��N����!]70v	�e���uz��5st�-�vUE'�+�ѽ��~2�[��X�rp��1���:�S���ہ��c��_���i쑕����wDN؎gNN`��ʟ����N�#L�/M���Ū������a ��%w�N\��g�8A�v�0>bYS]��1T���j}R���"�@v���j��ܨ:M2�	�z\w$=��NQᄂĊ�DX'��'���WG�{�u��*���R������]hs	��cF.�*���|Ҝ�����ZL���޳�S�}ʬi�-nm���("�����=�[465��D��.�X���Hq���+���h� T�#�=�T%�ܾ��%�����lQ��E��A4��������w���V�_N�o�����g}_�^ 
��r�*{���6}"~{G%^8�������>q�<�����i�:��({��k����)�����S�^��S�gWl2���yӟl��2�}��H����{�jb�Q� �>��HT�0�w��(�ʲ�wՖ��	�1y����Qb
��u$�"qv�(QW7�sw�t��Ai����36�����H����w��lR�X��K��n�k�Դ�m���e˼ϓ��	�Ť�%#�&�b����k��Ϋ�ٚ�Dm1pi]��+�mS��0���Z��'�i�s|��N�Y��Lص
_.8�-��M�he�=J�W��%�p��;�H��iɠoa�.(���6�}yp*5n�r�r��H��P���y������>��q���i=4,�2yl0诛x���&�^͂mn�rTY�t�:z[��T�,��2S�H�v�����t��9?Y����ɶ8
�����4�-=�)1al��V:d�c��-��I��w�vg_��J�ׅ���?�\�C�@��UvB�n7�m<m?j�+͹(�u2�y��>E|d��k�p��-��p˖t<E�>�Sv��6�ɺ��^3��W��2�+�̽/tϿ���Ís7n8~�Yڇ�8$��h�#�F˼��c��w�G��H>78(�!;��6��jmݖ�e�l���4��i�M��ĩ�7��K��o��:�MM���AX��i�JYKn��-��l�<.mݘ�&9nn;U�&D����C�����Q�VIM5��'
��]TO�ܣ��Ӵ&0h���oɲ�RiJc��vR1��]�[_�l$g�m�_m�x��x�$�	�r"�ĆY���G [hd����&�ꨉ����Ս��l�[�,�(�'Փ��d����s��7.�f�b�ֿ�m���v;22u��"����1`�O�i��MB%Qo��4�Jn
�'�Ka�.��k��t� �����n��}딁�����y�%��5l�X�X�U�NEp�0mlX�*�ϛ;USa�}(+m��
��RZ�:ǟ����˞B���m_�p�{:i�7���aj(�7�
��a��o��0<2��"��r�WWNpS�V����U��Z7oHn2~婹5�ړ�-���Qs����4�����~Z�4~��Q�).!��Sj��U���<W��!&-��7=X��s=�����Wib�MPE��u���_�4N�O8��n�/�|��D��'�eYV�m����<n>2C���s�į2r?ݨs�lt?��p�u��c���;��.�h���ve�8"s1؋��i����v�"R��� |R%(u�.��b(o��I;ԁs���Ш;���y����%��҈yU���t��'���ge���3�ˊZ�傋�v���=�^)���:O��C*&���j��p��+?y�M����l��i��ax~[�V���f�!����r���=�Z͹i�������k�i��~��HvE��pg����������IEJ�;p�S�y�պ����4K �����~�i��t��j��������Ϩ�I�6��k}gA^a���
U�	�#��	�C���̔��Y8Bk���^B,�l�\�?~�a��t�����W��euW�6�%(�H�E�������ގ\m�Hp%���Q����dEh�u2eUކ[S�K�g���L�3
���)�?ՖfT�C�v��RO4M������')@��s��G��!���y3)�G�\}c��V��t��dC�EC��t�dt��� ��f`B0���G�Z {'*׆�H1�	��kHƘF#F�m�@W	�<{}�$!�oѫW-��~���&]<������n1C�T=8�*�*�Vw)Z>Â!��N�Z���^�������&�w�7��#v���;�b�1G��ö�^�����``���G-b���ǩ�6� oݺ�^ㇲHr(�iL{��T����NM���ȡ2=�^}�������v�$
����c���"]�8�(��	(��g	\� ���s% �8��D�=�G��u��,��D'#K�T�(�UY�1��1:���������R(�D��RA,A�@�Y���W\xQ��yg�(������Vttv6�[�I8��^�O.n��<ݫ	^�*ϴ�ca+�0gU�����h����AE=wV|�����>��� �F4��9>�[�d�s��
2���t�0P՗?@�)Ƭ<�|'Ľi4SOa����zĝp �ie/�g�|�+:v��Dm�2|^U����3`�Q_��������	�C���`��q�8�W��
�iC�#7�G6�����,j�E����>}Zu���"TU(���?=�i"L�ݳ��� W��=���SP�*j�]n�kLl����x}C��?QX��f���.�7�stV���e��3�~�כֿ�힜��j����(�+T�?�$2@z��ɟ��Y�f�E�~�"G�b\M���*s�ˑ�f�O���3�Kh巹sZQ��{�����̍��p�C<&�@�{�s�p9�����D�=�c�����6K=ݹ��3#HӐ��5�����ώ��ӈ9<quź)�
I�U�o7��ƿ�������@���u�0� �}�p}��ߍ����|s{���������'tG��I��k���P���*����T���n?2{!�J��N6� ��o��]��.�R�>�����}c�fH̫�+_�9��ѾJ�	�ruu�d�nV9�Ka��P��2ݥ<�_ɼZ;{�CL�u�?���?�w�/��LQ햋y�eԪ>B�?�[�dľ Z͈�������d�譵��ݧB�߷����6����o�bx Ji����h��剷�O��zLk�3NcP�	�	<�`^�)*G�.~�a;�tt��D��U�UH���Alؓu��>I^_[��>$M�,(��#�#&}翙���	r�j���]�wu�OS�@wp����)9��	[��U\1�3�+Cr[�2�
T��_����g�����ě5���cc�n���PE��E�X�HRu�\��Y����ٺ���fh�ޣ�ڰ�¾xk~�%�u�l   
լpFF���@:R��������B70y8�0�WH��S9��ou�[��#(�.�u'�/�)�׷�_���|����zz3Ɗ�7�����o=ߎ�h�_��3��^�|������i`*y��;��I@��߲�a@�թ��;.��C�Q�[lv�|z�l��;���J�+��ǑK��}��TȞ�=6p��IQ��T������ʌ��{b8�SQ��������m?�}[�X;S���d(�<�8�JVԸ&�#��;�3��$��K�S�\����"��p��KZd�f���*�B����Td�?��S�s��S:ZK�0��f˔��+q��K3<;==��T#�dgݬuIv9����	��O��5v�g��%{�0=�[8��G4��3�0�#n$�Q�a�/�T�a��X�-"�:n�S��P���ba��R����/�fO'�y�������\�� ���Γ�$\��䘕�(je]Ƴ����4Y/*7%(~A��v�R:���C�- X��tݤ)\�����k��=n?;?�u�\���_z6��4h��aG'�}�;��q���p����g��ӡ����N�o�}�؞����OQ'AX�SR��.���Rt���doɄ6�4��ܚmd1MX�r7�+ B}�^s2Ο{�U���a�4��e��9| �U���3mƻ$����Z$�2�V�េ�.�l�&E���+�F�)�(Q(hL_;˦[�����Z���b'{���L;��"~��K��F9�6LvKZt�R�>WY�i�L��E_���OgE|S.#�2wx�Gz��d�$�! ��Ovp�J�<b�\u����[���·�a�B���Ȋ�> ;�޲w-)U��E�'���d&Y��*R���1���X-:�ֱY]`��s�;�����������wq`j|��Q�|�5o�R��x��#b��d��.6~�>�48=/�һ_}R�|��>��frs}�����&�1[77\�395�����������ݔ�r��s��w�0�v��b]$��~�I5��Y{�'{�U]Hd��B�ĺg��隿N��s��ӥ������(]G�aKP��tY�*e����'��<	��Y�eLp��!��lO6I���lZt����� �&�m�zy����6���x�#i���<��'�TF�U(v1F��0�iֻI��/���D؈�YUb����VH}9ö$,�y���-���Z����j3k�����=D�g���ezw�
��t���b&�/2j/a9��>GL|Pn2���k$u���.��Ȝ��.S�D9�E5ũ^�@U
#˗�r_�O,�����M����cLR������m���;��
4�݉:C=X�śE�U���������쾛E&���,o`2l�ձ�4�m����ޡWIߡ%zt�a��݊�G��
k��Ы�S�{�v���Y��̨o�9�h�)yc�j�|{]�������d�&��I���v�29�9���
�G��]S��{Ԫ�k���ٙ~3N� �`K��:j�yh��$�2��ɺ��=����;Tp���DG*l:`��p��\u];<��"��Q��dP"ҍ�4���,�����#��S�D{M��F%Z��,��c�s=;��^=��rB�ķ�=��0��X`m�p��)j�úI_m(n~��HEY�
��&����9�E�ި�v����nwv�PGo�U\5G��⋄�ұ0]�xߣ���F�J�9<܄ ����%�v��("��j�:Ԟ~�IB��}�M��b��6<��{R�*bOY!��T��g�5Y\�?�zY�D��l!�j;9�=�"<)W����1�z2�%���U�i������<�-t��`r�G�e�:�+�œD�?	Xm7b�ŕ�6Fh�pBH٤e��1���1�</��Ha�A�9]lSeK� ��oQ�eEO���#'�q폘�{\m3���w�'��������m��/�������Ɖ��y,hu{�Ct�t"�㍯�2�98#S�T0�c
�o�$n0�x}��T>�S�ɜ��������w�j݃j'~a�	���POҔ�G�-�<�w�r���  k�TA}ېB�f��
?r{�}k����B�ܓ~h����k�:��)������;����Kש�هu���G@�8�K��`�������KJ-��10���?('��j����3���j�X��{��ر(�mO��;�Q�hN���>�=ôeB���I2�d���]�*txlN�gƾ(�X/�h۟<`�x��9cAs4�-2١�{B������������:�h�Xs��m�,ܣ�A�4O�x�1u³:��<�DwN� �D�ac"á��//�8,���bXLT�,��iM��s��e<���S]���)ŗ��
��E<F�A�;���Z��*7ƶ�Ȁ��Ȯ�	3$Qm�px�t�n7�z�����z�uІ㼪�J̪-���I?U�e\���S���Q�0�\�#Z��%��<Q3;��������)���J�[����Q�[Oъ��_�ª@r���X��Ͱ
����tP�{�-�	���*�Z�<f� �%-0��°�l,�*V\�v�S��\!�JB� /pE���)�:$�YX9��%�� ����n�� 8%Pc}[������=Gߘ�@����m��yx��������jSC��$+�w�ik*��r��״��k4ր����	�aO��y?�1��gu\��k/7Ev#�~���M��x�R\��Z{�����alt8�_c��U�7�z}�d]�°5��y���Pm��{���qFAd�涑��n6�_Eҧ����z:C�3%���EZ>O������e�}�͍�Ɣ�*d���@z̟��^��h>���D՜�۞h��U��Yۥ���� w�[w�YRU����s��^��{Ui
�i�^3��Y��Z�Q]��A��@�m[R�~x*�h�Xd*WE5^�>�E�w��+P�� �
����:B&EO5��"�y�&B�n�r�5Sm�K^خ	�-��@LD^�1�;e�TX4X�(Ua`�3� ��>�.�)Ԙ�j%���v��E��=°�W)����db��{����1��;���撘
��;43�O����@���z���c~��^gT�lڎN�7"n�x��[�V��B5�\��E`��U7�����5��A\�Ot��?|�3>�w>��b����S������lH?�?��Q���?v~�o!���������GNw      �   �   x��O��0���!�[�tCBl��bh�UZR5 _O� ��y�u�Z鯏J�}vj�n&����F�G}����Urѷ����a�k����N��麕����CZE1�fTR�d�"�|��� �t�~�ݭ�Kj��l
�LJ��]� q0{}'�P�i��C0ƀ��ǉ7��ԓ-����n��zr�      �      x������ � �      �   �  x��\Is�F>ӿ�OSV��Ԝ�8�(�V$�\ri�0YX�����-����t�C�DZ��%���o��5`g�n�5�� ˤ�l�-�,�,&�D}�Ɲ|�n�%�.VMFI�T�����be�LKZ�Ror��� ��bE�XL��q�N�mNi�YVu��9���i�&uRf4�{r�->��V)��i�T�}JȎ>ь�E�t�h�E��)�Iv�&�����/���%�O6;Z_Xِn@[� ��5�׻ɚG�_�,�
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