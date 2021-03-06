LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY REG2 IS
PORT(CLK:IN STD_LOGIC;
     RESET:IN STD_LOGIC;
	  Y:IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	  Q:BUFFER STD_LOGIC_VECTOR(10 DOWNTO 0));
END ENTITY;
ARCHITECTURE ART OF REG2 IS
BEGIN
PROCESS(CLK,Y)IS
BEGIN
IF(CLK'EVENT AND CLK='1') THEN
 IF (RESET='0') THEN
 Q<="00000000000";
 ELSE Q<=Y;
 END IF;
 END IF;
 END PROCESS;
 Q<=Q;
 END ARCHITECTURE ART;