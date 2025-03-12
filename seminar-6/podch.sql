SPOOL result_2_1.lst
COL "Familia" FORMAT A15
COL "Podchinenie" FORMAT A30

SELECT lpad (last_name, length(last_name) + 2 * (level-1)) "Familia",
    sys_connect_by_path(last_name, '/') "Podchinenie"
FROM employees
CONNECT BY PRIOR employee_id = manager_id
START WITH last_name = 'King'
ORDER SIBLINGS BY last_name;
SPOOL OFF;