# Oracle APEX Application Files

Place the exported Oracle APEX application files in this folder.

Suggested screens:

- Dashboard: balances, pending requests, pending expenses, and approval queue.
- Configurations: petty cash users, employee limits, categories, and approval setup.
- Petty Cash Request: create, submit, approve, reject, cancel, and close requests.
- Petty Cash Expense: enter expenses, upload receipts, submit for approval, and account expenses.
- Reports: employee balances, expense summary, request status, and audit trail.

Suggested APEX export layout:

- `f100.sql`: full application export.
- `pages/`: page-level exports when split exports are used.
- `shared_components/`: authorization schemes, lists of values, navigation, and application processes.
- `static_files/`: CSS, JavaScript, images, and report templates.
