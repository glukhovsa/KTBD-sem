DECLARE
    x  REAL := &x;
    first REAL;
    second REAL;
BEGIN
    first := FLOOR(x/7);
    second := MOD(x, 7);
    DBMS_OUTPUT.PUT_LINE(
        TO_CHAR(x) ||
        ' / 7 = '||
        TO_CHAR(first)
    );
    DBMS_OUTPUT.PUT_LINE(
        'Остаток: ' ||
        TO_CHAR(second)
    );
END;