----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:59:17 05/04/2020 
-- Design Name: 
-- Module Name:    registre - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registre is
    Port ( AA : in  STD_LOGIC_VECTOR (3 downto 0);
           AB : in  STD_LOGIC_VECTOR (3 downto 0);
           AW : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end registre;

architecture Behavioral of registre is
type registre_array is array (15 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
signal rgst : registre_array := (others=>"00000000");

begin
process (AA,AB)
begin
	if (W = '1') then -- si on écrit			
			if (AW = AA) then --addr d'entrée = addr sortie
				QA <= DATA; --bypass
			else
				QA <= rgst(to_integer(unsigned(AA)));
			end if;
			if (AW = AB) then
				QB <= DATA;
			else
				QB <= rgst(to_integer(unsigned(AB)));
			end if;
	else --lecture simple
		QA <= rgst(to_integer(unsigned(AA)));
		QB <= rgst(to_integer(unsigned(AB)));
	end if;
end process;

reset_or_write: process
begin
		wait until CLK'event and CLK = '1';
		if (RST='0') then
			rgst <= (Others => "00000000");
		else
			if(W = '1') then
				rgst(to_integer(unsigned(AW))) <= DATA;
			end if;
		end if;
end process reset_or_write;

end Behavioral;

