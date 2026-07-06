library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compuertas is
    Port (
        A      : in  STD_LOGIC;
        B      : in  STD_LOGIC;
        Y1  	: out STD_LOGIC;
        Y2 		: out STD_LOGIC;
        Y3  	: out STD_LOGIC;
        Y4	 	: out STD_LOGIC
    );
end compuertas;

architecture Behavioral of compuertas is
begin

    -- Compuerta NOT
    Y1 <= NOT A;

    -- Compuerta AND
    Y2 <= A AND B;

    -- Compuerta OR
    Y3 <= A OR B;

    -- Compuerta XOR
    Y4 <= A XOR B;

end Behavioral;
