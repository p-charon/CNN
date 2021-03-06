LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY COUNTER20 IS
  PORT(CLK:IN STD_LOGIC;
       CO:OUT STD_LOGIC);
END ENTITY COUNTER20;

ARCHITECTURE ART OF COUNTER20 IS
SIGNAL CQI:STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
PROCESS(CLK,CQI)IS
  BEGIN
    IF CLK'EVENT AND CLK='1' THEN
      IF CQI="10011" THEN
	     CQI<="00000";
	   ELSE
	     CQI<=CQI+'1';
		 END IF;END IF;
END PROCESS;
PROCESS(CLK)IS
  BEGIN
    IF CLK'EVENT AND CLK='1' THEN
	   IF CQI="10011" THEN
		  CO<='1';
		ELSE 
		  CO<='0';
		 END IF;
	 END IF;
END PROCESS;
END ARCHITECTURE ART;
      