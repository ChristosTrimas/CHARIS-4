----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:25:03 03/03/2019 
-- Design Name: 
-- Module Name:    IFSTAGE - Structural 
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

entity IFSTAGE is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  Clk : in STD_LOGIC;
           PC : out  STD_LOGIC_VECTOR (31 downto 0));
end IFSTAGE;

architecture Structural of IFSTAGE is

component MUX_2x1 is
    Port ( SEL : in  STD_LOGIC;
           MUXIn1 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXIn2 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component PCImmediate is
    Port ( PCIm : in  STD_LOGIC_VECTOR (31 downto 0);
           Immediate : in  STD_LOGIC_VECTOR (31 downto 0);
           PCmOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component PCounter is
	Port ( PCIn : in  STD_LOGIC_VECTOR (31 downto 0);
           PCOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Reg_32 is
	Port ( CLK : in  STD_LOGIC;
           WE : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal muxoutput,pcregout,pc_4_out,pci_out : STD_LOGIC_VECTOR(31 downto 0);

begin

pcnt: Reg_32 port map(CLK => Clk,
						 WE => PC_LdEn,
						 reset => Reset,
						 Data => muxoutput,
						 Dout => pcregout);
						 
counter: PCounter port map(PCIn => pcregout,
									PCOut => pc_4_out);
									
icounter: PCImmediate port map(PCIm => pc_4_out,
										 Immediate => PC_Immed,
										 PCmOut => pci_out);
										 
mux2x1: MUX_2x1 port map(SEL => PC_sel,
								MUXIn1 => pc_4_out,
								MUXIn2 => pci_out,
								MUXOut => muxoutput);

PC <= pcregout;

end Structural;

