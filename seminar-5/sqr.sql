SET SERVEROUTPUT ON
DECLARE
PI CONSTANT REAL := 3.141519265359; 
RADIUS REAL := &RADIUS;
LOKR REAL := PI * RADIUS * 2.0; 
SKRG REAL := PI *RADIUS ** 2;
BEGIN
    DBMS_OUTPUT.enable(100000);
    DBMS_OUTPUT.put_line('Радиус = ' || to_char(RADIUS) || ', ДЛИНА ОКРУЖНОСТИ =' || to_char(LOKR) || ', ПЛОЩАДЬ КРУГА =' || to_char(SKRG));
END;
/