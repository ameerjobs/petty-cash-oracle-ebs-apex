prompt Installing Petty Cash database objects

@@../tables/xxpc_users.sql
@@../tables/xxpc_categories.sql
@@../tables/xxpc_requests.sql
@@../tables/xxpc_expenses.sql
@@../tables/xxpc_attachments.sql
@@../tables/xxpc_approvals.sql
@@../tables/xxpc_audit_log.sql

@@../indexes/xxpc_indexes.sql

@@../views/xxpc_user_balances_v.sql
@@../views/xxpc_open_requests_v.sql
@@../views/xxpc_expense_summary_v.sql
@@../views/xxpc_approval_queue_v.sql

@@../packages/specs/xxpc_security_pkg.pks
@@../packages/specs/xxpc_request_pkg.pks
@@../packages/specs/xxpc_expense_pkg.pks
@@../packages/specs/xxpc_approval_pkg.pks

@@../packages/bodies/xxpc_security_pkg.pkb
@@../packages/bodies/xxpc_request_pkg.pkb
@@../packages/bodies/xxpc_expense_pkg.pkb
@@../packages/bodies/xxpc_approval_pkg.pkb

@@../security/xxpc_grants.sql
@@../security/xxpc_synonyms.sql

prompt Petty Cash database installation complete
