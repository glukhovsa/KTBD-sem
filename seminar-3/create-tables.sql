CREATE TABLE TPLG_PCB_Library
( 
    PCBLib_ID               NUMBER      NOT NULL,
    PCBLib_Name             CHAR(40)    UNIQUE, 
    PCBLib_Footprint_Count  INTEGER     NOT NULL, 
    PCBLib_YGOLib_Name      CHAR(40)    UNIQUE,
    CONSTRAINT C_PCBLib_PK PRIMARY KEY ( PCBLib_ID ),
    CONSTRAINT C_PCBLib_Footprint_Count_CHK CHECK ( PCBLib_Footprint_Count > 0 )
); 

CREATE TABLE TPLG_Footprint 
( 
    Footprint_PCBLib_ID   NUMBER    NOT NULL,
    Footprint_ID          NUMBER    NOT NULL,
    Footprint_Name        CHAR(20)  UNIQUE, 
    Footprint_Length      INTEGER   NOT NULL, 
    Footprint_Width       INTEGER   NOT NULL, 
    Footprint_Instalation CHAR(20)  NOT NULL, 
    Footprint_YGO         CHAR(20)  NULL,

    CONSTRAINT C_Footprint_PK PRIMARY KEY (Footprint_ID),
    CONSTRAINT C_Footprint_PCBLib_FK FOREIGN KEY (Footprint_PCBLib_ID) REFERENCES TPLG_PCB_Library
);

CREATE TABLE TPLG_Pad 
( 
    Pad_PCBLib_ID     NUMBER    NOT NULL, 
    Pad_Footprint_ID  NUMBER    NOT NULL, 
    Pad_ID            NUMBER    NOT NULL, 
    Pad_Length        INTEGER   NOT NULL, 
    Pad_Width         INTEGER   NOT NULL, 
    Pad_Square        CHAR(20)  NOT NULL, 
    Pad_D             INTEGER   NOT NULL, 
    Pad_X             INTEGER   NOT NULL, 
    Pad_Y             INTEGER   NOT NULL,

    CONSTRAINT C_Pad_PK PRIMARY KEY (Pad_ID),
    CONSTRAINT C_Pad_PCBLib_FK FOREIGN KEY (Pad_PCBLib_ID) REFERENCES TPLG_PCB_Library,
    CONSTRAINT C_Pad_Footprint_FK FOREIGN KEY (Pad_Footprint_ID) REFERENCES TPLG_Footprint
); 

