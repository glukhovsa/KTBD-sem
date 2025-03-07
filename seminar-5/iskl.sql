DECLARE
    x REAL := &x;
    n REAL;
BEGIN
    FOR n IN 0..6 LOOP
        DBMS_OUTPUT.put_line('LN(x) = ' || TO_CHAR(LN(x)));
    END LOOP;
    EXCEPTION
        WHEN VALUE_ERROR THEN
        BEGIN
            DBMS_OUTPUT.put_line('x<=0');
        END;
END;