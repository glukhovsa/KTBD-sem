DECLARE
    v_num1 NUMBER; 
    v_num2 NUMBER; 
    v_result VARCHAR(20);
BEGIN
    IF v_num1 is NULL THEN
        v_result := 'v_num1 = NULL';
    ELSE
        IF v_num1 >= v_num2	THEN 
            v_result := 'No';
        ELSE
            v_result := 'Yes'; 
        END IF;
    END IF;
    DBMS_OUTPUT.put_line(TO_CHAR(v_result));
END;
