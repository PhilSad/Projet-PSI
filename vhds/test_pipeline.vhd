--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:07:50 05/04/2020
-- Design Name:   
-- Module Name:   /home/lucas/14.7/ISE_DS/processeur/test_pipeline.vhd
-- Project Name:  processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pipeline
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
 
ENTITY test_pipeline IS
END test_pipeline;
 
ARCHITECTURE behavior OF test_pipeline IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pipeline
    PORT(
         CLK : IN  std_logic;
         A_IN : IN  std_logic_vector(7 downto 0);
         B_IN : IN  std_logic_vector(7 downto 0);
         C_IN : IN  std_logic_vector(7 downto 0);
         OP_IN : IN  std_logic_vector(7 downto 0);
         A_OUT : OUT  std_logic_vector(7 downto 0);
         B_OUT : OUT  std_logic_vector(7 downto 0);
         C_OUT : OUT  std_logic_vector(7 downto 0);
         OP_OUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal A_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal B_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal C_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal OP_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal A_OUT : std_logic_vector(7 downto 0);
   signal B_OUT : std_logic_vector(7 downto 0);
   signal C_OUT : std_logic_vector(7 downto 0);
   signal OP_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pipeline PORT MAP (
          CLK => CLK,
          A_IN => A_IN,
          B_IN => B_IN,
          C_IN => C_IN,
          OP_IN => OP_IN,
          A_OUT => A_OUT,
          B_OUT => B_OUT,
          C_OUT => C_OUT,
          OP_OUT => OP_OUT
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
      A_IN <= "00000000";
		B_IN <= "00001111";
		C_IN <= "11111111";
		OP_IN <= "10101010";
      -- insert stimulus here 

      wait;
   end process;

END;
