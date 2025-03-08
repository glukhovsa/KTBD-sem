PROMPT Правильная вставка данных при констрейтах

INSERT INTO TPLG_PCB_Library (PCBLib_ID, PCBLib_Name, PCBLib_Footprint_Count) VALUES (1, 'my', 1);

PROMPT Неправильная вставка данных при констрейтах

INSERT INTO TPLG_PCB_Library (PCBLib_ID, PCBLib_Name, PCBLib_Footprint_Count) VALUES (1, '', 1);

COMMIT;
