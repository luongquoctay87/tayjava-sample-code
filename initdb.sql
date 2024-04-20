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


CREATE TABLE public.tbl_role (
	id bigserial PRIMARY KEY,
	name varchar(255) NOT NULL
);

CREATE TABLE public.tbl_group (
	id bigserial PRIMARY KEY,
	name varchar(255) NOT null,
	role_id bigserial NOT NULL
);

CREATE TABLE public.tbl_permission (
	id bigserial PRIMARY KEY,
	name varchar(255) NOT NULL
);

CREATE TABLE public.tbl_user_has_role (
	user_id bigserial NOT NULL,
	role_id bigserial NOT NULL
);

CREATE TABLE public.tbl_user_has_group (
	user_id bigserial NOT NULL,
	group_id bigserial NOT NULL
);

CREATE TABLE public.tbl_role_has_permission (
	role_id bigserial NOT NULL,
	permission_id bigserial NOT NULL
);

-- public.tbl_address foreign keys

ALTER TABLE public.tbl_address ADD CONSTRAINT fk_address_to_user FOREIGN KEY (user_id) REFERENCES public.tbl_user(id);
ALTER TABLE public.tbl_group ADD CONSTRAINT fk_group_to_role FOREIGN KEY (role_id) REFERENCES public.tbl_role(id);
ALTER TABLE public.tbl_user_has_role ADD CONSTRAINT fk_user_has_role_to_user FOREIGN KEY (user_id) REFERENCES public.tbl_user(id);
ALTER TABLE public.tbl_user_has_role ADD CONSTRAINT fk_user_has_role_to_role FOREIGN KEY (role_id) REFERENCES public.tbl_role(id);
ALTER TABLE public.tbl_role_has_permission ADD CONSTRAINT fk_role_has_permission_to_role FOREIGN KEY (role_id) REFERENCES public.tbl_role(id);
ALTER TABLE public.tbl_role_has_permission ADD CONSTRAINT fk_role_has_permission_to_permission FOREIGN KEY (permission_id) REFERENCES public.tbl_permission(id);
ALTER TABLE public.tbl_user_has_group ADD CONSTRAINT fk_user_has_group_to_user FOREIGN KEY (user_id) REFERENCES public.tbl_user(id);
ALTER TABLE public.tbl_user_has_group ADD CONSTRAINT fk_user_has_group_to_group FOREIGN KEY (group_id) REFERENCES public.tbl_group(id);


