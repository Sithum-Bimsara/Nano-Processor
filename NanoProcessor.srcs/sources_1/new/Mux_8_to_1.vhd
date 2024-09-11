----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 12:54:36 AM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
    COMPONENT Decoder_3_to_8
        port(
        I : in STD_LOGIC_VECTOR;
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR );
     END COMPONENT;
     
     signal TEMP1,TEMP2 : std_logic_vector(7 downto 0);
     
begin
 Decoder_3_to_8_0 : Decoder_3_to_8
 port map(
    EN => EN,
    I => S,
    Y => TEMP1
 );
    
 TEMP2(0) <= TEMP1(0) AND D(0);
 TEMP2(1) <= TEMP1(1) AND D(1);
 TEMP2(2) <= TEMP1(2) AND D(2);
 TEMP2(3) <= TEMP1(3) AND D(3);
 TEMP2(4) <= TEMP1(4) AND D(4);
 TEMP2(5) <= TEMP1(5) AND D(5);
 TEMP2(6) <= TEMP1(6) AND D(6);
 TEMP2(7) <= TEMP1(7) AND D(7);
 
 Y <= TEMP2(0) OR TEMP2(1) OR TEMP2(2) OR TEMP2(3) OR TEMP2(4) OR TEMP2(5) OR TEMP2(6) OR TEMP2(7);

end Behavioral;