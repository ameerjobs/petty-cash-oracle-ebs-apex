# Security and Roles

Suggested APEX roles:

- `PC_ADMIN`: maintain setup and view all records.
- `PC_EMPLOYEE`: create requests and expenses for self.
- `PC_APPROVER`: approve assigned requests and expenses.
- `PC_FINANCE`: review accounting and reimbursement status.

Use Oracle EBS user identity where possible, and map APEX users to `FND_USER.USER_NAME`.
