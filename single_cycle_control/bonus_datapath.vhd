----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:21:45 03/19/2019 
-- Design Name: 
-- Module Name:    bonus_datapath - Behavioral 
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

entity bonus_datapath is
    Port (Reset : in  STD_LOGIC;
			 CLK : in STD_LOGIC);
end bonus_datapath;

architecture Structural of bonus_datapath is

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
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
			  Instr : out STD_LOGIC_VECTOR(31 downto 0);
           MEM_Wr_En : in  STD_LOGIC);
end component;

component bonus is
    Port ( Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_Sel : out  STD_LOGIC;
           PC_LdEn : out  STD_LOGIC;
           RF_B_sel : out  STD_LOGIC;
           RF_WrData_sel : out  STD_LOGIC;
           ImmExt : out  STD_LOGIC;
           ALU_Bin_sel : out  STD_LOGIC;
           RF_Wr_en : out  STD_LOGIC;
           ALU_func : out  STD_LOGIC_VECTOR(3 downto 0);
           MEM_Wr_En : out  STD_LOGIC);
end component;

signal pcsel,pcld,rfb,rfwrdata,imext,alub,rfwren,memwren : STD_LOGIC;
signal aluf : STD_LOGIC_VECTOR(3 downto 0);
signal inst :STD_LOGIC_VECTOR(31 downto 0);

begin

data: DATAPATH port map	(PC_Sel => pcsel,
								  Clk => CLK,
								  PC_LdEn => pcld,
								  RF_B_sel => rfb,
								  Reset =>Reset,
								  RF_WrData_sel => rfwrdata,
								  ImmExt =>imext,
								  ALU_Bin_sel => alub,
								  RF_Wr_en => rfwren,
								  ALU_func => aluf,
								  Instr => inst,
								  MEM_Wr_En => memwren);
								  
bon: bonus port map(Instruction => inst,
						  PC_Sel => pcsel,
						  PC_LdEn => pcld,
						  RF_B_sel => rfb,
						  RF_WrData_sel => rfwrdata,
						  ImmExt => imext,
						  ALU_Bin_sel => alub,
						  RF_Wr_en => rfwren,
						  ALU_func => aluf,
						  MEM_Wr_En => memwren);

end Structural;

