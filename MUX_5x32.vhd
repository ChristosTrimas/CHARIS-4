----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:17:13 02/19/2019 
-- Design Name: 
-- Module Name:    MUX_5x32 - Behavioral 
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

entity MUX_5x32 is
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
end MUX_5x32;

architecture Behavioral of MUX_5x32 is
signal muxo : STD_LOGIC_VECTOR(31 DOWNTO 0);
begin

muxo <=	  MUXRe0 when MUXsel = "00000"  else
			  MUXRe1 when MUXsel = "00001"	else
			  MUXRe2 when MUXsel = "00010"	else
			  MUXRe3 when MUXsel = "00011"	else
			  MUXRe4 when MUXsel = "00100"	else
			  MUXRe5 when MUXsel = "00101"	else  
			  MUXRe6 when MUXsel = "00110"	else
			  MUXRe7 when MUXsel = "00111"	else
			  MUXRe8 when MUXsel = "01000"	else
			  MUXRe9 when MUXsel = "01001"	else
			  MUXRe10 when MUXsel = "01010"	else
			  MUXRe11 when MUXsel = "01011"	else
			  MUXRe12 when MUXsel = "01100"	else
			  MUXRe13 when MUXsel = "01101"	else
			  MUXRe14 when MUXsel = "01110"	else
			  MUXRe15 when MUXsel = "01111"	else
			  MUXRe16 when MUXsel = "10000"	else	
			  MUXRe17 when MUXsel = "10001"	else
			  MUXRe18 when MUXsel = "10010"	else
			  MUXRe19 when MUXsel = "10011"	else
			  MUXRe20 when MUXsel = "10100"	else
			  MUXRe21 when MUXsel = "10101"	else
			  MUXRe22 when MUXsel = "10110"	else
			  MUXRe23 when MUXsel = "10111"	else
			  MUXRe24 when MUXsel = "11000"	else
			  MUXRe25 when MUXsel = "11001"	else
			  MUXRe26 when MUXsel = "11010"	else
			  MUXRe27 when MUXsel = "11011"	else
			  MUXRe28 when MUXsel = "11100"	else
			  MUXRe29 when MUXsel = "11101"	else
			  MUXRe30 when MUXsel = "11110"	else 
			  MUXRe31;

Dout <= muxo after 5ns;
end Behavioral;

