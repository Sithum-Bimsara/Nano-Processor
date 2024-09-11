----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 09:13:47 PM
-- Design Name: 
-- Module Name: Magnitude_Comparator_4_bit - Behavioral
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

entity Magnitude_Comparator_4_bit is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        Enable : in STD_LOGIC;
        Equal : out STD_LOGIC;
        Greater : out STD_LOGIC;
        Lesser : out STD_LOGIC
    );
end Magnitude_Comparator_4_bit;

architecture Behavioral of Magnitude_Comparator_4_bit is
    signal Equal_signal, Greater_signal, Lesser_signal : STD_LOGIC;
begin

    -- A = B
    Equal_signal <= (A(3) XNOR B(3)) AND (A(2) XNOR B(2)) AND (A(1) XNOR B(1)) AND (A(0) XNOR B(0));

    -- A > B
    Greater_signal <= (A(3) AND NOT(B(3))) OR
                   ((A(3) XNOR B(3)) AND A(2) AND NOT(B(2))) OR
                   ((A(3) XNOR B(3)) AND (A(2) XNOR B(2)) AND A(1) AND NOT(B(1))) OR
                   ((A(3) XNOR B(3)) AND (A(2) XNOR B(2)) AND (A(1) XNOR B(1)) AND A(0) AND NOT(B(0)));

    -- A < B
    Lesser_signal <= (NOT(A(3)) AND B(3)) OR
                  ((A(3) XNOR B(3)) AND NOT(A(2)) AND B(2)) OR
                  ((A(3) XNOR B(3)) AND (A(2) XNOR B(2)) AND NOT(A(1)) AND B(1)) OR
                  ((A(3) XNOR B(3)) AND (A(2) XNOR B(2)) AND (A(1) XNOR B(1)) AND NOT(A(0)) AND B(0));

    -- Output logic
    Equal <= Equal_signal AND Enable;
    Greater <= Greater_signal AND Enable;
    Lesser <= Lesser_signal AND Enable;

end Behavioral;