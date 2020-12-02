----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/12/01 22:02:00
-- Design Name: 
-- Module Name: SHIFTADD - Behavioral
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

entity SHIFTADD is
    Port ( clk : in STD_LOGIC;
           Start : in STD_LOGIC;
           DATA_A : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_B : in STD_LOGIC_VECTOR (7 downto 0);
           RESULT_C : out STD_LOGIC_VECTOR (15 downto 0));
           Done: out STD_LOGIC);
end SHIFTADD; --도움이 되고 싶다... 근데 너무 어렵다


architecture Behavioral of SHIFTADD is
    signal cnt : bit(7 downto 0);
   type state_type is (HALT, INIT, Qtemp, ADD, SHIFT);
    signal state : states:= HALT;
   
         
begin

Done <= '1' when state=HALT else '0';


    process(clk)
    begin
        if(rising_edge(clk)) then
            state <=HALT;
        elsif (clk'EVENT and clk='1') then
            case state is
            when start=>
                if start ='1' then
                       state<=INIT;
                elsif start='0' then
                    state<=HALT;
                    
            
            when SHIFT 
                DATA_B 
                if DATA_B(0)='1';
                
                
                
                cnt<= cnt+1
            
            
            
            if cnt=8 then
            
                
            
            when  
                          
            
            --if(clear='1') then
               -- Dinternal <=(others=>'0');
           -- elsif (Load='1') then
            --    Dinternal <=Din;
          --  elsif(Shift ='1') then
               -- Dinternal <=Serln & Dinternal(N=1 downto 1); 
                
            end if; 
         end if; 
      end process; 
      
      Dout<=Dinternal;
      
      end behavioral; d
    process(clk)
    begin
        if rising_edge(Clk) then
        case state is
            when HaltS => if Start = '1' then
                            state <- InitS;
                            end if; 
            when InitS => state<= QtempS; 
            when QtempS => if(Q0='1') then
                            state <=AddS; 
                           else
                            state <=ShiftS; 
                           end if; 
            when Adds => state<=ShiftS; 
            when ShiftS => if
                cnt=cnt+1;
              
        
   
   


end Behavioral;
