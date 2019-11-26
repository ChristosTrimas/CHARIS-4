----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:13:08 02/18/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Outs : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

signal temp : STD_LOGIC_VECTOR (31 downto 0);
signal cout_sig,ovf_sig,zero_sig : STD_LOGIC;

begin

temp <= (A + B) when Op = "0000" else
		  (A - B) when Op = "0001" else
		  (A AND B) when Op = "0010" else
		  (A OR B) when Op = "0011" else
		  (NOT A) when Op = "0100" else
		  (A NAND B) when Op = "0110" else
			(A NOR B) when Op = "0111" else
			A(31) & A(31 downto 1) when Op = "1000" else
			'0' & A(31 downto 1) when Op = "1001" else
			A(30 downto 0) & '0' when Op = "1010" else
			A(30 downto 0) & A(31) when Op = "1100" else
			A(0) & A(31 downto 1) when Op = "1101" else
			A;
			
Outs <= temp after 10 ns;

zero_sig <= '1' when temp = "00000000000000000000000000000000" else '0';
Zero <= zero_sig after 10 ns;

ovf_sig <= A(31) XOR temp(31) when (A(31) = B(31)) AND (Op = "0000")  else
		 B(31) XOR temp(31) when (A(31) /= B(31)) AND (Op = "0001")  else
		 '0';

Ovf <= ovf_sig after 10 ns;

cout_sig <= 	A(31) when (A(31) = B(31)) AND (Op = "0000")  else
			(NOT temp(31)) when (A(31) /= B(31)) AND (Op = "0001")  else
			'0';
	
Cout <= cout_sig after 10 ns;

end Behavioral;

