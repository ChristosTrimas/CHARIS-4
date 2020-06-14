----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:39:17 03/29/2019 
-- Design Name: 
-- Module Name:    CONTROL - Behavioral 
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

entity CONTROL is
    Port ( RESET : in STD_LOGIC;
			  Clk : in STD_LOGIC;
			  PC_Sel : out STD_LOGIC;
			  PC_LdEn : out  STD_LOGIC;
			  RF_B_sel : out STD_LOGIC;
			  RF_WrData_sel : out STD_LOGIC;
			  ImmExt : out STD_LOGIC;
			  ALU_Bin_sel : out STD_LOGIC;
			  RF_Wr_en : out STD_LOGIC;
			  ALU_func : out STD_LOGIC_VECTOR(3 downto 0);
			  MEM_Wr_En : out STD_LOGIC;
			  PC_Reset : out STD_LOGIC;
			  DECREG_EN_1 : out STD_LOGIC;
			  DECREG_EN_2 : out STD_LOGIC;
			  DECREG_EN_3 : out STD_LOGIC;
			  --IFREG_EN_1 : out STD_LOGIC;
			  ALUREG_EN : out STD_LOGIC;
			  Inst : in STD_LOGIC_VECTOR(31 downto 0);
			  ZERO : in STD_LOGIC);
end CONTROL;

architecture Behavioral of CONTROL is

type state is (NOTHING,RESETST,INSTRUCT,FINAL,RTYPE_1,RTYPE_2,RTYPE_3,LI,LUI,ADDI_1,ADDI_2,ADDI_3,NANDI_1,NANDI_2,NANDI_3,ORI_1,ORI_2,ORI_3,B_1,B_2,BEQ_1,BEQ_2,BNE_1,BNE_2,
LB_1,LB_2,LB_3,LB_4,LB_5,LW_1,LW_2,LW_3,LW_4,LW_5,SW_1,SW_2,SW_3,SW_4);

signal current,nexts : STATE;

begin

process(current,Inst,ZERO)
	begin 
		case current is 
		
			WHEN RESETST =>		PC_Sel <= '0';
										PC_LdEn <= '0';
										RF_B_sel <= '0';
										PC_Reset <= '1';
										RF_WrData_sel <= '0';
										ImmExt <= '0';
										ALU_Bin_sel <= '0';
										RF_Wr_en <= '0';
										ALU_func <= "0000";
										MEM_Wr_En <= '0';
										DECREG_EN_1 <= '0';
										DECREG_EN_2 <= '0';
										DECREG_EN_3 <= '0';
										ALUREG_EN <= '0';
										nexts <= INSTRUCT;
										
			WHEN FINAL =>			PC_LdEn <= '0';
										RF_Wr_en <= '0';
										ImmExt <= '0';
										nexts <= INSTRUCT;
										
			WHEN INSTRUCT => 		PC_Reset <= '0';
										PC_Sel <= '0';
										DECREG_EN_1 <= '1';
										DECREG_EN_2 <= '1';
										DECREG_EN_3 <= '1';
										ALUREG_EN <= '1';
										RF_Wr_en <= '0';
										MEM_Wr_En <= '0';
										
										IF(Inst <= "0000000000000000000000000000000") THEN --NOTHINH
											nexts <= NOTHING;
										ELSIF(Inst(31 downto 26) = "100000") THEN --RTYPE INSTRUCTIONS
											nexts <= RTYPE_1;
										ELSIF(Inst(31 downto 26) = "111001") THEN --LOAD UPPER IMMEDIATE
											nexts <= LUI;
										ELSIF(Inst(31 downto 26) = "111000") THEN --LOAD IMMEDIATE
											nexts <= LI;
										ELSIF(Inst(31 downto 26) = "110000") THEN --ADDI
											nexts <= ADDI_1;
										ELSIF(Inst(31 downto 26) = "110010") THEN --NANDI
											nexts <= NANDI_1;
										ELSIF(Inst(31 downto 26) = "110011") THEN --ORI
											nexts <= ORI_1;
										ELSIF(Inst(31 downto 26) = "111111") THEN --BRANCH
											nexts <= B_1;
										ELSIF(Inst(31 downto 26) = "000000") THEN --BRANCH NOT EQUAL 
											nexts <= BEQ_1;
										ELSIF(Inst(31 downto 26) = "000001") THEN --BRANCH EQUAL 
											nexts <= BNE_1;
										ELSIF(Inst(31 downto 26) = "000011") THEN --LOAD BYTE
											nexts <= LB_1;
										ELSIF(Inst(31 downto 26) = "001111") THEN --LOAD WORD
											nexts <= LW_1;
										ELSIF(Inst(31 downto 26) = "011111") THEN --STORE WORD
											nexts <= SW_1; 
											--interrupts
										END IF;
										
		WHEN NOTHING =>			RF_Wr_En <= '0';
										MEM_Wr_En <= '0';
										PC_LdEn <= '1';
										ImmExt <= '0';
										PC_Sel <= '0';
										nexts <= FINAL;
										
