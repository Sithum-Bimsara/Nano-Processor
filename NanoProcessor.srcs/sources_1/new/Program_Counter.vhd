----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 10:43:09 PM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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

entity Program_Counter is
    Port ( Reset : in STD_LOGIC;
           Clock : in STD_LOGIC;
           PC_in : in STD_LOGIC_VECTOR (2 downto 0) := "000";
           PC_out : out STD_LOGIC_VECTOR (2 downto 0) );
    end Program_Counter;

architecture Behavioral of Program_Counter is
   
   COMPONENT D_FF
          PORT(D : in STD_LOGIC;
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC;
               Qbar : out STD_LOGIC);
      END COMPONENT;
      
begin
    
    D_FF0 : D_FF
         port map(
          D => PC_in(0),
          Res => Reset,
          Clk => Clock,                                
          Q => PC_out(0));                                                                   
            
     D_FF1:D_FF
         port map(           
         D => PC_in(1),               
         Res => Reset,
         Clk => Clock ,               
         Q => PC_out(1));   
                     
      D_FF2:D_FF
         port map(
           D => PC_in(2),
           Res => Reset,
           Clk => Clock ,
           Q => PC_out(2) ); 
                  
end Behavioral;
