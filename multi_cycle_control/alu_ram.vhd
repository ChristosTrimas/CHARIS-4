----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:38:30 03/03/2019 
-- Design Name: 
-- Module Name:    alu_ram - Behavioral 
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

entity alu_ram is
    Port ( al_me_addr : in  STD_LOGIC_VECTOR (31 downto 0);
           adr_0x400 : out  STD_LOGIC_VECTOR (31 downto 0));
end alu_ram;

architecture Behavioral of alu_ram is

begin

adr_0x400 <= al_me_addr + "00000000000000000000010000000000" ;   --0x400 to binary

end Behavioral;

