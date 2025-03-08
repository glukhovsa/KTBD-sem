CREATE OR REPLACE FUNCTION round_square(radius REAL)
    RETURN REAL IS result REAL;
BEGIN
    result := 3.14*radius**2;
    return(result);
END round_square;
/

DECLARE
    radius REAL := &radius;
BEGIN
    DBMS_OUTPUT.enable;
    DBMS_OUTPUT.PUT_LINE(
        'Площадь круга с радиусом ' || 
        radius || 
        ' равна ' 
        ||round_square(radius)
    );
END;