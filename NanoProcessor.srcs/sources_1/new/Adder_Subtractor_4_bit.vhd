----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 12:01:10 PM
-- Design Name: 
-- Module Name: Adder_Subtractor_4_bit - Behavioral
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

entity Adder_Subtractor_4_bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           ADD_SUB_SELECT : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end Adder_Subtractor_4_bit;

architecture Behavioral of Adder_Subtractor_4_bit is
    component FA   
       port (   
       A: in std_logic;   
       B: in std_logic; 
       C_in: in std_logic;   
       S: out std_logic; 
       C_out: out std_logic);   
   end component; 
   
   SIGNAL FA_S , FA_B , FA_C : std_logic_vector(3 downto 0);
   SIGNAL FA_0_Carry_In : std_logic;
  
begin
    FA_0 : FA 
        port map (   
            A => A(0),   
            B => FA_B(0), 
            C_in => FA_0_Carry_In,            
            S => FA_S(0),   
            C_Out => FA_C(0) );  
    FA_1 : FA 
        port map (               
            A => A(1),              
            B => FA_B(1),           
            C_in => FA_C(0),                
            S => FA_S(1),               
            C_Out => FA_C(1) );     
    FA_2 : FA 
        port map (   
            A => A(2),   
            B => FA_B(2),
            C_in => FA_C(1),    
            S => FA_S(2),   
            C_Out => FA_C(2) ); 
    FA_3 : FA 
        port map (   
            A => A(3),   
            B => FA_B(3),
            C_in => FA_C(2),    
            S => FA_S(3),   
            C_Out => FA_C(3) );   
            
    Zero <=  NOT(FA_S(0) OR FA_S(1) OR FA_S(2) OR FA_S(3) OR FA_C(3) );
    S <= FA_S; 
    Overflow  <=  FA_C(2) XOR FA_C(3); 
    FA_0_Carry_In <= ADD_SUB_SELECT;
    FA_B(0) <= ADD_SUB_SELECT XOR B(0);
    FA_B(1) <= ADD_SUB_SELECT XOR B(1);
    FA_B(2) <= ADD_SUB_SELECT XOR B(2);
    FA_B(3) <= ADD_SUB_SELECT XOR B(3);


end Behavioral;
