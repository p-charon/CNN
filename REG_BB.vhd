LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY REG_BB IS
PORT(
     start5:IN STD_LOGIC;
	  Y:IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	  Q:BUFFER STD_LOGIC_VECTOR(10 DOWNTO 0));
END ENTITY;
ARCHITECTURE ART OF REG_BB IS
SIGNAL CNT:STD_LOGIC_VECTOR(10 DOWNTO 0);
BEGIN
PROCESS(Y)IS
BEGIN
  CNT<=Y;
 IF (start5='0') THEN
 Q<=CNT;
 ELSE NULL;
 END IF;
 END PROCESS;
 END ARCHITECTURE ART;