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
	created_at timestamp(6) DEFAULT NOW(),
	updated_at timestamp(6) DEFAULT NOW(),
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
	created_at timestamp(6) DEFAULT NOW(),
	updated_at timestamp(6) DEFAULT NOW(),
	CONSTRAINT tbl_address_pkey PRIMARY KEY (id),
	CONSTRAINT fk_address_and_user FOREIGN KEY (user_id) REFERENCES public.tbl_user(id)
);
