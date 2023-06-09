library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Points_Counter is
    port (
        hit : in std_logic;
        reset : in std_logic;
        mole_active : in std_logic;
        points : out std_logic_vector(7 downto 0)
    );
end entity Points_Counter;

architecture Behavioral of Points_Counter is
    signal score : unsigned(7 downto 0);

begin
    process (reset, hit, mole_active)
    begin
        if reset = '1' then
            score <= (others => '0');
        elsif hit = '1' and mole_active = '1' then
            score <= score + 1;
        end if;
    end process;

    points <= std_logic_vector(score);

end architecture Behavioral;