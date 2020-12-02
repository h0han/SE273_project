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


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/11/30 20:34:55
-- Design Name: 
-- Module Name: EIGHTBIT_ADDER - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EIGHTBIT_ADDER is
    Port ( Ain : in STD_LOGIC_VECTOR (7 downto 0);
           Bin : in STD_LOGIC_VECTOR (7 downto 0);
           C : out STD_LOGIC_VECTOR (15 downto 0));
end EIGHTBIT_ADDER;

architecture Behavioral of EIGHTBIT_ADDER is
component ADDER is
     Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

signal c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16 : std_logic;
signal Acon : STD_LOGIC_VECTOR (15 downto 0);
signal Bcon : STD_LOGIC_VECTOR (15 downto 0);

begin

Acon <= (15 downto 8 => '0') & Ain;
--Acon <= (others => '0');
Bcon <= (15 downto 8 => '0') & Bin;
--Bcon <= (others => '0');

--    A16 <= (others => '0');
--    A16(7 downto 0) <= A8;
--    B16 <= (others => '0');
--    B16(7 downto 0) <= B8;
--    C16 <= (others => '0');
--    C16(7 downto 0) <= C8;
    
    A1 : ADDER port map(A => Acon(0), B => Bcon(0), Cin => '0', S => C(0), Cout => c1);
    A2 : ADDER port map(A => Acon(1), B => Bcon(1), Cin => c1, S => C(1), Cout => c2);
    A3 : ADDER port map(A => Acon(2), B => Bcon(2), Cin => c2, S => C(2), Cout => c3);
    A4 : ADDER port map(A => Acon(3), B => Bcon(3), Cin => c3, S => C(3), Cout => c4);
    A5 : ADDER port map(A => Acon(4), B => Bcon(4), Cin => c4, S => C(4), Cout => c5);
    A6 : ADDER port map(A => Acon(5), B => Bcon(5), Cin => c5, S => C(5), Cout => c6);
    A7 : ADDER port map(A => Acon(6), B => Bcon(6), Cin => c6, S => C(6), Cout => c7);
    A8 : ADDER port map(A => Acon(7), B => Bcon(7), Cin => c7, S => C(7), Cout => c8);
    A9 : ADDER port map(A => Acon(8), B => Bcon(8), Cin => c8, S => C(8), Cout => c9);
    A10 : ADDER port map(A => Acon(9), B => Bcon(9), Cin => c9, S => C(9), Cout => c10);
    A11 : ADDER port map(A => Acon(10), B => Bcon(10), Cin => c10, S => C(10), Cout => c11);
    A12 : ADDER port map(A => Acon(11), B => Bcon(11), Cin => c11, S => C(11), Cout => c12);
    A13 : ADDER port map(A => Acon(12), B => Bcon(12), Cin => c12, S => C(12), Cout => c13);
    A14 : ADDER port map(A => Acon(13), B => Bcon(13), Cin => c13, S => C(13), Cout => c14);
    A15 : ADDER port map(A => Acon(14), B => Bcon(14), Cin => c14, S => C(14), Cout => c15);
    A16 : ADDER port map(A => Acon(15), B => Bcon(15), Cin => c15, S => C(15), Cout => c16); 

end Behavioral;

