----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 03:30:27 PM
-- Design Name: 
-- Module Name: TB_Program_ROM - Behavioral
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

entity TB_Program_ROM is
--  Port ( );
end TB_Program_ROM;

architecture Behavioral of TB_Program_ROM is
    component Program_ROM is
    Port ( Memory_Select : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    
    signal Memory_Select : STD_LOGIC_VECTOR (2 downto 0);
    signal Instruction : STD_LOGIC_VECTOR (11 downto 0);


begin
     process
       begin
       Memory_Select <= "000";
       wait for 100ns;
       
       Memory_Select <= "001";
       wait for 100ns;
               
       Memory_Select <= "010";
       wait for 100ns;
       
       Memory_Select <= "011";
       wait for 100ns;
       
       Memory_Select <= "100";
       wait for 100ns;
           
       Memory_Select <= "101";
       wait for 100ns;
       
       Memory_Select <= "110";
       wait for 100ns;
       
       Memory_Select <= "111";
       wait;
       
   end process;



end Behavioral;
