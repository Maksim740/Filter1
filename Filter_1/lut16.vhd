--  VHDL Example
-- File LUT16.VHD

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.all;

ENTITY	lut16	IS
	GENERIC(	C0	: INTEGER:=1;
				C1	: INTEGER:=2;
				C2	: INTEGER:=3;
				C3	: INTEGER:=4;
				W	: NATURAL:=6);
	PORT (	ADDR	: IN INTEGER RANGE 0 to 15;
			clk		: IN STD_LOGIC;
		  	DATA	: OUT STD_LOGIC_VECTOR(W-1 downto 0) );
END lut16;

architecture	behavior	of	lut16	is
signal s	: integer	RANGE -(2**(W-1))+1 TO 2**(W-1) - 1;
begin
	process(ADDR)
	begin
		case ADDR is
			when 0 => s <= 0;
			when 1 => s <= C0;
			when 2 => s <= C1;
			when 3 => s <= C0+C1;
			when 4 => s <= C2;
			when 5 => s <= C2+C0;
			when 6 => s <= C2+C1;
			when 7 => s <= C2+C1+C0;
			when 8 => s <= C3;
			when 9 => s <= C3+C0;
			when 10 => s <= C3+C1;
			when 11 => s <= C3+C1+C0;
			when 12 => s <= C3+C2;
			when 13 => s <= C3+C2+C0;
			when 14 => s <= C3+C2+C1;
			when 15 => s <= C3+C2+C1+C0;
		end case;
	end process;
	process(clk)
	begin
		if(clk'EVENT AND clk='1')then
			DATA <= CONV_STD_LOGIC_VECTOR(s,W);
		end if;
	end process;
end behavior;