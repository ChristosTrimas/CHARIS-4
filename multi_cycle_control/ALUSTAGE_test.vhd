--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:31:41 03/07/2019
-- Design Name:   
-- Module Name:   C:/Users/mugino/Desktop/giakomis/2/HRY_312_2019/lab_01/ALUSTAGE_test.vhd
-- Project Name:  lab_01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_module
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
 
ENTITY ALUSTAGE_test IS
END ALUSTAGE_test;
 
ARCHITECTURE behavior OF ALUSTAGE_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_module
    PORT(
         RF_A : IN  std_logic_vector(31 downto 0);
         RF_B : IN  std_logic_vector(31 downto 0);
         Immed : IN  std_logic_vector(31 downto 0);
         ALU_Bin_sel : IN  std_logic;
         ALU_func : IN  std_logic_vector(3 downto 0);
         ALU_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RF_A : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_B : std_logic_vector(31 downto 0) := (others => '0');
   signal Immed : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Bin_sel : std_logic := '0';
   signal ALU_func : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALU_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_module PORT MAP (
          RF_A => RF_A,
          RF_B => RF_B,
          Immed => Immed,
          ALU_Bin_sel => ALU_Bin_sel,
          ALU_func => ALU_func,
          ALU_out => ALU_out
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
      RF_A <= "11000000000000000000000001000000";
		RF_B <= "01000000000000000000000001000010";
		Immed <= "01000000000000000000000001000010";
		ALU_Bin_sel <= '0';
		ALU_func <= "0000";
		--add
      wait for 100 ns;	
		
		RF_A <= "01000000000000000000000000000000";
		RF_B <= "01000000000000000000000001000010";
		Immed <= "11000000000000000000000000000000";
		ALU_Bin_sel <= '1';
		ALU_func <= "0000";
		--prosthesi 
      wait for 100 ns;	
		
		RF_A <= "10000000000000000000000000000000";
		RF_B <= "01000000000000000000000001000010";
		Immed <= "01000000000000000000000000000000";
		ALU_Bin_sel <= '1';
		ALU_func <= "0001";
		--afairesi
      wait for 100 ns;	
		
		RF_A <= "11000000000000000000000000000011";
		RF_B <= "11000000000000000000000000000011";
		Immed <= "01000000000000000000000000000000";
		ALU_Bin_sel <= '0';
		ALU_func <= "0010";
		--and
      wait for 100 ns;	

     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
