DECLARE
    dt date;
    radius real := &radius1; 
BEGIN
    dt:=sysdate;
    for i in 1..5 loop
        IF 3.14*((radius+i)**2) < 500 THEN
            dbms_output.put_line('Площадь чересчур мала. Время - ' || to_char(dt));
        ELSE
            dbms_output.put_line(to_char( 3.14*((radius+i)**2))||'. Время - ' || to_char(dt));
        END IF;
    end loop;
    END;
/
