prompt Dropping Petty Cash database objects

drop package xxpc_approval_pkg;
drop package xxpc_expense_pkg;
drop package xxpc_request_pkg;
drop package xxpc_security_pkg;

drop view xxpc_approval_queue_v;
drop view xxpc_expense_summary_v;
drop view xxpc_open_requests_v;
drop view xxpc_user_balances_v;

drop table xxpc_audit_log purge;
drop table xxpc_approvals purge;
drop table xxpc_attachments purge;
drop table xxpc_expenses purge;
drop table xxpc_requests purge;
drop table xxpc_categories purge;
drop table xx_users purge;

prompt Petty Cash database objects dropped
