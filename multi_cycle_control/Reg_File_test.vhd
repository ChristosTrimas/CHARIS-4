--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:58:20 02/19/2019
-- Design Name:   
-- Module Name:   C:/Users/mugino/Desktop/giakomis/giorgos/Reg_File_test.vhd
-- Project Name:  giorgos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegisterFile32
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
 
ENTITY Reg_File_test IS
END Reg_File_test;
 
ARCHITECTURE behavior OF Reg_File_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile32
    PORT(
         Ard1 : IN  std_logic_vector(4 downto 0);
         Ard2 : IN  std_logic_vector(4 downto 0);
         Awr : IN  std_logic_vector(4 downto 0);
         Dout1 : OUT  std_logic_vector(31 downto 0);
         Dout2 : OUT  std_logic_vector(31 downto 0);
         Din : IN  std_logic_vector(31 downto 0);
         WrEn : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ard1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Ard2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Awr : std_logic_vector(4 downto 0) := (others => '0');
   signal Din : std_logic_vector(31 downto 0) := (others => '0');
   signal WrEn : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Dout1 : std_logic_vector(31 downto 0);
   signal Dout2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile32 PORT MAP (
          Ard1 => Ard1,
          Ard2 => Ard2,
          Awr => Awr,
          Dout1 => Dout1,
          Dout2 => Dout2,
          Din => Din,
          WrEn => WrEn,
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		Ard1 <= "00000";
		Ard2 <= "00010";
		WrEn <= '1';
		Awr <= "00000";
		Din <= "00000000000000000110000000000001";
		
		wait for CLK_period*2;
		
		Ard1 <= "00001";
		Ard2 <= "00010";
		WrEn <= '1';
		Awr <= "00010";
		Din <= "00000000000000001100000000000001";
		
		wait for CLK_period*2;
      
		Ard1 <= "00000";
		Ard2 <= "00000";
		WrEn <= '1';
		Awr <= "00000";
		Din <= "00000000000000000000000000000001";
	
   	wait for CLK_period*2;
		
   	Ard1 <= "00000";
		Ard2 <= "11010";
		WrEn <= '0';
		Awr <= "11010";
		Din <= "00011000000001100000111110000001";
		
		wait for CLK_period*2;
		
		Ard1 <= "00000";
		Ard2 <= "11010";
		WrEn <= '1';
		Awr <= "11010";
		Din <= "00011000000001100000111110000001";
		
		wait for CLK_period*2;
		--wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
