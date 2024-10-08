PGDMP                         |            software_project    13.12    13.12 6    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16610    software_project    DATABASE     u   CREATE DATABASE software_project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United Kingdom.1252';
     DROP DATABASE software_project;
                postgres    false                        2615    16612    staff_    SCHEMA        CREATE SCHEMA staff_;
    DROP SCHEMA staff_;
                postgres    false                        2615    16611    student_    SCHEMA        CREATE SCHEMA student_;
    DROP SCHEMA student_;
                postgres    false            �            1255    41306    add_courses(text)    FUNCTION     &  CREATE FUNCTION student_.add_courses(json_request text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE 
    json_result_obj TEXT DEFAULT '';
	vr_course_code TEXT DEfault '';
	vr_course_name TEXT DEFAULT '';
BEGIN
-- 	{"course_code": "CPEN211", "course_name": "Database"}
	vr_course_code := json_request::json ->> 'course_code';
	vr_course_name := json_request::json ->> 'course_name';
--       json_result_obj= json_build_object('success',true,'data',array_to_json(array_agg(row_to_json(t))));
 insert into student_.courses(course_code, course_name)
 values(vr_course_code,vr_course_name);
 return 'Course Saved Successfully';
-- IF  json_result_obj IS NULL THEN
--      json_result_obj = json_build_object('success',false,'msg','Error Loading Data');
-- END IF;
--   RETURN json_result_obj;
END;
$$;
 7   DROP FUNCTION student_.add_courses(json_request text);
       student_          postgres    false    4            �            1255    16740 #   calculate_outstanding_fees(integer)    FUNCTION       CREATE FUNCTION student_.calculate_outstanding_fees(student_id_input integer) RETURNS json
    LANGUAGE plpgsql
    AS $$
DECLARE
    outstanding_amount DECIMAL;
    fees_paid DECIMAL;
BEGIN
    SELECT SUM(amount) INTO fees_paid
    FROM student_.fees
    WHERE student_id = student_id_input;
    
    SELECT SUM(amount) INTO outstanding_amount
    FROM student_.fees
    WHERE student_id = student_id_input;
    
    RETURN JSON_BUILD_OBJECT(
        'student_id', student_id_input,
        'outstanding_fees', fees_paid
    );
END;
$$;
 M   DROP FUNCTION student_.calculate_outstanding_fees(student_id_input integer);
       student_          postgres    false    4            �            1255    41314    delete_courses(text)    FUNCTION     	  CREATE FUNCTION student_.delete_courses(json_request text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE 
    json_result_obj TEXT DEFAULT '';
	vr_course_code TEXT DEfault '';
	vr_course_name TEXT DEFAULT '';
BEGIN
-- 	{"course_code": "CPEN211", "course_name": "Database"}
	vr_course_code := json_request::json ->> 'course_code';
-- 	vr_course_name := json_request::json ->> 'course_name';
--       json_result_obj= json_build_object('success',true,'data',array_to_json(array_agg(row_to_json(t))));
 delete from student_.courses where course_code = vr_course_code;
 return 'Deleted Successfully';
-- IF  json_result_obj IS NULL THEN
--      json_result_obj = json_build_object('success',false,'msg','Error Loading Data');
-- END IF;
--   RETURN json_result_obj;
END;
$$;
 :   DROP FUNCTION student_.delete_courses(json_request text);
       student_          postgres    false    4            �            1259    16701 	   lecturers    TABLE     �   CREATE TABLE staff_.lecturers (
    lecture_id integer NOT NULL,
    lecture_name character varying(100),
    course_name character varying(100),
    email character varying(100),
    course_code character varying
);
    DROP TABLE staff_.lecturers;
       staff_         heap    postgres    false    7            �            1259    16699    lecturers_lecture_id_seq    SEQUENCE     �   CREATE SEQUENCE staff_.lecturers_lecture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE staff_.lecturers_lecture_id_seq;
       staff_          postgres    false    7    211            �           0    0    lecturers_lecture_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE staff_.lecturers_lecture_id_seq OWNED BY staff_.lecturers.lecture_id;
          staff_          postgres    false    210            �            1259    16717    teachingassistants    TABLE     �   CREATE TABLE staff_.teachingassistants (
    ta_name character varying(100),
    email character varying(100),
    course_name character varying(100)
);
 &   DROP TABLE staff_.teachingassistants;
       staff_         heap    postgres    false    7            �            1259    16623    courses    TABLE     �   CREATE TABLE student_.courses (
    course_id integer NOT NULL,
    course_name character varying(100),
    course_code character varying(10)
);
    DROP TABLE student_.courses;
       student_         heap    postgres    false    4            �            1259    16621    courses_course_id_seq    SEQUENCE     �   CREATE SEQUENCE student_.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE student_.courses_course_id_seq;
       student_          postgres    false    205    4            �           0    0    courses_course_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE student_.courses_course_id_seq OWNED BY student_.courses.course_id;
          student_          postgres    false    204            �            1259    16652    enrollments    TABLE     �   CREATE TABLE student_.enrollments (
    enrollment_id integer NOT NULL,
    student_id integer,
    course_id integer,
    enrollment_date date,
    semester character varying(10)
);
 !   DROP TABLE student_.enrollments;
       student_         heap    postgres    false    4            �            1259    16650    enrollments_enrollment_id_seq    SEQUENCE     �   CREATE SEQUENCE student_.enrollments_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE student_.enrollments_enrollment_id_seq;
       student_          postgres    false    4    209            �           0    0    enrollments_enrollment_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE student_.enrollments_enrollment_id_seq OWNED BY student_.enrollments.enrollment_id;
          student_          postgres    false    208            �            1259    16639    fees    TABLE     �   CREATE TABLE student_.fees (
    fee_id integer NOT NULL,
    student_id integer,
    amount numeric(10,2),
    payment_date date
);
    DROP TABLE student_.fees;
       student_         heap    postgres    false    4            �            1259    16637    fees_fee_id_seq    SEQUENCE     �   CREATE SEQUENCE student_.fees_fee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE student_.fees_fee_id_seq;
       student_          postgres    false    4    207            �           0    0    fees_fee_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE student_.fees_fee_id_seq OWNED BY student_.fees.fee_id;
          student_          postgres    false    206            �            1259    16615    students    TABLE     �   CREATE TABLE student_.students (
    student_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    date_of_birth date,
    email character varying(100),
    password_ character varying(50)
);
    DROP TABLE student_.students;
       student_         heap    postgres    false    4            �            1259    16613    students_student_id_seq    SEQUENCE     �   CREATE SEQUENCE student_.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE student_.students_student_id_seq;
       student_          postgres    false    4    203            �           0    0    students_student_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE student_.students_student_id_seq OWNED BY student_.students.student_id;
          student_          postgres    false    202            H           2604    16704    lecturers lecture_id    DEFAULT     |   ALTER TABLE ONLY staff_.lecturers ALTER COLUMN lecture_id SET DEFAULT nextval('staff_.lecturers_lecture_id_seq'::regclass);
 C   ALTER TABLE staff_.lecturers ALTER COLUMN lecture_id DROP DEFAULT;
       staff_          postgres    false    210    211    211            E           2604    16626    courses course_id    DEFAULT     z   ALTER TABLE ONLY student_.courses ALTER COLUMN course_id SET DEFAULT nextval('student_.courses_course_id_seq'::regclass);
 B   ALTER TABLE student_.courses ALTER COLUMN course_id DROP DEFAULT;
       student_          postgres    false    205    204    205            G           2604    16655    enrollments enrollment_id    DEFAULT     �   ALTER TABLE ONLY student_.enrollments ALTER COLUMN enrollment_id SET DEFAULT nextval('student_.enrollments_enrollment_id_seq'::regclass);
 J   ALTER TABLE student_.enrollments ALTER COLUMN enrollment_id DROP DEFAULT;
       student_          postgres    false    208    209    209            F           2604    16642    fees fee_id    DEFAULT     n   ALTER TABLE ONLY student_.fees ALTER COLUMN fee_id SET DEFAULT nextval('student_.fees_fee_id_seq'::regclass);
 <   ALTER TABLE student_.fees ALTER COLUMN fee_id DROP DEFAULT;
       student_          postgres    false    206    207    207            D           2604    16618    students student_id    DEFAULT     ~   ALTER TABLE ONLY student_.students ALTER COLUMN student_id SET DEFAULT nextval('student_.students_student_id_seq'::regclass);
 D   ALTER TABLE student_.students ALTER COLUMN student_id DROP DEFAULT;
       student_          postgres    false    202    203    203            �          0    16701 	   lecturers 
   TABLE DATA           ^   COPY staff_.lecturers (lecture_id, lecture_name, course_name, email, course_code) FROM stdin;
    staff_          postgres    false    211    G       �          0    16717    teachingassistants 
   TABLE DATA           I   COPY staff_.teachingassistants (ta_name, email, course_name) FROM stdin;
    staff_          postgres    false    212   0H       �          0    16623    courses 
   TABLE DATA           H   COPY student_.courses (course_id, course_name, course_code) FROM stdin;
    student_          postgres    false    205   2I       �          0    16652    enrollments 
   TABLE DATA           h   COPY student_.enrollments (enrollment_id, student_id, course_id, enrollment_date, semester) FROM stdin;
    student_          postgres    false    209   �I       �          0    16639    fees 
   TABLE DATA           J   COPY student_.fees (fee_id, student_id, amount, payment_date) FROM stdin;
    student_          postgres    false    207   	J       �          0    16615    students 
   TABLE DATA           h   COPY student_.students (student_id, first_name, last_name, date_of_birth, email, password_) FROM stdin;
    student_          postgres    false    203   �J       �           0    0    lecturers_lecture_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('staff_.lecturers_lecture_id_seq', 49, true);
          staff_          postgres    false    210            �           0    0    courses_course_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('student_.courses_course_id_seq', 8, true);
          student_          postgres    false    204            �           0    0    enrollments_enrollment_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('student_.enrollments_enrollment_id_seq', 1, false);
          student_          postgres    false    208            �           0    0    fees_fee_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('student_.fees_fee_id_seq', 1, false);
          student_          postgres    false    206            �           0    0    students_student_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('student_.students_student_id_seq', 30, true);
          student_          postgres    false    202            V           2606    16706    lecturers lecturers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY staff_.lecturers
    ADD CONSTRAINT lecturers_pkey PRIMARY KEY (lecture_id);
 B   ALTER TABLE ONLY staff_.lecturers DROP CONSTRAINT lecturers_pkey;
       staff_            postgres    false    211            L           2606    16628    courses courses_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY student_.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);
 @   ALTER TABLE ONLY student_.courses DROP CONSTRAINT courses_pkey;
       student_            postgres    false    205            T           2606    16657    enrollments enrollments_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY student_.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (enrollment_id);
 H   ALTER TABLE ONLY student_.enrollments DROP CONSTRAINT enrollments_pkey;
       student_            postgres    false    209            R           2606    16644    fees fees_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY student_.fees
    ADD CONSTRAINT fees_pkey PRIMARY KEY (fee_id);
 :   ALTER TABLE ONLY student_.fees DROP CONSTRAINT fees_pkey;
       student_            postgres    false    207            J           2606    16620    students students_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY student_.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);
 B   ALTER TABLE ONLY student_.students DROP CONSTRAINT students_pkey;
       student_            postgres    false    203            N           2606    16690    courses unique_course_name 
   CONSTRAINT     ^   ALTER TABLE ONLY student_.courses
    ADD CONSTRAINT unique_course_name UNIQUE (course_name);
 F   ALTER TABLE ONLY student_.courses DROP CONSTRAINT unique_course_name;
       student_            postgres    false    205            P           2606    16731 "   courses unique_student_course_code 
   CONSTRAINT     f   ALTER TABLE ONLY student_.courses
    ADD CONSTRAINT unique_student_course_code UNIQUE (course_code);
 N   ALTER TABLE ONLY student_.courses DROP CONSTRAINT unique_student_course_code;
       student_            postgres    false    205            [           2606    16732 $   lecturers lecturers_course_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY staff_.lecturers
    ADD CONSTRAINT lecturers_course_code_fkey FOREIGN KEY (course_code) REFERENCES student_.courses(course_code);
 N   ALTER TABLE ONLY staff_.lecturers DROP CONSTRAINT lecturers_course_code_fkey;
       staff_          postgres    false    211    205    2896            Z           2606    16712 $   lecturers lecturers_course_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY staff_.lecturers
    ADD CONSTRAINT lecturers_course_name_fkey FOREIGN KEY (course_name) REFERENCES student_.courses(course_name);
 N   ALTER TABLE ONLY staff_.lecturers DROP CONSTRAINT lecturers_course_name_fkey;
       staff_          postgres    false    2894    211    205            \           2606    16725 6   teachingassistants teachingassistants_course_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY staff_.teachingassistants
    ADD CONSTRAINT teachingassistants_course_name_fkey FOREIGN KEY (course_name) REFERENCES student_.courses(course_name);
 `   ALTER TABLE ONLY staff_.teachingassistants DROP CONSTRAINT teachingassistants_course_name_fkey;
       staff_          postgres    false    2894    212    205            Y           2606    16663 &   enrollments enrollments_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY student_.enrollments
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id) REFERENCES student_.courses(course_id);
 R   ALTER TABLE ONLY student_.enrollments DROP CONSTRAINT enrollments_course_id_fkey;
       student_          postgres    false    209    2892    205            X           2606    16658 '   enrollments enrollments_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY student_.enrollments
    ADD CONSTRAINT enrollments_student_id_fkey FOREIGN KEY (student_id) REFERENCES student_.students(student_id);
 S   ALTER TABLE ONLY student_.enrollments DROP CONSTRAINT enrollments_student_id_fkey;
       student_          postgres    false    203    209    2890            W           2606    16645    fees fees_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY student_.fees
    ADD CONSTRAINT fees_student_id_fkey FOREIGN KEY (student_id) REFERENCES student_.students(student_id);
 E   ALTER TABLE ONLY student_.fees DROP CONSTRAINT fees_student_id_fkey;
       student_          postgres    false    207    203    2890            �      x�m��N�0E��W�D�5�숚���
�-�i�8.�3�P�7j�3:G�^�e��MKz�<��!2lm߳x�N#��Z��,w�d����������j)��d�͈���{����{��9�ӝ�q�s�\��I��;9��!)*߆ϣ�t&E�d�<�WR-�"[$�� �c����R�މB(�!�f@�@�O6t��\������cU{d���R��L��/��'Qضդ]��C�1X����������3bys�QC��hF}*�������s��I)� ��1      �   �   x�]�1n�0Eg�<����v
x�҅Vh��M%�\��������?������=�[�$E1X�}=�%,ȳ�q1-f�&.�*�1s�d�q�~�<�!.U�s���I��I��-%b�	uf���M��*��gB��Y��9ٖQޕœ�Tp�;�L}�J�I(~*�`�o8*��DO�L���}-�NJ$f�څ���賮>�J	P.p�CԒ�8Q�@�1q&��
�<��$�q�����鬵�h��(      �   �   x�=���@D�ۯ�AD�6^1��ełM`�n7ƿ�(x���&1'��fi"k0��V��sHM1��$X�������_*)lL=��rBh}7�H�wK��̔N�*��(���n���e�5%�-	yeף}F�<�`j[���˺�@˝y�$��y��C����9N���He      �      x������ � �      �   �   x�U��� D��]Za�1,�	��=S5�����pN��]+������P��T�4���^���1N3Ɗ��sJs`��7�yδ0'&�RJsa��ߔ
2Ω�H�9mQ}���w��;��<|��}� ��ؾ�X�ß ��d�����w�r/_z���,�yws��s~y���e��k��<#�kmߡw��'��_���y���T�?�w�K)_��h�      �   Y  x�m�[o�0����V�\vy+inUԤM�V��2�k��6dÿ�x!郑���y��C�����ʲG����8�3l�z+�q[7x���G�EO�P������ ��Nx0BZ0���S��\(BVO�#e���#��C��uY�Scك�s��Z�	�*�7SfF���	���q���G�"3�������8.H�}��N��K��֤
ipI�x�{�F�J��t����,$�W�^�:��+\�H��2�%��r��<Ǳ� �կ{3�Z��r�7�kɅo&ꪏ�r�u��nI)�y7��������f�
|c:�]�sٹt�G��� ���}�5�8��{a�_�ٱ>T���T�q�0�*<5BCx8��ävi81��)~KU5��H�X��S�x�����ٶ�:�I������x�:�B�"<�I~
M=>����.�,��{�3����Cd�xGV4���fR�5�Z1�.�%;�%��g��3|���1�6�[aξ��R.�X�\J�?��Eb�5�)Wx��h'e����Bo����ע����Z,S�<>�V�7-�wn�N���4��]>�q+Z��gPU�X�&�7���e��l�M���     