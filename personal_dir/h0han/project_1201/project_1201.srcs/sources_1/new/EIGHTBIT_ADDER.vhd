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
    Port ( Ain : in STD_LOGIC_VECTOR (15 downto 0);
           Bin : in STD_LOGIC_VECTOR (15 downto 0);
           oper : in STD_LOGIC;
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

signal b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16 : std_logic;
signal c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16 : std_logic;

begin



b1 <= Bin(0) xor oper;
b2 <= Bin(1) xor oper;
b3 <= Bin(2) xor oper;
b4 <= Bin(3) xor oper;
b5 <= Bin(4) xor oper;
b6 <= Bin(5) xor oper;
b7 <= Bin(6) xor oper;
b8 <= Bin(7) xor oper;
b9 <= Bin(8) xor oper;
b10 <= Bin(9) xor oper;
b11 <= Bin(10) xor oper;
b12 <= Bin(11) xor oper;
b13 <= Bin(12) xor oper;
b14 <= Bin(13) xor oper;
b15 <= Bin(14) xor oper;
b16 <= Bin(15) xor oper;
    
    A1 : ADDER port map(A => Ain(0), B => b1, Cin => oper, S => C(0), Cout => c1);
    A2 : ADDER port map(A => Ain(1), B => b2, Cin => c1, S => C(1), Cout => c2);
    A3 : ADDER port map(A => Ain(2), B => b3, Cin => c2, S => C(2), Cout => c3);
    A4 : ADDER port map(A => Ain(3), B => b4, Cin => c3, S => C(3), Cout => c4);
    A5 : ADDER port map(A => Ain(4), B => b5, Cin => c4, S => C(4), Cout => c5);
    A6 : ADDER port map(A => Ain(5), B => b6, Cin => c5, S => C(5), Cout => c6);
    A7 : ADDER port map(A => Ain(6), B => b7, Cin => c6, S => C(6), Cout => c7);
    A8 : ADDER port map(A => Ain(7), B => b8, Cin => c7, S => C(7), Cout => c8);
    A9 : ADDER port map(A => Ain(8), B => b9, Cin => c8, S => C(8), Cout => c9);
    A10 : ADDER port map(A => Ain(9), B => b10, Cin => c9, S => C(9), Cout => c10);
    A11 : ADDER port map(A => Ain(10), B => b11, Cin => c10, S => C(10), Cout => c11);
    A12 : ADDER port map(A => Ain(11), B => b12, Cin => c11, S => C(11), Cout => c12);
    A13 : ADDER port map(A => Ain(12), B => b13, Cin => c12, S => C(12), Cout => c13);
    A14 : ADDER port map(A => Ain(13), B => b14, Cin => c13, S => C(13), Cout => c14);
    A15 : ADDER port map(A => Ain(14), B => b15, Cin => c14, S => C(14), Cout => c15);
    A16 : ADDER port map(A => Ain(15), B => b16, Cin => c15, S => C(15), Cout => c16); 

end Behavioral;