INSERT INTO tbl_user (id,last_name,first_name,date_of_birth,gender,phone,email,username,"password",status,"type",created_at,updated_at) VALUES
	 (10,'Dang Thanh','Tung','1989-05-06','MALE','0123456789','someone@email.com','user8','password','ACTIVE','USER','2024-04-18 09:56:29.231','2024-04-18 09:56:29.231'),
	 (11,'Nguyen Khac','Trung','1990-06-07','MALE','0123456789','someone@email.com','user9','password','ACTIVE','USER','2024-04-18 09:56:30.136','2024-04-18 09:56:30.136'),
	 (12,'Truong Hai','Kien','1991-07-09','MALE','0123456789','someone@email.com','user10','password','ACTIVE','USER','2024-04-18 09:56:30.6','2024-04-18 09:56:30.6'),
	 (13,'Vu Hong','Quan','1992-08-11','MALE','0123456789','someone@email.com','user11','password','ACTIVE','USER','2024-04-18 09:56:30.963','2024-04-18 09:56:30.963'),
	 (23,'Nguyen Trung','Nguyen','2003-03-12','MALE','0123456789','someone@email.com','user21','password','ACTIVE','USER','2024-04-18 09:56:22.366','2024-04-18 09:56:22.366'),
	 (28,'Java','Tây','2003-06-05','MALE','0123456789','someone@email.com','user22','password','ACTIVE','USER','2024-04-20 06:00:46.115','2024-04-20 06:00:46.115'),
	 (24,'Dang','Huy','2001-04-23','MALE','0123456789','someone@email.com','user23','password','INACTIVE','USER','2024-04-18 09:56:23.573','2024-04-18 09:56:23.573'),
	 (25,'Minh','Khang','2002-05-25','MALE','0123456789','someone@email.com','user24','password','NONE','USER','2024-04-18 09:56:24.091','2024-04-18 09:56:24.091'),
	 (26,'Le','Ngan','2004-02-15','MALE','0123456789','someone@email.com','user25','password','ACTIVE','USER','2024-04-18 09:56:21.536','2024-04-18 09:56:21.536'),
	 (27,'Thuy','Thuy','2003-05-20','FEMALE','0123456789','someone@email.com','user26','password','ACTIVE','USER','2024-04-18 09:56:23.06','2024-04-18 09:56:23.06'),
	 (1,'Sys','SysAdmin','1980-06-05','MALE','0123456789','sysadmin@email.com','sysadmin','password','ACTIVE','OWNER','2024-04-18 09:58:07.169','2024-04-18 09:58:07.169'),
	 (14,'Tran Ngoc','Tu','1993-09-12','MALE','0123456789','someone@email.com','user12','password','ACTIVE','USER','2024-04-18 09:56:31.3','2024-04-18 09:56:31.3'),
	 (15,'Dang Dinh','Tuan','1992-10-13','MALE','0123456789','someone@email.com','user13','password','ACTIVE','USER','2024-04-15 21:54:04.258','2024-04-15 21:54:04.258'),
	 (16,'Nguyen Quoc','Hung','1994-10-14','MALE','0123456789','someone@email.com','user14','password','ACTIVE','USER','2024-04-15 21:57:15.934','2024-04-15 21:57:15.934'),
	 (17,'Mai Ngoc','Que','1995-11-11','MALE','0123456789','someone@email.com','user15','password','NONE','USER','2024-04-15 22:02:26.532','2024-04-16 21:14:05.098'),
	 (18,'Tran Tu','Binh','1996-12-15','MALE','0123456789','someone@email.com','user16','password','ACTIVE','USER','2024-04-15 22:05:00.438','2024-04-15 22:05:00.438'),
	 (19,'Nguyen Hai','Thanh','1997-01-16','FEMALE','0123456789','someone@email.com','user17','password','ACTIVE','USER','2024-04-18 09:56:25.034','2024-04-18 09:56:25.034'),
	 (20,'Pham Ngoc','Hoa','1998-07-10','FEMALE','0123456789','someone@email.com','user18','password','ACTIVE','USER','2024-04-18 09:56:26.215','2024-04-18 09:56:26.215'),
	 (2,'Sub','Admin','1981-06-05','MALE','0123456789','admin@email.com','admin','password','ACTIVE','ADMIN','2024-04-18 09:56:24.587','2024-04-18 09:56:24.587'),
	 (3,'Mai','Manager','1982-07-24','FEMALE','0123456789','someone@email.com','manager','password','ACTIVE','USER','2024-04-18 09:58:07.611','2024-04-18 09:58:07.611'),
	 (4,'Dinh Van','Nam','1983-06-08','MALE','0123456789','someone@email.com','user1','password','ACTIVE','USER','2024-04-18 09:56:25.435','2024-04-18 09:56:25.435'),
	 (5,'Pham Quang','Dinh','1984-02-28','MALE','0123456789','someone@email.com','user2','password','ACTIVE','USER','2024-04-18 09:56:25.804','2024-04-18 09:56:25.804'),
	 (6,'Nguyen Thi Kim','Oanh','1985-01-01','FEMALE','0123456789','someone@email.com','user3','password','ACTIVE','USER','2024-04-18 09:58:08.138','2024-04-18 09:58:08.138'),
	 (21,'Trinh Van','Sam','1999-01-19','FEMALE','0123456789','someone@email.com','user19','password','ACTIVE','USER','2024-04-18 09:56:26.88','2024-04-18 09:56:26.88'),
	 (7,'Nguyen Thi','Dung','1986-02-02','MALE','0123456789','someone@email.com','user5','password','ACTIVE','USER','2024-04-18 09:56:26.542','2024-04-18 09:56:26.542'),
	 (8,'Pham Thi','Chi','1987-03-04','FEMALE','0123456789','someone@email.com','user6','password','ACTIVE','USER','2024-04-18 09:58:08.589','2024-04-18 09:58:08.589'),
	 (9,'Tran Thuy','Dung','1988-04-05','MALE','0123456789','someone@email.com','user7','password','ACTIVE','USER','2024-04-18 09:56:28.438','2024-04-18 09:56:28.438'),
	 (22,'Kieu','My','2000-02-22','FEMALE','0123456789','someone@email.com','user10','password','ACTIVE','USER','2024-04-18 09:56:31.622','2024-04-18 09:56:31.622');

