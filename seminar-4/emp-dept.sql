SELECT
    row_number() OVER(order by department_id) "ID",
    row_number() OVER(PARTITION BY department_id Order by salary desc) "ID in depart",
    department_id "Department",
    job_title	"Job",
    last_name	"Last name",
    salary	"ZP",
    rank() OVER(PARTITION BY department_id Order by salary desc) "Rang"
from  EMPLOYEES
where Department_id in (1, 2, 4);
