----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 05:38:43 PM
-- Design Name: 
-- Module Name: Multiplexer_8_way_4_bit - Behavioral
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

entity Multiplexer_8_way_4_bit is
    Port ( Register_Select : in STD_LOGIC_VECTOR (2 downto 0);
           Register_0_output : in STD_LOGIC_VECTOR (3 downto 0);
           Register_1_output : in STD_LOGIC_VECTOR (3 downto 0);
           Register_2_output : in STD_LOGIC_VECTOR (3 downto 0);
           Register_3_output : in STD_LOGIC_VECTOR (3 downto 0);
           Register_4_output : in STD_LOGIC_VECTOR (3 downto 0);
           Register_5_output : in STD_LOGIC_VECTOR (3 downto 0);
           Register_6_output : in STD_LOGIC_VECTOR (3 downto 0);
           Register_7_output : in STD_LOGIC_VECTOR (3 downto 0);
           Multiplexer_8_way_4_bit_output : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplexer_8_way_4_bit;

architecture Behavioral of Multiplexer_8_way_4_bit is
   COMPONENT Mux_8_to_1 
       PORT(  S : in STD_LOGIC_VECTOR (2 downto 0);
              D : in STD_LOGIC_VECTOR (7 downto 0);
              EN : in STD_LOGIC;
              Y : out STD_LOGIC);
    END COMPONENT;
    
    signal Mux_8_to_1_out : std_logic_vector(3 downto 0) ;

begin
     Mux_8_to_1_0 :  Mux_8_to_1
     port map(
            S => Register_Select,
            D(0) => Register_0_output(0),
            D(1) => Register_1_output(0),
            D(2) => Register_2_output(0),
            D(3) => Register_3_output(0),
            D(4) => Register_4_output(0),
            D(5) => Register_5_output(0),
            D(6) => Register_6_output(0),
            D(7) => Register_7_output(0),
            EN => '1',
            Y => Mux_8_to_1_out(0)
     );
     Mux_8_to_1_1 :  Mux_8_to_1
          port map(
                 S => Register_Select,
                 D(0) => Register_0_output(1),
                 D(1) => Register_1_output(1),
                 D(2) => Register_2_output(1),
                 D(3) => Register_3_output(1),
                 D(4) => Register_4_output(1),
                 D(5) => Register_5_output(1),
                 D(6) => Register_6_output(1),
                 D(7) => Register_7_output(1),
                 EN => '1',
                 Y => Mux_8_to_1_out(1)
          );
     Mux_8_to_1_2 :  Mux_8_to_1
               port map(
                      S => Register_Select,
                      D(0) => Register_0_output(2),
                      D(1) => Register_1_output(2),
                      D(2) => Register_2_output(2),
                      D(3) => Register_3_output(2),
                      D(4) => Register_4_output(2),
                      D(5) => Register_5_output(2),
                      D(6) => Register_6_output(2),
                      D(7) => Register_7_output(2),
                      EN => '1',
                      Y => Mux_8_to_1_out(2)
               );     
     Mux_8_to_1_3 :  Mux_8_to_1
                    port map(
                           S => Register_Select,
                           D(0) => Register_0_output(3),
                           D(1) => Register_1_output(3),
                           D(2) => Register_2_output(3),
                           D(3) => Register_3_output(3),
                           D(4) => Register_4_output(3),
                           D(5) => Register_5_output(3),
                           D(6) => Register_6_output(3),
                           D(7) => Register_7_output(3),
                           EN => '1',
                           Y => Mux_8_to_1_out(3)
                    ); 
                    
       Multiplexer_8_way_4_bit_output <= Mux_8_to_1_out;             

end Behavioral;
