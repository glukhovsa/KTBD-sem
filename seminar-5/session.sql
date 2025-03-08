DECLARE
    MONTH NUMBER;
    DAY NUMBER;
    inp VARCHAR(64) := '&date';
    session_date DATE;
BEGIN
    session_date := TO_DATE(inp, 'dd.mm.yyyy');
      MONTH := MONTHS_BETWEEN(session_date, TO_DATE(sysdate, 'dd.mm.yyyy'));
    DAY:=session_date - TO_DATE(sysdate, 'dd.mm.yyyy');
    DBMS_OUTPUT.PUT_LINE(
        'До сессии осталось - ' ||
        ROUND(TO_CHAR(MONTH),2) ||
        ' месяцев или ' ||
        ROUND(TO_CHAR(DAY),2) ||
        ' дней.'
    );
END;