library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testBench is
--  Port ( );
end testBench;

architecture tb of testBench is
component EIGHTBIT_ADDER is
  port (
    Ain                   : in std_logic_vector(15 downto 0);
    Bin                   : in std_logic_vector(15 downto 0);
    oper                  : in std_logic;
    C                     : out std_logic_vector(15 downto 0));

end component;

signal EOP : std_logic := '1';
signal Ain : std_logic_vector(15 downto 0) := (others => '0');
signal Bin : std_logic_vector(15 downto 0) := (others => '0');
signal C : std_logic_vector(15 downto 0) := (others => '0');
signal oper : std_logic := '0';

constant CLK_period : time := 10ms;

begin

UUT : EIGHTBIT_ADDER port map( 
    Ain => Ain, 
    Bin => Bin,
    oper => oper,
    C => C );

stim_proc : process
begin
        Ain <= "00000110";
        Bin <= "00001101";
        oper <= '0';
    wait for CLK_period*10;
        Ain <= "11111010";
        Bin <= "00001101";
        oper <= '0';
    wait for CLK_period*10;
        Ain <= "00000110";
        Bin <= "11110011";
        oper <= '0';
    wait for CLK_period*10;
        Ain <= "11111010";
        Bin <= "11110011";
        oper <= '0';
    wait for CLK_period*10;        
end process;
end tb;
