library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is
    port (clk, rst, start : in std_logic;
    m, n, s : in std_logic_vector(3 downto 0);
    s_addr : out std_logic_vector(3 downto 0);
    y : out std_logic_vector(7 downto 0));
end toplevel;

architecture rtl of toplevel is
component dp is
    port (clk, rst, wr, i_ld, j_ld, sel : in std_logic;
    m, n, s : in std_logic_vector(3 downto 0);
    x1, x2 : out std_logic;
    s_addr : out std_logic_vector(3 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component ctrl is
   port(clk,rst, start, x1, x2: in std_logic;
        wr, i_ld, j_ld, sel: out std_logic);
end component;
signal wr, sel, i_ld, j_ld, x1, x2 : std_logic;
begin
    datapath : dp port map (clk, rst, wr, i_ld, j_ld, sel, m, n, s, x1, x2, s_addr, y);
    control : ctrl port map (clk, rst, start, x1, x2, wr, i_ld, j_ld, sel);
end rtl;