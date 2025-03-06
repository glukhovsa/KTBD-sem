select location, round(avg(salary)) as n from
    cities c,
    departments  d,
    employees  e 
        where c.name = d.location and e.department_id = d.department_id
            group by location
            order by n desc;
