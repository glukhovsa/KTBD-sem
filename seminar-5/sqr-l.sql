CREATE OR REPLACE PROCEDURE len_sqr(radius REAL) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Площадь круга с радиусом ' || 
        radius || 
        ' равна ' 
        || TO_CHAR(3.14*radius**2)
    );
    DBMS_OUTPUT.PUT_LINE(
        'Длина окружности с радиусом ' || 
        radius || 
        ' равна ' 
        || TO_CHAR(3.14*radius*2)
    );
END;
/

DECLARE
    radius REAL := &radius;
BEGIN
    DBMS_OUTPUT.enable;
    len_sqr(radius);
END;