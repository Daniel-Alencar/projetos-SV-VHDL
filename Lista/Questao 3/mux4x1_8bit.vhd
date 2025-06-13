library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux4x1_8bit is
    Port (
        sel : in std_logic_vector(1 downto 0);
        a, b, c, d : in std_logic_vector(7 downto 0);
        y_case     : out std_logic_vector(7 downto 0);
        y_if       : out std_logic_vector(7 downto 0);
        y_when     : out std_logic_vector(7 downto 0);
        y_with     : out std_logic_vector(7 downto 0)
    );
end mux4x1_8bit;

architecture use_case of mux4x1_8bit is
begin
    process(sel, a, b, c, d)
    begin
        case sel is
            when "00" => y_case <= a;
            when "01" => y_case <= b;
            when "10" => y_case <= c;
            when others => y_case <= d;
        end case;
    end process;
end use_case;

architecture use_if of mux4x1_8bit is
begin
    process(sel, a, b, c, d)
    begin
        if sel = "00" then
            y_if <= a;
        elsif sel = "01" then
            y_if <= b;
        elsif sel = "10" then
            y_if <= c;
        else
            y_if <= d;
        end if;
    end process;
end use_if;

architecture use_when of mux4x1_8bit is
begin
    y_when <= a when sel = "00" else
              b when sel = "01" else
              c when sel = "10" else
              d;
end use_when;

architecture use_with of mux4x1_8bit is
begin
    with sel select
        y_with <= a when "00",
                  b when "01",
                  c when "10",
                  d when others;
end use_with;

