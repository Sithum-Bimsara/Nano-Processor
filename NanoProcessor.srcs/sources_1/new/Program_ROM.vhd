library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Program_ROM is
    Port ( Memory_Select : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (12 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is
    type rom_type is array (0 to 7) of std_logic_vector(12 downto 0); 
        signal Instruction_ROM : rom_type := ( 
--            "0101110000010", -- MOVI R7, 2
--            "0100100000100", -- MOVI R2, 4
--            "0100110000010", -- MOVI R3, 2
--            "1011110100000", -- COM R1, R2
--            "1011110110000", -- COM R1, R3
--            "1010100110000", -- COM R2, R3
--            "1001110100000", -- MUL R7, R2
--            "0101110000000"  -- MOVI R7, 0
            
--            "0101110000001", -- MOVI R7, 1
--            "0100100000010", -- MOVI R2, 2
--            "0100110000011", -- MOVI R3, 3
--            "1001110100000", -- MUL R7, R2
--            "1001110110000", -- MUL R7, R3
--            "0001110110000", -- ADD R7, R3
--            "1001110000000", -- MUL R7, R2
--            "0111110000000"  -- JUMP to Line 1 if R7 = 0
            
            "0101110000100",  -- MOVI R7, 4
            "0100010000010",  -- MOVI R1, 2
            "1010011110000",  -- COM R1, R7
            "1111110010000",  -- SUB R7, R1
            "1001110010000",  -- MUL R7, R1
            "1101110000000",  -- DOUB R7
            "1011110010000",  -- COM R7, R1
            "0110000000000"   -- JZR R0, 1
            
        );

begin

    Instruction <= Instruction_ROM(to_integer(unsigned(Memory_Select)));

end Behavioral;





