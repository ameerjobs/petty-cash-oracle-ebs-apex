create or replace package xxpc_approval_pkg as
    procedure assign_approval (
        p_entity_name        in varchar2,
        p_entity_id          in number,
        p_approver_user_name in varchar2,
        p_sequence_num       in number default 1
    );

    procedure approve_document (
        p_approval_id in number,
        p_user_id     in number,
        p_comments    in varchar2
    );

    procedure reject_document (
        p_approval_id in number,
        p_user_id     in number,
        p_comments    in varchar2
    );
end xxpc_approval_pkg;
/
