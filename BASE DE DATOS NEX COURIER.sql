PGDMP                         |            nexdb    15.3    15.3 G    o           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            p           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            r           1262    18679    nexdb    DATABASE     x   CREATE DATABASE nexdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE nexdb;
                nex    false            s           0    0    SCHEMA public    ACL     %   GRANT USAGE ON SCHEMA public TO nex;
                   pg_database_owner    false    5            �            1259    21839    comunicado_seq    SEQUENCE     y   CREATE SEQUENCE public.comunicado_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;
 %   DROP SEQUENCE public.comunicado_seq;
       public          postgres    false            �            1259    21800    usuario_seq    SEQUENCE     v   CREATE SEQUENCE public.usuario_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;
 "   DROP SEQUENCE public.usuario_seq;
       public          postgres    false            �            1259    21840 
   comunicado    TABLE     �  CREATE TABLE public.comunicado (
    cod_comunicado character(8) DEFAULT ('COM'::text || lpad((nextval('public.comunicado_seq'::regclass))::text, 5, '0'::text)) NOT NULL,
    descripcion character varying NOT NULL,
    url_documento character varying NOT NULL,
    fecha date NOT NULL,
    cod_usuario character(8) DEFAULT ('USR'::text || lpad((nextval('public.usuario_seq'::regclass))::text, 5, '0'::text)) NOT NULL
);
    DROP TABLE public.comunicado;
       public         heap    postgres    false    234    230            �            1259    21780    deduccion_seq    SEQUENCE     x   CREATE SEQUENCE public.deduccion_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;
 $   DROP SEQUENCE public.deduccion_seq;
       public          postgres    false            �            1259    21143    tipo_deduccion_seq    SEQUENCE     }   CREATE SEQUENCE public.tipo_deduccion_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;
 )   DROP SEQUENCE public.tipo_deduccion_seq;
       public          postgres    false            �            1259    21781 	   deduccion    TABLE     �  CREATE TABLE public.deduccion (
    cod_deduccion character(8) DEFAULT ('DED'::text || lpad((nextval('public.deduccion_seq'::regclass))::text, 5, '0'::text)) NOT NULL,
    estado_deduccion character varying NOT NULL,
    dni character(8) NOT NULL,
    cod_tipo_deduccion character(8) DEFAULT ('TID'::text || lpad((nextval('public.tipo_deduccion_seq'::regclass))::text, 5, '0'::text)) NOT NULL
);
    DROP TABLE public.deduccion;
       public         heap    postgres    false    228    223            �            1259    20939    departamento_seq    SEQUENCE     {   CREATE SEQUENCE public.departamento_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;
 '   DROP SEQUENCE public.departamento_seq;
       public          postgres    false            �            1259    20940    departamento    TABLE       CREATE TABLE public.departamento (
    cod_departamento character(8) DEFAULT ('DEP'::text || lpad((nextval('public.departamento_seq'::regclass))::text, 5, '0'::text)) NOT NULL,
    nombre_departamento character varying NOT NULL,
    descripcion character varying NOT NULL
);
     DROP TABLE public.departamento;
       public         heap    postgres    false    214            �            1259    20948 
   puesto_seq    SEQUENCE     u   CREATE SEQUENCE public.puesto_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;
 !   DROP SEQUENCE public.puesto_seq;
       public          postgres    false            �            1259    21749    empleado    TABLE     �  CREATE TABLE public.empleado (
    dni character(8) NOT NULL,
    primer_nombre character varying NOT NULL,
    segundo_nombre character varying NOT NULL,
    primer_apellido character varying NOT NULL,
    segundo_apellido character varying NOT NULL,
    correo_empresa character varying NOT NULL,
    telefono character(9) NOT NULL,
    ubigeo integer NOT NULL,
    nombre_direccion character varying NOT NULL,
    fecha_contrato date NOT NULL,
    cod_puesto character(8) DEFAULT ('PST'::text || lpad((nextval('public.puesto_seq'::regclass))::text, 5, '0'::text)) NOT NULL,
    cod_departamento character(8) DEFAULT ('DEP'::text || lpad((nextval('public.departamento_seq'::regclass))::text, 5, '0'::text)) NOT NULL
);
    DROP TABLE public.empleado;
       public         heap    postgres    false    216    214            �            1259    21820 	   login_seq    SEQUENCE     t   CREATE SEQUENCE public.login_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;
     DROP SEQUENCE public.login_seq;
       public          postgres    false            �            1259    20989    plataforma_seq    SEQUENCE     y   CREATE SEQUENCE public.plataforma_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;
 %   DROP SEQUENCE public.plataforma_seq;
       public          postgres    false            �            1259    21821    login    TABLE     !  CREATE TABLE public.login (
    cod_login character(8) DEFAULT ('LOG'::text || lpad((nextval('public.login_seq'::regclass))::text, 5, '0'::text)) NOT NULL,
    fecha_hora_inicio timestamp without time zone NOT NULL,
    fecha_hora_fin timestamp without time zone NOT NULL,
    cod_plataforma character(8) DEFAULT ('PLT'::text || lpad((nextval('public.plataforma_seq'::regclass))::text, 5, '0'::text)) NOT NULL,
    cod_usuario character(8) DEFAULT ('USR'::text || lpad((nextval('public.usuario_seq'::regclass))::text, 5, '0'::text)) NOT NULL
);
    DROP TABLE public.login;
       public         heap    postgres    false    232    218    230            �            1259    20990 
   plataforma    TABLE     �   CREATE TABLE public.plataforma (
    cod_plataforma character(8) DEFAULT ('PLT'::text || lpad((nextval('public.plataforma_seq'::regclass))::text, 5, '0'::text)) NOT NULL,
    cant_usos_exitosos integer NOT NULL,
    cant_usos_totales integer NOT NULL
);
    DROP TABLE public.plataforma;
       public         heap    postgres    false    218            �            1259    20949    puesto    TABLE     �   CREATE TABLE public.puesto (
    cod_puesto character(8) DEFAULT ('PST'::text || lpad((nextval('public.puesto_seq'::regclass))::text, 5, '0'::text)) NOT NULL,
    nombre_puesto character varying NOT NULL,
    descripcion character varying NOT NULL
);
    DROP TABLE public.puesto;
       public         heap    postgres    false    216            �            1259    21768 
   sueldo_seq    SEQUENCE     u   CREATE SEQUENCE public.sueldo_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;
 !   DROP SEQUENCE public.sueldo_seq;
       public          postgres    false            �            1259    21769    sueldo_bruto    TABLE     �  CREATE TABLE public.sueldo_bruto (
    cod_sueldo character(8) DEFAULT ('SLD'::text || lpad((nextval('public.sueldo_seq'::regclass))::text, 5, '0'::text)) NOT NULL,
    sueldo_base numeric(10,2) NOT NULL,
    asignacion_familiar_porcentaje numeric(10,2) NOT NULL,
    horas_extras integer NOT NULL,
    comisiones numeric(10,2) NOT NULL,
    compens_variables numeric(10,2) NOT NULL,
    dni character(8) NOT NULL
);
     DROP TABLE public.sueldo_bruto;
       public         heap    postgres    false    226            �            1259    21113    tipo_beneficio_seq    SEQUENCE     }   CREATE SEQUENCE public.tipo_beneficio_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;
 )   DROP SEQUENCE public.tipo_beneficio_seq;
       public          postgres    false            �            1259    21144    tipo_deduccion    TABLE     9  CREATE TABLE public.tipo_deduccion (
    cod_tipo_deduccion character(8) DEFAULT ('TID'::text || lpad((nextval('public.tipo_deduccion_seq'::regclass))::text, 5, '0'::text)) NOT NULL,
    descripcion character varying NOT NULL,
    categoria character varying NOT NULL,
    porcentaje double precision NOT NULL
);
 "   DROP TABLE public.tipo_deduccion;
       public         heap    postgres    false    223            �            1259    20996    tipo_usuario_seq    SEQUENCE     {   CREATE SEQUENCE public.tipo_usuario_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;
 '   DROP SEQUENCE public.tipo_usuario_seq;
       public          postgres    false            �            1259    20997    tipo_usuario    TABLE       CREATE TABLE public.tipo_usuario (
    cod_tipo_usuario character(8) DEFAULT ('TPU'::text || lpad((nextval('public.tipo_usuario_seq'::regclass))::text, 5, '0'::text)) NOT NULL,
    descripcion character varying NOT NULL,
    rol character varying NOT NULL
);
     DROP TABLE public.tipo_usuario;
       public         heap    postgres    false    220            �            1259    21801    usuario    TABLE       CREATE TABLE public.usuario (
    cod_usuario character(8) DEFAULT ('USR'::text || lpad((nextval('public.usuario_seq'::regclass))::text, 5, '0'::text)) NOT NULL,
    "contraseña" character varying NOT NULL,
    dni character(8) NOT NULL,
    cod_tipo_usuario character(8) DEFAULT ('TPU'::text || lpad((nextval('public.tipo_usuario_seq'::regclass))::text, 5, '0'::text)) NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false    230    220            l          0    21840 
   comunicado 
   TABLE DATA           d   COPY public.comunicado (cod_comunicado, descripcion, url_documento, fecha, cod_usuario) FROM stdin;
    public          postgres    false    235   �Z       f          0    21781 	   deduccion 
   TABLE DATA           ]   COPY public.deduccion (cod_deduccion, estado_deduccion, dni, cod_tipo_deduccion) FROM stdin;
    public          postgres    false    229   �[       X          0    20940    departamento 
   TABLE DATA           Z   COPY public.departamento (cod_departamento, nombre_departamento, descripcion) FROM stdin;
    public          postgres    false    215   �\       b          0    21749    empleado 
   TABLE DATA           �   COPY public.empleado (dni, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, correo_empresa, telefono, ubigeo, nombre_direccion, fecha_contrato, cod_puesto, cod_departamento) FROM stdin;
    public          postgres    false    225   �^       j          0    21821    login 
   TABLE DATA           j   COPY public.login (cod_login, fecha_hora_inicio, fecha_hora_fin, cod_plataforma, cod_usuario) FROM stdin;
    public          postgres    false    233   �a       \          0    20990 
   plataforma 
   TABLE DATA           [   COPY public.plataforma (cod_plataforma, cant_usos_exitosos, cant_usos_totales) FROM stdin;
    public          postgres    false    219   �b       Z          0    20949    puesto 
   TABLE DATA           H   COPY public.puesto (cod_puesto, nombre_puesto, descripcion) FROM stdin;
    public          postgres    false    217   c       d          0    21769    sueldo_bruto 
   TABLE DATA           �   COPY public.sueldo_bruto (cod_sueldo, sueldo_base, asignacion_familiar_porcentaje, horas_extras, comisiones, compens_variables, dni) FROM stdin;
    public          postgres    false    227   �d       a          0    21144    tipo_deduccion 
   TABLE DATA           `   COPY public.tipo_deduccion (cod_tipo_deduccion, descripcion, categoria, porcentaje) FROM stdin;
    public          postgres    false    224   �e       ^          0    20997    tipo_usuario 
   TABLE DATA           J   COPY public.tipo_usuario (cod_tipo_usuario, descripcion, rol) FROM stdin;
    public          postgres    false    221   Rf       h          0    21801    usuario 
   TABLE DATA           T   COPY public.usuario (cod_usuario, "contraseña", dni, cod_tipo_usuario) FROM stdin;
    public          postgres    false    231   �f       t           0    0    comunicado_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.comunicado_seq', 5, true);
          public          postgres    false    234            u           0    0    deduccion_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.deduccion_seq', 40, true);
          public          postgres    false    228            v           0    0    departamento_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.departamento_seq', 6, true);
          public          postgres    false    214            w           0    0 	   login_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.login_seq', 10, true);
          public          postgres    false    232            x           0    0    plataforma_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.plataforma_seq', 10, true);
          public          postgres    false    218            y           0    0 
   puesto_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.puesto_seq', 8, true);
          public          postgres    false    216            z           0    0 
   sueldo_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.sueldo_seq', 18, true);
          public          postgres    false    226            {           0    0    tipo_beneficio_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tipo_beneficio_seq', 2, true);
          public          postgres    false    222            |           0    0    tipo_deduccion_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tipo_deduccion_seq', 4, true);
          public          postgres    false    223            }           0    0    tipo_usuario_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.tipo_usuario_seq', 4, true);
          public          postgres    false    220            ~           0    0    usuario_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.usuario_seq', 18, true);
          public          postgres    false    230            �           2606    21848    comunicado comunicado_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.comunicado
    ADD CONSTRAINT comunicado_pkey PRIMARY KEY (cod_comunicado);
 D   ALTER TABLE ONLY public.comunicado DROP CONSTRAINT comunicado_pkey;
       public            postgres    false    235            �           2606    21789    deduccion deduccion_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.deduccion
    ADD CONSTRAINT deduccion_pkey PRIMARY KEY (cod_deduccion);
 B   ALTER TABLE ONLY public.deduccion DROP CONSTRAINT deduccion_pkey;
       public            postgres    false    229            �           2606    20947    departamento departamento_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (cod_departamento);
 H   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_pkey;
       public            postgres    false    215            �           2606    21757    empleado empleado_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (dni);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public            postgres    false    225            �           2606    21828    login login_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (cod_login);
 :   ALTER TABLE ONLY public.login DROP CONSTRAINT login_pkey;
       public            postgres    false    233            �           2606    20995    plataforma plataforma_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.plataforma
    ADD CONSTRAINT plataforma_pkey PRIMARY KEY (cod_plataforma);
 D   ALTER TABLE ONLY public.plataforma DROP CONSTRAINT plataforma_pkey;
       public            postgres    false    219            �           2606    20956    puesto puesto_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.puesto
    ADD CONSTRAINT puesto_pkey PRIMARY KEY (cod_puesto);
 <   ALTER TABLE ONLY public.puesto DROP CONSTRAINT puesto_pkey;
       public            postgres    false    217            �           2606    21774    sueldo_bruto sueldo_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sueldo_bruto
    ADD CONSTRAINT sueldo_pkey PRIMARY KEY (cod_sueldo);
 B   ALTER TABLE ONLY public.sueldo_bruto DROP CONSTRAINT sueldo_pkey;
       public            postgres    false    227            �           2606    21151 "   tipo_deduccion tipo_deduccion_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.tipo_deduccion
    ADD CONSTRAINT tipo_deduccion_pkey PRIMARY KEY (cod_tipo_deduccion);
 L   ALTER TABLE ONLY public.tipo_deduccion DROP CONSTRAINT tipo_deduccion_pkey;
       public            postgres    false    224            �           2606    21004    tipo_usuario tipo_usuario_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey PRIMARY KEY (cod_tipo_usuario);
 H   ALTER TABLE ONLY public.tipo_usuario DROP CONSTRAINT tipo_usuario_pkey;
       public            postgres    false    221            �           2606    21809    usuario usuario_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (cod_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    231            �           2606    21849 &   comunicado comunicado_cod_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comunicado
    ADD CONSTRAINT comunicado_cod_usuario_fkey FOREIGN KEY (cod_usuario) REFERENCES public.usuario(cod_usuario);
 P   ALTER TABLE ONLY public.comunicado DROP CONSTRAINT comunicado_cod_usuario_fkey;
       public          postgres    false    235    3258    231            �           2606    21795 +   deduccion deduccion_cod_tipo_deduccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.deduccion
    ADD CONSTRAINT deduccion_cod_tipo_deduccion_fkey FOREIGN KEY (cod_tipo_deduccion) REFERENCES public.tipo_deduccion(cod_tipo_deduccion);
 U   ALTER TABLE ONLY public.deduccion DROP CONSTRAINT deduccion_cod_tipo_deduccion_fkey;
       public          postgres    false    3250    224    229            �           2606    21790    deduccion deduccion_dni_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.deduccion
    ADD CONSTRAINT deduccion_dni_fkey FOREIGN KEY (dni) REFERENCES public.empleado(dni);
 F   ALTER TABLE ONLY public.deduccion DROP CONSTRAINT deduccion_dni_fkey;
       public          postgres    false    3252    229    225            �           2606    21763 '   empleado empleado_cod_departamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_cod_departamento_fkey FOREIGN KEY (cod_departamento) REFERENCES public.departamento(cod_departamento);
 Q   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_cod_departamento_fkey;
       public          postgres    false    225    215    3242            �           2606    21758 !   empleado empleado_cod_puesto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_cod_puesto_fkey FOREIGN KEY (cod_puesto) REFERENCES public.puesto(cod_puesto);
 K   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_cod_puesto_fkey;
       public          postgres    false    225    3244    217            �           2606    21829    login login_cod_plataforma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_cod_plataforma_fkey FOREIGN KEY (cod_plataforma) REFERENCES public.plataforma(cod_plataforma);
 I   ALTER TABLE ONLY public.login DROP CONSTRAINT login_cod_plataforma_fkey;
       public          postgres    false    219    3246    233            �           2606    21834    login login_cod_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_cod_usuario_fkey FOREIGN KEY (cod_usuario) REFERENCES public.usuario(cod_usuario);
 F   ALTER TABLE ONLY public.login DROP CONSTRAINT login_cod_usuario_fkey;
       public          postgres    false    3258    233    231            �           2606    21775    sueldo_bruto sueldo_dni_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.sueldo_bruto
    ADD CONSTRAINT sueldo_dni_fkey FOREIGN KEY (dni) REFERENCES public.empleado(dni);
 F   ALTER TABLE ONLY public.sueldo_bruto DROP CONSTRAINT sueldo_dni_fkey;
       public          postgres    false    227    225    3252            �           2606    21815 %   usuario usuario_cod_tipo_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_cod_tipo_usuario_fkey FOREIGN KEY (cod_tipo_usuario) REFERENCES public.tipo_usuario(cod_tipo_usuario);
 O   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_cod_tipo_usuario_fkey;
       public          postgres    false    221    231    3248            �           2606    21810    usuario usuario_dni_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_dni_fkey FOREIGN KEY (dni) REFERENCES public.empleado(dni);
 B   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_dni_fkey;
       public          postgres    false    225    3252    231            %           826    18900    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     W   ALTER DEFAULT PRIVILEGES FOR ROLE nex IN SCHEMA public GRANT SELECT ON TABLES  TO nex;
          public          nex    false            l   �   x���K�0�u{
.��<|�kc�q禖*M���5�;��\��+i2������x��Qō�Wz5��ÈP�u?��P��W�.�cW�!���HD?��8C�S5i��Y�
�mś2��Ўm��d�� �ۛ���%`��}E�d	o�88E�4��&r�W��R�:5uj�J�]g�Em���-ٝc3|	0�?n?�e      f   �   x�u�;n�@k�a�]��Q@.ҧtc�J���b�";A�!5�q;�s�������ؚ��1����zQ�!�� 4�5G7���8:#4���H�2�-+��=9vF��� �Ϭ{*�#�@�s��Q�C�1"��~�QӖkӚ����'��p��'MwHeD8M=�Lah�|����OrF�����p���\Zm��?H��v�t�1w���I��8�t�$�bh�|����r+��I�5s      X   �  x�]SK��@]ۧ�D�dFb�ĊM�\��]��Xdn�Xq�\��v�d�U��y����/�l>�Y�M�}�=wF��g�5ew��0�]rO:�Qo���%r@m=���i�t@����:��*K4FM���݂�U�U�"#���(��|�4ZH��Z+�х�#�@霭�E�
	e<���8S��! �T�̊���˭��i.�]Q�n����iv�.�9F�� V�����t.���#��HP[Y �$��c���U.���ɮ���4�?��C·J���sp���ɰ�A���N(��.8����{Z�9j���b.a1tv7땝���fg(4_Sv��ϕ;-L��r��Z�2T&$�,�|�S�`YAYZ���]\WŌ�ㅁ,0f�ub_N��"}��D,#�/K�bί �=e�`n�sν}.�/=I7��8���
