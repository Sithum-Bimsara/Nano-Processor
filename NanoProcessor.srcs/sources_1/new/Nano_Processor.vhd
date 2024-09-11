----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 07:37:11 PM
-- Design Name: 
-- Module Name: Nano_Processor - Behavioral
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


entity Nano_Processor is
    Port( Reset : in STD_LOGIC;
          Clk_in : in STD_LOGIC;
          Overflow : out STD_LOGIC;
          ZERO : out STD_LOGIC;
          Reg7_Value : out STD_LOGIC_VECTOR (3 downto 0);
          Seven_Segment_Out : out STD_LOGIC_VECTOR (6 downto 0);
          Equal : out STD_LOGIC;
          Greater : out STD_LOGIC;
          Lesser : out STD_LOGIC;
          Anode : out STD_LOGIC_VECTOR(3 downto 0));
          
end Nano_Processor;

architecture Behavioral of Nano_Processor is

    component Instruction_Decoder is
    Port ( Instruction_Bus : in STD_LOGIC_VECTOR (12 downto 0);
           Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Immediate_Value : out STD_LOGIC_VECTOR (3 downto 0);
           Load_Select : out STD_LOGIC;
           MUL_RCA_Select : out STD_LOGIC;
           Add_Sub_Select : out STD_LOGIC;
           Comparator_Select : out STD_LOGIC;
           Reg_Sel_MUX_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_MUX_B : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0);
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component Program_ROM is
        Port ( Memory_Select : in STD_LOGIC_VECTOR (2 downto 0);
               Instruction : out STD_LOGIC_VECTOR (12 downto 0));
    end component;
    
    component Register_Bank is
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
    
    component Adder_Subtractor_4_bit is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               ADD_SUB_SELECT : in STD_LOGIC;
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    

    component MUX_8_way_4_bit is
        Port ( Register_Select : in STD_LOGIC_VECTOR (2 downto 0);
               Register_0_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_1_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_2_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_3_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_4_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_5_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_6_output : in STD_LOGIC_VECTOR (3 downto 0);
               Register_7_output : in STD_LOGIC_VECTOR (3 downto 0);
               Multiplexer_8_way_4_bit_output : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component MUX_2_way_4_bit is
        Port ( Input_A : in STD_LOGIC_VECTOR (3 downto 0);
               Input_B : in STD_LOGIC_VECTOR (3 downto 0);
               Sel : in STD_LOGIC;
               Output : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Adder_3_Bit is
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
               C_in : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (2 downto 0) );
    end component;
    
    
    component MUX_2_way_3_bit is
        Port ( Adder_3_bit_input : in STD_LOGIC_VECTOR (2 downto 0);
               Address_to_jump : in STD_LOGIC_VECTOR (2 downto 0);
               Jump_Flag : in STD_LOGIC;
               Mux_2_way_3_bit_output : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    component Program_Counter is
    Port ( Reset : in STD_LOGIC;
           Clock : in STD_LOGIC;
           PC_in : in STD_LOGIC_VECTOR (2 downto 0);
           PC_out : out STD_LOGIC_VECTOR (2 downto 0) );
    end component;
    
    component Slow_Clk is
        Port ( Clk_in : in STD_LOGIC;
               Clk_out : out STD_LOGIC);
    end component;
    
    component Seven_Segment_Display is
        Port ( number : in STD_LOGIC_VECTOR (3 downto 0);
               display : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    component Multiplier_2_bit is
        Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
               B : in STD_LOGIC_VECTOR (1 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Reversed_Multiplexer_4_bit is
        Port ( Sel : in std_logic;
               Input : in std_logic_vector(3 downto 0);
               Output_0 : out std_logic_vector(3 downto 0);
               Output_1 : out std_logic_vector(3 downto 0));
    end component;
    
    component Magnitude_Comparator_4_bit is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Enable : in STD_LOGIC;
               Equal : out STD_LOGIC;
               Greater : out STD_LOGIC;
               Lesser : out STD_LOGIC);
    end component;
    
    signal Slow_Clock : STD_LOGIC;
    signal PC_out : STD_LOGIC_VECTOR (2 downto 0);
    signal Adder_3_Bit_Output : STD_LOGIC_VECTOR (2 downto 0);
    signal Mux_2_way_3_bit_Output : STD_LOGIC_VECTOR (2 downto 0);
    signal ROM_Out : STD_LOGIC_VECTOR (12 downto 0);
    signal Reg_Sel_MUX_A, Reg_Sel_MUX_B, Reg_Enable, Jump_Address : STD_LOGIC_VECTOR (2 downto 0);
    signal Immediate_Value : STD_LOGIC_VECTOR (3 downto 0);
    signal Load_Select, Add_Sub_Select, Jump_Flag, MUL_RCA_Select, Comparator_Select : STD_LOGIC;
    signal Overflow_0 : STD_LOGIC;
    signal Reg_0, Reg_1, Reg_2, Reg_3, Reg_4, Reg_5, Reg_6, Reg_7, MUX_2_to_1_out, RCA_out, MUL_out, MUX_RCA_or_MUL_out : STD_LOGIC_VECTOR (3 downto 0);
    signal MUX_A_Out, MUX_B_Out : STD_LOGIC_VECTOR (3 downto 0);
    signal MUX_A_Out_Com, MUX_B_Out_Com, MUX_A_Out_RCA_or_MUL, MUX_B_Out_RCA_or_MUL : STD_LOGIC_VECTOR (3 downto 0);
    
    
begin

    Slow_Clk_0 : Slow_Clk
        port map (
            Clk_in => Clk_in,
            Clk_out => Slow_Clock);
            
    Adder_3_bit_0 : Adder_3_bit
        port map (
            A => PC_out,
            C_in => '0',
            S => Adder_3_Bit_Output);
            
    Program_Counter_0 : Program_Counter
        port map (
            Reset => Reset,
            Clock => Slow_Clock,
            PC_in => Mux_2_way_3_bit_Output,
            PC_out => PC_out);
            
    Adder_Subtractor_4_bit_0 : Adder_Subtractor_4_bit 
        port map (
            A => MUX_A_Out_RCA_or_MUL,
            B => MUX_B_Out_RCA_or_MUL,
            ADD_SUB_SELECT => Add_Sub_Select,
            Overflow => Overflow_0,
            Zero => Zero,
            S => RCA_out);
            
    MUX_A : MUX_8_way_4_bit 
        port map (
            Register_Select => Reg_Sel_MUX_A,
            Register_0_output => Reg_0,
            Register_1_output => Reg_1,
            Register_2_output => Reg_2,
            Register_3_output => Reg_3,
            Register_4_output => Reg_4,
            Register_5_output => Reg_5,
            Register_6_output => Reg_6,
            Register_7_output => Reg_7,
            Multiplexer_8_way_4_bit_output => MUX_A_Out );
            
    MUX_B : MUX_8_way_4_bit 
        port map (
            Register_Select => Reg_Sel_MUX_B,
            Register_0_output => Reg_0,
            Register_1_output => Reg_1,
            Register_2_output => Reg_2,
            Register_3_output => Reg_3,
            Register_4_output => Reg_4,
            Register_5_output => Reg_5,
            Register_6_output => Reg_6,
            Register_7_output => Reg_7,
            Multiplexer_8_way_4_bit_output => MUX_B_Out );
            
    Register_Bank_0 : Register_Bank
        port map (
            Register_Enable => Reg_Enable,
            Clock => Slow_Clock,
            Register_0_output => Reg_0,
            Register_1_output => Reg_1,
            Register_2_output => Reg_2,
            Register_3_output => Reg_3,
            Register_4_output => Reg_4,
            Register_5_output => Reg_5,
            Register_6_output => Reg_6,
            Register_7_output => Reg_7,
            Multiplexer_2_way_4_bit_output => MUX_2_to_1_out,
            Reset => Reset );
            
    MUX_2_way_3_bit_0 : MUX_2_way_3_bit
        port map (
            Adder_3_bit_input => Adder_3_Bit_Output,
            Address_to_jump => Jump_Address,
            Jump_Flag => Jump_Flag,
            Mux_2_way_3_bit_output => Mux_2_way_3_bit_Output);
            
    MUX_2_way_4_bit_0 : MUX_2_way_4_bit
        port map (
            Input_A => Immediate_Value,
            Input_B => MUX_RCA_or_MUL_out,
            Sel => Load_Select,
            Output => MUX_2_to_1_out );
            
    MUX_2_way_4_bit_1 : MUX_2_way_4_bit
        port map (
            Input_A => MUL_out,
            Input_B => RCA_out,
            Sel => MUL_RCA_Select,
            Output => MUX_RCA_or_MUL_out );
            
    Instruction_Decoder_0 : Instruction_Decoder 
        port map (
            Instruction_Bus => ROM_Out,
            Jump_Check => MUX_B_Out,
            Immediate_Value => Immediate_Value,
            Load_Select => Load_Select,
            MUL_RCA_Select => MUL_RCA_Select,
            Add_Sub_Select => Add_Sub_Select,
            Comparator_Select => Comparator_Select,
            Reg_Sel_MUX_A => Reg_Sel_MUX_A,
            Reg_Sel_MUX_B => Reg_Sel_MUX_B,
            Reg_Enable => Reg_Enable,
            Jump_Flag => Jump_Flag,
            Jump_Address => Jump_Address);
            
    Program_ROM_0 : Program_ROM 
        port map (
            Memory_Select => PC_Out,
            Instruction => ROM_Out);
            
    Seven_Segement_Display_0 : Seven_Segment_Display 
        port map (
            number => Reg_7,
            display => Seven_Segment_Out);
            
    Multiplier_2_bit_0 : Multiplier_2_bit 
        port map (
            A => MUX_A_Out_RCA_or_MUL(1 downto 0),
            B => MUX_B_Out_RCA_or_MUL(1 downto 0),
            Y => MUL_out);
            
    Reversed_Multiplexer_A : Reversed_Multiplexer_4_bit
        port map (
            Sel => Comparator_Select,
            Input => MUX_A_Out,
            Output_0 => MUX_A_Out_RCA_or_MUL,
            Output_1 => MUX_A_Out_Com );
            
    Reversed_Multiplexer_B : Reversed_Multiplexer_4_bit
        port map (
            Sel => Comparator_Select,
            Input => MUX_B_Out,
            Output_0 => MUX_B_Out_RCA_or_MUL,
            Output_1 => MUX_B_Out_Com );
            
    Magnitude_Comparator_4_bit_0 : Magnitude_Comparator_4_bit
        port map (
            A => MUX_A_Out_Com,
            B => MUX_B_Out_Com,
            Enable => Comparator_Select,
            Equal => Equal,
            Greater => Greater,
            Lesser => Lesser );
          
    Reg7_Value <= Reg_7;  
    Overflow <= Overflow_0;
    Anode <= "1110";
    
end Behavioral;
