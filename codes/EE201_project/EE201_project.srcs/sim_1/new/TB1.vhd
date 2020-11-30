library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testBench is
--  Port ( );
end testBench;

architecture tb of testBench is
component EIGHTBIT_ADDER is
  port (
--    SYS_RESET_B           : in std_logic;
--    SYS_CLK               : in std_Logic;
--    START                 : in std_logic;
--    OP_CODE               : in std_logic_vector(2 downto 0);
    Ain                   : in std_logic_vector(7 downto 0);
    Bin                   : in std_logic_vector(7 downto 0);
    C                     : out std_logic_vector(15 downto 0));
--    END_OP                : out std_logic
end component;

--signal RESET : std_logic := '0';
--signal CLK : std_logic := '0';
--signal ST : std_logic := '1';
--signal OP : std_logic_vector(2 downto 0);
--signal Acon : std_logic_vector(15 downto 0) := (others => '0');
--signal Bcon : std_logic_vector(15 downto 0) := (others => '0');
--signal c1: std_logic := '0';
--signal c2: std_logic := '0';
--signal c3: std_logic := '0';
--signal c4: std_logic := '0';
--signal c5: std_logic := '0';
--signal c6: std_logic := '0';
--signal c7: std_logic := '0';
--signal c8: std_logic := '0';
--signal c9: std_logic := '0';
--signal c10: std_logic := '0';
--signal c11: std_logic := '0';
--signal c12: std_logic := '0';
--signal c13: std_logic := '0';
--signal c14: std_logic := '0';
--signal c15: std_logic := '0';
--signal c16: std_logic := '0';
signal EOP : std_logic := '1';
signal Ain : std_logic_vector(7 downto 0) := (others => '0');
signal Bin : std_logic_vector(7 downto 0) := (others => '0');
signal C : std_logic_vector(15 downto 0) := (others => '0');

constant CLK_period : time := 10ms;

begin

UUT : EIGHTBIT_ADDER port map( 
--    SYS_RESET_B => RESET, 
--    SYS_CLK => CLK,
--    START => ST, 
--    OP_CODE => OP,
    Ain => Ain, Bin => Bin,
    C => C );
--    C(0) => c1, C(1) => c2, C(2) => c3, C(3) => c4,
--    C(4) => c5, C(5) => c6, C(6) => c7, C(7) => c8,
--    C(8) => c9, C(9) => c10, C(10) => c11, C(11) => c12, 
--    C(12) => c13, C(13) => c14, C(14) => c15, C(15) => c16); 
--    END_OP => EOP
--CLK <= not CLK after CLK_period/2;

stim_proc : process
begin
--    RESET <= '0';
--    wait for CLK_period*10;
--        RESET <= '1';
--    wait for CLK_period*10;
        Ain <= "00000110";
        Bin <= "00001101";
    wait for CLK_period*10;
        Ain <= "11111010";
        Bin <= "00001101";
    wait for CLK_period*10;
        Ain <= "00000110";
        Bin <= "11110011";
    wait for CLK_period*10;
        Ain <= "11111010";
        Bin <= "11110011";
    wait for CLK_period*10;        
end process;
end tb;
