create or replace view xxpc_approval_queue_v as
select
    a.approval_id,
    a.entity_name,
    a.entity_id,
    a.approver_user_name,
    a.sequence_num,
    a.status_code approval_status,
    a.creation_date approval_created_date,
    case
        when a.entity_name = 'REQUEST' then r.request_number
        when a.entity_name = 'EXPENSE' then e.expense_number
    end document_number,
    case
        when a.entity_name = 'REQUEST' then r.status_code
        when a.entity_name = 'EXPENSE' then e.status_code
    end document_status
from xxpc_approvals a
left join xxpc_requests r on a.entity_name = 'REQUEST' and r.request_id = a.entity_id
left join xxpc_expenses e on a.entity_name = 'EXPENSE' and e.expense_id = a.entity_id
where a.status_code = 'PENDING';
