SELECT	employee_id,  last_name,  manager_id,  department_id
    FROM	employees WHERE	manager_id IN
        (SELECT	manager_id FROM	employees
            WHERE	employee_id IN (1603,1257))
        AND	department_id  IN
            (SELECT	department_id FROM	employees
                WHERE	employee_id IN (1603,1257)) AND
                    employee_id NOT IN(1603,1257);
