----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 06:35:47 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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



entity Instruction_Decoder is
    Port ( Instruction_Bus : in STD_LOGIC_VECTOR (12 downto 0);
           Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Immediate_Value : out STD_LOGIC_VECTOR (3 downto 0);
           Load_Select : out STD_LOGIC;
           MUL_RCA_Select : out STD_LOGIC;
           Add_Sub_Select : out STD_LOGIC;
           Comparator_Select : out STD_LOGIC;
           Reg_Sel_MUX_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_MUX_B : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0);
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;
    
architecture Behavioral of Instruction_Decoder is

    component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    signal ADD, NEG, MOVI, JZR, MUL, COM, DOUB, SUB : std_logic;

begin

    Decoder_3_to_8_0 : Decoder_3_to_8 port map(
        I => Instruction_Bus(12 downto 10),
        EN => '1',
        Y(0) => ADD,
        Y(1) => NEG,
        Y(2) => MOVI,
        Y(3) => JZR, 
        Y(4) => MUL,
        Y(5) => COM,
        Y(6) => DOUB,
        Y(7) => SUB);
        

    process(Instruction_Bus, NEG, DOUB)
    begin
        if NEG = '1' then
            Reg_Sel_MUX_A <= Instruction_Bus(6 downto 4);
            Reg_Sel_MUX_B <= Instruction_Bus(9 downto 7);
        elsif DOUB = '1' then
            Reg_Sel_MUX_A <= Instruction_Bus(9 downto 7);
            Reg_Sel_MUX_B <= Instruction_Bus(9 downto 7);
        else
            Reg_Sel_MUX_A <= Instruction_Bus(9 downto 7);
            Reg_Sel_MUX_B <= Instruction_Bus(6 downto 4);
        end if;
    end process;
    
    process(Instruction_Bus, COM)
    begin
        if COM = '1' then
            Reg_Enable <= "000";
        else
            Reg_Enable <= Instruction_Bus(9 downto 7);
        end if;
    end process;

       
    Load_Select <= MOVI;
    MUL_RCA_Select <= MUL;
    Add_Sub_Select <= NEG OR SUB;
    Comparator_Select <= COM;
    Immediate_Value <= Instruction_Bus(3 downto 0);
    Jump_Flag <= JZR AND (NOT (Jump_Check(0) OR Jump_Check(1) OR Jump_Check(2) OR Jump_Check(3)));
    Jump_Address <= Instruction_Bus(2 downto 0);
    
end Behavioral;
