----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 10:10:55 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
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
end Register_Bank;

architecture Behavioral of Register_Bank is
    COMPONENT Reg 
       PORT(   D : in STD_LOGIC_VECTOR (3 downto 0);
               En : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Reset :in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0));
    END COMPONENT;
    
    COMPONENT Decoder_3_to_8
        Port (  I : in STD_LOGIC_VECTOR (2 downto 0);
                EN : in STD_LOGIC;
                Y : out STD_LOGIC_VECTOR (7 downto 0));
    END COMPONENT;
    
    
    signal Decoder_3_to_8_output : std_logic_vector(7 downto 0);
        signal Registers_Output_0,Registers_Output_1,Registers_Output_2,Registers_Output_3,Registers_Output_4,Registers_Output_5,Registers_Output_6,Registers_Output_7 : std_logic_vector(3 downto 0);
        signal Reg_0_D : std_logic_vector(3 downto 0);
begin

            
    Decoder_3_to_8_0 :  Decoder_3_to_8
     port map(
            EN => '1',
            I => Register_Enable ,
            Y => Decoder_3_to_8_output
     );
     
     
     Reg_0 : Reg
     port map( 
            D => Reg_0_D,
            En =>  '1',
            Clk =>  Clock,
            Reset => Reset,
            Q => Registers_Output_0
      );
      Reg_1 : Reg
      port map( 
                  D =>  Multiplexer_2_way_4_bit_output ,
                  En =>  Decoder_3_to_8_output(1),
                  Clk =>  Clock,
                  Reset => Reset,
                  Q => Registers_Output_1
            );
      Reg_2 : Reg
         port map( 
                D =>  Multiplexer_2_way_4_bit_output ,
                En =>  Decoder_3_to_8_output(2),
                Clk =>  Clock,
                Reset => Reset,
                Q => Registers_Output_2
          );       
     Reg_3 : Reg
       port map( 
              D =>  Multiplexer_2_way_4_bit_output ,
              En =>  Decoder_3_to_8_output(3),
              Clk =>  Clock,
              Reset => Reset,
              Q => Registers_Output_3
        );          
     Reg_4 : Reg
         port map( 
                D =>  Multiplexer_2_way_4_bit_output ,
                En =>  Decoder_3_to_8_output(4),
                Clk =>  Clock,
                Reset => Reset,
                Q => Registers_Output_4
          );     
     Reg_5 : Reg
           port map( 
                  D =>  Multiplexer_2_way_4_bit_output ,
                  En =>  Decoder_3_to_8_output(5),
                  Clk =>  Clock,
                  Reset => Reset,
                  Q => Registers_Output_5
            );
     Reg_6 : Reg
         port map( 
                D =>  Multiplexer_2_way_4_bit_output ,
                En =>  Decoder_3_to_8_output(6),
                Clk =>  Clock,
                Reset => Reset,
                Q => Registers_Output_6
          );
    Reg_7 : Reg
       port map( 
              D =>  Multiplexer_2_way_4_bit_output ,
              En =>  Decoder_3_to_8_output(7),
              Clk =>  Clock,
              Reset => Reset,
              Q => Registers_Output_7
        );
        
        Reg_0_D(0) <= ( '0' AND NOT(Decoder_3_to_8_output(0)) ) OR ( Multiplexer_2_way_4_bit_output(0) AND Decoder_3_to_8_output(0) ) ;
        Reg_0_D(1) <= ( '0' AND NOT(Decoder_3_to_8_output(0)) ) OR ( Multiplexer_2_way_4_bit_output(1) AND Decoder_3_to_8_output(0) ) ;
        Reg_0_D(2) <= ( '0' AND NOT(Decoder_3_to_8_output(0)) ) OR ( Multiplexer_2_way_4_bit_output(2) AND Decoder_3_to_8_output(0) ) ;
        Reg_0_D(3) <= ( '0' AND NOT(Decoder_3_to_8_output(0)) ) OR ( Multiplexer_2_way_4_bit_output(3) AND Decoder_3_to_8_output(0) ) ;
       
        Register_0_output <= Registers_Output_0;
        Register_1_output <= Registers_Output_1;
        Register_2_output <= Registers_Output_2;
        Register_3_output <= Registers_Output_3;
        Register_4_output <= Registers_Output_4;
        Register_5_output <= Registers_Output_5;
        Register_6_output <= Registers_Output_6;
        Register_7_output <= Registers_Output_7;
        
end Behavioral;
