----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:47 03/17/2019 
-- Design Name: 
-- Module Name:    DATAPATH - Structural 
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

entity DATAPATH is
    Port ( PC_Sel : in  STD_LOGIC;
			  Clk : in STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           RF_B_sel : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
           RF_WrData_sel : in  STD_LOGIC;
           ImmExt : in  STD_LOGIC;
           ALU_Bin_sel : in  STD_LOGIC;
           RF_Wr_en : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
			  Instr : out STD_LOGIC_VECTOR(31 downto 0);
           MEM_Wr_En : in  STD_LOGIC);
end DATAPATH;

architecture Structural of DATAPATH is

component ALU_module is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component DECSTAGE is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn : in  STD_LOGIC;
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrData_sel : in  STD_LOGIC;
           RF_B_sel : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  RESET : in STD_LOGIC;
			  ImmExt : in STD_LOGIC;
           Immed : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Memory is     
	Port  ( Clk : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
			  PC_Sel : in STD_LOGIC;
			  PC_LdEn : in STD_LOGIC;
			  PC_Imm : in STD_LOGIC_VECTOR(31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0);
			  Instruction : out STD_LOGIC_VECTOR(31 downto 0);
			  Reset : in STD_LOGIC;
           MEM_Wr_En : in  STD_LOGIC);
end component;

signal ra,rb,immediatesignal,alumuxsignal,instruction,memtomuxsignal : STD_LOGIC_VECTOR(31 downto 0);

begin

alu: ALU_module port map(RF_A => ra,
							    RF_B => rb,
							    Immed => immediatesignal,
							    ALU_Bin_sel => ALU_Bin_sel,
							    ALU_func => ALU_func,
							    ALU_out => alumuxsignal);
								 
decoding: DECSTAGE port map (Instr => instruction,
									  RF_WrEn => RF_Wr_en,
									  ALU_out => alumuxsignal,
									  MEM_out => memtomuxsignal,
									  RF_WrData_sel => RF_WrData_sel,
									  RF_B_sel => RF_B_sel,
									  Clk => Clk,
									  RESET => Reset,
									  ImmExt => ImmExt,
									  Immed => immediatesignal,
									  RF_A => ra,
									  RF_B => rb);
									  
memorystage: Memory port map(Clk => Clk,
									  ALU_MEM_Addr => alumuxsignal, 
									  MEM_DataIn => rb,
									  PC_Sel => PC_Sel,
									  PC_LdEn => PC_LdEn,
									  PC_Imm => immediatesignal,
									  MEM_DataOut => memtomuxsignal,
									  Instruction => instruction,
									  Reset => Reset,
									  MEM_Wr_En => MEM_Wr_En);
									  
Instr <= instruction;

end Structural;

