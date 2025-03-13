SELECT
    DECODE( GM+GJ,
        0, 
        (SELECT first_name || ' ' || last_name
            FROM employees
            WHERE employee_id = m.manager_id),
        1, 
        (SELECT LPAD (first_name || ' ' || last_name || 'itogo', 30,'.')
            FROM employees
            WHERE employee_id = m.manager_id),
        2, LPAD('Common', 25, '.')
    ) "Manager",
    DECODE( GM+GJ,
        0, 
            (SELECT job_title
            FROM employees
            WHERE job_title = m.job_title),
        1, 
            (SELECT employees.job_title
            FROM employees
                WHERE employee_id = m.manager_id),
        2, 'itogo'
    ) "Должность",
    CNT "Сотрудников",
    AMOUNT "Сумма"
FROM (
    SELECT manager_id,
    job_title,
    COUNT(*) cnt,
    SUM(salary*(1+nvl(commission,0))) AMOUNT,
    GROUPING(manager_id) GM,
    GROUPING(job_title) GJ
    FROM employees
    GROUP BY ROLLUP(manager_id, job_title)
) m;