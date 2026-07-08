create or replace package xxpc_request_pkg as
    procedure create_request (
        p_pc_user_id        in number,
        p_requested_amount  in number,
        p_currency_code     in varchar2,
        p_purpose           in varchar2,
        x_request_id        out number
    );

    procedure submit_request (
        p_request_id in number,
        p_user_id    in number
    );

    procedure cancel_request (
        p_request_id in number,
        p_user_id    in number,
        p_comments   in varchar2
    );
end xxpc_request_pkg;
/
