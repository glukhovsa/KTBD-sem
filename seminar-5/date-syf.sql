BEGIN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE,'MONTH, Month, month'));
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE,'MON, Mon, mon'));
END;