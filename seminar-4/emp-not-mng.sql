SELECT employee_id, first_name, last_name FROM employees e
    WHERE NOT EXISTS (
        SELECT employee_id FROM employees
            WHERE employees.manager_id = e.employee_id
    );