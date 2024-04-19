-- DROP TYPE public."e_gender";

CREATE TYPE public."e_gender" AS ENUM (
	'MALE',
	'FEMALE',
	'OTHER');

-- DROP TYPE public."e_user_status";

CREATE TYPE public."e_user_status" AS ENUM (
	'ACTIVE',
	'INACTIVE',
	'NONE');

-- DROP TYPE public."e_user_type";

CREATE TYPE public."e_user_type" AS ENUM (
	'OWNER',
	'ADMIN',
	'USER');

-- public.tbl_user definition

-- Drop table

-- DROP TABLE public.tbl_user;

CREATE TABLE public.tbl_user (
	id bigserial NOT NULL,
	first_name varchar(255) NOT NULL,
	last_name varchar(255) NOT NULL,
	date_of_birth date NOT NULL,
	gender public."e_gender" NOT NULL,
	phone varchar(255) NULL,
	email varchar(255) NULL,
	username varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	status public."e_user_status" NOT NULL,
	"type" public."e_user_type" NOT NULL,
	created_at timestamp(6) DEFAULT now() NULL,
	updated_at timestamp(6) DEFAULT now() NULL,
	CONSTRAINT tbl_user_pkey PRIMARY KEY (id)
);

-- public.tbl_address definition

-- Drop table

-- DROP TABLE public.tbl_address;

CREATE TABLE public.tbl_address (
	id bigserial NOT NULL,
	apartment_number varchar(255) NULL,
	floor varchar(255) NULL,
	building varchar(255) NULL,
	street_number varchar(255) NULL,
	street varchar(255) NULL,
	city varchar(255) NULL,
	country varchar(255) NULL,
	address_type int4 NULL,
	user_id int8 NULL,
	created_at timestamp(6) DEFAULT now() NULL,
	updated_at timestamp(6) DEFAULT now() NULL,
	CONSTRAINT tbl_address_pkey PRIMARY KEY (id)
);


-- public.tbl_address foreign keys

ALTER TABLE public.tbl_address ADD CONSTRAINT fk_address_and_user FOREIGN KEY (user_id) REFERENCES public.tbl_user(id);


INSERT INTO public.tbl_user (first_name,last_name,date_of_birth,gender,phone,email,username,"password",status,"type",created_at,updated_at) VALUES
	 ('W','Ngan','2003-06-05','FEMALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:58:07.169','2024-04-18 09:58:07.169'),
	 ('J','Minh','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:24.587','2024-04-18 09:56:24.587'),
	 ('X','Huong','2003-06-05','FEMALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:58:07.611','2024-04-18 09:58:07.611'),
	 ('L','Nam','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:25.435','2024-04-18 09:56:25.435'),
	 ('M','Dinh','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:25.804','2024-04-18 09:56:25.804'),
	 ('Y','Oanh','2003-06-05','FEMALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:58:08.138','2024-04-18 09:58:08.138'),
	 ('N','Dung','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:26.542','2024-04-18 09:56:26.542'),
	 ('Z','Chi','2003-06-05','FEMALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:58:08.589','2024-04-18 09:58:08.589'),
	 ('P','Dung','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:28.438','2024-04-18 09:56:28.438'),
	 ('Q','Tung','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:29.231','2024-04-18 09:56:29.231');
INSERT INTO public.tbl_user (first_name,last_name,date_of_birth,gender,phone,email,username,"password",status,"type",created_at,updated_at) VALUES
	 ('R','Trung','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:30.136','2024-04-18 09:56:30.136'),
	 ('S','Kien','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:30.6','2024-04-18 09:56:30.6'),
	 ('T','Quan','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:30.963','2024-04-18 09:56:30.963'),
	 ('U','Tu','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:31.3','2024-04-18 09:56:31.3'),
	 ('A','Tuan','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-15 21:54:04.258','2024-04-15 21:54:04.258'),
	 ('B','Hung','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-15 21:57:15.934','2024-04-15 21:57:15.934'),
	 ('C','Que','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','NONE','USER','2024-04-15 22:02:26.532','2024-04-16 21:14:05.098'),
	 ('D','Binh','2003-06-05','MALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-15 22:05:00.438','2024-04-15 22:05:00.438'),
	 ('K','Thanh','2003-06-05','FEMALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:25.034','2024-04-18 09:56:25.034'),
	 ('L','Hoa','2003-06-05','FEMALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:26.215','2024-04-18 09:56:26.215');
