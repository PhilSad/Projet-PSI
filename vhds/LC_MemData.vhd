----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:57:19 05/26/2020 
-- Design Name: 
-- Module Name:    LC_MemData - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LC_MemData is
    Port ( OP : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_MemData : out  STD_LOGIC);
end LC_MemData;

architecture Behavioral of LC_MemData is

begin
	Op_MemData <= '0' when OP = x"08" else
						'1';

end Behavioral;

