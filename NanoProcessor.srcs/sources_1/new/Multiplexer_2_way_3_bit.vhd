----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 11:54:05 PM
-- Design Name: 
-- Module Name: Multiplexer_2_way_3_bit - Behavioral
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

entity Multiplexer_2_way_3_bit is
    Port ( Adder_3_bit_input : in STD_LOGIC_VECTOR (2 downto 0);
           Address_to_jump : in STD_LOGIC_VECTOR (2 downto 0);
           Jump_Flag : in STD_LOGIC;
           Mux_2_way_3_bit_output : out STD_LOGIC_VECTOR (2 downto 0));
end Multiplexer_2_way_3_bit;

architecture Behavioral of Multiplexer_2_way_3_bit is

begin
 
Mux_2_way_3_bit_output(0) <=  (Jump_Flag AND Address_to_jump(0)) OR ( NOT(Jump_Flag) AND Adder_3_bit_input(0) );
Mux_2_way_3_bit_output(1) <=  (Jump_Flag AND Address_to_jump(1)) OR ( NOT(Jump_Flag) AND Adder_3_bit_input(1) );
Mux_2_way_3_bit_output(2) <=  (Jump_Flag AND Address_to_jump(2)) OR ( NOT(Jump_Flag) AND Adder_3_bit_input(2) );

end Behavioral;
