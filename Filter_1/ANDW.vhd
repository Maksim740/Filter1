library ieee;
use ieee.std_logic_1164.all;

entity ANDW is
GENERIC (W	: NATURAL:=5);
port (
input1 : in std_logic_vector(W-1 downto 0);
input2 : in std_logic_vector(W-1 downto 0);
output : out std_logic_vector(W-1 downto 0)
);
end entity ANDW;

architecture behavioral of ANDW is
begin
process(input1, input2)
begin
for i in 0 to W-1 loop
if (input1(i) = '1' and input2(i) = '1') then
output(i) <= '1';
else
output(i) <= '0';
end if;
end loop;
end process;
end architecture behavioral;