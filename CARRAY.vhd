LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY CARRAY IS
GENERIC( W1:INTEGER:=11;   --样本位宽
			W3:INTEGER:=100;  --样本数组长度
			W4:INTEGER:=25); --输出数组长度

 PORT(CLK:IN STD_LOGIC;
		START4:IN STD_LOGIC;
		OVER4:OUT STD_LOGIC;
      OUT1:OUT STD_LOGIC_VECTOR(W1-1 DOWNTO 0);
		OUT2:OUT STD_LOGIC_VECTOR(W1-1 DOWNTO 0);
		OUT3:OUT STD_LOGIC_VECTOR(W1-1 DOWNTO 0);
		OUT4:OUT STD_LOGIC_VECTOR(W1-1 DOWNTO 0);
		OUT5:OUT STD_LOGIC_VECTOR(W1-1 DOWNTO 0);
		SAMENTER:IN STD_LOGIC_VECTOR(W1-1 DOWNTO 0));--样本输入
END ENTITY;

ARCHITECTURE ART OF CARRAY IS
 SUBTYPE N1 IS STD_LOGIC_VECTOR(W1-1 DOWNTO 0);  --样本数组宽度
 TYPE ARRAY_N1 IS ARRAY(0 TO W3-1) OF N1;  --样本数组长度
 TYPE ARRAY_N3 IS ARRAY(0 TO W4-1) OF N1;	 --输出数组长度

 SIGNAL SAMARRAY:ARRAY_N1;		 --样本矩阵
 SIGNAL OUTARRAY:ARRAY_N3;		--输出矩阵
 SIGNAL OUTARRAY1:ARRAY_N3;

 SIGNAL A:INTEGER RANGE 0 TO W3;
 SIGNAL E:INTEGER RANGE 0 TO W4;
 SIGNAL G:INTEGER RANGE 0 TO 561;
 SIGNAL N:INTEGER RANGE 0 TO 4;
 SIGNAL Y:INTEGER RANGE 0 TO 4;
 SIGNAL Z:INTEGER RANGE 0 TO 4;
 SIGNAL C,D,J:STD_LOGIC;
 
 BEGIN

 LOAD:PROCESS(CLK,SAMENTER) IS
  BEGIN 
  IF START4='1' THEN
  IF CLK'EVENT AND CLK='1' THEN
   IF A<W3 THEN	
      A<=A+1;
		C<='0';
	ELSE
	   C<='1';
	--	A<=0;
  END IF;
  SAMARRAY(A)<=SAMENTER;
  END IF;
  END IF;
END PROCESS;
 
 JISUAN:PROCESS(SAMARRAY,N,CLK) IS
  BEGIN
  IF C='1' THEN 
  IF CLK'EVENT AND CLK='1' THEN
	 FOR Y IN 0 TO 4 LOOP
	 OUTARRAY(5*N+Y)<=SAMARRAY(20*N+2*Y)+SAMARRAY(20*N+2*Y+1)+SAMARRAY(20*N+2*Y+10)+SAMARRAY(20*N+2*Y+11);
	 END LOOP;
	 N<=N+1;
	END IF;
  END IF;
  
  IF N=4 THEN
     D<='1';
  ELSE 
     D<='0';
  END IF;
  END PROCESS;
  
  CUNCHU:PROCESS(CLK,D)
  BEGIN
  	IF D='1' THEN
   IF CLK'EVENT AND CLK='1' THEN
	  IF CONV_INTEGER(OUTARRAY(E)(W1-1)&"00"&OUTARRAY(E)(W1-2 DOWNTO 2))>0 THEN
	     OUTARRAY1(E)<=OUTARRAY(E)(W1-1)&"00"&OUTARRAY(E)(W1-2 DOWNTO 2);
		ELSE
		  OUTARRAY1(E)<="00000000000";
		END IF;
		E<=E+1;
	END IF;
	IF E=W4 THEN
     J<='1';
  ELSE 
     J<='0';
  END IF;
  END IF;
	END PROCESS;
		
	SHUCHU:PROCESS(CLK,J) IS
	BEGIN
	IF J='1' THEN
		  OVER4<='1';
	 IF CLK'EVENT AND CLK='1' THEN
	 IF G>554 AND G<560 THEN
		OUT1<=OUTARRAY1(Z);
		OUT2<=OUTARRAY1(Z+5);
		OUT3<=OUTARRAY1(Z+10);
		OUT4<=OUTARRAY1(Z+15);
		OUT5<=OUTARRAY1(Z+20);
		Z<=Z+1;
	 ELSE
	   OUT1<="ZZZZZZZZZZZ";
		OUT2<="ZZZZZZZZZZZ";
		OUT3<="ZZZZZZZZZZZ";
		OUT4<="ZZZZZZZZZZZ";
		OUT5<="ZZZZZZZZZZZ";
	 END IF;
	 END IF;
	END IF;
	END PROCESS;
	
	CHOOSEOUT:PROCESS(CLK,G) IS
	BEGIN
	IF CLK'EVENT AND CLK='1' THEN
	IF G<561 THEN
	   G<=G+1;
	ELSE
		G<=561;
	END IF;
	END IF;
	END PROCESS;
END ARCHITECTURE;