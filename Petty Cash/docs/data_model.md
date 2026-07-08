# Petty Cash Data Model

## Core Tables

- `XX_USERS`: configured petty cash employees and their limits.
- `XXPC_CATEGORIES`: expense category setup and accounting references.
- `XXPC_REQUESTS`: cash advance or petty cash request headers.
- `XXPC_EXPENSES`: expense claims against an employee and optionally a request.
- `XXPC_ATTACHMENTS`: receipt and supporting document storage or references.
- `XXPC_APPROVALS`: approval worklist records for requests and expenses.
- `XXPC_AUDIT_LOG`: status and action history.

## Suggested Status Flow

Request:

`DRAFT -> SUBMITTED -> APPROVED -> PAID -> CLOSED`

Expense:

`DRAFT -> SUBMITTED -> APPROVED -> ACCOUNTED`

Both flows support `REJECTED` and `CANCELLED` where applicable.
