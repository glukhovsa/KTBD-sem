PROMPT Создаём библиотеку

INSERT INTO TPLG_PCB_Library (PCBLib_ID, PCBLib_Name, PCBLib_Footprint_Count) 
    VALUES (S_TPLG_PCB_Library.NEXTVAL, 'MyLib', 5);


PROMPT Добавляем SMD резистор 0603

INSERT INTO TPLG_Footprint (Footprint_PCBLib_ID, Footprint_ID, Footprint_Name, Footprint_Length, Footprint_Width, Footprint_Instalation, Footprint_Pad_Count)
    VALUES ( (SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),S_TPLG_Footprint.NEXTVAL, 'R_0603', 2.8, 1, 'SMD', 2);

INSERT INTO TPLG_Pad (Pad_PCBLib_ID, Pad_Footprint_ID, Pad_ID, Pad_Length, Pad_Width, Pad_Square, Pad_Hole_D, Pad_X, Pad_Y)
    VALUES ((SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),
        (SELECT Footprint_ID FROM TPLG_Footprint WHERE Footprint_Name = 'R_0603'),
        S_TPLG_Pad.NEXTVAL, 1, 0.8, 'Round Rectangle', NULL, -0.8, 0);

INSERT INTO TPLG_Pad (Pad_PCBLib_ID, Pad_Footprint_ID, Pad_ID, Pad_Length, Pad_Width, Pad_Square, Pad_Hole_D, Pad_X, Pad_Y)
    VALUES ((SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),
        (SELECT Footprint_ID FROM TPLG_Footprint WHERE Footprint_Name = 'R_0603'),
        S_TPLG_Pad.NEXTVAL, 1, 0.8, 'Round Rectangle', NULL, 0.8, 0);


PROMPT Добавляем SMD резистор 0806

INSERT INTO TPLG_Footprint (Footprint_PCBLib_ID, Footprint_ID, Footprint_Name, Footprint_Length, Footprint_Width, Footprint_Instalation, Footprint_Pad_Count)
    VALUES ( (SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),S_TPLG_Footprint.NEXTVAL, 'R_0805', 3.4, 1.6, 'SMD', 2);

INSERT INTO TPLG_Pad (Pad_PCBLib_ID, Pad_Footprint_ID, Pad_ID, Pad_Length, Pad_Width, Pad_Square, Pad_Hole_D, Pad_X, Pad_Y)
    VALUES ((SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),
        (SELECT Footprint_ID FROM TPLG_Footprint WHERE Footprint_Name = 'R_0805'),
        S_TPLG_Pad.NEXTVAL, 1.2, 1.3, 'Round Rectangle', NULL, -1, 0);

INSERT INTO TPLG_Pad (Pad_PCBLib_ID, Pad_Footprint_ID, Pad_ID, Pad_Length, Pad_Width, Pad_Square, Pad_Hole_D, Pad_X, Pad_Y)
    VALUES ((SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),
        (SELECT Footprint_ID FROM TPLG_Footprint WHERE Footprint_Name = 'R_0805'),
        S_TPLG_Pad.NEXTVAL, 1.2, 1.3, 'Round Rectangle', NULL, 1, 0);


PROMPT Добавляем SMD конденсатор 0603

INSERT INTO TPLG_Footprint (Footprint_PCBLib_ID, Footprint_ID, Footprint_Name, Footprint_Length, Footprint_Width, Footprint_Instalation, Footprint_Pad_Count)
    VALUES ( (SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),S_TPLG_Footprint.NEXTVAL, 'C_0603', 2.8, 1, 'SMD', 2);

INSERT INTO TPLG_Pad (Pad_PCBLib_ID, Pad_Footprint_ID, Pad_ID, Pad_Length, Pad_Width, Pad_Square, Pad_Hole_D, Pad_X, Pad_Y)
    VALUES ((SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),
        (SELECT Footprint_ID FROM TPLG_Footprint WHERE Footprint_Name = 'C_0603'),
        S_TPLG_Pad.NEXTVAL, 1, 0.8, 'Round Rectangle', NULL, -0.8, 0);

