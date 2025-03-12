SPOOL Task2_3.lst
DROP TABLE emp_selected;
CREATE TABLE emp_selected (
    first_name  VARCHAR2(20) NOT NULL,
    last_name   VARCHAR2(20) NOT NULL,
    n           INTEGER NOT NULL
);

INSERT INTO emp_selected VALUES ('Stepan', 'Glukhov', 3);
INSERT INTO emp_selected VALUES ('Boris', 'Karyshev', 5);
COMMIT;

SELECT row_number() OVER
    (ORDER BY last_name, first_name) "Number",
    row_number() OVER
        (PARTITION BY last_name, first_name
        ORDER BY last_name, first_name) "Group Number",
    first_name "First Name",
    last_name "Last Name"
    FROM emp_selected,
        (SELECT level lev
        FROM dual
        CONNECT BY level <= 10)
    WHERE lev <= n
    ORDER BY last_name, first_name;
SPOOL OFF;