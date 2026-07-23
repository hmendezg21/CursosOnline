library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador is
    Port (
        clk     : in  STD_LOGIC;
		clk_out : buffer STD_LOGIC;
        reset   : in  STD_LOGIC;
        up_down : in  STD_LOGIC;

        Q       : out STD_LOGIC_VECTOR(3 downto 0);
        seg     : out STD_LOGIC_VECTOR(6 downto 0) --abcdefg
    );
end contador;


architecture Behavioral of contador is
	signal pulso : STD_LOGIC := '0';
    signal count : unsigned(3 downto 0) := "0000";
	signal counter_max 	: integer range 0 to 10 := 0; --150000 para 60Hz

begin


    -- Contador ascendente / descendente
    process(clk, clk_out, reset)
    begin
			-------- if clk ---------------------------
			if reset = '1' then
				count <= "0000";
			else
				if clk'event and clk = '1' then
					if counter_max = 1 then
							pulso <= NOT(pulso);
							counter_max <= 0;
					else
							counter_max <= counter_max + 1;
					end if;
				end if;
				clk_out <= pulso;
				-------- end if clk -----------------------

				-------- if clk_out -----------------------
				if clk_out'event and clk_out = '1' then
					-------- if up/down --------------------
					if up_down = '0' then
						 -- Ascendente 0 a 15
						 if count = 15 then
							  count <= "0000";
						 else
							  count <= count + 1;
						 end if;

					else
						 -- Descendente 15 a 0
						 if count = 0 then
							  count <= "1111";
						 else
							  count <= count - 1;
						 end if;
					end if;
					-------- end if up/down ----------------
				end if;
				-------- end if clk_out -------------------
			end if;
    end process;


    Q <= STD_LOGIC_VECTOR(count);


    -- Decodificador hexadecimal a 7 segmentos
    -- Display cátodo común
    -- Orden: abcdefg

    process(count)
    begin

        case count is

            when "0000" => seg <= "1111110"; -- 0
            when "0001" => seg <= "0110000"; -- 1
            when "0010" => seg <= "1101101"; -- 2
            when "0011" => seg <= "1111001"; -- 3
            when "0100" => seg <= "0110011"; -- 4
            when "0101" => seg <= "1011011"; -- 5
            when "0110" => seg <= "1011111"; -- 6
            when "0111" => seg <= "1110000"; -- 7
            when "1000" => seg <= "1111111"; -- 8
            when "1001" => seg <= "1111011"; -- 9

            when "1010" => seg <= "1110111"; -- A
            when "1011" => seg <= "0011111"; -- b
            when "1100" => seg <= "1001110"; -- C
            when "1101" => seg <= "0111101"; -- d
            when "1110" => seg <= "1001111"; -- E
            when "1111" => seg <= "1000111"; -- F

            when others =>
                seg <= "0000000";

        end case;

    end process;


end Behavioral;
