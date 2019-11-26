----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:35:16 02/27/2019 
-- Design Name: 
-- Module Name:    PCImmediate - Behavioral 
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

entity PCImmediate is
    Port ( PCIm : in  STD_LOGIC_VECTOR (31 downto 0);
           Immediate : in  STD_LOGIC_VECTOR (31 downto 0);
           PCmOut : out  STD_LOGIC_VECTOR (31 downto 0));
end PCImmediate;

architecture Behavioral of PCImmediate is

signal temp,temp1 : STD_LOGIC_VECTOR(31 downto 0);

begin

--temp <= NOT(PCIm) + "00000000000000000000000000000001" ;

PCmOut <= Immediate + PCIm ;

--PCmOut <= NOT(temp1) + "00000000000000000000000000000001";

end Behavioral;

