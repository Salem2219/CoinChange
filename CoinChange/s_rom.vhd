library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity s_rom is
port(
addr : in std_logic_vector(3 downto 0);
dout : out std_logic_vector(3 downto 0));
end s_rom;
architecture rtl of s_rom is
type ram_type is array (0 to 15) of
std_logic_vector(3 downto 0);
signal program: ram_type := (
    "0001", "0010", "0011", "0000","0000","0000","0000","0000","0000","0000","0000","0000","0000","0000","0000","0000"

    );
begin
dout <= program(conv_integer(unsigned(addr)));
end rtl;