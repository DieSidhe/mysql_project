use dudesunited;

create or replace view users_link_companies as
select
    uc.*,
    u.firstname, u.lastname as users,
    c.name as companies
from
    user_companies as uc
    INNER JOIN users AS u ON uc.user_id = u.id
    INNER JOIN companies AS c ON uc.company_id = c.id;