INSERT INTO tbl_address (id,apartment_number,floor,building,street_number,street,city,country,address_type,user_id,created_at,updated_at) VALUES
	 (1,'1','5','B1','101','Vo Nguyen Giap street','Hanoi','Vietnam',1,1,'2024-04-15 21:54:04.274','2024-04-15 21:54:04.274'),
	 (2,'2','6','B2','102','Pham Van Dong','Hue','Vietnam',1,1,'2024-04-15 21:54:04.274','2024-04-15 21:54:04.274'),
	 (3,'3','7','B3','103','Le Duan','Da Nang','Vietnam',1,2,'2024-04-15 22:05:00.453','2024-04-15 22:05:00.453'),
	 (4,'4','8','B4','104','Le Duc Tho','Sai Gon','Vietnam',1,3,'2024-04-16 21:13:28.872','2024-04-16 21:13:28.872'),
	 (5,'5','9','B6','105','Nguyen Chi Thanh','Can Tho','Vietnam',1,4,'2024-04-18 09:56:21.552','2024-04-18 09:56:21.552'),
	 (6,'6','10','B7','106','Le Trong Tan','Vung Tau','Vietnam',1,5,'2024-04-18 09:56:22.368','2024-04-18 09:56:22.368'),
	 (7,'7','11','A1','107','Truong Trinh','Kien Giang','Vietnam',1,6,'2024-04-18 09:56:23.061','2024-04-18 09:56:23.061'),
	 (8,'8','12','A2','108','Tran Dai Nghia','Soc Trang','Vietnam',1,7,'2024-04-18 09:56:23.575','2024-04-18 09:56:23.575'),
	 (9,'9','13','A3','109','Tran Khanh Du','Quy Nho','Vietnam',1,8,'2024-04-18 09:56:24.093','2024-04-18 09:56:24.093'),
	 (10,'10','14','A4','110','Tran Quang Khai','Phan Thiet','Vietnam',1,9,'2024-04-18 09:56:24.589','2024-04-18 09:56:24.589'),
	 (11,'11','15','A5','210','Tran Nhat Duat','Tay Ninh','Vietnam',1,10,'2024-04-18 09:56:25.037','2024-04-18 09:56:25.037'),
	 (12,'12','16','A6','310','Tran Tu Binh','Dak Lak','Vietnam',1,11,'2024-04-18 09:56:25.438','2024-04-18 09:56:25.438'),
	 (13,'13','17','A7','40','Tran Quoc Toan','Bac Giang','Vietnam',1,12,'2024-04-18 09:56:25.807','2024-04-18 09:56:25.807'),
	 (14,'14','18','A8','50','Tran Hung Dao','Bac Ninh','Vietnam',1,13,'2024-04-18 09:56:26.218','2024-04-18 09:56:26.218'),
	 (15,'15','19','Z1','60','Tran Nhan Tong','Bac Ninh','Vietnam',1,13,'2024-04-18 09:56:26.218','2024-04-18 09:56:26.218'),
	 (16,'16','20','X2','70','Ngo Quyen','Vinh Phuc','Vietnam',1,14,'2024-04-18 09:56:26.544','2024-04-18 09:56:26.544'),
	 (17,'17','21','W4','80','Khuc Thua Du','Phu Yen','Vietnam',1,15,'2024-04-18 09:56:28.442','2024-04-18 09:56:28.442'),
	 (18,'18','22','T2','90','Trieu Quang Phuc','Binh Dinh','Vietnam',1,16,'2024-04-18 09:56:29.232','2024-04-18 09:56:29.232'),
	 (19,'19','23','P2','20','Hai Ba Trung','Phan Rang','Vietnam',1,17,'2024-04-18 09:56:30.138','2024-04-18 09:56:30.138'),
	 (20,'20','25','G1','30','Le Loi','Dien Bien','Vietnam',1,18,'2024-04-18 09:56:30.603','2024-04-18 09:56:30.603'),
	 (21,'21','26','U4','111','Le Lai','Quang Ninh','Vietnam',1,19,'2024-04-18 09:56:30.965','2024-04-18 09:56:30.965'),
	 (22,'22','27','Y1','112','Ly Thai To','Hai Phong','Vietnam',1,20,'2024-04-18 09:56:31.303','2024-04-18 09:56:31.303'),
	 (23,'23','28','K1','113','Ly Thanh Tong','Tuyen Quang','Vietnam',1,21,'2024-04-18 09:56:31.624','2024-04-18 09:56:31.624'),
	 (24,'24','29','L1','114','Au Co','Ha Giang','Vietnam',1,22,'2024-04-18 09:58:07.172','2024-04-18 09:58:07.172'),
	 (25,'25','30','J2','115','Lac Long Quan','Quang Nam','Vietnam',1,23,'2024-04-18 09:58:07.613','2024-04-18 09:58:07.613'),
	 (26,'26','31','R3','116','Ly Nam De','Quang Ngai','Vietnam',1,24,'2024-04-18 09:58:08.139','2024-04-18 09:58:08.139'),
	 (27,'27','32','F2','117','Giai Phong','Binh Duong ','Vietnam',1,25,'2024-04-18 09:58:08.592','2024-04-18 09:58:08.592'),
	 (28,'28','33','V1','118','Bui Thi Xuan','Ben Tre','Vietnam',1,26,'2024-04-18 09:56:26.882','2024-04-18 09:56:26.882'),
	 (29,'10','10','A','10','Wall street','Hanoi','Vietnam',1,28,'2024-04-20 06:00:46.123','2024-04-20 06:00:46.123');

