----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 03:25:05 PM
-- Design Name: 
-- Module Name: TB_Multiplexer_2_way_3_bit - Behavioral
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

entity TB_Multiplexer_2_way_3_bit is
--  Port ( );
end TB_Multiplexer_2_way_3_bit;

architecture Behavioral of TB_Multiplexer_2_way_3_bit is
    COMPONENT Multiplexer_2_way_3_bit
     Port ( Adder_3_bit_input : in STD_LOGIC_VECTOR (2 downto 0);
            Address_to_jump : in STD_LOGIC_VECTOR (2 downto 0);
            Jump_Flag : in STD_LOGIC;
            Mux_2_way_3_bit_output : out STD_LOGIC_VECTOR (2 downto 0));
   end COMPONENT; 
   
   signal Adder_3_bit_input , Address_to_jump , Mux_2_way_3_bit_output : std_logic_vector(2 downto 0);
   signal Jump_Flag : std_logic;

begin
    UUT : Multiplexer_2_way_3_bit
    PORT MAP (  Adder_3_bit_input =>  Adder_3_bit_input,
                Address_to_jump => Address_to_jump,
                Jump_Flag => Jump_Flag,
                Mux_2_way_3_bit_output => Mux_2_way_3_bit_output );
                
     process
     begin
     Jump_Flag <= '1';             
                
     Adder_3_bit_input(0) <= '0';
     Adder_3_bit_input(1) <= '0';
     Adder_3_bit_input(2) <= '1'; 
     
     Address_to_jump(0) <= '0';
     Address_to_jump(1) <= '1';
     Address_to_jump(2) <= '0';  
     wait for 100 ns;
     
     Jump_Flag <= '0';             
                     
          Adder_3_bit_input(0) <= '0';
          Adder_3_bit_input(1) <= '0';
          Adder_3_bit_input(2) <= '1'; 
          
          Address_to_jump(0) <= '0';
          Address_to_jump(1) <= '1';
          Address_to_jump(2) <= '0';  
          wait for 100 ns;   
          
    end process;            


end Behavioral;
