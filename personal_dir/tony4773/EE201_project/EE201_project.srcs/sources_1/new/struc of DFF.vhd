----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/12/01 15:19:20
-- Design Name: 
-- Module Name: struc of DFF - struc of DFF
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

architecture  struc of DFF is

signal NAND_temp : std_logic_vector(6 downto 1); --NAND 6°³

component NAND_2
    port (
            IN1 : in std_logic;
            IN2 : in std_logic;
            OUT1 : out std_logic
            );
            
end component; 

component NAND_3
    port (
            IN1 : in std_logic;
            IN2 : in std_logic;
            IN3 : in std_logic;
            OUT1 : out std_logic
            );
end component;   

begin

NAND1 : NAND_2 port map (NAND_temp(4), NAND_temp(2), NAND_temp(1));
NAND2 : NAND_3 port map (NAND_temp(1), clk, reset, NAND_temp(2));
NAND3 : NAND_3 port map (NAND_temp(2), clk, NAND_temp(4), NAND_temp(3));
NAND4 : NAND_3 port map (NAND_temp(3), D, reset, NAND_temp(4));
NAND5 : NAND_2 port map (NAND_temp(2), NAND_temp(6), NAND_temp(5));
NAND6 : NAND_3 port map (NAND_temp(5), NAND_temp(3), reset, NAND_temp(6)); 

Q <=NAND_temp(5);         

end struc;
