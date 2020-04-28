library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb is
end tb ;

architecture behav of tb is
  constant clockperiod: time:= 0.1 ns;
  signal clk: std_logic:='0';
  signal rst,start: std_logic;
  signal n, m, s, s_addr : std_logic_vector(3 downto 0);
  signal y : std_logic_vector (7 downto 0);
  component toplevel
    port (clk, rst, start : in std_logic;
    m, n, s : in std_logic_vector(3 downto 0);
    s_addr : out std_logic_vector(3 downto 0);
    y : out std_logic_vector(7 downto 0));
  end component ;
  component s_rom is
port(
addr : in std_logic_vector(3 downto 0);
dout : out std_logic_vector(3 downto 0));
end component;
  begin
    clk <= not clk after clockperiod /2;
    rst <= '1' , '0' after 0.1 ns;
    start <= '0' , '1' after 0.1 ns, '0' after 0.5 ns;
    n <= "0100";
    m <= "0011";
    dut: toplevel port map(clk,rst,start, m, n, s, s_addr, y);
    dut2 : s_rom port map (s_addr, s);
  end behav;