----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 03:02:08 PM
-- Design Name: 
-- Module Name: TB_Program_Counter - Behavioral
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

entity TB_Program_Counter is
--  Port ( );
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is
    component Program_Counter
        Port (  Clock : in STD_LOGIC;
                Reset : in STD_LOGIC;
                PC_in : in std_logic_vector(2 downto 0);
                PC_out : out std_logic_vector(2 downto 0));
    end component;
    
signal Clock : std_logic:='0';
signal Reset : std_logic;
signal PC_out , PC_in : std_logic_vector(2 downto 0);

begin
    UUT : Program_Counter
    port map(   Clock=>Clock,
                Reset=>Reset,
                PC_in=>PC_in,
                PC_out=>PC_out
            );
            
            
    process begin
        Clock <= not(Clock);
        wait for 5ns;
    end process;
    
    
    
    
    process begin
    
        Reset <= '1';
        wait for 50ns;
        Reset <= '0';
        PC_in(0) <= '1';
        PC_in(1) <= '0';
        PC_in(2) <= '0';
        wait for 260ns;
        
        Reset <= '1';
        wait for 50ns;
        
        Reset <= '0';
        PC_in(0) <= '1';
        PC_in(1) <= '1';
        PC_in(2) <= '0';
        wait for 260ns;
    end process;
    
      
    


end Behavioral;
