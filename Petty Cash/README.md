# Petty Cash Solution for Oracle EBS R12.2.9

This repository contains the database and Oracle APEX application structure for a petty cash solution integrated with Oracle ERP E-Business Suite Release 12.2.9.

The solution tracks petty cash limits, requests, advances, expenses, approvals, reimbursements, and employee balances.

## Main Modules

- Configuration of petty cash users, limits, categories, and approval rules.
- Petty cash requests raised by employees.
- Petty cash expense entry and settlement.
- Balance tracking by employee.
- Oracle APEX application files and supporting assets.

## Suggested Installation Order

1. Run scripts in `database/tables`.
2. Run scripts in `database/indexes`.
3. Run scripts in `database/views`.
4. Compile package specs in `database/packages/specs`.
5. Compile package bodies in `database/packages/bodies`.
6. Run grants and synonyms from `database/security`.
7. Import the APEX application from `apex/application`.

Review all schema names, grants, and EBS integration points before installing in any Oracle EBS environment.
