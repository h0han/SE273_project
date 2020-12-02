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

component EIGHTBIT_ADDER is
    Port ( Ain : in std_logic_vector;
            Bin : in std_logic_vector;
            C : out std_logic_vector );
end component;

--signal cnt : std_logic_vector(3 downto 0);
signal A : std_logic_vector(7 downto 0);
signal B : std_logic_vector(7 downto 0);
signal C_temp : std_logic_vector(15 downto 0);
<<<<<<< HEAD

=======
signal op_code : std_logic_vector(2 downto 0);
>>>>>>> 9f881404852e3b8f6847682d22899b1450dea088
type state_type is (IDLE, INIT, OP);
signal state : state_type;
constant CLK_period : time := 10ms;

begin

UUT : EIGHTBIT_ADDER port map(Ain => A, Bin => B, C => C_temp);

stim_proc : process
begin
<<<<<<< HEAD
`       OP_CODE <= "001";
        A <= "00000110";
        B <= "00001101";
    wait for CLK_period*10;
        A <= "11111010";
        B <= "00001101";
    wait for CLK_period*10;
        A <= "00000110";
        B <= "11110011";
    wait for CLK_period*10;
        A <= "11111010";
        B <= "11110011";
=======
        OP_CODE <= "001";
        A <= "00001111";
        B <= "00001111";
    wait for CLK_period*10;
        OP_CODE <= "010";
        A <= "00001111";
        B <= "00001111";
    wait for CLK_period*10;
        OP_CODE <= "100";
        A <= "00001111";
        B <= "00001111";
    wait for CLK_period*10;
        OP_CODE <= "100";
        A <= "00000000";
        B <= "00001111";
>>>>>>> 9f881404852e3b8f6847682d22899b1450dea088
    wait for CLK_period*10;        
end process;
end tb;
