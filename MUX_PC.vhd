----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:44:13 02/27/2019 
-- Design Name: 
-- Module Name:    MUX_PC - Behavioral 
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

entity MUX_2x1 is
    Port ( SEL : in  STD_LOGIC;
           MUXIn1 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXIn2 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUXOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_2x1;

architecture Behavioral of MUX_2x1 is

begin

MUXOut <= MUXIn1 when SEL = '0' else
			 MUXIn2;

end Behavioral;

