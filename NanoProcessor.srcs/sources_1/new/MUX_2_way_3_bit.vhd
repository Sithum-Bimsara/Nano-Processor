library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_way_3_bit is
    Port ( Adder_3_bit_input : in STD_LOGIC_VECTOR (2 downto 0);
           Address_to_jump : in STD_LOGIC_VECTOR (2 downto 0);
           Jump_Flag : in STD_LOGIC;
           Mux_2_way_3_bit_output : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_way_3_bit;

architecture Behavioral of MUX_2_way_3_bit is

component Tri_State_Buffer_3_bit is
    Port ( C_in : in STD_LOGIC_VECTOR(2 downto 0);
           C_out : out STD_LOGIC_VECTOR(2 downto 0);
           En : in STD_LOGIC);
end component;

signal Buffer_Out_0, Buffer_Out_1 : STD_LOGIC_VECTOR (2 downto 0);
signal Not_Jump_Flag : STD_LOGIC;

begin

--    Buf0_Adder: for i in 0 to 2 generate
        Buffer_Adder: Tri_State_Buffer_3_bit port map (
            C_in => Adder_3_bit_input,
            C_out => Buffer_Out_0,
            En => Not_Jump_Flag
        );

--    Buf1_Jump: for i in 0 to 2 generate
        Buffer_Jumper: Tri_State_Buffer_3_bit port map (
            C_in => Address_to_jump,
            C_out => Buffer_Out_1,
            En => Jump_Flag
        );


    Not_Jump_Flag <= NOT Jump_Flag;
    Mux_2_way_3_bit_output <= Buffer_Out_0 or Buffer_Out_1;

end Behavioral;