create or replace package body xxpc_security_pkg as
    function is_user_active (
        p_user_name in varchar2
    ) return varchar2 is
        l_active_flag xx_users.active_flag%type;
    begin
        select active_flag
          into l_active_flag
          from xx_users
         where upper(user_name) = upper(p_user_name)
           and trunc(sysdate) between start_date and nvl(end_date, trunc(sysdate));

        return l_active_flag;
    exception
        when no_data_found then
            return 'N';
    end is_user_active;

    function get_pc_user_id (
        p_user_name in varchar2
    ) return number is
        l_pc_user_id xx_users.pc_user_id%type;
    begin
        select pc_user_id
          into l_pc_user_id
          from xx_users
         where upper(user_name) = upper(p_user_name)
           and active_flag = 'Y';

        return l_pc_user_id;
    end get_pc_user_id;

    function get_available_limit (
        p_pc_user_id in number
    ) return number is
        l_remaining_limit number;
    begin
        select remaining_limit
          into l_remaining_limit
          from xxpc_user_balances_v
         where pc_user_id = p_pc_user_id;

        return l_remaining_limit;
    exception
        when no_data_found then
            return 0;
    end get_available_limit;
end xxpc_security_pkg;
/
