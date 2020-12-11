use dudesunited;

/* Запись логов при создании и изменении requested_deals */
create table logs (
tablename varchar(255),
extenal_id bigint unsigned not null,
creater bigint unsigned not null,
picker bigint unsigned default null,
name varchar(255),
created_at datetime default current_timestamp
) engine=archive;

delimiter //
create trigger log_after_insert_requests after insert on requested_deals
for each row begin
	insert into logs (tablename, extenal_id, creater, picker, name) values('requested_deals', new.id, new.posted_by, new.picked_by, new.body);
end//
delimiter ;