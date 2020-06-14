----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:50:46 03/30/2019 
-- Design Name: 
-- Module Name:    PROCESSOR - Structural 
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

entity PROCESSOR is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC);
end PROCESSOR;

architecture Structural of PROCESSOR is

component DATAPATH is
    Port ( PC_Sel : in  STD_LOGIC;
			  Clk : in STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           RF_B_sel : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
           RF_WrData_sel : in  STD_LOGIC;
           ImmExt : in  STD_LOGIC;
           ALU_Bin_sel : in  STD_LOGIC;
           RF_Wr_en : in  STD_LOGIC;
			  ALUREGEN : in STD_LOGIC;
--			  IFREGEN : in STD_LOGIC;
			  DECREGEN_1 : in STD_LOGIC;
			  DECREGEN_2 : in STD_LOGIC;
			  DECREGEN_3 : in STD_LOGIC;
			  Zero : out STD_LOGIC;
			  Instr : out STD_LOGIC_VECTOR(31 downto 0);
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
			  PC_Reset : in STD_LOGIC;
           MEM_Wr_En : in  STD_LOGIC);
end component;

component CONTROL is
    Port ( RESET : in STD_LOGIC;
			  Clk : in STD_LOGIC;
			  PC_Sel : out STD_LOGIC;
			  PC_LdEn : out  STD_LOGIC;
			  RF_B_sel : out STD_LOGIC;
			  RF_WrData_sel : out STD_LOGIC;
			  ImmExt : out STD_LOGIC;
			  ALU_Bin_sel : out STD_LOGIC;
			  RF_Wr_en : out STD_LOGIC;
			  ALU_func : out STD_LOGIC_VECTOR(3 downto 0);
			  MEM_Wr_En : out STD_LOGIC;
			  PC_Reset : out STD_LOGIC;
			  DECREG_EN_1 : out STD_LOGIC;
			  DECREG_EN_2 : out STD_LOGIC;
			  DECREG_EN_3 : out STD_LOGIC;
			  --IFREG_EN_1 : out STD_LOGIC;
			  ALUREG_EN : out STD_LOGIC;
			  Inst : in STD_LOGIC_VECTOR(31 downto 0);
			  ZERO : in STD_LOGIC);
end component;

signal  pcselect,pcloaden,rfbselect,rfwritedataselect,immediateext,alubinselect,rfwriteenable,memwriteen,pcreset : STD_LOGIC;
signal decregen1,decregen2,decregen3,aluregen,zerosignal : STD_LOGIC;
signal alufunc : STD_LOGIC_VECTOR(3 downto 0);
signal instruction : STD_LOGIC_VECTOR(31 downto 0);

begin

ctrl : CONTROL port map(  RESET => Reset,
								  Clk => Clk,
								  PC_Sel => pcselect,
								  PC_LdEn => pcloaden,
								  RF_B_sel => rfbselect,
								  RF_WrData_sel => rfwritedataselect, 
								  ImmExt => immediateext,
								  ALU_Bin_sel => alubinselect,
								  RF_Wr_en => rfwriteenable,
								  ALU_func => alufunc,
								  MEM_Wr_En => memwriteen,
								  PC_Reset => pcreset,
								  DECREG_EN_1 => decregen1,
								  DECREG_EN_2 => decregen2,
								  DECREG_EN_3 => decregen3,
								  ALUREG_EN => aluregen,
								  Inst => instruction,
								  ZERO => zerosignal);
								  
datapth : DATAPATH port map( PC_Sel => pcselect,
									  Clk => Clk,
									  PC_LdEn => pcloaden,
									  RF_B_sel => rfbselect,
									  Reset => Reset,
									  RF_WrData_sel => rfwritedataselect,
									  ImmExt => immediateext,
									  ALU_Bin_sel => alubinselect,
									  RF_Wr_en => rfwriteenable,
									  ALUREGEN => aluregen,
									  DECREGEN_1 => decregen1,
									  DECREGEN_2 => decregen2,
									  DECREGEN_3 => decregen3,
									  Zero => zerosignal,
									  Instr => instruction,
									  ALU_func => alufunc,
									  PC_Reset => pcreset,
									  MEM_Wr_En => memwriteen);

end Structural;

