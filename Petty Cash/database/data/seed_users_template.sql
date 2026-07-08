-- Replace sample values with employees from Oracle HRMS / FND users.
insert into xx_users (
    employee_id,
    employee_number,
    employee_name,
    user_name,
    operating_unit_id,
    currency_code,
    cash_limit_amount,
    warning_limit_amount
) values (
    1001,
    'E1001',
    'Sample Employee',
    'SAMPLE.USER',
    204,
    'AED',
    5000,
    1000
);

commit;
