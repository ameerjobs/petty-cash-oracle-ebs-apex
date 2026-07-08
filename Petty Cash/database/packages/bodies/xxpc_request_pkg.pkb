create or replace package body xxpc_request_pkg as
    procedure create_request (
        p_pc_user_id        in number,
        p_requested_amount  in number,
        p_currency_code     in varchar2,
        p_purpose           in varchar2,
        x_request_id        out number
    ) is
    begin
        insert into xxpc_requests (
            request_number,
            pc_user_id,
            requested_amount,
            currency_code,
            purpose,
            status_code
        ) values (
            'PCR-' || to_char(sysdate, 'YYYYMMDDHH24MISS'),
            p_pc_user_id,
            p_requested_amount,
            p_currency_code,
            p_purpose,
            'DRAFT'
        )
        returning request_id into x_request_id;
    end create_request;

    procedure submit_request (
        p_request_id in number,
        p_user_id    in number
    ) is
    begin
        update xxpc_requests
           set status_code = 'SUBMITTED',
               submitted_date = sysdate,
               last_updated_by = p_user_id,
               last_update_date = sysdate
         where request_id = p_request_id
           and status_code = 'DRAFT';

        insert into xxpc_audit_log (
            entity_name,
            entity_id,
            action_code,
            old_status_code,
            new_status_code,
            action_by
        ) values (
            'REQUEST',
            p_request_id,
            'SUBMIT',
            'DRAFT',
            'SUBMITTED',
            p_user_id
        );
    end submit_request;

    procedure cancel_request (
        p_request_id in number,
        p_user_id    in number,
        p_comments   in varchar2
    ) is
    begin
        update xxpc_requests
           set status_code = 'CANCELLED',
               last_updated_by = p_user_id,
               last_update_date = sysdate
         where request_id = p_request_id
           and status_code in ('DRAFT', 'SUBMITTED');

        insert into xxpc_audit_log (
            entity_name,
            entity_id,
            action_code,
            new_status_code,
            action_by,
            comments
        ) values (
            'REQUEST',
            p_request_id,
            'CANCEL',
            'CANCELLED',
            p_user_id,
            p_comments
        );
    end cancel_request;
end xxpc_request_pkg;
/
