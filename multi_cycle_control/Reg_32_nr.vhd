----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:23:08 03/30/2019 
-- Design Name: 
-- Module Name:    Reg_32_nr - Behavioral 
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

entity Reg_32_nr is
    Port ( Clk : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
			  WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end Reg_32_nr;

architecture Behavioral of Reg_32_nr is

signal temp : STD_LOGIC_VECTOR(31 downto 0);

begin

Process(CLK)
begin	
	if (CLK'EVENT AND CLK='1') THEN
		if(WE='1') then 
			temp<= Data;
		else
			temp <= temp;
		end if;
	end if;
end process;	

Dout <= temp after 5 ns;

end Behavioral;

