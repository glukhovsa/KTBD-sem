DECLARE
    N NUMERIC := 5;
BEGIN
    WHILE N>0 LOOP
        N := N - 1;
        DBMS_OUTPUT.put_line(TO_CHAR(N));
    END LOOP;
    DBMS_OUTPUT.put_line('N=0');
END;