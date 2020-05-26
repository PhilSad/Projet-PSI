--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:09:26 05/26/2020
-- Design Name:   
-- Module Name:   /home/lucas/14.7/ISE_DS/processeur/mem_register_test.vhd
-- Project Name:  processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registre
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mem_register_test IS
END mem_register_test;
 
ARCHITECTURE behavior OF mem_register_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registre
    PORT(
         AA : IN  std_logic_vector(3 downto 0);
         AB : IN  std_logic_vector(3 downto 0);
         AW : IN  std_logic_vector(3 downto 0);
         W : IN  std_logic;
         DATA : IN  std_logic_vector(7 downto 0);
         RST : IN  std_logic;
         CLK : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal AA : std_logic_vector(3 downto 0) := (others => '0');
   signal AB : std_logic_vector(3 downto 0) := (others => '0');
   signal AW : std_logic_vector(3 downto 0) := (others => '0');
   signal W : std_logic := '0';
   signal DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal RST : std_logic := '1';
   signal CLK : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registre PORT MAP (
          AA => AA,
          AB => AB,
          AW => AW,
          W => W,
          DATA => DATA,
          RST => RST,
          CLK => CLK,
          QA => QA,
          QB => QB
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		AA <= "0000";
		AB <= "0000";
		W <= '0';
		AW <= "1111";
		DATA <= "11111111";
		RST <= '1';
      wait for 100 ns;	
		W <= '1';
		wait for 50 ns;
		AB <= "1111";

      wait;
   end process;

END;
