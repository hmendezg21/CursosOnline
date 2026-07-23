library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contador01 is
    Port (
        clk    	: in  STD_LOGIC;  -- Señal de reloj
        clk_1seg  : buffer STD_LOGIC;  -- Salida de reloj
		  count  	: out STD_LOGIC_VECTOR (3 downto 0)  -- Salida del contador
    );
end contador01;

-- Arquitectura del contador de 4 bits
architecture Behavioral of contador01 is
	 signal pulso			: STD_LOGIC := '0';
	 signal counter_reg 	: STD_LOGIC_VECTOR (3 downto 0);
	 signal counter_max 	: integer range 0 to 150000 := 0;
	 
begin
	 -- proceso para generar un timer de 1seg con entrada de 60Hz
    process(clk, clk_1seg)
	 begin
		  if clk'event and clk = '1' then
				if counter_max = 150000 then
						pulso <= NOT(pulso);
						counter_max <= 0;
				else
						counter_max <= counter_max + 1;
				end if;
			end if;
	 clk_1seg <= pulso;
	 
	 -- proceso para generar uncontador de 4 bits
 	 if clk_1seg'event and clk_1seg = '1' then
			if counter_reg = "1001" then
						counter_reg <= "0000";
				else
						counter_reg <= counter_reg + 1;
				end if;
		end if;
	 count <= counter_reg;
	 end process;
end Behavioral;
		  
