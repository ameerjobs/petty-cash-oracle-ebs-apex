create index xx_users_n1 on xx_users (employee_id);
create index xxpc_requests_n1 on xxpc_requests (pc_user_id, status_code);
create index xxpc_requests_n2 on xxpc_requests (request_date);
create index xxpc_expenses_n1 on xxpc_expenses (pc_user_id, status_code);
create index xxpc_expenses_n2 on xxpc_expenses (request_id);
create index xxpc_expenses_n3 on xxpc_expenses (expense_date);
create index xxpc_approvals_n1 on xxpc_approvals (entity_name, entity_id, status_code);
create index xxpc_audit_log_n1 on xxpc_audit_log (entity_name, entity_id);
