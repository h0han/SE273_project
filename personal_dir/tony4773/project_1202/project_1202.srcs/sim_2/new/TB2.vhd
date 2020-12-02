library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testBench is
--  Port ( );
end testBench;

architecture tb of testBench is
component calculator_top is
  port (
    SYS_RESET_B           : in std_logic;
    SYS_CLK               : in std_Logic;

    START                 : in std_logic;
    OP_CODE               : in std_logic_vector(2 downto 0);

    DATA_A                : in std_logic_vector(7 downto 0);
    DATA_B                : in std_logic_vector(7 downto 0);

    DATA_C                : out std_logic_vector(15 downto 0);
    END_OP                : out std_logic
);
end component;


--signal cnt : std_logic_vector(3 downto 0);
signal sys_reset_b : std_logic := '0';
signal sys_clk : std_logic := '0';
signal start : std_logic := '0';
signal op_code : std_logic_vector(2 downto 0) := (others => '0');
signal data_a : std_logic_vector(7 downto 0) := (others => '0');
signal data_b : std_logic_vector(7 downto 0) := (others => '0');
signal data_c : std_logic_vector(15 downto 0) := (others => '0');
signal end_op : std_logic := '0';

constant CLK_period : time := 10ns;

begin

UUT : calculator_top port map(
    sys_reset_b => sys_reset_b,
    sys_clk => sys_clk,
    START => START,
    OP_CODE => OP_CODE,
    DATA_A => DATA_A,
    DATA_B => DATA_B,
    DATA_C => DATA_C,
    END_OP => END_OP);

clk_process :process
begin
    sys_clk <= '0';
    wait for clk_period/2;
    sys_clk <= '1';
    wait for clk_period/2;
end process;

stim_proc : process
begin
    wait for CLK_period*10;
        sys_reset_b <= '1';
        OP_CODE <= "001";
        DATA_A <= "00001111";
        DATA_B <= "00001111";
        start <= '1';
        
    wait for CLK_period*10;
        OP_CODE <= "001";
        DATA_A <= "00001111";
        DATA_B <= "00001111";
        start <= '1';
        
    wait for CLK_period*10;
        OP_CODE <= "010";
        DATA_A <= "00001111";
        DATA_B <= "00001111";
        start <= '1';
        
    wait for CLK_period*10;
        OP_CODE <= "010";
        DATA_A <= "00000000";
        DATA_B <= "00001111";
        start <= '1';
        
    wait for CLK_period*10;
        OP_CODE <= "100";
        DATA_A <= "00001111";
        DATA_B <= "00001111";
        start <= '1';    
        
    wait for CLK_period*10;        
end process;
end tb;
