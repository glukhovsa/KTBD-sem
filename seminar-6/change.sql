SELECT employee_id id, (first_name || ' ' || last_name) name
    FROM employees
    WHERE employee_id in (1541, 1257);

UPDATE employees
    SET employee_id = DECODE(employee_id, 1541, 1257, 1257, 1541)
    WHERE employee_id IN (1541,1257);

SELECT employee_id id, (first_name || ' ' || last_name) name
    FROM employees
    WHERE employee_id in (1541, 1257);