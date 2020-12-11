use dudesunited;

/* Вывод пользователей, оставивших хотя бы одну идею */
select 
	id, firstname, lastname
from 
	users
where
	id in (select distinct posted_by from requested_deals);

/* Выборка из пользователей тех, кто является представителями компаний */
	
select
    uc.*,
    u.firstname, u.lastname as users,
    c.name as companies
from
    user_companies as uc
    INNER JOIN users AS u ON uc.user_id = u.id
    INNER JOIN companies AS c ON uc.company_id = c.id;
