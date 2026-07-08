create or replace view xxpc_open_requests_v as
select
    r.request_id,
    r.request_number,
    r.request_date,
    r.requested_amount,
    r.approved_amount,
    r.currency_code,
    r.status_code,
    r.purpose,
    u.employee_id,
    u.employee_number,
    u.employee_name,
    u.user_name
from xxpc_requests r
join xxpc_users u on u.pc_user_id = r.pc_user_id
where r.status_code in ('DRAFT', 'SUBMITTED', 'APPROVED', 'PAID');
