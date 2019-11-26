----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:07:01 03/04/2019 
-- Design Name: 
-- Module Name:    Immed_logic - Behavioral 
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

entity Immed_logic is
    Port ( Instr_in : in  STD_LOGIC_VECTOR (15 downto 0);
			  Opcode : in STD_LOGIC_VECTOR(5 downto 0);
           Immed_out : out  STD_LOGIC_VECTOR (31 downto 0));
end Immed_logic;

architecture Behavioral of Immed_logic is

begin

Immed_out <= "0000000000000000" & Instr_in when (Opcode = "110010" OR Opcode = "110011") else --zero filling gia nandi kai ori
				 Instr_in & "0000000000000000" when (Opcode = "111001") else --   <<16(zero filling) lui
				 "0000000000000000" & Instr_in when ((Opcode = "111000" OR Opcode = "110000" OR Opcode = "000111" OR Opcode = "000111" OR Opcode = "001111")) AND (Instr_in(15) = '0') else --sign extend msb=0 li,addi,lb,sb,lw
				 "1111111111111111" & Instr_in when ((Opcode = "111000" OR Opcode = "110000" OR Opcode = "000111" OR Opcode = "000111" OR Opcode = "001111")) AND (Instr_in(15) = '1') else --sign extend msb=1 li,addi,lb,sb,lw
				 "00000000000000" & Instr_in & "00" when ((Opcode = "000000" OR Opcode = "000001" OR Opcode = "111111")) AND (Instr_in(15) = '0') else -- b,beq,bne signExtend<<2 msb = 0
				 "11111111111111" & Instr_in & "00" when ((Opcode = "000000" OR Opcode = "000001" OR Opcode = "111111")) AND (Instr_in(15) = '1'); -- b,beq,bne signExtend<<2 msb = 1
				 
end Behavioral;

