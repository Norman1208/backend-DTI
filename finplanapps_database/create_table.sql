-- create all of table using script 

create table userAccount (
	user_id SERIAL primary key,
	profile_image bytea null,
	name varchar(100),
	password varchar(100),
	pin varchar(4),
	isRegistered BOOLEAN not null, 
	check (
		(isRegistered = False) or 
		(isRegistered = true and name is not null and password is not null and pin is not null) 
	)
);


create table wallets (
	wallet_id SERIAL primary key, 
	user_id integer not null,
	wallet_name varchar(100) not null,
	total_amount integer not null
);


ALTER table wallets add constraint wallet_user_fk foreign key (user_id) references useraccount(user_id);


create table pockets (
	pocket_id SERIAL primary key,
	wallet_id integer not null,
	budget_amount integer not null, 
	description varchar(100) not null, 
	emoji bytea
);

ALTER table pockets add constraint pocket_wallet_fk foreign key (wallet_id) references wallets(wallet_id);


create table money_record (
	money_record_id SERIAL primary key, 
	wallet_id integer not null, 
	pocket_id integer not null, 
	isIncome boolean not null, 
	date date not null,
	record_attach text
);

alter table money_record add constraint money_record_wallet_fk foreign key (wallet_id) references wallets(wallet_id);
alter table money_record add constraint money_record_pocket_fk foreign key (pocket_id) references pockets(pocket_id);


create table expenses (
	expense_id SERIAL primary key,
	money_record_id integer not null, 
	expense_amount integer not null, 
	description varchar(100)
);

alter table expenses add constraint expense_money_record_fk foreign key (money_record_id) references money_record(money_record_id);


create table incomes (
	income_id SERIAL primary key, 
	money_record_id integer not null, 
	income_amount integer not null, 
	description varchar(100)
);

alter table incomes add constraint income_money_record_fk foreign key (money_record_id) references money_record(money_record_id);


create table total_expenses (
	total_expenses_id serial primary key, 
	user_id integer not null, 
	wallet_id integer not null, 
	total_expenses integer not null
);

alter table total_expenses add constraint total_expenses_user_fk foreign key (user_id) references useraccount(user_id);
alter table total_expenses add constraint total_expenses_wallet_fk foreign key (wallet_id) references wallets(wallet_id);

create table total_incomes (
	total_incomes_id serial primary key, 
	user_id integer not null, 
	wallet_id integer not null, 
	total_incomes integer not null
);

alter table total_incomes add constraint total_incomes_user_fk foreign key (user_id) references useraccount(user_id);
alter table total_incomes add constraint total_incomes_wallet_fk foreign key (wallet_id) references wallets(wallet_id);


create table goals (
	goals_id serial primary key, 
	wallet_id integer not null, 
	goal_name varchar(100),
	goal_amount integer, 
	goal_description varchar(100),
	img_attatch bytea
);

alter table goals add constraint goals_wallet_fk foreign key (wallet_id) references wallets(wallet_id);

create table goal_record (
	goal_record_id serial primary key, 
	goals_id integer not null, 
	goal_record integer not null, 
	date date, 
	money_goal_amount integer
);

alter table goal_record add constraint goal_record_goals_fk foreign key (goals_id) references goals(goals_id)