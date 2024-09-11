----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 08:03:24 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

    component Instruction_Decoder 
    Port ( Instruction_Bus : in STD_LOGIC_VECTOR (11 downto 0);
           Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Immediate_Value : out STD_LOGIC_VECTOR (3 downto 0);
           Load_Select : out STD_LOGIC;
           Add_Sub_Select : out STD_LOGIC;
           Reg_Sel_MUX_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_MUX_B : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0);
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
    end component;    
    
    signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);
    signal Jump_Check, Immediate_Value : STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_Sel_MUX_A, Reg_Sel_MUX_B, Reg_Enable, Jump_Address : STD_LOGIC_VECTOR (2 downto 0);
    signal Load_Select, Add_Sub_Select, Jump_Flag : STD_LOGIC;
    
begin

    UUT : Instruction_Decoder Port Map (
        Instruction_Bus => Instruction_Bus,
        Jump_Check => Jump_Check,
        Immediate_Value => Immediate_Value,
        Load_Select => Load_Select,
        Add_Sub_Select => Add_Sub_Select,
        Reg_Sel_MUX_A => Reg_Sel_MUX_A,
        Reg_Sel_MUX_B => Reg_Sel_MUX_B,
        Reg_Enable => Reg_Enable,
        Jump_Flag => Jump_Flag,
        Jump_Address => Jump_Address );
        
        
process
    begin
        Jump_Check <= "1000";
        Instruction_Bus <= "100010001010";
        wait for 100ns;
        
        Jump_Check <= "1100";
        Instruction_Bus <= "100100000001";
        wait for 100ns;
        
        Jump_Check <= "1111";
        Instruction_Bus <= "010100000000";
        wait for 100ns;
        
        Jump_Check <= "0000";
        Instruction_Bus <= "000010100000";
        wait for 100ns;
        
        Jump_Check <= "0010";
        Instruction_Bus <= "110010000111";
        wait for 100ns;
        
        Jump_Check <= "0000";
        Instruction_Bus <= "110000000011";
        wait for 100ns;
        
end process;

end Behavioral;
