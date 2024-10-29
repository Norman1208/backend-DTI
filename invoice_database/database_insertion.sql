insert into public.seller (id, company_name)
values (1, 'jaya baru'),
		(2, 'jaya makmur'),
		(3, 'jaya abadi')

insert into public.product (id, product_name, price, description, quantity, seller_id) 
values (1, 'palu', 70000, 'alat untuk malu', 10, 3),
		(2, 'risol', 30000, 'makanan enak', 100, 3),
		(3, 'gergaji', 100000, 'alat untuk memotong', 8, 3)

insert into public.buyer (id, name, address, phone)
values (1, 'jaya', 'jalan raya', 12345),
        (2, 'jaya', 'jalan raya', 12345),
        (3, 'jaya', 'jalan raya', 12345)

insert into public.invoice (id, buyer_id, product_id, seller_id , total_price, created_at, address, payment_method)
values (1, 1, 1, 2, 140000, '2022-01-01', 'kemang', 'BNI'),
        (2, 1, 2, 1, 30000, '2022-01-01', 'kemang', 'BNI'),
        (3, 1, 3, 1, 100000, '2022-01-01', 'kemang', 'BNI')