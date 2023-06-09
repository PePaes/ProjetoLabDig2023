library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Timer_60s is
    port (
        clk_50MHz : in std_logic; -- Sinal de entrada do clock de 50 MHz
        reset : in std_logic;
        timeout : out std_logic
    );
end entity Timer_60s;

architecture Behavioral of Timer_60s is
    constant TIMEOUT_VALUE : natural := 50_000_000 * 60; -- Valor de contagem para 60 segundos

    signal count : unsigned(31 downto 0); -- Contador interno
    signal timeout_flag : std_logic := '0'; -- Flag para indicar timeout

begin
    process(clk_50MHz)
    begin
        if rising_edge(clk_50MHz) then
            if reset = '1' then
                count <= (others => '0'); -- Reinicia o contador em caso de reset
                timeout_flag <= '0'; -- Reinicia a flag de timeout
            else
                if count = TIMEOUT_VALUE - 1 then
                    count <= count + 1;
                    timeout_flag <= '1'; -- Seta a flag de timeout quando atingir o valor máximo
                elsif count < TIMEOUT_VALUE - 1 then
                    count <= count + 1;
                end if;
            end if;
        end if;
    end process;

    timeout <= timeout_flag;

end architecture Behavioral;