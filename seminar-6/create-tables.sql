CREATE TABLE TPLG_PCB_Library
( 
    PCBLib_ID               NUMBER      NOT NULL,
    PCBLib_Name             CHAR(40)    UNIQUE, 
    PCBLib_Footprint_Count  INTEGER     NOT NULL, 
    PCBLib_YGOLib_Name      CHAR(40)    UNIQUE
);

ALTER TABLE TPLG_PCB_Library
    ADD CONSTRAINT C_PCBLib_PK PRIMARY KEY ( PCBLib_ID );
ALTER TABLE TPLG_PCB_Library
    ADD CONSTRAINT C_PCBLib_Footprint_Count_CHK CHECK ( PCBLib_Footprint_Count > 0 );
CREATE SEQUENCE S_TPLG_PCB_Library INCREMENT BY 1 START WITH 1;


CREATE TABLE TPLG_Footprint 
( 
    Footprint_PCBLib_ID   NUMBER    NOT NULL,
    Footprint_ID          NUMBER    NOT NULL,
    Footprint_Name        CHAR(20)  UNIQUE, 
    Footprint_Length      INTEGER   NOT NULL, 
    Footprint_Width       INTEGER   NOT NULL,
    Footprint_Pad_Count   NUMBER    NOT NULL, 
    Footprint_Instalation CHAR(20)  NOT NULL, 
    Footprint_YGO         CHAR(20)  NULL
);

ALTER TABLE TPLG_Footprint
    ADD CONSTRAINT C_Footprint_PK PRIMARY KEY (Footprint_ID);
ALTER TABLE TPLG_Footprint
    ADD CONSTRAINT C_Footprint_PCBLib_FK FOREIGN KEY (Footprint_PCBLib_ID) REFERENCES TPLG_PCB_Library(PCBLib_ID);
CREATE SEQUENCE S_TPLG_Footprint INCREMENT BY 1 START WITH 1;


CREATE TABLE TPLG_Pad 
( 
    Pad_PCBLib_ID     NUMBER    NOT NULL, 
    Pad_Footprint_ID  NUMBER    NOT NULL, 
    Pad_ID            NUMBER    NOT NULL, 
    Pad_Length        INTEGER   NOT NULL, 
    Pad_Width         INTEGER   NOT NULL, 
    Pad_Square        CHAR(20)  NOT NULL, 
    Pad_Hole_D        INTEGER   NULL, 
    Pad_X             INTEGER   NOT NULL, 
    Pad_Y             INTEGER   NOT NULL
);

ALTER TABLE TPLG_Pad
    ADD CONSTRAINT C_Pad_PK PRIMARY KEY (Pad_ID);
ALTER TABLE TPLG_Pad
    ADD CONSTRAINT C_Pad_PCBLib_FK FOREIGN KEY (Pad_PCBLib_ID) REFERENCES TPLG_PCB_Library(PCBLib_ID);
ALTER TABLE TPLG_Pad
    ADD CONSTRAINT C_Pad_Footprint_FK FOREIGN KEY (Pad_Footprint_ID) REFERENCES TPLG_Footprint(Footprint_ID);
CREATE SEQUENCE S_TPLG_Pad INCREMENT BY 1 START WITH 1;

CREATE TABLE users_data_my (login VARCHAR(10), passw VARCHAR(50));
