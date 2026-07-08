create or replace view xxpc_user_balances_v as
select
    u.pc_user_id,
    u.employee_id,
    u.employee_number,
    u.employee_name,
    u.user_name,
    u.currency_code,
    u.cash_limit_amount,
    nvl(r.approved_advances, 0) approved_advances,
    nvl(e.approved_expenses, 0) approved_expenses,
    nvl(r.approved_advances, 0) - nvl(e.approved_expenses, 0) available_balance,
    u.cash_limit_amount - (nvl(r.approved_advances, 0) - nvl(e.approved_expenses, 0)) remaining_limit
from xxpc_users u
left join (
    select pc_user_id, sum(nvl(approved_amount, requested_amount)) approved_advances
    from xxpc_requests
    where status_code in ('APPROVED', 'PAID', 'CLOSED')
    group by pc_user_id
) r on r.pc_user_id = u.pc_user_id
left join (
    select pc_user_id, sum(amount + tax_amount) approved_expenses
    from xxpc_expenses
    where status_code in ('APPROVED', 'ACCOUNTED')
    group by pc_user_id
) e on e.pc_user_id = u.pc_user_id;
