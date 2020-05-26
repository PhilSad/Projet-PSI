--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:42:49 05/26/2020
-- Design Name:   
-- Module Name:   /home/lucas/14.7/ISE_DS/processeur/LC_test.vhd
-- Project Name:  processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LC
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
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY LC_test IS
END LC_test;
 
ARCHITECTURE behavior OF LC_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LC_register
    PORT(
         OP_IN : IN  std_logic_vector(7 downto 0);
         W : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OP_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal W : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LC_register PORT MAP (
          OP_IN => OP_IN,
          W => W
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      OP_IN <= "00000001";
		wait for 50 ns;
		OP_IN <= "00000010";
		wait for 50 ns;
		OP_IN <= "00000011";
		wait for 50 ns;		
		OP_IN <= "00000100";
		wait for 50 ns;
		OP_IN <= "00000101";
		wait for 50 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
