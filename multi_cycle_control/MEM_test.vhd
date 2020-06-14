--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:03:49 03/07/2019
-- Design Name:   
-- Module Name:   C:/Users/mugino/Desktop/giakomis/2/HRY_312_2019/lab_01/MEM_test.vhd
-- Project Name:  lab_01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MEM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MEM_test IS
END MEM_test;
 
ARCHITECTURE behavior OF MEM_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MEM
    PORT(
         clk : IN  std_logic;
         MemWr_En : IN  std_logic;
         ALU_MEM_Addr : IN  std_logic_vector(31 downto 0);
         MEM_DataIn : IN  std_logic_vector(31 downto 0);
         MEM_DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal MemWr_En : std_logic := '0';
   signal ALU_MEM_Addr : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_DataIn : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal MEM_DataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MEM PORT MAP (
          clk => clk,
          MemWr_En => MemWr_En,
          ALU_MEM_Addr => ALU_MEM_Addr,
          MEM_DataIn => MEM_DataIn,
          MEM_DataOut => MEM_DataOut
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		MemWr_En <= '0';
		ALU_MEM_Addr <= "00000000000000000000000000000100";
		MEM_DataIn <= "00000000000000000000000000011100";
      wait for clk_period*2;
		
		MemWr_En <= '1';
		ALU_MEM_Addr <= "00000000000000000000000000000100";
		MEM_DataIn <= "00000000000000000000000000011100";
      wait for clk_period*2;
		
		MemWr_En <= '0';
		ALU_MEM_Addr <= "00000000000000000000000000000100";
		MEM_DataIn <= "00000000000010000000000000000000";
      wait for clk_period*2;
		
		MemWr_En <= '1';
		ALU_MEM_Addr <= "00000000000000000000000000000100";
		MEM_DataIn <= "00000000000010000000000000000000";
      wait for clk_period*2;
		
		MemWr_En <= '0';
		ALU_MEM_Addr <= "00000000000000000000000000000100";
		MEM_DataIn <= "00000000000010000000000000000000";
      wait for clk_period*2;
		
		MemWr_En <= '1';
		ALU_MEM_Addr <= "00000000000000000000000000100100";
		MEM_DataIn <= "00000000000010000000000000000000";
      wait for clk_period*2;

      -- insert stimulus here 

      wait;
   end process;

END;