INSERT INTO tbl_role (id,"name") VALUES
	 (2,'admin'),
	 (3,'manager'),
	 (4,'user'),
	 (1,'sysadmin');

INSERT INTO tbl_group (id,"name",role_id) VALUES
	 (3,'Group Fronted',4),
	 (2,'Group Backend',3),
	 (1,'Group DevOps',2);

INSERT INTO tbl_permission (id,"name") VALUES
	 (2,'View'),
	 (3,'Add'),
	 (4,'Update'),
	 (5,'Delete'),
	 (1,'Full Access'),
	 (6,'Upload'),
	 (7,'Import'),
	 (8,'Export'),
	 (9,'Send'),
	 (10,'Share');

INSERT INTO tbl_user_has_role (user_id,role_id) VALUES
	 (3,3),
	 (3,3),
	 (3,3),
	 (3,3),
	 (2,3);

INSERT INTO tbl_user_has_group (user_id,group_id) VALUES
	 (2,1),
	 (3,1),
	 (4,2),
	 (5,2),
	 (6,2),
	 (7,2),
	 (8,2),
	 (9,2),
	 (10,2),
	 (11,2),
	 (12,2),
	 (13,2),
	 (14,2),
	 (15,2),
	 (16,2),
	 (17,2),
	 (18,2);

INSERT INTO tbl_role_has_permission (role_id,permission_id) VALUES
	 (1,1),
	 (1,1),
	 (2,3),
	 (2,4),
	 (2,5),
	 (2,10),
	 (2,10),
	 (3,8),
	 (3,2),
	 (3,3),
	 (3,4),
	 (3,9),
	 (3,10),
	 (4,2),
	 (4,3),
	 (4,4),
	 (4,6),
	 (4,7);






