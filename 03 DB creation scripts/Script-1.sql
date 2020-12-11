drop database if exists dudesunited;
create database dudesunited;
use dudesunited;

drop table if exists users;
create table users(
id serial,
firstname varchar(50),
lastname varchar(50),
email varchar(120) unique,
phone bigint unsigned unique,
password_hash varchar(100),
index users_firstname_lastname_idx(firstname, lastname),
primary key (id)
);

drop table if exists `profiles`;
create table `profiles`(
user_id serial,
is_active bit not null default 1,
gender char(1),
photo_id bigint unsigned null,
created_at datetime default now(),
rating bigint unsigned not null,
prof_field varchar(100),
languages varchar(100),
country varchar(100)
);

/*Использование alter table*/
alter table `profiles` add constraint fk_user_id
	foreign key (user_id) references users(id)
	on update cascade
	on delete restrict;

drop table if exists companies;
create table companies(
id serial,
name varchar(100),
registered_at datetime default now()
);

drop table if exists user_companies;
create table user_companies(
user_id bigint unsigned not null,
company_id bigint unsigned not null,
foreign key (user_id) references users(id),
foreign key (company_id) references companies(id),
primary key (user_id, company_id)
);

drop table if exists requested_deals;
create table requested_deals(
id serial,
posted_by bigint unsigned not null,
picked_by bigint unsigned not null,
body text,
created_at datetime default now(),
foreign key (posted_by) references users(id),
foreign key (picked_by) references users(id)
);

drop table if exists deal_messages;
create table deal_messages(
id serial,
based_on bigint unsigned not null,
from_user_id bigint unsigned not null,
to_user_id bigint unsigned not null,
body text,
created_at datetime default now(),
foreign key (based_on) references requested_deals(id),
foreign key (from_user_id) references users(id),
foreign key (to_user_id) references users(id)
);

drop table if exists media_types;
create table media_types(
id serial,
name varchar(255),
created_at datetime default now(),
updated_at datetime on update current_timestamp
);

drop table if exists media;
create table media(
id serial,
media_type_id bigint unsigned not null,
user_id bigint unsigned not null,
body text,
filename varchar(255),
size int,
metadata json,
created_at datetime default now(),
updated_at datetime on update current_timestamp,
foreign key (user_id) references users(id),
foreign key (media_type_id) references media_types(id)
);

drop table if exists photo_albums;
create table photo_albums(
id serial,
name varchar(255) default null,
user_id bigint unsigned default null,
bound_to_deal bigint unsigned default null,
foreign key (user_id) references users(id),
foreign key (bound_to_deal) references requested_deals(id),
primary key (id)
);

drop table if exists photos;
create table photos(
id serial,
album_id bigint unsigned not null,
media_id bigint unsigned not null,
foreign key (album_id) references photo_albums(id),
foreign key (media_id) references media(id)
);