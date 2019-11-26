----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:36:59 03/04/2019 
-- Design Name: 
-- Module Name:    DECSTAGE - Structural 
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

entity DECSTAGE is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn : in  STD_LOGIC;
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrData_sel : in  STD_LOGIC;
           RF_B_sel : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  RESET : in STD_LOGIC;
           Immed : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR (31 downto 0));
end DECSTAGE;

architecture Structural of DECSTAGE is

component mux_2_1_5bits is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           sel : in  STD_LOGIC;
           Outp : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component RegisterFile32 is
    Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
			  reset : in STD_LOGIC;
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           CLK : in  STD_LOGIC);
end component;

component Immed_logic is
    Port ( Instr_in : in  STD_LOGIC_VECTOR (15 downto 0);
			  Opcode : in STD_LOGIC_VECTOR(5 downto 0);
           Immed_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX_2x1 is
    Port ( SEL : in  STD_LOGIC;
           MUXIn1 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXIn2 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal mux_inst : STD_LOGIC_VECTOR(4 downto 0);
signal mux_wr_data : STD_LOGIC_VECTOR(31 downto 0);

begin

rf : RegisterFile32 port map(Ard1 => Instr(25 downto 21),
									  Ard2 => mux_inst,
									  Awr => Instr(20 downto 16),
									  reset => RESET,
									  Dout1 => RF_A,
									  Dout2 => RF_B,
									  Din => mux_wr_data,
									  WrEn => RF_WrEn,
									  CLK => Clk);
									  
Immediate : Immed_logic port map(Instr_in => Instr(15 downto 0),
									  Opcode => Instr(31 downto 26),
									  Immed_out => Immed);
									  
mux1 : MUX_2x1 port map(SEL => RF_WrData_sel,
								MUXIn1 => MEM_out,
								MUXIn2 => ALU_out,
								MUXOut => mux_wr_data);
								
mux2 : mux_2_1_5bits port map(A => Instr(15 downto 11),
										B => Instr(20 downto 16),
										sel => RF_B_sel,
										Outp => mux_inst);

end Structural;

