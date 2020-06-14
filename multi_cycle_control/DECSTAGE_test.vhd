--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:32:06 03/06/2019
-- Design Name:   
-- Module Name:   C:/Users/mugino/Desktop/giakomis/2/HRY_312_2019/lab_01/DECSTAGE_test.vhd
-- Project Name:  lab_01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DECSTAGE
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
 
ENTITY DECSTAGE_test IS
END DECSTAGE_test;
 
ARCHITECTURE behavior OF DECSTAGE_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DECSTAGE
    PORT(
         Instr : IN  std_logic_vector(31 downto 0);
         RF_WrEn : IN  std_logic;
         ALU_out : IN  std_logic_vector(31 downto 0);
         MEM_out : IN  std_logic_vector(31 downto 0);
         RF_WrData_sel : IN  std_logic;
         RF_B_sel : IN  std_logic;
         Clk : IN  std_logic;
         RESET : IN  std_logic;
         Immed : OUT  std_logic_vector(31 downto 0);
         RF_A : OUT  std_logic_vector(31 downto 0);
         RF_B : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrEn : std_logic := '0';
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_out : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrData_sel : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
   signal Clk : std_logic := '0';
   signal RESET : std_logic := '0';

 	--Outputs
   signal Immed : std_logic_vector(31 downto 0);
   signal RF_A : std_logic_vector(31 downto 0);
   signal RF_B : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECSTAGE PORT MAP (
          Instr => Instr,
          RF_WrEn => RF_WrEn,
          ALU_out => ALU_out,
          MEM_out => MEM_out,
          RF_WrData_sel => RF_WrData_sel,
          RF_B_sel => RF_B_sel,
          Clk => Clk,
          RESET => RESET,
          Immed => Immed,
          RF_A => RF_A,
          RF_B => RF_B
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     RESET <= '1';
     wait for Clk_period*2;
	  
	  RESET <= '0';
	  Instr <= "100000" & "00000" & "00001" & "00000" & "00000" & "000000"; --(31-26 & 25-21 & 20-26 & 15-11)
	  RF_WrEn <= '1';
	  ALU_out <= "00000000000000000000000000000001";
	  MEM_out <= "00000000000000000000000000000000";
	  RF_WrData_sel <= '1';
	  RF_B_sel <= '0';
	  wait for Clk_period*2;
	  
	  Instr <= "100000" & "00001" & "10000" & "00000" & "00000" & "000000"; --(31-26 & 25-21 & 20-26 & 15-11)
	  RF_WrEn <= '1';
	  ALU_out <= "00000000000000000000000000000011";
	  MEM_out <= "00000000000000000000000000000000";
	  RF_WrData_sel <= '1';
	  RF_B_sel <= '0';
	  wait for Clk_period*2;
	  
	  Instr <= "100000" & "00001" & "10000" & "00000" & "00000" & "000000"; --(31-26 & 25-21 & 20-26 & 15-11)
	  RF_WrEn <= '0';
	  ALU_out <= "00000000000000000000000000000011";
	  MEM_out <= "00000000000000000000000000000000";
	  RF_WrData_sel <= '1';
	  RF_B_sel <= '0';
	  wait for Clk_period*2;
	  
	  Instr <= "110010" & "00001" & "00000" & "10000" & "00100" & "000110"; --(31-26 & 25-21 & 20-26 & 15-11)
	  RF_WrEn <= '1';
	  ALU_out <= "00000000000000000000000000000011";
	  MEM_out <= "00000000000000000000000000000000";
	  RF_WrData_sel <= '0';
	  RF_B_sel <= '0';
	  --nandi
	  wait for Clk_period*2;
	  
	  Instr <= "111001" & "00001" & "10000" & "10000" & "00011" & "000011"; --(31-26 & 25-21 & 20-26 & 15-11)
	  RF_WrEn <= '0';
	  ALU_out <= "00000000000000000000000000000000";
	  MEM_out <= "00000000000000000000000000000000";
	  RF_WrData_sel <= '0';
	  RF_B_sel <= '1';
	  --lui
	  wait for Clk_period*2;
	  
	  Instr <= "111000" & "00000" & "00011" & "10000" & "11111" & "000000"; --(31-26 & 25-21 & 20-26 & 15-11)
	  RF_WrEn <= '1';
	  ALU_out <= "00000000000000000000000000000000";
	  MEM_out <= "00000000000000000000000000000011";
	  RF_WrData_sel <= '1';
	  RF_B_sel <= '0';
	  --li
	  wait for Clk_period*2;
	  
	  Instr <= "000000" & "00000" & "00011" & "00011" & "00000" & "000000"; --(31-26 & 25-21 & 20-26 & 15-11)
	  RF_WrEn <= '0';
	  ALU_out <= "00000000000000000000000000000000";
	  MEM_out <= "00000000000000000000000000000011";
	  RF_WrData_sel <= '1';
	  RF_B_sel <= '0';
	  --beq
	  wait for Clk_period*2;
      wait;
   end process;

END;
