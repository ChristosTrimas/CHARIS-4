--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:37:26 02/18/2019
-- Design Name:   
-- Module Name:   C:/LAB_1_ORGAN/ALU_test.vhd
-- Project Name:  LAB_1_ORGAN
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_test IS
END ALU_test;
 
ARCHITECTURE behavior OF ALU_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Op : IN  std_logic_vector(3 downto 0);
         Outs : OUT  std_logic_vector(31 downto 0);
         Zero : OUT  std_logic;
         Cout : OUT  std_logic;
         Ovf : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Outs : std_logic_vector(31 downto 0);
   signal Zero : std_logic;
   signal Cout : std_logic;
   signal Ovf : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          Op => Op,
          Outs => Outs,
          Zero => Zero,
          Cout => Cout,
          Ovf => Ovf
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		A <= "11000000000000000000000000000000";
		B <= "00000000000000000000000110000000";
		Op <= "0000";
      wait for 90 ns;	
		
		A <= "10000000000000000000000000000000";
		B <= "10000000000000000000000000000000";
		Op <= "0000";
      wait for 90 ns;
		
	
		A <= "01000000000000000000000000000001";
		B <= "01000000000000000000000000000001";
		Op <= "0001";
		wait for 90 ns;	
		
		
		A <= "01000011110000000000000000111111";
		B <= "01000011000000000000000000000001";
		Op <= "0010";
		wait for 90 ns;	
		
		A <= "01000011110000000000000000111111";
		B <= "01000011000000000000000000000001";
		Op <= "0011";
		wait for 90 ns;
		
		A <= "01000011110000000000000000111111";
		B <= "01000011000000000000000000000001";
		Op <= "0100";
		wait for 90 ns;
		
		A <= "01000011110000000000000000111111";
		B <= "01000011000000000000000000000001";
		Op <= "1000";
		wait for 90 ns;
		
		A <= "01000011110000000000000000111111";
		B <= "01000011000000000000000000000001";
		Op <= "1001";
		wait for 90 ns;
		
		A <= "01000011110000000000000000111111";
		B <= "01000011000000000000000000000001";
		Op <= "1010";
		wait for 90 ns;
		
		A <= "01000011110000000000000000111111";
		B <= "01000011000000000000000000000001";
		Op <= "1100";
		wait for 90 ns;
		
		A <= "01000011110000000000000000111111";
		B <= "01000011000000000000000000000001";
		Op <= "1101";
		wait for 90 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
