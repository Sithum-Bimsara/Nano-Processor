----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 09:36:24 PM
-- Design Name: 
-- Module Name: Adder_3_Bit - Behavioral
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

entity Adder_3_Bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0) );
end Adder_3_Bit;

architecture Behavioral of Adder_3_Bit is
     component FA   
      port (   
      A: in std_logic;   
      B: in std_logic; 
      C_in: in std_logic;   
      S: out std_logic; 
      C_out: out std_logic);   
  end component; 
  
  SIGNAL FA_S , FA_C : std_logic_vector(2 downto 0);
  
begin
    FA_0 : FA 
        port map (   
            A => A(0),   
            B => '1', 
            C_in => '0',            
            S => FA_S(0),   
            C_Out => FA_C(0) );  
    FA_1 : FA 
        port map (               
            A => A(1),              
            B => '0',           
            C_in => FA_C(0),                
            S => FA_S(1),               
            C_Out => FA_C(1) );     
    FA_2 : FA 
        port map (   
            A => A(2),   
            B => '0',
            C_in => FA_C(1),    
            S => FA_S(2),   
            C_Out => FA_C(2) );

S <= FA_S;

end Behavioral;
