----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:12:49 03/06/2019 
-- Design Name: 
-- Module Name:    MEM - Structural 
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

entity MEM is
    Port ( clk : in  STD_LOGIC;
           MemWr_En : in  STD_LOGIC;
			  INST_DOUT : out STD_LOGIC_VECTOR(31 downto 0);
			  INST_ADR : in STD_LOGIC_VECTOR(10 downto 0);
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MEM;

architecture Structural of MEM is

component alu_ram  is
    Port ( al_me_addr : in  STD_LOGIC_VECTOR (31 downto 0);
           adr_0x400 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component RAM is
    Port ( clk : in  STD_LOGIC;
           inst_addr : in  STD_LOGIC_VECTOR (10 downto 0);
           inst_dout : out  STD_LOGIC_VECTOR (31 downto 0);
           data_we : in  STD_LOGIC;
           data_addr : in  STD_LOGIC_VECTOR (10 downto 0);
           data_din : in  STD_LOGIC_VECTOR (31 downto 0);
           data_dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal temp : STD_LOGIC_VECTOR(31 downto 0);

begin

al_ram : alu_ram port map(al_me_addr => ALU_MEM_Addr,
								  adr_0x400 => temp);

ram_mem : RAM port map(clk => clk,
							  inst_addr => INST_ADR,
							  inst_dout => INST_DOUT,
							  data_we => MemWr_En,
							  data_addr => temp(12 downto 2),
							  data_din => MEM_DataIn,
							  data_dout => MEM_DataOut);
							 
end Structural;

