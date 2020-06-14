----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:19:56 03/16/2019 
-- Design Name: 
-- Module Name:    lb - Behavioral 
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

entity lb is
    Port ( inputLoadByte : in  STD_LOGIC_VECTOR (31 downto 0);
           outputLoadByte : out  STD_LOGIC_VECTOR (31 downto 0);
           Opcode : in  STD_LOGIC_VECTOR (5 downto 0));
end lb;

architecture Behavioral of lb is

begin
outputLoadByte(31 downto 8) <= "000000000000000000000000" when Opcode = "000011" else
										 inputLoadByte(31 downto 8);

		
outputLoadByte(7 downto 0) <= inputLoadByte(7 downto 0);


end Behavioral;

