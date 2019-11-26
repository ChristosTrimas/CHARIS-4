----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:12:34 02/27/2019 
-- Design Name: 
-- Module Name:    ALU_module - Structural 
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

entity ALU_module is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU_module;

architecture Structural of ALU_module is

component ALU is
	Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Outs : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end component;

component MUX_2x1 is
	Port ( SEL : in  STD_LOGIC;
           MUXIn1 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXIn2 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal muxalu : STD_LOGIC_VECTOR(31 downto 0);

begin

alum: ALU port map(A => RF_A,
						 B => muxalu,
						 Op => ALU_func,
						 Outs => ALU_out);
--						 Zero => 
--						 Cout =>
--						 Ovf => );
						 
mux: MUX_2x1 port map(SEL => ALU_Bin_sel,
							 MUXIn1 => RF_B,
							 MUXIn2 => Immed,
							 MUXOut => muxalu);

end Structural;

