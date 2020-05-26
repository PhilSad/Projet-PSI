----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:05:49 05/26/2020 
-- Design Name: 
-- Module Name:    LC_ALU - Behavioral 
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

entity LC_ALU is
    Port ( OP : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_ALU : out  STD_LOGIC_VECTOR (3 downto 0));
end LC_ALU;

architecture Behavioral of LC_ALU is

begin
	OP_ALU <= "0001" when OP = X"01" else
				 "0010" when OP = X"02" else
				 "0011" when OP = X"03" else
				 "1111";
end Behavioral;

