library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decodificador is
    Port (
        DCBA 		: in  STD_LOGIC_VECTOR(3 downto 0);
        DISPLAY 	: out STD_LOGIC_VECTOR(6 downto 0)  -- gfedcba
    );
end Decodificador;

architecture Behavioral of Decodificador is
begin

    process(DCBA)
    begin
        case DCBA is
            when "0000" => DISPLAY <= "0111111"; -- 0
            when "0001" => DISPLAY <= "0000110"; -- 1
            when "0010" => DISPLAY <= "1011011"; -- 2
            when "0011" => DISPLAY <= "1001111"; -- 3
            when "0100" => DISPLAY <= "1100110"; -- 4
            when "0101" => DISPLAY <= "1101101"; -- 5
            when "0110" => DISPLAY <= "1111101"; -- 6
            when "0111" => DISPLAY <= "0000111"; -- 7
            when "1000" => DISPLAY <= "1111111"; -- 8
            when "1001" => DISPLAY <= "1101111"; -- 9

            -- Apagar display para valores no válidos
            when others => DISPLAY <= "0000000";
        end case;
    end process;

end Behavioral;
