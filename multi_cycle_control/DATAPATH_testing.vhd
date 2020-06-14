--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:28:15 03/15/2019
-- Design Name:   
-- Module Name:   C:/Users/mugino/Desktop/giakomis/2/HRY_312_2019/lab_01/DATAPATH_testing.vhd
-- Project Name:  lab_01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DATAPATH
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
 
ENTITY DATAPATH_testing IS
END DATAPATH_testing;
 
ARCHITECTURE behavior OF DATAPATH_testing IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DATAPATH
    PORT(
         Clk : IN  std_logic;
         PC_sel : IN  std_logic;
         PC_LDEn : IN  std_logic;
         RF_B_sel : IN  std_logic;
         RF_WrData_sel : IN  std_logic;
         ImmExt : IN  std_logic;
         ALU_Bin_sel : IN  std_logic;
         Rf_Wr_en : IN  std_logic;
         ALU_func : IN  std_logic_vector(3 downto 0);
         MEM_Wr_En : IN  std_logic;
         Reset : IN  std_logic;
         Instr : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal PC_sel : std_logic := '0';
   signal PC_LDEn : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
   signal RF_WrData_sel : std_logic := '0';
   signal ImmExt : std_logic := '0';
   signal ALU_Bin_sel : std_logic := '0';
   signal Rf_Wr_en : std_logic := '0';
   signal ALU_func : std_logic_vector(3 downto 0) := (others => '0');
   signal MEM_Wr_En : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Instr : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DATAPATH PORT MAP (
          Clk => Clk,
          PC_sel => PC_sel,
          PC_LDEn => PC_LDEn,
          RF_B_sel => RF_B_sel,
          RF_WrData_sel => RF_WrData_sel,
          ImmExt => ImmExt,
          ALU_Bin_sel => ALU_Bin_sel,
          Rf_Wr_en => Rf_Wr_en,
          ALU_func => ALU_func,
          MEM_Wr_En => MEM_Wr_En,
          Reset => Reset,
          Instr => Instr
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
      Reset <= '1';
      wait for Clk_period*2;
		
		PC_sel <= '0';
		PC_LDEn <= '1';
		Reset <= '0';
		
		 -- addi r5,r0,8

		PC_sel <='0'; 
		PC_LDEn<='1'; 
		RF_Wr_en <='1';
		RF_WrData_sel <='0'; --Alu out 
		RF_B_sel  <='0';
		ImmExt <='1';  -- SIGN EXT
		ALU_Bin_sel <='1';  --Immed
		ALU_func <="0000"; --add			
		Mem_Wr_En  <='0';

		wait for Clk_period*2;

      -- insert stimulus here 

      wait;
   end process;

END;
