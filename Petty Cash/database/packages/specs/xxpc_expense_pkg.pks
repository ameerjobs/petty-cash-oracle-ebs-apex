create or replace package xxpc_expense_pkg as
    procedure create_expense (
        p_request_id      in number,
        p_pc_user_id      in number,
        p_category_id     in number,
        p_expense_date    in date,
        p_amount          in number,
        p_tax_amount      in number,
        p_description     in varchar2,
        x_expense_id      out number
    );

    procedure submit_expense (
        p_expense_id in number,
        p_user_id    in number
    );
end xxpc_expense_pkg;
/
