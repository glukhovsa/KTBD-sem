SELECT manager_id "Manager",
    job_title "Job",
    COUNT(*) "Owners",
    SUM(salary * (1+NVL(commission,0))) "Money"
    FROM employees
        GROUP BY ROLLUP(manager_id, job_title);