create or replace package body xxpc_approval_pkg as
    procedure assign_approval (
        p_entity_name        in varchar2,
        p_entity_id          in number,
        p_approver_user_name in varchar2,
        p_sequence_num       in number default 1
    ) is
    begin
        insert into xxpc_approvals (
            entity_name,
            entity_id,
            approver_user_name,
            sequence_num,
            status_code
        ) values (
            p_entity_name,
            p_entity_id,
            p_approver_user_name,
            p_sequence_num,
            'PENDING'
        );
    end assign_approval;

    procedure approve_document (
        p_approval_id in number,
        p_user_id     in number,
        p_comments    in varchar2
    ) is
        l_entity_name xxpc_approvals.entity_name%type;
        l_entity_id   xxpc_approvals.entity_id%type;
    begin
        update xxpc_approvals
           set status_code = 'APPROVED',
               comments = p_comments,
               action_date = sysdate,
               last_updated_by = p_user_id,
               last_update_date = sysdate
         where approval_id = p_approval_id
           and status_code = 'PENDING'
        returning entity_name, entity_id into l_entity_name, l_entity_id;

        if l_entity_name = 'REQUEST' then
            update xxpc_requests
               set status_code = 'APPROVED',
                   approved_date = sysdate,
                   last_updated_by = p_user_id,
                   last_update_date = sysdate
             where request_id = l_entity_id;
        elsif l_entity_name = 'EXPENSE' then
            update xxpc_expenses
               set status_code = 'APPROVED',
                   last_updated_by = p_user_id,
                   last_update_date = sysdate
             where expense_id = l_entity_id;
        end if;
    end approve_document;

    procedure reject_document (
        p_approval_id in number,
        p_user_id     in number,
        p_comments    in varchar2
    ) is
        l_entity_name xxpc_approvals.entity_name%type;
        l_entity_id   xxpc_approvals.entity_id%type;
    begin
        update xxpc_approvals
           set status_code = 'REJECTED',
               comments = p_comments,
               action_date = sysdate,
               last_updated_by = p_user_id,
               last_update_date = sysdate
         where approval_id = p_approval_id
           and status_code = 'PENDING'
        returning entity_name, entity_id into l_entity_name, l_entity_id;

        if l_entity_name = 'REQUEST' then
            update xxpc_requests
               set status_code = 'REJECTED',
                   rejected_date = sysdate,
                   last_updated_by = p_user_id,
                   last_update_date = sysdate
             where request_id = l_entity_id;
        elsif l_entity_name = 'EXPENSE' then
            update xxpc_expenses
               set status_code = 'REJECTED',
                   last_updated_by = p_user_id,
                   last_update_date = sysdate
             where expense_id = l_entity_id;
        end if;
    end reject_document;
end xxpc_approval_pkg;
/
