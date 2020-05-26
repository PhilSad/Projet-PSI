----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:42:06 05/19/2020 
-- Design Name: 
-- Module Name:    LC - Behavioral 
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

entity LC_register is
    Port ( OP_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           W : out  STD_LOGIC);
end LC_register;

architecture Behavioral of LC_register is

begin
	W <=	'1' when OP_IN = "00000001" or OP_IN = "00000010" or OP_IN = "00000011" or OP_IN = "00000100" or OP_IN = "000000101" or OP_IN = "00000110" or OP_IN = "00000111" else --sauvegarde
			'0';
end Behavioral;

