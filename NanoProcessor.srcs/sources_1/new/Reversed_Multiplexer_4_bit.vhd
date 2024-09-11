----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2024 01:38:56 PM
-- Design Name: 
-- Module Name: Reversed_Multiplexer_4_bit - Behavioral
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


entity Reversed_Multiplexer_4_bit is
    Port ( Sel : in std_logic;
           Input : in std_logic_vector(3 downto 0);
           Output_0 : out std_logic_vector(3 downto 0);
           Output_1 : out std_logic_vector(3 downto 0));
end Reversed_Multiplexer_4_bit;

architecture Behavioral of Reversed_Multiplexer_4_bit is

    component Tri_State_Buffer_4_bit is
        Port ( C_in : in STD_LOGIC_VECTOR(3 downto 0);
               C_out : out STD_LOGIC_VECTOR(3 downto 0);
               En : in STD_LOGIC);
    end component;

    signal Buffer_Output_0, Buffer_Output_1 : std_logic_vector(3 downto 0);
    signal Not_Sel : std_logic;

begin
    
    Buffer_0: Tri_State_Buffer_4_bit port map (
        C_in => Input,
        C_out => Buffer_Output_0,
        En => Not_Sel
    );

    Buffer_1: Tri_State_Buffer_4_bit port map (
        C_in => Input,
        C_out => Buffer_Output_1,
        En => Sel
    );

    Not_Sel <= NOT Sel;
    
    Output_0 <= Buffer_Output_0;
    Output_1 <= Buffer_Output_1;


end Behavioral;




