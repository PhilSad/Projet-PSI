----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:01:16 05/12/2020 
-- Design Name: 
-- Module Name:    combine - Behavioral 
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

entity combine is
    Port ( addr : in  STD_LOGIC_VECTOR (7 downto 0);
			  RST : in STD_LOGIC;
			  CLK : in  STD_LOGIC);
end combine;

--Overflow : out STD_LOGIC;
--			  Carry : out STD_LOGIC;
--			  Negatif : out STD_LOGIC;
--			  Zero : out STD_LOGIC;
--			  Solution : out STD_LOGIC_VECTOR (7 downto 0)
architecture Structural of combine is

component LC_register is
    Port ( OP_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           W : out  STD_LOGIC);
end component;

component LC_ALU is
    Port ( OP : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_ALU : out  STD_LOGIC_VECTOR (3 downto 0));
end component;


component LC_MemData is
    Port ( OP : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_MemData : out  STD_LOGIC);
end component;

component ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (3 downto 0);
           N : out  STD_LOGIC; --negatif
           O : out  STD_LOGIC; --overflow
           Z : out  STD_LOGIC; --zero
           C : out  STD_LOGIC; --retenu
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component memoire_instruction is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           DATA_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component pipeline is
    Port ( CLK : in  STD_LOGIC;
			  A_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           B_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           C_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           A_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
           B_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
           C_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
           OP_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component banc_memoire is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DATA_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component registre is
    Port ( AA : in  STD_LOGIC_VECTOR (3 downto 0);
           AB : in  STD_LOGIC_VECTOR (3 downto 0);
           AW : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end component;


 
for all: memoire_instruction	use entity work.memoire_instruction(Behavioral);
for all: pipeline	use entity work.pipeline(Behavioral); 
for all: registre	use entity work.registre(Behavioral); 
for all: ALU             use entity work.ALU(Behavioral) ; 
for all: banc_memoire         use entity work.banc_memoire(Behavioral) ;
for all: LC_register	use entity work.LC_register(Behavioral);
signal data32 : STD_LOGIC_VECTOR (31 downto 0);
signal A1,B1,C1,OP1,A2,B2,C2,OP2,A3,B3,C3,OP3,A4,B4,C4,OP4, Solution : STD_LOGIC_VECTOR (7 downto 0);
signal W_to_register: STD_LOGIC;
signal into_CtrlAlu : STD_LOGIC_VECTOR (3 downto 0);
--signal AAfake : STD_LOGIC_VECTOR (3 downto 0) := "0000";
--signal ABfake : STD_LOGIC_VECTOR (3 downto 0) := (Others => '0');
signal QA : STD_LOGIC_VECTOR (7 downto 0);
signal QB : STD_LOGIC_VECTOR (7 downto 0) := (Others => '0');
signal mux1, mux2, mux3, mux4 : STD_LOGIC_VECTOR (7 downto 0);
signal OP2_to_ALU : STD_LOGIC_VECTOR (3 downto 0);
signal OP3_to_MemData : STD_LOGIC;
signal Negatif, Overflow, Zero, Carry : STD_LOGIC;
signal memoryData : STD_LOGIC_VECTOR (7 downto 0);

begin
	--étage 1: Mémoire des instructions
	mem_instruc:memoire_instruction port map (addr, CLK, data32);
	--LI/DI
	LIDI:pipeline port map (CLK, data32 (31 downto 24),data32 (23 downto 16), data32 (15 downto 8), data32 (7 downto 0), A1, B1, C1, OP1);
	--banc de registre
	REG:registre port map (B1(3 downto 0),C1(3 downto 0),A4(3 downto 0), W_to_register, B4, RST, CLK, QA, QB);
	
	mux1 <= B1 when OP1 = X"06" or OP1 = X"07" else
				QA when OP1 = X"01" or OP1 = X"02" or OP1 = X"03" or OP1 = X"04" or OP1 = X"05" or OP1 = X"08";
	--DI/EX
	DIEX:pipeline port map (CLK,A1,mux1,QB,OP1, A2,B2,C2,OP2);
	--étage 2: UAL
	LCALU:LC_ALU port map(OP2,OP2_to_ALU); 
	unite_calcul:ALU port map (B2,C2,OP2_to_ALU,Negatif,Overflow,Zero,Carry,Solution);
	
	mux2 <= Solution when OP2 = X"01" or OP2 = X"02" or OP2 = X"03" or OP2 = X"04" else
		B2 when OP2 = X"05" or OP2 = X"06" or OP2 = X"07" or OP2 = X"08";
	--EX/Mem
	EXMEM:pipeline port map (CLK, A2,mux2,C2,OP2, A3,B3,C3,OP3);
	--étage 3: Mémoire des données
	
	mux4 <= A3 when OP3 = X"08" else
				B3 when OP3 = X"07" else
				B3;
	OP_to_memData:LC_MemData port map(OP3, OP3_to_MemData);
	data_memory:banc_memoire port map (mux4, B3, OP3_to_MemData, RST, CLK, memoryData);	

	--Mem/RE
	mux3 <= memoryData when OP3 = X"07" else
				B3;
	
	MEMRE:pipeline port map (CLK,A3,mux3,C3,OP3, A4,B4,C4,OP4);
	--étage 4: LC to banc de registre
	REtoW:LC_register port map (OP4, W_to_register);
	
	
end Structural;