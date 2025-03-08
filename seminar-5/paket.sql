CREATE OR REPLACE PACKAGE calc IS
    FUNCTION square (radius IN REAL) RETURN REAL;
    PROCEDURE length (radius IN REAL, len OUT VARCHAR);
END calc;
/
CREATE OR REPLACE PACKAGE BODY calc IS
    FUNCTION square (radius in REAL) RETURN REAL IS
    BEGIN
        RETURN(3.14*radius**2);
    END;

    PROCEDURE length (radius in REAL, len OUT VARCHAR) IS
    BEGIN
        len:=3.14*radius*2;
        DBMS_OUTPUT.ENABLE;
    END;
END calc;
/

DECLARE
    sqr REAL;
    len REAL;
    rad REAL:=&rad;
BEGIN
    sqr := calc.square(rad);
    calc.length(rad,len);
    DBMS_OUTPUT.PUT_LINE('Площадь = ' || TO_CHAR(sqr));
    DBMS_OUTPUT.PUT_LINE('Длина = ' || TO_CHAR(len));
END;