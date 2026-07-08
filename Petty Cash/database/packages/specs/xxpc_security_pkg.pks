create or replace package xxpc_security_pkg as
    function is_user_active (
        p_user_name in varchar2
    ) return varchar2;

    function get_pc_user_id (
        p_user_name in varchar2
    ) return number;

    function get_available_limit (
        p_pc_user_id in number
    ) return number;
end xxpc_security_pkg;
/
