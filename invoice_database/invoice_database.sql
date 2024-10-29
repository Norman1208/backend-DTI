-- public.buyer definition

-- Drop table

-- DROP TABLE public.buyer;

CREATE TABLE public.buyer (
	id bigserial NOT NULL,
	"name" varchar NOT NULL,
	address text NOT NULL,
	phone int8 NULL,
	CONSTRAINT buyer_pk PRIMARY KEY (id)
);

-- public.seller definition

-- Drop table

-- DROP TABLE public.seller;

CREATE TABLE public.seller (
	id bigserial NOT NULL,
	company_name varchar NOT NULL,
	CONSTRAINT seller_pk PRIMARY KEY (id)
);

-- public.product definition

-- Drop table

-- DROP TABLE public.product;

CREATE TABLE public.product (
	id bigserial NOT NULL,
	product_name varchar NULL,
	price int8 NOT NULL,
	description text NOT NULL,
	quantity int4 NOT NULL,
	CONSTRAINT product_pk PRIMARY KEY (id)
);


-- public.product foreign keys

ALTER TABLE public.product ADD CONSTRAINT product_seller_fk FOREIGN KEY (id) REFERENCES public.seller(id);





-- public.invoice definition

-- Drop table

-- DROP TABLE public.invoice;

CREATE TABLE public.invoice (
	id bigserial NOT NULL,
	created_at timestamp NOT NULL,
	address varchar NOT NULL,
	total_price numeric NOT NULL,
	payment_method varchar NOT NULL,
	seller_id int4 NOT NULL,
	buyer_id int4 NOT NULL,
	product_id int4 NOT NULL,
	CONSTRAINT invoice_pk PRIMARY KEY (id)
);


-- public.invoice foreign keys

ALTER TABLE public.invoice ADD CONSTRAINT invoice_buyer_fk FOREIGN KEY (buyer_id) REFERENCES public.buyer(id);
ALTER TABLE public.invoice ADD CONSTRAINT invoice_product_fk FOREIGN KEY (product_id) REFERENCES public.product(id);
ALTER TABLE public.invoice ADD CONSTRAINT invoice_seller_fk FOREIGN KEY (seller_id) REFERENCES public.seller(id);