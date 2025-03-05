SELECT
    EMP.First_name  "Name",
    EMP.Last_name "Last Name",
    DEPT.name "Department",
    EMP.Salary	"ZP",
    EMP.Job_title "Job",
    D_S.Position	"Position" 
    FROM employees EMP, departments DEPT, (select
        Rownum Position, Sal 
            from (select
                Distinct Salary Sal from employees
                    order by Sal desc
                )
            ) D_S WHERE
            D_S.Sal = EMP.Salary and 
            DEPT.Department_id = EMP.Department_id and 
            D_S.Position between 2 and 5
            order  by
            D_S.Position
            , DEPT.name
            , Job_title;
