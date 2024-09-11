----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 09:16:22 PM
-- Design Name: 
-- Module Name: MUX_2_way_4_bit - Behavioral
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

entity MUX_2_way_4_bit is
Port ( Input_A : in STD_LOGIC_VECTOR (3 downto 0);
       Input_B : in STD_LOGIC_VECTOR (3 downto 0);
       Sel : in STD_LOGIC;
       Output : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_2_way_4_bit;

architecture Behavioral of MUX_2_way_4_bit is

component Tri_State_Buffer_4_bit is
    Port ( C_in : in STD_LOGIC_VECTOR(3 downto 0);
           C_out : out STD_LOGIC_VECTOR(3 downto 0);
           En : in STD_LOGIC);
end component;

signal Buffer_Out_0, Buffer_Out_1 : STD_LOGIC_VECTOR (3 downto 0);
signal Not_Sel : STD_LOGIC;

begin

        Buffer_0: Tri_State_Buffer_4_bit port map (
            C_in => Input_A,
            C_out => Buffer_Out_0,
            En => Sel
        );

        Buffer_1: Tri_State_Buffer_4_bit port map (
            C_in => Input_B,
            C_out => Buffer_Out_1,
            En => Not_Sel
        );

    Not_Sel <= NOT Sel;
    Output <= Buffer_Out_0 or Buffer_Out_1;


end Behavioral;
