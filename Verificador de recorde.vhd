entity Record_Verifier is
    port (
        points : in std_logic_vector(7 downto 0);
        record_score : in std_logic_vector(7 downto 0);
        record_updated : out std_logic
    );
end entity Record_Verifier;

architecture Behavioral of Record_Verifier is

begin
    process (points, record_score)
    begin
        if points > unsigned(record_score) then
            record_updated <= '1';
        else
            record_updated <= '0';
        end if;
    end process;

end architecture Behavioral;