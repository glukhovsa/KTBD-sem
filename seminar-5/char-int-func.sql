DECLARE
    str VARCHAR(30) := '&str';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Длина строки = ' || LENGTH(str));
END;