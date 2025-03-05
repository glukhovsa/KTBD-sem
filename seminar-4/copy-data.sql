CREATE TABLE proto1 (
    proto_id            NUMERIC     NOT NULL,
    proto_name          CHAR(50)    NOT NULL
);

CREATE TABLE proto2 (
    proto_id            NUMERIC     NOT NULL,
    proto_name          CHAR(50)    NOT NULL
);

INSERT INTO proto1 (proto_id, proto_name) VALUES (1, 'TVGI.455659.481');
INSERT INTO proto1 (proto_id, proto_name) VALUES (2, 'TVGI.455659.480');
INSERT INTO proto1 (proto_id, proto_name) VALUES (3, 'TVGI.455659.466');
INSERT INTO proto1 (proto_id, proto_name) VALUES (4, 'TVGI.455659.479');

SELECT * FROM proto2;

INSERT INTO proto2
    SELECT * FROM proto1 WHERE proto_id <= 3;

SELECT * FROM proto1;
SELECT * FROM proto2;