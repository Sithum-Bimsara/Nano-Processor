----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 06:09:48 PM
-- Design Name: 
-- Module Name: TB_Multiplexer_8_way_4_bit - Behavioral
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

entity TB_Multiplexer_8_way_4_bit is
--  Port ( );
end TB_Multiplexer_8_way_4_bit;

architecture Behavioral of TB_Multiplexer_8_way_4_bit is
    COMPONENT Multiplexer_8_way_4_bit
        PORT ( Register_Select : in STD_LOGIC_VECTOR (2 downto 0);
               Register_0_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_1_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_2_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_3_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_4_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_5_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_6_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_7_output : in STD_LOGIC_VECTOR (3 downto 0);
               Multiplexer_8_way_4_bit_output : out STD_LOGIC_VECTOR (3 downto 0) );
       END COMPONENT; 
       
       signal Multiplexer_8_way_4_bit_output,Register_0_output,Register_1_output,Register_2_output,Register_3_output,Register_4_output,Register_5_output,Register_6_output,Register_7_output : std_logic_vector(3 downto 0);
       signal Register_Select : std_logic_vector(2 downto 0);

begin

    UUT: Multiplexer_8_way_4_bit
    PORT MAP(
       Register_Select => Register_Select,
       Register_0_output => Register_0_output,
       Register_1_output => Register_1_output,
       Register_2_output => Register_2_output,
       Register_3_output => Register_3_output,
       Register_4_output => Register_4_output,
       Register_5_output => Register_5_output,
       Register_6_output => Register_6_output,
       Register_7_output => Register_7_output,
       Multiplexer_8_way_4_bit_output => Multiplexer_8_way_4_bit_output );
    

    process
    begin
        Register_Select <= "000"; -- Select Register 0
        
        Register_0_output <= "0000";
        Register_1_output <= "0001";
        Register_2_output <= "0010";
        Register_3_output <= "0011";
        Register_4_output <= "0100";
        Register_5_output <= "0101";
        Register_6_output <= "0110";
        Register_7_output <= "0111";
        wait for 100 ns;
        
        Register_Select <= "001"; -- Select Register 1
        
        
        wait for 100 ns;
    end process;
    


end Behavioral;
