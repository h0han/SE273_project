library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity calculator_top is
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
end calculator_top;

architecture Behavioral of calculator_top is
component EIGHTBIT_ADDER is
    Port ( Ain : in std_logic_vector;
            Bin : in std_logic_vector;
            oper : in std_logic;
            C : out std_logic_vector );
end component;
        
-- contents will be here

signal A_temp : std_logic_vector(15 downto 0);
signal B_temp : std_logic_vector(15 downto 0);
signal C_temp : std_logic_vector(15 downto 0);
signal end_op_temp : std_logic;
signal add_sub : std_logic;
signal Acon : std_logic_vector(15 downto 0);
signal Bcon : std_logic_vector(15 downto 0);

type state_type is (IDLE, INIT, OP);
signal state : state_type;


begin

Acon <= (15 downto 8 => DATA_A(7)) & DATA_A;
Bcon <= (15 downto 8 => DATA_B(7)) & DATA_B;

result : EIGHTBIT_ADDER port map(Ain => A_temp, Bin => B_temp, C => C_temp , oper => add_sub);

process(sys_clk, sys_reset_b)
    begin
    if sys_reset_b = '0' then
        end_op_temp <= '0';
        A_temp <= (others => '0');
        B_temp <= (others => '0');
--        C_temp <= (others => '0');
        add_sub <= '0';
        state <= init;
        if start = '0' then
            state <= init;
        end if;
        
    elsif (rising_edge (sys_clk)) then
        case state is
--            when idle =>
--                if start = '0' then
--                    state <= idle;
--                elsif start = '1' then
--                    state <= init;
--                else
--                    state <= idle;
--                end if;
                                
            when init =>
                if start = '1' then
                    if op_code = "001" then
                        end_op_temp <= '1';
                        A_temp <= Acon;
                        B_temp <= Bcon;
                        add_sub <= '0';
                        state <= init;
                                            
                    elsif op_code = "010" then
                        end_op_temp <= '1';
                        A_temp <= Acon;
                        B_temp <= Bcon;
                        add_sub <= '1';
                        state <= init;
                        
                    elsif op_code = "100" then
                        end_op_temp <= '1';
                        A_temp <= Acon;
                        B_temp <= Bcon;
                        add_sub <= '0';
                    else
                        state <= init;
                    end if;
                end if;
            when others => NULL;            
        end case;
                    
    end if;
                
end process;        

DATA_C <= C_temp;
END_OP <= end_op_temp;

end Behavioral; 
