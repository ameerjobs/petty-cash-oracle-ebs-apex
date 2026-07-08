create or replace package body xxpc_expense_pkg as
    procedure create_expense (
        p_request_id      in number,
        p_pc_user_id      in number,
        p_category_id     in number,
        p_expense_date    in date,
        p_amount          in number,
        p_tax_amount      in number,
        p_description     in varchar2,
        x_expense_id      out number
    ) is
    begin
        insert into xxpc_expenses (
            expense_number,
            request_id,
            pc_user_id,
            category_id,
            expense_date,
            amount,
            tax_amount,
            description,
            status_code
        ) values (
            'PCE-' || to_char(sysdate, 'YYYYMMDDHH24MISS'),
            p_request_id,
            p_pc_user_id,
            p_category_id,
            p_expense_date,
            p_amount,
            nvl(p_tax_amount, 0),
            p_description,
            'DRAFT'
        )
        returning expense_id into x_expense_id;
    end create_expense;

    procedure submit_expense (
        p_expense_id in number,
        p_user_id    in number
    ) is
    begin
        update xxpc_expenses
           set status_code = 'SUBMITTED',
               last_updated_by = p_user_id,
               last_update_date = sysdate
         where expense_id = p_expense_id
           and status_code = 'DRAFT';

        insert into xxpc_audit_log (
            entity_name,
            entity_id,
            action_code,
            old_status_code,
            new_status_code,
            action_by
        ) values (
            'EXPENSE',
            p_expense_id,
            'SUBMIT',
            'DRAFT',
            'SUBMITTED',
            p_user_id
        );
    end submit_expense;
end xxpc_expense_pkg;
/