TFň�9{�Y9Ddy�3Ku����m۶���Vt      b     x����r�0���)�0H�?�5�6n=Ɍ'�����Veb��C�&�r�#�b]�nm�'-X��}�e�4NҌ,�P�%��"sU��o��������Ƃ'�����R�
����,K�x1J��"rR��R�b#J��%,d�R����!���ߖ�f�u�߁�?��p]@��o�b�ǯ�yƛ���}d0���Ձb�k^�4f�Ub&t�S���$�/ �{Q�;���C^h<�Ai<�H�r��o��B������f��h�&i63��>D>]�%�<�Č\��a��ޘ?��@�r�� Wz/>aeH}�)�y=�e(���"Wr��N�e�n�����4%� �4�d��5 &5
d~��%1uID�)>4�����5J0�?�#L����f,u��[`B�����;=v��N��j�"�T!���S�4AcA�9�As�T8� c~�|���C�	��d���sXk�%���pjT�Ǡ2[4Vr=p`M�L�& �h���؂��߫�}�0�4��	��P
m�	\���4Y� ���j���D�;��Q���>T�Ći
;'�5E�S�3v2�ԣv9.�n2�-�$�6<�Lv"��̮L�����_|�.�cҷ"�������'�ģ�2
���B2��vP)i|a1�)76<���B\&���v�{պa����-u�er.�`��������N̟�<��_��3�H�rN���i:��ab��̚�s�2f�y�C�7!���@��7���-g=-��e�J=�_��y�Mؽ�      j   �   x�e�K� D��\ ��.�M�V��z�s7X�$�h4~���7�^8�A� -����"i��}|^�������PF�p���c�c���H^��Z�ψȈ �`G�Y�#�@FFD�Gy�"�>����I��\IT'̋$F$Fd�g�sI��N�"�)b/���E!�JQQQ�^�"�Q+]D�����bG8?��aVG��|�Ƙ ̄q      \   U   x�=���0��0�%?�wH�"e��#Yݑ<@����(v�x�n�L<����]v�䤡!�O|RG�D�.!9U=����0�w�      Z   �  x�]Rˎ�0<;_�/��H��8 F���'jpڡ�4��9p@|B~�r2���qwUW�{u���sw��Zط��@�}�<$ʹ��m�����}ǹHR�9z���!Ն�[4���[*EɅ�{Q� l��j 먝�h�������ԊA�C���d�#��z������y�Kw�\F���d߹�v�F:)�����,�X}�bT�ʵԟ����d�P�Y.f�r�c��v�6�'?I.�GUS=!f�^*q���D��=���J8�N!\�_�h[�Cf`�m0�ӗ#�A�6o�$�e�q���eۋ�d_v�-��O�u� �A�e��}�ţ��p�҉������_�4g��:��¬mP�ȋ�7neǖq=X�s(�߹OC]@�XV��m�D �i���Q��j��?���0�_G��>�!�0�Y4_M�����      d   �   x���;�0Dkt�BB�>e:���9�D��L��c����x�Q���<F�;Dy:f�����	��ye�Lv�V�D��46�c�e��ҍw<%9!�����-��g��'[|:���]�HS��ellE��|�~�H��7����?��S�ab�Nw��1���tjF_-�(���oN�X�Tyţ��K�W�L��>�_<�_}n��&�W�_������-&���YM�[��|7Sx�B/�œo      a   �   x��t1 CNǂ���T�DG� ����Ң̔�������N=C��R#�R���Ĝ�l�La�9]RSJ��3��R���sJ�J�2���A:,`:L�2�ɥ�y%��
@�SRsA<$	�c�=... ��<T      ^   p   x�	5 CN����̂��Û�RR�S�R�JR9�4WD��Bǔ�̼�⒢Ĕ�"��_>P ��8� c����R�*@��]<8��0�&]srR��8a�=... �wJ�      h     x�e��N�@���as�mb7��5��+�`ZB�^�C\ܳ�/s�ܩ^�t���ϭ)�����:l���QR��nvt���5ZI�H��ˮ2#|D�(�~��7�"���h�Cf������1����*0ߑNř�0c�BA��Oʌ�lK0ϙ3�����Ԉ��="�h���* V���nC�N!b�!���s�FP3�.\��o�ft���P1���h�����t3Ӟ���rO�01�X�>����a}���m
��o�wI���{��     