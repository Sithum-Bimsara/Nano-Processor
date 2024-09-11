----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 11:34:50 PM
-- Design Name: 
-- Module Name: TB_Register_Bank - Behavioral
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

entity TB_Register_Bank is
--  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is
    component Register_Bank
        Port ( Register_Enable : in STD_LOGIC_VECTOR (2 downto 0);
               Clock : in STD_LOGIC;
               Register_0_output : out STD_LOGIC_VECTOR (3 downto 0);
               Register_1_output : out STD_LOGIC_VECTOR (3 downto 0);
               Register_2_output : out STD_LOGIC_VECTOR (3 downto 0);
               Register_3_output : out STD_LOGIC_VECTOR (3 downto 0);
               Register_4_output : out STD_LOGIC_VECTOR (3 downto 0);
               Register_5_output : out STD_LOGIC_VECTOR (3 downto 0);
               Register_6_output : out STD_LOGIC_VECTOR (3 downto 0);
               Register_7_output : out STD_LOGIC_VECTOR (3 downto 0);
               Multiplexer_2_way_4_bit_output : in STD_LOGIC_VECTOR (3 downto 0);
               Reset : in STD_LOGIC);
    end component;


    signal Clock : std_logic := '0'; -- Clock signal
    signal Reset : std_logic := '0'; -- Reset signal
    signal Register_Enable : std_logic_vector(2 downto 0) := "000"; -- Enable signal
    signal Multiplexer_2_way_4_bit_output : std_logic_vector(3 downto 0) := "0000"; -- Example multiplexer output
    signal Register_0_output, Register_1_output, Register_2_output, Register_3_output,Register_4_output, Register_5_output, Register_6_output, Register_7_output : std_logic_vector(3 downto 0);

 begin
 UUT : Register_Bank
 port map(
             Register_Enable => Register_Enable,
             Clock => Clock,
             Register_0_output => Register_0_output,
             Register_1_output => Register_1_output,
             Register_2_output => Register_2_output,
             Register_3_output => Register_3_output,
             Register_4_output => Register_4_output,
             Register_5_output => Register_5_output,
             Register_6_output => Register_6_output,
             Register_7_output => Register_7_output,
             Multiplexer_2_way_4_bit_output => Multiplexer_2_way_4_bit_output,
             Reset => Reset
         );
         
    process begin
                 Clock <= not(Clock);
                 wait for 5ns;
    end process; 
    
     
    process
    begin
            Register_Enable <= "001";
            Multiplexer_2_way_4_bit_output <= "1010";
            wait for 200 ns;
            
            Register_Enable <= "010";
            Multiplexer_2_way_4_bit_output <= "1011";
            wait for 200 ns;
            
            Register_Enable <= "000";
            Multiplexer_2_way_4_bit_output <= "1001";
            wait for 200 ns;
                
            Reset <= '1';    
            wait for 200 ns;
      
    
            wait;
        end process;
    
        
 


end Behavioral;
