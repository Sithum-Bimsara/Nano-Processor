----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 12:33:36 PM
-- Design Name: 
-- Module Name: TB_Adder_Substractor_4_bit - Behavioral
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

entity TB_Adder_Subtractor_4_bit is
--  Port ( );
end TB_Adder_Subtractor_4_bit;

architecture Behavioral of TB_Adder_Subtractor_4_bit is
     COMPONENT   Adder_Subtractor_4_bit
        PORT(   A : in STD_LOGIC_VECTOR (3 downto 0);  
                B : in STD_LOGIC_VECTOR (3 downto 0);  
                ADD_SUB_SELECT : in STD_LOGIC;         
                Overflow : out STD_LOGIC;              
                Zero : out STD_LOGIC;                  
                S : out STD_LOGIC_VECTOR (3 downto 0));
     END COMPONENT;

SIGNAL A,B,S :  STD_LOGIC_VECTOR (3 downto 0); 
SIGNAL ADD_SUB_SELECT ,  Overflow , Zero : STD_LOGIC;     
                     
begin
    UUT:  Adder_Subtractor_4_bit
    PORT MAP(
        A => A,
        B => B,
        Overflow => Overflow,
        ADD_SUB_SELECT => ADD_SUB_SELECT, 
        S => S,
        Zero => Zero
    );
    process
    begin
        ADD_SUB_SELECT <= '0';
        A(0) <= '1';
        A(1) <= '0';
        A(2) <= '0';
        A(3) <= '1'; -- set initial values
        B(0) <= '1';
        B(1) <= '0';
        B(2) <= '1';
        B(3) <= '1';
        WAIT FOR 100 ns; -- after 100 ns change inputs
        
        ADD_SUB_SELECT <= '1';
        A(0) <= '0';
        A(1) <= '0';
        A(2) <= '0';
        A(3) <= '1'; -- set initial values
        B(0) <= '1';
        B(1) <= '0';
        B(2) <= '0';
        B(3) <= '0';
        WAIT FOR 100 ns; -- after 100 ns change inputs
        
        WAIT;
        
        end process;

end Behavioral;
