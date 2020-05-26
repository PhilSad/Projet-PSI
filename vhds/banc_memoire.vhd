----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:11:46 05/04/2020 
-- Design Name: 
-- Module Name:    banc_memoire - Behavioral 
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

entity banc_memoire is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DATA_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end banc_memoire;

architecture Behavioral of banc_memoire is
type memoire_donnees is array (255 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
signal memory : memoire_donnees := (9 => "10101010", Others => X"00");
begin
	process
	begin
	wait until CLK'event and CLK = '1';
	if RST = '0' then
		memory <= (Others => X"00");
	else
		if RW = '1' then
			--lecture
			DATA_OUT <= memory(to_integer(unsigned(A)));
		else
			--ecriture
			memory(to_integer(unsigned(A))) <= DATA_IN;
		end if;
	end if;
	end process;

end Behavioral;

