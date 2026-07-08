-- Replace APEX_PUBLIC_USER and APPS with the target schemas used in your environment.
grant select, insert, update, delete on xx_users to APEX_PUBLIC_USER;
grant select, insert, update, delete on xxpc_categories to APEX_PUBLIC_USER;
grant select, insert, update, delete on xxpc_requests to APEX_PUBLIC_USER;
grant select, insert, update, delete on xxpc_expenses to APEX_PUBLIC_USER;
grant select, insert, update, delete on xxpc_attachments to APEX_PUBLIC_USER;
grant select, insert, update, delete on xxpc_approvals to APEX_PUBLIC_USER;
grant select on xxpc_user_balances_v to APEX_PUBLIC_USER;
grant select on xxpc_open_requests_v to APEX_PUBLIC_USER;
grant select on xxpc_expense_summary_v to APEX_PUBLIC_USER;
grant select on xxpc_approval_queue_v to APEX_PUBLIC_USER;
grant execute on xxpc_security_pkg to APEX_PUBLIC_USER;
grant execute on xxpc_request_pkg to APEX_PUBLIC_USER;
grant execute on xxpc_expense_pkg to APEX_PUBLIC_USER;
grant execute on xxpc_approval_pkg to APEX_PUBLIC_USER;