INSERT INTO TPLG_Pad (Pad_PCBLib_ID, Pad_Footprint_ID, Pad_ID, Pad_Length, Pad_Width, Pad_Square, Pad_Hole_D, Pad_X, Pad_Y)
    VALUES ((SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),
        (SELECT Footprint_ID FROM TPLG_Footprint WHERE Footprint_Name = 'C_0603'),
        S_TPLG_Pad.NEXTVAL, 1, 0.8, 'Round Rectangle', NULL, 0.8, 0);


PROMPT Добавляем SMD конденсатор 0806

INSERT INTO TPLG_Footprint (Footprint_PCBLib_ID, Footprint_ID, Footprint_Name, Footprint_Length, Footprint_Width, Footprint_Instalation, Footprint_Pad_Count)
    VALUES ( (SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),S_TPLG_Footprint.NEXTVAL, 'C_0805', 3.4, 1.6, 'SMD', 2);

INSERT INTO TPLG_Pad (Pad_PCBLib_ID, Pad_Footprint_ID, Pad_ID, Pad_Length, Pad_Width, Pad_Square, Pad_Hole_D, Pad_X, Pad_Y)
    VALUES ((SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),
        (SELECT Footprint_ID FROM TPLG_Footprint WHERE Footprint_Name = 'C_0805'),
        S_TPLG_Pad.NEXTVAL, 1.2, 1.3, 'Round Rectangle', NULL, -1, 0);

INSERT INTO TPLG_Pad (Pad_PCBLib_ID, Pad_Footprint_ID, Pad_ID, Pad_Length, Pad_Width, Pad_Square, Pad_Hole_D, Pad_X, Pad_Y)
    VALUES ((SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),
        (SELECT Footprint_ID FROM TPLG_Footprint WHERE Footprint_Name = 'C_0805'),
        S_TPLG_Pad.NEXTVAL, 1.2, 1.3, 'Round Rectangle', NULL, 1, 0);


PROMPT Добавляем микросхемы в корпусе SOT23-3

INSERT INTO TPLG_Footprint (Footprint_PCBLib_ID, Footprint_ID, Footprint_Name, Footprint_Length, Footprint_Width, Footprint_Instalation, Footprint_Pad_Count)
    VALUES ( (SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),S_TPLG_Footprint.NEXTVAL, 'SOT23-3', 3.6, 1.2, 'SMD', 3);

INSERT INTO TPLG_Pad (Pad_PCBLib_ID, Pad_Footprint_ID, Pad_ID, Pad_Length, Pad_Width, Pad_Square, Pad_Hole_D, Pad_X, Pad_Y)
    VALUES ((SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),
        (SELECT Footprint_ID FROM TPLG_Footprint WHERE Footprint_Name = 'SOT23-3'),
        S_TPLG_Pad.NEXTVAL, 0.8, 0.5, 'Round Rectangle', NULL, -1.25, 0.95);

INSERT INTO TPLG_Pad (Pad_PCBLib_ID, Pad_Footprint_ID, Pad_ID, Pad_Length, Pad_Width, Pad_Square, Pad_Hole_D, Pad_X, Pad_Y)
    VALUES ((SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),
        (SELECT Footprint_ID FROM TPLG_Footprint WHERE Footprint_Name = 'SOT23-3'),
        S_TPLG_Pad.NEXTVAL, 0.8, 0.5, 'Round Rectangle', NULL, -1.25, -0.95);

INSERT INTO TPLG_Pad (Pad_PCBLib_ID, Pad_Footprint_ID, Pad_ID, Pad_Length, Pad_Width, Pad_Square, Pad_Hole_D, Pad_X, Pad_Y)
    VALUES ((SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = 'MyLib'),
        (SELECT Footprint_ID FROM TPLG_Footprint WHERE Footprint_Name = 'SOT23-3'),
        S_TPLG_Pad.NEXTVAL, 0.8, 0.5, 'Round Rectangle', NULL, 1.25, 0);

INSERT INTO users_data_my (login, passw) VALUES ('gluhx', 'cac9debae0a1aa893273978e653ada26');