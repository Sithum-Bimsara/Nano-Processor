library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8_way_4_bit is
    Port ( 
        Register_Select : in STD_LOGIC_VECTOR (2 downto 0);
        Register_0_output : in STD_LOGIC_VECTOR (3 downto 0);
        Register_1_output : in STD_LOGIC_VECTOR (3 downto 0);
        Register_2_output : in STD_LOGIC_VECTOR (3 downto 0);
        Register_3_output : in STD_LOGIC_VECTOR (3 downto 0);
        Register_4_output : in STD_LOGIC_VECTOR (3 downto 0);
        Register_5_output : in STD_LOGIC_VECTOR (3 downto 0);
        Register_6_output : in STD_LOGIC_VECTOR (3 downto 0);
        Register_7_output : in STD_LOGIC_VECTOR (3 downto 0);
        Multiplexer_8_way_4_bit_output : out STD_LOGIC_VECTOR (3 downto 0)
    );
end MUX_8_way_4_bit;

architecture Behavioral of MUX_8_way_4_bit is
    component Tri_State_Buffer_4_bit is
        Port ( 
            C_in : in STD_LOGIC_VECTOR(3 downto 0);
            C_out : out STD_LOGIC_VECTOR(3 downto 0);
            En : in STD_LOGIC
        );
    end component;

    signal Buffer_Out_0, Buffer_Out_1, Buffer_Out_2, Buffer_Out_3, Buffer_Out_4, Buffer_Out_5, Buffer_Out_6, Buffer_Out_7 : STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_Sel : STD_LOGIC_VECTOR(7 downto 0);

begin
    -- Instantiate tri-state buffers for each input
    Buf0: Tri_State_Buffer_4_bit port map (
        C_in => Register_0_output,
        C_out => Buffer_Out_0,
        En => Reg_Sel(0)
    );
    Buf1: Tri_State_Buffer_4_bit port map (
        C_in => Register_1_output,
        C_out => Buffer_Out_1,
        En => Reg_Sel(1)
    );
    Buf2: Tri_State_Buffer_4_bit port map (
        C_in => Register_2_output,
        C_out => Buffer_Out_2,
        En => Reg_Sel(2)
    );
    Buf3: Tri_State_Buffer_4_bit port map (
        C_in => Register_3_output,
        C_out => Buffer_Out_3,
        En => Reg_Sel(3)
    );
    Buf4: Tri_State_Buffer_4_bit port map (
        C_in => Register_4_output,
        C_out => Buffer_Out_4,
        En => Reg_Sel(4)
    );
    Buf5: Tri_State_Buffer_4_bit port map (
        C_in => Register_5_output,
        C_out => Buffer_Out_5,
        En => Reg_Sel(5)
    );
    Buf6: Tri_State_Buffer_4_bit port map (
        C_in => Register_6_output,
        C_out => Buffer_Out_6,
        En => Reg_Sel(6)
    );
    Buf7: Tri_State_Buffer_4_bit port map (
        C_in => Register_7_output,
        C_out => Buffer_Out_7,
        En => Reg_Sel(7)
    );
        
    -- Process to set the register select signal based on the input
    process(Register_Select)
    begin
        Reg_Sel <= (others => '0'); -- Reset all bits to '0'
        case Register_Select is
            when "000" =>
                Reg_Sel(0) <= '1';
            when "001" =>
                Reg_Sel(1) <= '1';
            when "010" =>
                Reg_Sel(2) <= '1';
            when "011" =>
                Reg_Sel(3) <= '1';
            when "100" =>
                Reg_Sel(4) <= '1';
            when "101" =>
                Reg_Sel(5) <= '1';
            when "110" =>
                Reg_Sel(6) <= '1';
            when "111" =>
                Reg_Sel(7) <= '1';
            when others =>
                null; -- Optional: handle other cases if needed
        end case;
    end process;

    -- Perform OR operation on the outputs of tri-state buffers
    Multiplexer_8_way_4_bit_output <= Buffer_Out_0 or Buffer_Out_1 or Buffer_Out_2 or Buffer_Out_3 or
                                      Buffer_Out_4 or Buffer_Out_5 or Buffer_Out_6 or Buffer_Out_7;

end Behavioral;
