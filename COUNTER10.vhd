LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY COUNTER10 IS
  PORT(CLK:IN STD_LOGIC;
       CO:OUT STD_LOGIC);
END ENTITY COUNTER10;

ARCHITECTURE ART OF COUNTER10 IS
SIGNAL CQI:STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
PROCESS(CLK,CQI)IS
  BEGIN
    IF CLK'EVENT AND CLK='1' THEN
      IF CQI="1001" THEN
	     CQI<="0000";
	   ELSE
	     CQI<=CQI+'1';
		 END IF;END IF;
END PROCESS;
PROCESS(CLK)IS
  BEGIN
    IF CLK'EVENT AND CLK='1' THEN
	   IF CQI="1001" THEN
		  CO<='1';
		ELSE 
		  CO<='0';
		 END IF;
	 END IF;
END PROCESS;
END ARCHITECTURE ART;
      