--====================================RTYPE INSTRUCTIONS====================================================--

		WHEN RTYPE_1 =>			RF_B_sel <= '0';
										ImmExt <= '0';
										nexts <= RTYPE_2;
										
		WHEN RTYPE_2 => 			nexts <= RTYPE_3;
		
		WHEN RTYPE_3 => 			ALU_Bin_sel <= '0';
										PC_LdEn <= '1';
										RF_WrData_sel <= '1';
										RF_Wr_En <= '1';
										
										IF(Inst(5 downto 0) = "110000") THEN --ADD
											ALU_func <= "0000";
										ELSIF(Inst(5 downto 0) = "110001") THEN --SUB
											ALU_func <= "0001";
										ELSIF(Inst(5 downto 0) = "110010") THEN --AND
											ALU_func <= "0010";
										ELSIF(Inst(5 downto 0) = "110011") THEN --OR
											ALU_func <= "0011";
										ELSIF(Inst(5 downto 0) = "110100") THEN --NOT
											ALU_func <= "0100";
										ELSIF(Inst(5 downto 0) = "110110") THEN --NAND
											ALU_func <= "0110";
										ELSIF(Inst(5 downto 0) = "110111") THEN --NOR
											ALU_func <= "0111";
										ELSIF(Inst(5 downto 0) = "111000") THEN --SRA
											ALU_func <= "1000";
										ELSIF(Inst(5 downto 0) = "111001") THEN --SRL
											ALU_func <= "1001";
										ELSIF(Inst(5 downto 0) = "111010") THEN --SLL
											ALU_func <= "1010";
										ELSIF(Inst(5 downto 0) = "111100") THEN --LEFT CYCLE ROTATE
											ALU_func <= "1100";
										ELSIF(Inst(5 downto 0) = "111101") THEN --RIGHT CYCLE ROTATE
											ALU_func <= "1101";
										END IF;
										
										nexts <= FINAL;
										
--====================================RTYPE INSTRUCTIONS END================================================--

--====================================LOAD IMMEDIATE INSTRUCTION============================================--

		WHEN LI =>					PC_LdEn <= '1';
										RF_Wr_En <= '1';
										ImmExt <= '1';
										RF_B_sel <= '1';
										nexts <= FINAL;
										
--====================================LOAD IMMEDIATE INSTRUCTION END========================================--

--====================================LOAD UPPER IMMEDIATE INSTRUCTION======================================--

		WHEN LUI => 				PC_LdEn <= '1';
										RF_Wr_En <= '1';
										ImmExt <= '1';
										RF_B_sel <= '1';
										nexts <= FINAL;
										
--====================================LOAD UPPER IMMEDIATE INSTRUCTION END==================================--

--====================================ADDI INSTRUCTION======================================================--

		WHEN ADDI_1 =>				PC_LdEn <= '0';
										RF_B_sel <= '1';
										RF_WrData_sel <= '1';
										ImmExt <= '1';
										RF_Wr_En <= '0';
										nexts <= ADDI_2;
										
		WHEN ADDI_2 =>				nexts <= ADDI_3;
		
		WHEN ADDI_3 =>				PC_LdEn <= '1';
										ALU_Bin_sel <= '1';
										ALU_func <= "0000";
										RF_Wr_En <= '1';
										nexts <= FINAL;
										
--====================================ADDI INSTRUCTION END==================================================--

--====================================NANDI INSTRUCTION=====================================================--
		
		WHEN NANDI_1 =>			PC_LdEn <= '0';
										ImmExt <= '1';
										RF_B_sel <= '1';
										RF_WrData_sel <= '1';--
										RF_Wr_En <= '0';
										nexts <= NANDI_2;
										
		WHEN NANDI_2 =>			nexts <= NANDI_3;
		
		WHEN NANDI_3 => 			PC_LdEn <= '1';
										ALU_Bin_sel <= '1';
										ALU_func <= "0110";
										RF_Wr_En <= '1';
										nexts <= FINAL;
										
--====================================NANDI INSTRUCTION END==================================================--