INSERT INTO public.tbl_user (first_name,last_name,date_of_birth,gender,phone,email,username,"password",status,"type",created_at,updated_at) VALUES
	 ('O','Sam','2003-06-05','FEMALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:26.88','2024-04-18 09:56:26.88'),
	 ('V','My','2003-06-05','FEMALE','0123456789','someone@email.com','tayjava','password','ACTIVE','USER','2024-04-18 09:56:31.622','2024-04-18 09:56:31.622'),
	 ('F','Nguyen','2003-06-05','MALE','0123456789','nguyen@email.com','nguyen','password','ACTIVE','USER','2024-04-18 09:56:22.366','2024-04-18 09:56:22.366'),
	 ('H','Dau','2003-06-05','MALE','0123456789','dau@email.com','dau','password','INACTIVE','USER','2024-04-18 09:56:23.573','2024-04-18 09:56:23.573'),
	 ('I','Sumo','2003-06-05','MALE','0123456789','sumo@email.com','sumo','password','NONE','USER','2024-04-18 09:56:24.091','2024-04-18 09:56:24.091'),
	 ('E','Tay','2003-06-05','MALE','0123456789','tay@email.com','tay','password','ACTIVE','OWNER','2024-04-18 09:56:21.536','2024-04-18 09:56:21.536'),
	 ('G','Thuy','2003-06-05','FEMALE','0123456789','thuy@email.com','thuy','password','ACTIVE','ADMIN','2024-04-18 09:56:23.06','2024-04-18 09:56:23.06');

	INSERT INTO public.tbl_address (apartment_number,floor,building,street_number,street,city,country,address_type,user_id,created_at,updated_at) VALUES
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,NULL,'2024-04-15 21:54:04.274','2024-04-15 21:54:04.274'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,36,'2024-04-15 22:05:00.453','2024-04-15 22:05:00.453'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,NULL,'2024-04-16 21:13:28.872','2024-04-16 21:13:28.872'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,37,'2024-04-18 09:56:21.552','2024-04-18 09:56:21.552'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,38,'2024-04-18 09:56:22.368','2024-04-18 09:56:22.368'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,39,'2024-04-18 09:56:23.061','2024-04-18 09:56:23.061'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,40,'2024-04-18 09:56:23.575','2024-04-18 09:56:23.575'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,41,'2024-04-18 09:56:24.093','2024-04-18 09:56:24.093'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,42,'2024-04-18 09:56:24.589','2024-04-18 09:56:24.589'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,43,'2024-04-18 09:56:25.037','2024-04-18 09:56:25.037');
INSERT INTO public.tbl_address (apartment_number,floor,building,street_number,street,city,country,address_type,user_id,created_at,updated_at) VALUES
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,44,'2024-04-18 09:56:25.438','2024-04-18 09:56:25.438'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,45,'2024-04-18 09:56:25.807','2024-04-18 09:56:25.807'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,46,'2024-04-18 09:56:26.218','2024-04-18 09:56:26.218'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,47,'2024-04-18 09:56:26.544','2024-04-18 09:56:26.544'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,48,'2024-04-18 09:56:26.882','2024-04-18 09:56:26.882'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,49,'2024-04-18 09:56:28.442','2024-04-18 09:56:28.442'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,50,'2024-04-18 09:56:29.232','2024-04-18 09:56:29.232'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,51,'2024-04-18 09:56:30.138','2024-04-18 09:56:30.138'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,52,'2024-04-18 09:56:30.603','2024-04-18 09:56:30.603'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,53,'2024-04-18 09:56:30.965','2024-04-18 09:56:30.965');
INSERT INTO public.tbl_address (apartment_number,floor,building,street_number,street,city,country,address_type,user_id,created_at,updated_at) VALUES
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,54,'2024-04-18 09:56:31.303','2024-04-18 09:56:31.303'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,55,'2024-04-18 09:56:31.624','2024-04-18 09:56:31.624'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,56,'2024-04-18 09:58:07.172','2024-04-18 09:58:07.172'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,57,'2024-04-18 09:58:07.613','2024-04-18 09:58:07.613'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,58,'2024-04-18 09:58:08.139','2024-04-18 09:58:08.139'),
	 ('10','10','A','10','Wall street','Hanoi','Vietnam',1,59,'2024-04-18 09:58:08.592','2024-04-18 09:58:08.592');
