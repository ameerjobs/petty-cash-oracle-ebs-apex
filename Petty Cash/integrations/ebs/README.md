# Oracle EBS R12.2.9 Integration Notes

Use this folder for integration scripts and technical notes related to Oracle E-Business Suite.

Suggested integration points:

- `FND_USER` for application user mapping.
- `PER_ALL_PEOPLE_F` or HR views for employee information.
- `ORG_ID` and MOAC context for operating unit support.
- AP invoice interfaces when petty cash reimbursement should create AP documents.
- GL code combinations for category accounting.

Set the EBS application context before invoking APIs or querying secured EBS views.
