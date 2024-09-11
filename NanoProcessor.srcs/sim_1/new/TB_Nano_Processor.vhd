----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2024 07:45:57 PM
-- Design Name: 
-- Module Name: TB_Nano_Processor - Behavioral
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

entity TB_Nano_Processor is
--  Port ( );
end TB_Nano_Processor;

architecture Behavioral of TB_Nano_Processor is
    component Nano_Processor 
        Port( Reset : in STD_LOGIC;
              Clk_in : in STD_LOGIC;
              Overflow : out STD_LOGIC;
              ZERO : out STD_LOGIC;
              Reg7_Value : out STD_LOGIC_VECTOR (3 downto 0);
              Seven_Segment_Out : out STD_LOGIC_VECTOR (6 downto 0);
              Anode : out STD_LOGIC_VECTOR(3 downto 0);
              Equal : out STD_LOGIC;
              Greater : out STD_LOGIC;
              Lesser : out STD_LOGIC);
    end component; 
    
       signal Clk_in : STD_LOGIC := '0';  
       signal Reset, ZERO, Overflow : STD_LOGIC;
       signal Equal, Greater, Lesser : STD_LOGIC;
       signal Reg7_Value : STD_LOGIC_VECTOR(3 downto 0);
       signal Seven_Segment_Out : STD_LOGIC_VECTOR(6 downto 0);
begin
     UUT : Nano_Processor Port Map (
                   Reset => Reset,
                   Clk_in => Clk_in,
                   Overflow => Overflow,
                   ZERO =>Zero,
                   Reg7_Value =>Reg7_Value,
                   Seven_Segment_Out => Seven_Segment_Out,
                   Equal => Equal,
                   Greater => Greater,
                   Lesser => Lesser);

    process begin      
                       Clk_in <= NOT(Clk_in); 
                       wait for 10ns; 
     end process;   
     process begin      
                    Reset <= '1';
                    wait for 100ns;
                    
                    Reset <= '0';
                    wait; 
     end process;   
                       
    

end Behavioral;
