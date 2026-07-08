create or replace view xxpc_expense_summary_v as
select
    e.expense_id,
    e.expense_number,
    e.expense_date,
    e.amount,
    e.tax_amount,
    e.amount + e.tax_amount total_amount,
    e.currency_code,
    e.status_code,
    e.description,
    c.category_code,
    c.category_name,
    u.employee_id,
    u.employee_number,
    u.employee_name,
    u.user_name,
    r.request_number
from xxpc_expenses e
join xxpc_users u on u.pc_user_id = e.pc_user_id
join xxpc_categories c on c.category_id = e.category_id
left join xxpc_requests r on r.request_id = e.request_id;
