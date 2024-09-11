----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 10:06:50 PM
-- Design Name: 
-- Module Name: TB_Magnitude_Comparator_4_bit - Behavioral
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

entity TB_Magnitude_Comparator_4_bit is
--  Port ( );
end TB_Magnitude_Comparator_4_bit;

architecture Behavioral of TB_Magnitude_Comparator_4_bit is
    component Magnitude_Comparator_4_bit is
        Port (
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Enable : in STD_LOGIC;
            Equal : out STD_LOGIC;
            Greater : out STD_LOGIC;
            Lesser : out STD_LOGIC
        );
    end component;

    -- Signals declaration
    signal A : STD_LOGIC_VECTOR (3 downto 0);
    signal B : STD_LOGIC_VECTOR (3 downto 0);
    signal Equal, Greater, Lesser : STD_LOGIC;
    signal Enable : STD_LOGIC;
    

begin
    UUT : Magnitude_Comparator_4_bit
        port map (
            A => A,
            B => B,
            Enable => Enable,
            Equal => Equal,
            Greater => Greater,
            Lesser => Lesser
        );

    process
    begin
        Enable <= '1';
        -- Test case 1: A = 0011, B = 0101
        A <= "0011";
        B <= "0101";
        wait for 100 ns;

        -- Test case 2: A = 1000, B = 0100
        A <= "1000";
        B <= "0100";
        wait for 100 ns;

        -- Test case 3: A = 1111, B = 1111
        A <= "1111";
        B <= "1111";
        wait for 100 ns;
        
        A <= "1110";
        B <= "1111";
        wait for 100 ns;
        
        A <= "0000";
        B <= "0000";
        wait for 100 ns;
        
        A <= "0001";
        B <= "0000";
        wait for 100 ns;
        
        -- End simulation
        wait;
    end process;


end Behavioral;