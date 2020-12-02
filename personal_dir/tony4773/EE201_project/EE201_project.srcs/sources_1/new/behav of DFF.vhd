library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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

use work.all;
architecture Behavioral of calcualtor_top is

    signal add_sub : std_logic;

    component EIGHTBIT_ALU
port (EIGHTBIT_ADDER : in STD_LOGIC_VECTOR(7 downto 0); 
);

end component;

component Controller
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           START : in STD_LOGIC;
           LSB : in STD_LOGIC;
           ADD_cmd : out STD_LOGIC;
           SHIFT_cmd : out STD_LOGIC;
           LOAD_cmd : out STD_LOGIC;
           STOP : out STD_LOGIC);
          
end component;

architecture Behavioral of Controller is

signal cnt : std_logic_vector(2 downto 0);


type state_typ is (IDLE, INIT, TEST, ADD, SHIFT);
signal state : state_typ;

begin

process (clk, reset)
    begin
        if reset='0' then
            state <= INIT;
            cnt <="000";
            
        elsif (clk'event and clk='1') then
         case state is
           when INIT =>
            if START ='0' then
                state <=INIT;
            else 
                if LSB ='0' then
                    state <= SHIFT;
                elsif LSB='1' then 
                    state <= ADD;
                end if;
            end if;    
           
           when ADD =>
               state <= SHIFT;
           when SHIFT =>
            if cnt ="111" then
                cnt <= "000";
                state<= IDLE;
            
            else
                cnt <= cnt + 1; 
                state <= INIT;
            end if; 
            
         end case;
         
       end if; 
     
     end process;
     
     STOP <= '1' when state = IDLE else '0';
     ADD_CMD <='1' when state = ADD else '0';
     SHIFT_cmd <='1' when state = SHIFT else '0';
     LOAD_cmd<='1' when state =INIT else '0';
       
end Behavioral;



architecture Behavioral of calculator_top is



begin




