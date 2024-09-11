library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tri_State_Buffer_3_bit is
    Port ( C_in : in STD_LOGIC_VECTOR(2 downto 0);
           C_out : out STD_LOGIC_VECTOR(2 downto 0);
           En : in STD_LOGIC);
end Tri_State_Buffer_3_bit;

architecture Behavioral of Tri_State_Buffer_3_bit is

begin

    C_out <= C_in when En='1' else "000";

end Behavioral;