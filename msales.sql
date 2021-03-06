PGDMP          &                y            msales    13.4    13.4     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16394    msales    DATABASE     j   CREATE DATABASE msales WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE msales;
                postgres    false            ?           0    0    DATABASE msales    COMMENT     0   COMMENT ON DATABASE msales IS 'first database';
                   postgres    false    3007            ?            1259    16424 	   documents    TABLE     ?   CREATE TABLE public.documents (
    document_id integer NOT NULL,
    header_text character varying(255) NOT NULL,
    posting_date date DEFAULT CURRENT_DATE NOT NULL
);
    DROP TABLE public.documents;
       public         heap    postgres    false            ?            1259    16422    documents_document_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.documents_document_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.documents_document_id_seq;
       public          postgres    false    201            ?           0    0    documents_document_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.documents_document_id_seq OWNED BY public.documents.document_id;
          public          postgres    false    200            ?            1259    16455    sales    TABLE     ?   CREATE TABLE public.sales (
    id integer NOT NULL,
    username character varying(255),
    amount integer,
    created_at timestamp with time zone
);
    DROP TABLE public.sales;
       public         heap    postgres    false            ?            1259    16453    sales_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sales_id_seq;
       public          postgres    false    204            ?           0    0    sales_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;
          public          postgres    false    203            ?            1259    16442    timestamp_demo    TABLE     n   CREATE TABLE public.timestamp_demo (
    ts timestamp without time zone,
    tstz timestamp with time zone
);
 "   DROP TABLE public.timestamp_demo;
       public         heap    postgres    false            ,           2604    16427    documents document_id    DEFAULT     ~   ALTER TABLE ONLY public.documents ALTER COLUMN document_id SET DEFAULT nextval('public.documents_document_id_seq'::regclass);
 D   ALTER TABLE public.documents ALTER COLUMN document_id DROP DEFAULT;
       public          postgres    false    201    200    201            .           2604    16458    sales id    DEFAULT     d   ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);
 7   ALTER TABLE public.sales ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    204    204            ?          0    16424 	   documents 
   TABLE DATA           K   COPY public.documents (document_id, header_text, posting_date) FROM stdin;
    public          postgres    false    201   ?       ?          0    16455    sales 
   TABLE DATA           A   COPY public.sales (id, username, amount, created_at) FROM stdin;
    public          postgres    false    204          ?          0    16442    timestamp_demo 
   TABLE DATA           2   COPY public.timestamp_demo (ts, tstz) FROM stdin;
    public          postgres    false    202   ?       ?           0    0    documents_document_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.documents_document_id_seq', 1, false);
          public          postgres    false    200            ?           0    0    sales_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.sales_id_seq', 17, true);
          public          postgres    false    203            0           2606    16430    documents documents_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (document_id);
 B   ALTER TABLE ONLY public.documents DROP CONSTRAINT documents_pkey;
       public            postgres    false    201            2           2606    16460    sales sales_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public            postgres    false    204            ?      x?????? ? ?      ?   ?   x???;n?0D??)?2f??D?i\???J??F??>,lX+p?v??\???O??j;P????F]?.{f??X??h??Vi?5?]??????GJ?ԌYB&?D?f?? ?D?-d?Fv?H????Hƒp??Hُ2?8B?A?F#?ӴIA?QSQA???s?VĊ<???R#
8?DbEm9访?7'????zYU?/?~/      ?   2   x?3204?50?52R0??24?22?4??+?[??ĴL???b???? ?4	P     