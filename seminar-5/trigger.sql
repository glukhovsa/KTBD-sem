CREATE SEQUENCE test1_seq START WITH 1;

CREATE TABLE test1 (
    id NUMBER,
    data VARCHAR2(30)
);

CREATE OR REPLACE TRIGGER test1_trig
    BEFORE INSERT ON test1 FOR EACH ROW
        BEGIN
            SELECT test1_seq.NEXTVAL
            INTO :new.id
            FROM DUAL;
        END;
/

INSERT INTO test1 (data) VALUES ('07.03.25');
INSERT INTO test1 (data) VALUES ('08.03.25');

SELECT * FROM test1;
DROP TABLE test1;
