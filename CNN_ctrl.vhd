LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY CNN_ctrl IS
 PORT(ctr_clk:in std_logic;
      reset:in std_logic;
      over1,over2,over3,over4:in std_logic;
      start1,start2,start3,start4,start5:out std_logic);
END ENTITY CNN_ctrl;
ARCHITECTURE ART OF CNN_ctrl IS
  TYPE state IS(st1,st2,st3,st4,ST5);
  SIGNAL pr_state:state;
  BEGIN
  PROCESS(reset,ctr_clk)IS
  BEGIN
  IF(reset='0')THEN
    pr_state<=ST1;
  ELSIF(ctr_clk'EVENT AND ctr_clk='1')THEN
  CASE pr_state IS
  
  
  WHEN st1=>start1<='1';
         IF(over1='1')THEN
              pr_state<=st2;
              start1<='0';
            ELSE
              pr_state<=st1;
            END IF;
  WHEN st2=>start2<='1';
           IF(over2='1')THEN
              pr_state<=st3;
              start2<='0';
            ELSE
              pr_state<=st2;
            END IF;
  WHEN st3=>start3<='1';
           IF(over3='1')THEN
              pr_state<=st4;
              start3<='0';
            ELSE
              pr_state<=st3;
            END IF;
  WHEN st4=>start4<='1';
           IF(over4='1')THEN
              pr_state<=st5;
              start4<='0';
            ELSE
              pr_state<=st4;
            END IF;
  WHEN st5=>start5<='1';
	         IF(over4='1')THEN
       
              start5<='0';
            ELSE
              pr_state<=st5;
            END IF;
  END CASE; 
  END IF;
  END PROCESS;
  END ARCHITECTURE;
