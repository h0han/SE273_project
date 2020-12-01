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
            C : out std_logic_vector );
end component;
        
-- contents will be here

signal cnt : std_logic_vector(3 downto 0);
signal A : std_logic_vector(7 downto 0);
signal B : std_logic_vector(7 downto 0);
signal C_temp : std_logic_vector(15 downto 0);

type state_type is (IDLE, INIT, OP);
signal state : state_type;


begin

result : EIGHTBIT_ADDER port map(Ain => A, Bin => B, C => C_temp);

process(sys_clk, sys_reset_b)
    begin
    if sys_reset_b = '0' then
        state <= idle;
        A <= "00000000";
        B <= "00000000";
--        cnt <= "0000";
        
    elsif (rising_edge (sys_clk)) then
        case state is
            when idle =>
                if start = '0' then
                    state <= idle;
                elsif start = '1' then
                    state <= init;
                end if;
                                
            when init =>
                if op_code = "001" then
                    C_temp <= (others => '0');
                    
                elsif op_code = "010" then
                    C_temp(0) <= '1';
                    C_temp <= (others => '0');
                    
                elsif op_code = "100" then
                    C_temp <= (others => '0');
                else
                    state <= idle;
                end if;
                
        end case;
                    
    end if;
                
end process;        
            
--process(SYS_CLK, SYS_RESET_B)
--    begin
--    -- contents will be here
--    if SYS_RESET_B = '0' then
--        state <= INIT;
--        cnt <= "0000";

--    elsif (rising_edge(sys_clk)) then
--        case state is
--            when INIT =>
--                if START = '0' then
--                    state <= INIT;
--                elsif START = '1' then
--                    if op_code = "001" then
--                        Cin
                
--                    if LSB = '0' then
--                        state <= SHIFT;
--                    elsif LSB = '1' then
--                        state <= ADD;
--                    end if;
--                else
--                    END_OP <= '1';
--                end if;
--            when ADD =>
--                state <= SHIFT;
--            when SHIFT =>
--                if cnt = "111" then
--                    state <= INIT;
--                    START <= '-1';
--                    cnt <= "000";
--                else
--                    state <= INIT;
--                    cnt <= cnt + 1;
--                end if;
                
--            end case;
            
--        end if;
        
--    end process;


end Behavioral; 
