----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 09:23:57 AM
-- Design Name: 
-- Module Name: TB_Adder_3_Bit - Behavioral
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

entity TB_Adder_3_Bit is
--  Port ( );
end TB_Adder_3_Bit;

architecture Behavioral of TB_Adder_3_Bit is
     component Adder_3_Bit
       Port (
           A    : in  STD_LOGIC_VECTOR (2 downto 0);
           C_in : in  STD_LOGIC;
           S    : out STD_LOGIC_VECTOR (2 downto 0)
       );
       end component; 
       
       signal A       : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
       signal C_in    : STD_LOGIC := '0';
       signal S       : STD_LOGIC_VECTOR (2 downto 0);

begin
    UUT: Adder_3_Bit port map (
        A    => A,
        C_in => C_in,
        S    => S
    );
    
    process
        begin
            -- Test case 1
            A <= "001";
            C_in <= '0';
            wait for 100 ns;
            
            -- Test case 2
            A <= "110";
            wait for 10 ns;
            
            -- Add more test cases as needed
            
            wait;
        end process;


end Behavioral;
