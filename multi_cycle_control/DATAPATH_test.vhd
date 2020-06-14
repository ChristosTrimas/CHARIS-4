--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:48:57 03/17/2019
-- Design Name:   
-- Module Name:   C:/Users/mugino/Desktop/giakomis/2/HRY_312_2019/lab_01/Datapath_test.vhd
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
 
ENTITY Datapath_test IS
END Datapath_test;
 
ARCHITECTURE behavior OF Datapath_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DATAPATH
    PORT(
         PC_Sel : IN  std_logic;
         Clk : IN  std_logic;
         PC_LdEn : IN  std_logic;
         RF_B_sel : IN  std_logic;
         Reset : IN  std_logic;
         RF_WrData_sel : IN  std_logic;
         ImmExt : IN  std_logic;
         ALU_Bin_sel : IN  std_logic;
         RF_Wr_en : IN  std_logic;
         ALU_func : IN  std_logic_vector(3 downto 0);
         MEM_Wr_En : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal PC_Sel : std_logic := '0';
   signal Clk : std_logic := '0';
   signal PC_LdEn : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
   signal Reset : std_logic := '0';
   signal RF_WrData_sel : std_logic := '0';
   signal ImmExt : std_logic := '0';
   signal ALU_Bin_sel : std_logic := '0';
   signal RF_Wr_en : std_logic := '0';
   signal ALU_func : std_logic_vector(3 downto 0) := (others => '0');
   signal MEM_Wr_En : std_logic := '0';

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DATAPATH PORT MAP (
          PC_Sel => PC_Sel,
          Clk => Clk,
          PC_LdEn => PC_LdEn,
          RF_B_sel => RF_B_sel,
          Reset => Reset,
          RF_WrData_sel => RF_WrData_sel,
          ImmExt => ImmExt,
          ALU_Bin_sel => ALU_Bin_sel,
          RF_Wr_en => RF_Wr_en,
          ALU_func => ALU_func,
          MEM_Wr_En => MEM_Wr_En
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
      -- hold reset state for 100 ns.
		Reset <= '1';
		wait for Clk_period;
		Reset <= '0';
--		addi r5,r0,8
		
		PC_Sel <= '0';
		PC_LdEn <= '1';
		RF_B_sel <= '0';
		RF_WrData_sel <= '1';
		ImmExt <= '1';
		ALU_Bin_sel <= '1';
		RF_Wr_en <= '1';
		ALU_func <= "0000";
		MEM_Wr_En <= '0';
		wait for Clk_period;
		
		--ori r3,r0,0xABCD
		PC_Sel <= '0';
		PC_LdEn <= '1';
		RF_B_sel <= '0';
		RF_WrData_sel <= '1';
		ImmExt <= '0';
		ALU_Bin_sel <= '1';
		RF_Wr_en <= '1';
		ALU_func <= "0011";
		MEM_Wr_En <= '0';
		wait for Clk_period;
		
		--sw r3,4(r0)
		PC_Sel <= '0';
		PC_LdEn <= '1';
		RF_B_sel <= '1';
		RF_WrData_sel <= '1';
		ImmExt <= '1';
		ALU_Bin_sel <= '1';
		RF_Wr_en <= '0';
		ALU_func <= "0000";
		MEM_Wr_En <= '1';
		wait for Clk_period;
		
		--lw r10, -4(r5)
		PC_Sel <= '0';
		PC_LdEn <= '1';
		RF_B_sel <= '0';
		RF_WrData_sel <= '0';
		ImmExt <= '1';
		ALU_Bin_sel <= '1';
		RF_Wr_en <= '1';
		ALU_func <= "0000";
		MEM_Wr_En <= '0';
		wait for Clk_period;
		
		--lb r16, 4(r0)
		PC_Sel <= '0';
		PC_LdEn <= '1';
		RF_B_sel <= '0';
		RF_WrData_sel <= '0';
		ImmExt <= '1';
		ALU_Bin_sel <= '1';
		RF_Wr_en <= '1';
		ALU_func <= "0000";
		MEM_Wr_En <= '0';
		wait for Clk_period;
		
		--nand r4,r10,r16
		PC_Sel <= '0';
		PC_LdEn <= '1';
		RF_B_sel <= '0';
		RF_WrData_sel <= '1';
		ImmExt <= '0';
		ALU_Bin_sel <= '0';
		RF_Wr_en <= '1';
		ALU_func <= "0110";
		MEM_Wr_En <= '0';
		wait for Clk_period;
		
--		--bne r5,r5,8
--		PC_Sel <= '0';
--		PC_LdEn <= '1';
--		RF_B_sel <= '0';
--		RF_WrData_sel <= '1';
--		ImmExt <= '1';
--		ALU_Bin_sel <= '1';
--		RF_Wr_en <= '0';
--		ALU_func <= "0000";
--		MEM_Wr_En <= '0';
--		wait for Clk_period;
--		
--		-- b -2
--		PC_Sel <= '1';
--		PC_LdEn <= '1';
--		RF_B_sel <= '0';
--		RF_WrData_sel <= '1';
--		ImmExt <= '1';
--		ALU_Bin_sel <= '1';
--		RF_Wr_en <= '0';
--		ALU_func <= "0000";
--		MEM_Wr_En <= '0';
--		wait for Clk_period;
--		
----		--addi r0,r0,0
--		PC_Sel <= '0';
--		PC_LdEn <= '1';
--		RF_B_sel <= '0';
--		RF_WrData_sel <= '1';
--		ImmExt <= '1';
--		ALU_Bin_sel <= '1';
--		RF_Wr_en <= '0';
--		ALU_func <= "0000";
--		MEM_Wr_En <= '0';
--		wait for Clk_period;
--		
--		-- b -2
--		PC_Sel <= '1';
--		PC_LdEn <= '1';
--		RF_B_sel <= '0';
--		RF_WrData_sel <= '1';
--		ImmExt <= '1';
--		ALU_Bin_sel <= '1';
--		RF_Wr_en <= '0';
--		ALU_func <= "0000";
--		MEM_Wr_En <= '0';
--		wait for Clk_period;
		

      -- insert stimulus here 

      wait;
   end process;

END;
