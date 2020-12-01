----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/12/01 14:44:58
-- Design Name: 
-- Module Name: Controller - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Controller is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           START : in STD_LOGIC;
           LSB : in STD_LOGIC;
           ADD_cmd : out STD_LOGIC;
           SHIFT_cmd : out STD_LOGIC;
           LOAD_cmd : out STD_LOGIC;
           STOP : out STD_LOGIC);
end Controller;

architecture Behavioral of Controller is

signal temp_count : std_logic_vector(2 downto 0);
--signal counter : std_logic_vector(0 downto 0);

type state_typ is (IDLE, INIT, TEST, ADD, SHIFT);
signal state : state_typ;

begin

process (clk, reset)
    begin
        if reset='0' then
            state <= INIT;
            temp_count <="000";
            
        elsif (clk'event and clk='1') then
         case state is
           when INIT =>
            if START ='0' then
                state <=INIT;
            else 
                if LSB ='0' then
                    state <= SHIFT;
                else 
                    state <= ADD;
                end if;
            end if;    
           
           when ADD =>
               state <= SHIFT;
           when SHIFT =>
            if temp_count ="111" then
                temp_count <= "000";
                state<= IDLE;
            else
                temp_count <= temp_count + 1; 
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
