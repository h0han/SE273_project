----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/12/01 17:10:09
-- Design Name: 
-- Module Name: NAND_2 - Behavioral
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

entity NAND_2 is
    Port ( IN1 : in STD_LOGIC;
           IN2 : in STD_LOGIC;
           OUT1 : out STD_LOGIC);
end NAND_2;

architecture Behavioral of NAND_2 is

begin
    OUT1 <= NOT(IN1 AND IN2);

end Behavioral;
