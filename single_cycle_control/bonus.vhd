----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:24:58 03/18/2019 
-- Design Name: 
-- Module Name:    bonus - Behavioral 
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

entity bonus is
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
end bonus;

architecture Behavioral of bonus is

begin

PC_Sel <= '0' when (Instruction = "11000000000001010000000000001000" OR Instruction = "11001100000000111010101111001101" OR Instruction = "01111100000000110000000000000100" OR Instruction = "00111100101010101111111111111100" OR Instruction = "00001100000100000000000000000100" OR Instruction = "10000001010001001000000000110010" OR Instruction = "00000100101001010000000000001000" OR Instruction = "10000000010000010001110000010000") else
			 '1' when (Instruction = "11111100000000001111111111111110") else
			 '0' ;

PC_LdEn <= '1' ;

RF_B_sel <= '0' when (Instruction = "11000000000001010000000000001000" OR Instruction = "11001100000000111010101111001101" OR Instruction = "00111100101010101111111111111100" OR Instruction = "00001100000100000000000000000100" OR Instruction = "10000001010001001000000000110010" OR Instruction = "00000100101001010000000000001000" OR Instruction = "11111100000000001111111111111110") else
				'1' when (Instruction = "01111100000000110000000000000100" OR Instruction = "10000000010000010001110000010000") else
				'0' ;
				
RF_WrData_sel <= '0' when (Instruction = "00111100101010101111111111111100" OR Instruction = "00001100000100000000000000000100") else
					  '1' ;
					  
ImmExt <= '0' when (Instruction = "11001100000000111010101111001101" OR Instruction = "10000001010001001000000000110010" OR Instruction = "00000100101001010000000000001000") else
			 '1' ;
			 
ALU_Bin_sel <= '0' when (Instruction = "10000001010001001000000000110010") else
					'1' ;
					
RF_Wr_en <= '0' when (Instruction = "01111100000000110000000000000100" OR Instruction = "00000100101001010000000000001000" OR Instruction = "11111100000000001111111111111110") else
				'1' ;
				
ALU_func <= "0011" when Instruction = "11001100000000111010101111001101" else
				"0110" when Instruction = "10000001010001001000000000110010" else
				"0001" when (Instruction = "00000100101001010000000000001000" OR Instruction = "11111100000000001111111111111110" )else
				"0000" ;
				
MEM_Wr_En <= '1' when Instruction = "01111100000000110000000000000100" else
				 '0' ;
				

end Behavioral;

