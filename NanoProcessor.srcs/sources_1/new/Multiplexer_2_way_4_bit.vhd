----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 04:47:32 PM
-- Design Name: 
-- Module Name: Multiplexer_2_way_ 4_bit - Behavioral
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

entity Multiplexer_2_way_4_bit is
    Port ( Immediate_value_from_ID : in STD_LOGIC_VECTOR (3 downto 0);
           Output_of_4_bit_Add_Sub_Unit : in STD_LOGIC_VECTOR (3 downto 0);
           Load_select : in STD_LOGIC;
           Multiplexer_2_way_4_bit_output : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplexer_2_way_4_bit;

architecture Behavioral of Multiplexer_2_way_4_bit is
   

begin
Multiplexer_2_way_4_bit_output(0) <=  (Load_select AND Immediate_value_from_ID(0)) OR ( NOT(Load_select) AND Output_of_4_bit_Add_Sub_Unit(0) );
Multiplexer_2_way_4_bit_output(1) <=  (Load_select AND Immediate_value_from_ID(1)) OR ( NOT(Load_select) AND Output_of_4_bit_Add_Sub_Unit(1) );
Multiplexer_2_way_4_bit_output(2) <=  (Load_select AND Immediate_value_from_ID(2)) OR ( NOT(Load_select) AND Output_of_4_bit_Add_Sub_Unit(2) );
Multiplexer_2_way_4_bit_output(3) <=  (Load_select AND Immediate_value_from_ID(3)) OR ( NOT(Load_select) AND Output_of_4_bit_Add_Sub_Unit(3) );

end Behavioral;