--======================================ORI INSTRUCTION======================================================--

		WHEN ORI_1 =>				PC_LdEn <= '0';
										RF_B_sel <= '1';
										RF_WrData_sel <= '1';--
										ImmExt <= '1';
										RF_Wr_En <= '0';
										nexts <= ORI_2;
										
		WHEN ORI_2 => 				nexts <= ORI_3;
		
		WHEN ORI_3 => 				PC_LdEn <= '1';
										ALU_Bin_sel <= '1';
										ALU_func <= "0011";
										RF_Wr_En <= '1';
										nexts <= FINAL;
										
--======================================ORI INSTRUCTION END==================================================--

--======================================BRANCH INSTRUCTION===================================================--

		WHEN B_1 =>					ImmExt <= '1';
										nexts <= B_2;
		
		WHEN B_2 =>					PC_LdEn <= '1';
										PC_sel <= '1';
										RF_Wr_En <= '0';
										nexts <= FINAL;
										
--======================================BRANCH INSTRUCTION END===============================================--

--======================================BRANCH EQUAL INSTRUCTION=============================================--

		WHEN BEQ_1 =>				RF_B_sel <= '1';
										RF_Wr_En <= '0';
										PC_LdEn <= '0';
										nexts <= BEQ_2;
										
		WHEN BEQ_2 =>				DECREG_EN_1 <= '0';
										DECREG_EN_2 <= '0';
										DECREG_EN_3 <= '0';
										
										IF(ZERO = '1') THEN 
											nexts <= B_1;
										ELSE
											nexts <= NOTHING;
										END IF;
										
--======================================BRANCH EQUAL INSTRUCTION END=========================================--

--======================================BRANCH NOT EQUAL INSTRUCTION=========================================--

		WHEN BNE_1 =>				RF_B_sel <= '1';
										RF_Wr_En <= '0';
										PC_LdEn <= '0';
										nexts <= BNE_2;
										
		WHEN BNE_2 =>				DECREG_EN_1 <= '0';
										DECREG_EN_2 <= '0';
										DECREG_EN_3 <= '0';
										
										IF(ZERO = '0') THEN 
											nexts <= B_1;
										ELSE
											nexts <= NOTHING;
										END IF;
										
--======================================BRANCH NOT EQUAL INSTRUCTION END=====================================--

--======================================LOAD BYTE INSTRUCTION================================================--

		WHEN LB_1 =>				RF_Wr_En <= '0';
										PC_LdEn <= '0';
										ImmExt <= '1';
										nexts <= LB_2;
										
		WHEN LB_2 =>				nexts <= LB_3;
		
		WHEN LB_3 =>				ALU_Bin_sel <= '1';
										ALU_func <= "0000";
										nexts <= LB_4;
										
		WHEN LB_4 =>				MEM_Wr_En <= '0';
										nexts <= LB_5;
										
		WHEN LB_5 =>				PC_LdEn <= '1';
										RF_Wr_En <= '1';
										nexts <= FINAL;
										
--======================================LOAD BYTE INSTRUCTION END============================================--

--======================================STORE WORD INSTRUCTION===============================================--

		WHEN SW_1 =>				RF_Wr_En <= '0';
										RF_B_sel <= '1';
										ImmExt <= '1';
										PC_LdEn <= '0';
										nexts <= SW_2;
										
		WHEN SW_2 => 				nexts <= SW_3;
		
		WHEN SW_3 =>				ALU_Bin_sel <= '1';
										ALU_func <= "0000";
										nexts <= SW_4;
										
		WHEN SW_4 => 				PC_LdEn <= '1';
										MEM_Wr_En <= '1';
										nexts <= FINAL;
										
--======================================STORE WORD INSTRUCTION END===========================================--

--======================================LOAD WORD INSTRUCTION================================================--

		WHEN LW_1 =>				RF_Wr_En <= '0';
										PC_LdEn <= '0';
										ImmExt <= '1';
										nexts <= LW_2;
										
		WHEN LW_2 =>				nexts <= LW_3;
		
		WHEN LW_3 =>				ALU_Bin_sel <= '1';
										ALU_func <= "0000";
										nexts <= LW_4;
										
		WHEN LW_4 => 				MEM_Wr_En <= '0';
										nexts <= LW_5;
										
		WHEN LW_5 =>				PC_LdEn <= '1';
										RF_Wr_En <= '1';
										RF_WrData_sel <= '0';
										nexts <= FINAL;
										
--======================================LOAD WORD INSTRUCTION END============================================--

		WHEN OTHERS =>				PC_LdEn <= '1';
										ImmExt <= '0';
										nexts <= FINAL;
		end case;
end process;

--======================================RESET OR INSTRUCTION=================================================--


process(Clk,Reset)
	BEGIN
		IF(Reset = '1') THEN 
			current <= RESETST;
		ELSIF(RISING_EDGE(Clk)) THEN 
			current <= nexts;
		END IF;
end process;

end Behavioral;

