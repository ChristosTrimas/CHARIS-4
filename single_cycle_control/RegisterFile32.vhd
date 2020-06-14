----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:48:09 02/19/2019 
-- Design Name: 
-- Module Name:    RegisterFile32 - Structural 
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

entity RegisterFile32 is
    Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
			  reset : in STD_LOGIC;
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           CLK : in  STD_LOGIC);
end RegisterFile32;

architecture Structural of RegisterFile32 is

component AND_GATE is
	Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           OUTS : out  STD_LOGIC);
end component;

component DECODER_5x32 is
	Port ( Input : in  STD_LOGIC_VECTOR (4 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX_5x32 is
	Port ( MUXRe0 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe3 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe4 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe5 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe6 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe7 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe8 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe9 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe10 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe11 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe12 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe13 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe14 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe15 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe16 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe17 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe18 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe19 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe20 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe21 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe22 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe23 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe24 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe25 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe26 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe27 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe28 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe29 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe30 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MUXRe31 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXsel : in  STD_LOGIC_VECTOR (4 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Reg_32 is
	Port ( CLK : in  STD_LOGIC;
           WE : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal decout,wen,regout0,regout1,regout2,regout3,regout4,regout5,regout6,regout7,regout8,regout9,regout10,regout11,regout12,regout13,regout14,regout15,regout16,regout17,regout18,regout19,regout20,regout21,regout22,regout23,regout24,regout25,regout26,regout27,regout28,regout29,regout30,regout31 : STD_LOGIC_VECTOR(31 downto 0);

begin

dec: DECODER_5x32 port map(Input => Awr,
							 Output => decout);
							 
and_0: AND_GATE port map(A => WrEn,
								 B => decout(0),
								 OUTS => wen(0));
			
and_1: AND_GATE port map(A => WrEn,
								B => decout(1),
								OUTS => wen(1));

and_2: AND_GATE port map(A => WrEn,
								B => decout(2),
								OUTS => wen(2));

and_3: AND_GATE port map(A => WrEn,
								B => decout(3),
								OUTS => wen(3));

and_4: AND_GATE port map(A => WrEn,
								B => decout(4),
								OUTS => wen(4));

and_5: AND_GATE port map(A => WrEn,
								B => decout(5),
								OUTS => wen(5));

and_6: AND_GATE port map(A => WrEn,
								B => decout(6),
								OUTS => wen(6));

and_7: AND_GATE port map(A => WrEn,
								B => decout(7),
								OUTS => wen(7));

and_8: AND_GATE port map(A => WrEn,
								B => decout(8),
								OUTS => wen(8));

and_9: AND_GATE port map(A => WrEn,
								B => decout(9),
								OUTS => wen(9));

and_10: AND_GATE port map(A => WrEn,
								B => decout(10),
								OUTS => wen(10));

and_11: AND_GATE port map(A => WrEn,
								B => decout(11),
								OUTS => wen(11));

and_12: AND_GATE port map(A => WrEn,
								B => decout(12),
								OUTS => wen(12));

and_13: AND_GATE port map(A => WrEn,
								B => decout(13),
								OUTS => wen(13));

and_14: AND_GATE port map(A => WrEn,
								B => decout(14),
								OUTS => wen(14));

and_15: AND_GATE port map(A => WrEn,
								B => decout(15),
								OUTS => wen(15));

and_16: AND_GATE port map(A => WrEn,
								B => decout(16),
								OUTS => wen(16));

and_17: AND_GATE port map(A => WrEn,
								B => decout(17),
								OUTS => wen(17));

and_18: AND_GATE port map(A => WrEn,
								B => decout(18),
								OUTS => wen(18));

and_19: AND_GATE port map(A => WrEn,
								B => decout(19),
								OUTS => wen(19));

and_20: AND_GATE port map(A => WrEn,
								B => decout(20),
								OUTS => wen(20));

and_21: AND_GATE port map(A => WrEn,
								B => decout(21),
								OUTS => wen(21));

and_22: AND_GATE port map(A => WrEn,
								B => decout(22),
								OUTS => wen(22));

and_23: AND_GATE port map(A => WrEn,
								B => decout(23),
								OUTS => wen(23));

and_24: AND_GATE port map(A => WrEn,
								B => decout(24),
								OUTS => wen(24));

and_25: AND_GATE port map(A => WrEn,
								B => decout(25),
								OUTS => wen(25));

and_26: AND_GATE port map(A => WrEn,
								B => decout(26),
								OUTS => wen(26));

and_27: AND_GATE port map(A => WrEn,
								B => decout(27),
								OUTS => wen(27));

and_28: AND_GATE port map(A => WrEn,
								B => decout(28),
								OUTS => wen(28));

and_29: AND_GATE port map(A => WrEn,
								B => decout(29),
								OUTS => wen(29));

and_30: AND_GATE port map(A => WrEn,
								B => decout(30),
								OUTS => wen(30));

and_31: AND_GATE port map(A => WrEn,
								B => decout(31),
								OUTS => wen(31));

reg0: Reg_32 port map(CLK => CLK,
							 WE => wen(0),
							 reset => reset,
							 Data => "00000000000000000000000000000000",
							 Dout => regout0);
							 
reg1: Reg_32 port map(CLK => CLK,
							 WE => wen(1),
							 reset => reset,
							 Data => Din,
							 Dout => regout1);
							 
reg2: Reg_32 port map(CLK => CLK,
							 WE => wen(2),
							 reset => reset,
							 Data => Din,
							 Dout => regout2);
							 
reg3: Reg_32 port map(CLK => CLK,
							 WE => wen(3),
							 reset => reset,
							 Data => Din,
							 Dout => regout3);
							 
reg4: Reg_32 port map(CLK => CLK,
							 WE => wen(4),
							 reset => reset,
							 Data => Din,
							 Dout => regout4);
							 
reg5: Reg_32 port map(CLK => CLK,
							 WE => wen(5),
							 reset => reset,
							 Data => Din,
							 Dout => regout5);
							 
reg6: Reg_32 port map(CLK => CLK,
							 WE => wen(6),
							 reset => reset,
							 Data => Din,
							 Dout => regout6);
							 
reg7: Reg_32 port map(CLK => CLK,
							 WE => wen(7),
							 reset => reset,
							 Data => Din,
							 Dout => regout7);
							 
reg8: Reg_32 port map(CLK => CLK,
							 WE => wen(8),
							 reset => reset,
							 Data => Din,
							 Dout => regout8);
							 
reg9: Reg_32 port map(CLK => CLK,
							 WE => wen(9),
							 reset => reset,
							 Data => Din,
							 Dout => regout9);
							 
reg10: Reg_32 port map(CLK => CLK,
							 WE => wen(10),
							 reset => reset,
							 Data => Din,
							 Dout => regout10);
							 
reg11: Reg_32 port map(CLK => CLK,
							 WE => wen(11),
							 reset => reset,
							 Data => Din,
							 Dout => regout11);
							 
reg12: Reg_32 port map(CLK => CLK,
							 WE => wen(12),
							 reset => reset,
							 Data => Din,
							 Dout => regout12);
							 
reg13: Reg_32 port map(CLK => CLK,
							 WE => wen(13),
							 reset => reset,
							 Data => Din,
							 Dout => regout13);
							 
reg14: Reg_32 port map(CLK => CLK,
							 WE => wen(14),
							 reset => reset,
							 Data => Din,
							 Dout => regout14);
							 
reg15: Reg_32 port map(CLK => CLK,
							 WE => wen(15),
							 reset => reset,
							 Data => Din,
							 Dout => regout15);
							 
reg16: Reg_32 port map(CLK => CLK,
							 WE => wen(16),
							 reset => reset,
							 Data => Din,
							 Dout => regout16);
							 
reg17: Reg_32 port map(CLK => CLK,
							 WE => wen(17),
							 reset => reset,
							 Data => Din,
							 Dout => regout17);
							 
reg18: Reg_32 port map(CLK => CLK,
							 WE => wen(18),
							 reset => reset,
							 Data => Din,
							 Dout => regout18);
							 
reg19: Reg_32 port map(CLK => CLK,
							 WE => wen(19),
							 reset => reset,
							 Data => Din,
							 Dout => regout19);
							 
reg20: Reg_32 port map(CLK => CLK,
							 WE => wen(20),
							 reset => reset,
							 Data => Din,
							 Dout => regout20);
							 
reg21: Reg_32 port map(CLK => CLK,
							 WE => wen(21),
							 reset => reset,
							 Data => Din,
							 Dout => regout21);
							 
reg22: Reg_32 port map(CLK => CLK,
							 WE => wen(22),
							 reset => reset,
							 Data => Din,
							 Dout => regout22);
							 
reg23: Reg_32 port map(CLK => CLK,
							 WE => wen(23),
							 reset => reset,
							 Data => Din,
							 Dout => regout23);
							 
reg24: Reg_32 port map(CLK => CLK,
							 WE => wen(24),
							 reset => reset,
							 Data => Din,
							 Dout => regout24);
							 
reg25: Reg_32 port map(CLK => CLK,
							 WE => wen(25),
							 reset => reset,
							 Data => Din,
							 Dout => regout25);
							 
reg26: Reg_32 port map(CLK => CLK,
							 WE => wen(26),
							 reset => reset,
							 Data => Din,
							 Dout => regout26);
							 
reg27: Reg_32 port map(CLK => CLK,
							 WE => wen(27),
							 reset => reset,
							 Data => Din,
							 Dout => regout27);
							 
reg28: Reg_32 port map(CLK => CLK,
							 WE => wen(28),
							 reset => reset,
							 Data => Din,
							 Dout => regout28);
							 
reg29: Reg_32 port map(CLK => CLK,
							 WE => wen(29),
							 reset => reset,
							 Data => Din,
							 Dout => regout29);
							 
reg30: Reg_32 port map(CLK => CLK,
							 WE => wen(30),
							 reset => reset,
							 Data => Din,
							 Dout => regout30);
							 
reg31: Reg_32 port map(CLK => CLK,
							 WE => wen(31),
							 reset => reset,
							 Data => Din,
							 Dout => regout31);
							 

mux0: MUX_5x32 port map(  MUXRe0 => regout0,
								  MUXRe1 => regout1,
								  MUXRe2 => regout2,
								  MUXRe3 => regout3,
								  MUXRe4 => regout4,
								  MUXRe5 => regout5,
								  MUXRe6 => regout6,
								  MUXRe7 => regout7,
								  MUXRe8 => regout8,
								  MUXRe9 => regout9,
								  MUXRe10 => regout10,
								  MUXRe11 => regout11,
								  MUXRe12 => regout12,
								  MUXRe13 => regout13,
								  MUXRe14 => regout14,
								  MUXRe15 => regout15,
								  MUXRe16 => regout16,
								  MUXRe17 => regout17,
								  MUXRe18 => regout18,
								  MUXRe19 => regout19,
								  MUXRe20 => regout20,
								  MUXRe21 => regout21,
								  MUXRe22 => regout22,
								  MUXRe23 => regout23,
								  MUXRe24 => regout24,
								  MUXRe25 => regout25,
								  MUXRe26 => regout26,
								  MUXRe27 => regout27,
								  MUXRe28 => regout28,
								  MUXRe29 => regout29,
								  MUXRe30 => regout30,
								  MUXRe31 => regout31,
								  MUXsel => Ard1,
								  Dout => Dout1);


mux1: MUX_5x32 port map(  MUXRe0 => regout0,
								  MUXRe1 => regout1,
								  MUXRe2 => regout2,
								  MUXRe3 => regout3,
								  MUXRe4 => regout4,
								  MUXRe5 => regout5,
								  MUXRe6 => regout6,
								  MUXRe7 => regout7,
								  MUXRe8 => regout8,
								  MUXRe9 => regout9,
								  MUXRe10 => regout10,
								  MUXRe11 => regout11,
								  MUXRe12 => regout12,
								  MUXRe13 => regout13,
								  MUXRe14 => regout14,
								  MUXRe15 => regout15,
								  MUXRe16 => regout16,
								  MUXRe17 => regout17,
								  MUXRe18 => regout18,
								  MUXRe19 => regout19,
								  MUXRe20 => regout20,
								  MUXRe21 => regout21,
								  MUXRe22 => regout22,
								  MUXRe23 => regout23,
								  MUXRe24 => regout24,
								  MUXRe25 => regout25,
								  MUXRe26 => regout26,
								  MUXRe27 => regout27,
								  MUXRe28 => regout28,
								  MUXRe29 => regout29,
								  MUXRe30 => regout30,
								  MUXRe31 => regout31,
								  MUXsel => Ard2,
								  Dout => Dout2);
end Structural;

