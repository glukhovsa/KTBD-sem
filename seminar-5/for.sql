DECLARE
    N NUMERIC := 0;
BEGIN
    FOR N IN 0..5 LOOP
    DBMS_OUTPUT.put_line(TO_CHAR(N));
    END LOOP;
    DBMS_OUTPUT.put_line('N=5');
END;