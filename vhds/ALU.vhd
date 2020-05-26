----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:19:52 04/20/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (3 downto 0);
           N : out  STD_LOGIC; --negatif
           O : out  STD_LOGIC; --overflow
           Z : out  STD_LOGIC; --zero
           C : out  STD_LOGIC; --retenu
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is
signal memoire : STD_LOGIC_VECTOR (17 downto 0):= (Others => '0');
signal memoire_A : STD_LOGIC_VECTOR (8 downto 0):= (Others => '0');
signal memoire_B : STD_LOGIC_VECTOR (8 downto 0):= (Others => '0');
begin
	--wait for A = "00000001";
	--Addition
	memoire_A <= (b"0" & A);
	memoire_B <= (b"0" & B);
	memoire <=  (b"000000000"&(memoire_A + memoire_B)) when Ctrl_Alu = "0001" else 
					(b"000000000"&(memoire_A - memoire_B)) when Ctrl_Alu = "0010" else
					memoire_A * memoire_B when Ctrl_Alu = "0011" else
					"000000000000000000";
	C <= '1';-- when (memoire(17 downto 9) AND ("111111111" /= "000000000")) else '0'--;
	O <= '0';
	--O <= '1' when (memoire(7) = '1' AND (Ctrl_Alu = "00" OR Ctrl_Alu = "01")) else
			--'1' when (((memoire(16 downto 9) AND "11111111") /= "00000000") AND Ctrl_Alu = "10") else
			--'0';
	--N <= '1' when (memoire(7) = '1' AND (Ctrl_Alu = "00" OR Ctrl_Alu = "01")) else
		--'1' when (memoire(17) = '1' AND Ctrl_Alu = "10") else
		--'0';
	N <= '0';
	Z <= '0';
	S <= memoire(7 downto 0);
end Behavioral;