library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuito is
    Port (
        A      : in  STD_LOGIC;
        B      : in  STD_LOGIC;
        Y1  	: out STD_LOGIC;
        Y2		: out STD_LOGIC
		  
     );
end circuito;

architecture Behavioral of circuito is
begin

    -- Salida SUMA
    Y1 <= A AND (NOT A);

    -- Salida CARRY
    Y2 <= (NOT A AND B) OR (A AND B);
    

end Behavioral;
