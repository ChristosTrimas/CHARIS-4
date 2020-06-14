----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:46:30 03/17/2019 
-- Design Name: 
-- Module Name:    Memory - Structural 
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

entity Memory is
    Port ( Clk : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
			  PC_Sel : in STD_LOGIC;
			  PC_LdEn : in STD_LOGIC;
			  PC_Imm : in STD_LOGIC_VECTOR(31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0);
			  Instruction : out STD_LOGIC_VECTOR(31 downto 0);
			  Reset : in STD_LOGIC;
           MEM_Wr_En : in  STD_LOGIC);
end Memory;

architecture Structural of Memory is

component MEM is
    Port ( clk : in  STD_LOGIC;
           MemWr_En : in  STD_LOGIC;
			  INST_DOUT : out STD_LOGIC_VECTOR(31 downto 0);
			  INST_ADR : in STD_LOGIC_VECTOR(10 downto 0);
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component IFSTAGE is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  Clk : in STD_LOGIC;
           PC : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal pctomem : STD_LOGIC_VECTOR(31 downto 0);

begin

instrfetch: IFSTAGE port map(PC_Immed => PC_Imm,
									  PC_sel => PC_Sel,
									  PC_LdEn => PC_LdEn,
									  Reset => Reset,
									  Clk => Clk,
									  PC => pctomem);
									  
meme: MEM port map(clk => Clk,
						 MemWr_En => MEM_Wr_En,
						 INST_DOUT => Instruction,
						 INST_ADR => pctomem(12 downto 2),
						 ALU_MEM_Addr => ALU_MEM_Addr,
						 MEM_DataIn => MEM_DataIn,
						 MEM_DataOut => MEM_DataOut);
									  

end Structural;

