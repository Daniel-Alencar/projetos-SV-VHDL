library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_mux4x1_8bit is
end entity;

architecture sim of tb_mux4x1_8bit is
    signal sel : std_logic_vector(1 downto 0) := "00";
    signal a, b, c, d : std_logic_vector(7 downto 0);
    signal y_case, y_if, y_when, y_with : std_logic_vector(7 downto 0);
begin

    -- Instancia diretamente a entidade
    dut: entity work.mux4x1_8bit
        port map (
            sel     => sel,
            a       => a,
            b       => b,
            c       => c,
            d       => d,
            y_case  => y_case,
            y_if    => y_if,
            y_when  => y_when,
            y_with  => y_with
        );

    -- Processo de estímulo
    stimulus_proc: process
    begin
        -- Valores distintos para entradas
        a <= x"11";  -- 00010001
        b <= x"22";  -- 00100010
        c <= x"33";  -- 00110011
        d <= x"44";  -- 01000100

        -- Testa todas as combinações de sel (00 a 11)
        for i in 0 to 3 loop
            sel <= std_logic_vector(to_unsigned(i, 2));
            wait for 10 ns;
        end loop;

        -- Espera indefinidamente
        wait;
    end process;

end architecture;
