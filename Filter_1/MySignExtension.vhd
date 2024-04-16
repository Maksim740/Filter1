library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MySignExtension is
	GENERIC (N	: NATURAL:=4);
    Port (
        input_data : in std_logic_vector(N-1 downto 0);
        output_data : out std_logic_vector(N downto 0)
    );
end entity MySignExtension;

architecture Behavioral of MySignExtension is
begin
    process (input_data)
    begin
        if input_data(N-1) = '1' then
            output_data <=   '1' & input_data;
        else
            output_data <=   '0' & input_data;
        end if;
    end process;
end architecture Behavioral;