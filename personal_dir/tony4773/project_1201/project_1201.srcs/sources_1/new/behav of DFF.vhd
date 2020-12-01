----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/12/01 15:12:12
-- Design Name: 
-- Module Name: behav of DFF - Behavioral
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

entity DFF is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
end;

architecture  behav of DFF is --D flip flop 설명
begin
    process (clk, reset)
    begin
        if reset='0' then
            Q<='0';
            
        elsif (clk'event and clk='1') then --상승 edge일떄
            Q<=D;  --입력신호 D가 Q에 그대로 출력
        end if; 
      end process; 
end behav;
