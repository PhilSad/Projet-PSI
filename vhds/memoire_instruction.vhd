----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:36:02 05/04/2020 
-- Design Name: 
-- Module Name:    memoire_instruction - Behavioral 
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

entity memoire_instruction is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           DATA_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
end memoire_instruction;

architecture Behavioral of memoire_instruction is
type instruction_array is array (255 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
signal instru : instruction_array := (0 => X"01060006",
													1 => X"02010005",
													2 => X"03010201",
													3 => X"04090007",
													4 => X"FF030008",
													others=>X"00000000");
begin
	process
	begin
	wait until CLK'event and CLK = '1';
	DATA_OUT <= instru(to_integer(unsigned(A)));
	end process;
end Behavioral;

