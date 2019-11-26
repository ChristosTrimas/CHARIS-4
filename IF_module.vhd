----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:49:44 02/27/2019 
-- Design Name: 
-- Module Name:    IF_module - Structural 
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

entity IF_module is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR (31 downto 0));
end IF_module;

architecture Structural of IF_module is



component MUX_2x1 is
    Port ( SEL : in  STD_LOGIC;
           MUXIn1 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXIn2 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component PCImmediate is
	Port ( PCIn : in  STD_LOGIC_VECTOR (31 downto 0);
           Immediate : in  STD_LOGIC_VECTOR (31 downto 0);
           PCOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component PCounter is
	Port ( PCIn : in  STD_LOGIC_VECTOR (31 downto 0);
           PCOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component RAM is
	Port ( clk : in  STD_LOGIC;
           inst_addr : in  STD_LOGIC_VECTOR (10 downto 0);
           inst_dout : out  STD_LOGIC_VECTOR (31 downto 0);
           data_we : in  STD_LOGIC;
           data_addr : in  STD_LOGIC_VECTOR (10 downto 0);
           data_din : in  STD_LOGIC_VECTOR (31 downto 0);
           data_dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Reg32 is
	Port ( CLK : in  STD_LOGIC;
           WE : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal muxoutput,pcregout,pc_4_out,pci_out : STD_LOGIC_VECTOR(31 downto 0);

begin

pc: Reg_32 port map(CLK => Clk,
						 WE => PC_LdEn,
						 reset => Reset,
						 Data => muxoutput,
						 Dout => pcregout);
						 
--mem: RAM  port map(clk => Clk,
--						 inst_addr => 
--						 inst_dout => 
--						 data_we =>
--						 data_addr => 
--						 data_in => 
--						 data_dout => );
						 
counter: PCounter port map(PCIn => pcregout,
									PCOut => pc_4_out);
									
icounter: PCImmediate port map(PCIn => pc_4_out,
										 Immediate => PC_Immed,
										 PCOut => pci_out);
										 
mux2x1: MUX_2x1 port map(SEL => PC_Sel,
								MUXIn1 => pc_4_out,
								MUXIn2 => pci_out,
								MUXOut => muxoutput);

end Structural;

