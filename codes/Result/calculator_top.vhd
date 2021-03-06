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
signal shf_aone : std_logic_vector(15 downto 0);
signal shf_bone : std_logic_vector (15 downto 0);
signal shf_atwo : std_logic_vector(15 downto 0);
signal shf_btwo : std_logic_vector (15 downto 0);
signal shf_athree : std_logic_vector(15 downto 0);
signal shf_bthree : std_logic_vector (15 downto 0);
signal shf_afour : std_logic_vector(15 downto 0);
signal shf_bfour : std_logic_vector (15 downto 0);
signal shf_afive : std_logic_vector(15 downto 0);
signal shf_bfive : std_logic_vector (15 downto 0);
signal shf_asix : std_logic_vector(15 downto 0);
signal shf_bsix : std_logic_vector (15 downto 0);
signal shf_aseven : std_logic_vector(15 downto 0);
signal shf_bseven : std_logic_vector (15 downto 0);
signal shf_aeight : std_logic_vector(15 downto 0);
signal shf_beight : std_logic_vector (15 downto 0);
signal shf_anine : std_logic_vector(15 downto 0);
signal shf_bnine : std_logic_vector (15 downto 0);
signal shf_aten : std_logic_vector(15 downto 0);
signal shf_bten : std_logic_vector (15 downto 0);
signal shf_aeleven : std_logic_vector(15 downto 0);
signal shf_beleven : std_logic_vector (15 downto 0);
signal shf_atwelve : std_logic_vector(15 downto 0);
signal shf_btwelve : std_logic_vector (15 downto 0);
signal shf_athirteen : std_logic_vector(15 downto 0);
signal shf_bthirteen : std_logic_vector (15 downto 0);
signal shf_afourteen : std_logic_vector(15 downto 0);
signal shf_bfourteen : std_logic_vector (15 downto 0);
signal shf_afifteen : std_logic_vector(15 downto 0);
signal shf_bfifteen : std_logic_vector (15 downto 0);


type state_type is  (INIT, OP, s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16);
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
        add_sub <= '0';
        shf_aone <= (others => '0');
        shf_bone <= (others => '0');
        shf_atwo <= (others => '0');
        shf_btwo <= (others => '0');
        shf_athree <= (others => '0');
        shf_bthree <= (others => '0');
        shf_afour <= (others => '0');
        shf_bfour <= (others => '0'); 
        shf_afive <= (others => '0');
        shf_bfive <= (others => '0');
        shf_asix <= (others => '0');
        shf_bsix <= (others => '0');
        shf_aseven <= (others => '0');
        shf_bseven <= (others => '0');
        shf_aeight <= (others => '0'); 
        shf_beight<= (others => '0'); 
        shf_anine <= (others => '0');
       shf_bnine <= (others => '0');
        shf_aten <= (others => '0');
        shf_bten <= (others => '0');
        shf_aeleven <= (others => '0');
        shf_beleven <= (others => '0');
        shf_atwelve <= (others => '0');
       shf_btwelve <= (others => '0');
        shf_athirteen<= (others => '0');
       shf_bthirteen <= (others => '0');
        shf_afourteen<= (others => '0');
        shf_bfourteen <= (others => '0');
       shf_afifteen<= (others => '0');
        shf_bfifteen<= (others => '0');
        state <= init;
--        DATA_C <= C_temp;

         if start = '0' then
          state <= init;
         end if; 
        
    elsif (rising_edge (sys_clk)) then
        case state is
                     
            when init =>
                A_temp <= (others => '0');
                        B_temp <= (others => '0');
                 if start = '1' then
                    if op_code = "001" then
                        end_op_temp<='1';
                        A_temp <= Acon;
                        B_temp <= Bcon;
                        add_sub <= '0';
                        state <= init;
                                                                
                    elsif op_code = "010" then
                        end_op_temp<='1';
                        A_temp <= Acon;
                        B_temp <= Bcon;
                        add_sub <= '1';
                        state <= init;
                                                            
                    elsif op_code = "100" then
                        end_op_temp<='0';
                       -- A_temp <= (others => '0');
                        --B_temp <= (others => '0');
                        add_sub <= '0';
                        state <= s1;
  
                    else
                        state <= init;
                    end if;
                end if;
             
             when s1 => 
                if Bcon(0)='0' then
                   A_temp<= (others => '0');
                   B_temp <= (others => '0');                 
                  
                  shf_aone(15 downto 1) <= Acon(14 downto 0);
                  shf_aone(0)<='0';
                  shf_bone(14 downto 0) <= Bcon(15 downto 1);
                  shf_bone(15)<='0';
                  
                elsif Bcon(0)='1' then
                   A_temp<= (others => '0');
                   B_temp<=Acon;
                   
                   
                  shf_aone(15 downto 1) <= Acon(14 downto 0);
                  shf_aone(0)<='0';
                  shf_bone(14 downto 0) <= Bcon(15 downto 1);
                  shf_bone(15)<='0';
                  end if;
                  state<=s2;
                  
              when s2 => 
               if Bcon(1)='0' then
                    A_temp<=C_temp;
                   B_temp <= (others => '0');
                   
                    
                  shf_atwo(15 downto 1) <= shf_aone(14 downto 0);
                  shf_atwo(0)<='0';
                  shf_btwo(14 downto 0) <= shf_bone(15 downto 1);
                  shf_btwo(15)<='0';
                  
                elsif Bcon(1)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_aone;
                  
                 
                  shf_atwo(15 downto 1) <= shf_aone(14 downto 0);
                  shf_atwo(0)<='0';
                  shf_btwo(14 downto 0) <= shf_bone(15 downto 1);
                  shf_btwo(15)<='0';
                     
             
                    end if;       
                         state<=s3;
          
          when s3 => 
                if Bcon(2)='0' then
               A_temp<=C_temp;
                   B_temp <= (others => '0');
                   
                 
                  shf_athree(15 downto 1) <= shf_atwo(14 downto 0);
                  shf_athree(0)<='0';
                  shf_bthree(14 downto 0) <= shf_btwo(15 downto 1);
                  shf_bthree(15)<='0';
                  
                elsif Bcon(2)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_atwo;
                  
                  
                   shf_athree(15 downto 1) <= shf_atwo(14 downto 0);
                  shf_athree(0)<='0';
                  shf_bthree(14 downto 0) <= shf_btwo(15 downto 1);
                  shf_bthree(15)<='0';
                  end if;
                  state<=s4;
    

          when s4 => 
              
                   if Bcon(3)='0' then
                  A_temp<=C_temp;
                   B_temp <= (others => '0');
                   
                 
                  shf_afour(15 downto 1) <= shf_athree(14 downto 0);
                  shf_afour(0)<='0';
                  shf_bfour(14 downto 0) <= shf_bthree(15 downto 1);
                  shf_bfour(15)<='0';
                  
                elsif Bcon(3)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_athree;
                  
                   
                 shf_afour(15 downto 1) <= shf_athree(14 downto 0);
                  shf_afour(0)<='0';
                  shf_bfour(14 downto 0) <= shf_bthree(15 downto 1);
                  shf_bfour(15)<='0';

                     
                end if;
                   state<=s5;
    

            
            when s5 => 
                if Bcon(4)='0' then
                A_temp<=C_temp;
                   B_temp <= (others => '0');
                   
                  
                  shf_afive(15 downto 1) <= shf_afour(14 downto 0);
                  shf_afive(0)<='0';
                  shf_bfive(14 downto 0) <= shf_bfour(15 downto 1);
                  shf_bfive(15)<='0';
                  
                elsif Bcon(4)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_afour;
                   
               
                 shf_afive(15 downto 1) <= shf_afour(14 downto 0);
                  shf_afive(0)<='0';
                  shf_bfive(14 downto 0) <= shf_bfour(15 downto 1);
                  shf_bfive(15)<='0';
                     
                end if;
                 state<=s6;
    

            
             when s6 => 
                if Bcon(5)='0' then
                A_temp<=C_temp;
                  B_temp <= (others => '0');
                  
           
                  shf_asix(15 downto 1) <= shf_afive(14 downto 0);
                  shf_asix(0)<='0';
                  shf_bsix(14 downto 0) <= shf_bfive(15 downto 1);
                  shf_bsix(15)<='0';
                  
                elsif Bcon(5)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_afive;
                   
                  
                shf_asix(15 downto 1) <= shf_afive(14 downto 0);
                  shf_asix(0)<='0';
                  shf_bsix(14 downto 0) <= shf_bfive(15 downto 1);
                  shf_bsix(15)<='0';
                  
                     
                end if;
                state<=s7;
    
            
            when s7 => 
                if Bcon(6)='0' then
                   A_temp<=C_temp;
                   B_temp <= (others => '0');
                  
                
                  shf_aseven(15 downto 1) <= shf_asix(14 downto 0);
                  shf_aseven(0)<='0';
                  shf_bseven(14 downto 0) <= shf_bsix(15 downto 1);
                  shf_bseven(15)<='0';
                  
                elsif Bcon(6)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_asix;
                   
                 
                 shf_aseven(15 downto 1) <= shf_asix(14 downto 0);
                  shf_aseven(0)<='0';
                  shf_bseven(14 downto 0) <= shf_bsix(15 downto 1);
                  shf_bseven(15)<='0';
                  
                end if;
                state<=s8;
                

            
             when s8 => 
                if Bcon(7)='0' then
                A_temp<=C_temp;
                 B_temp <= (others => '0');
                 
               
                  shf_aeight(15 downto 1) <= shf_aseven(14 downto 0);
                  shf_aeight(0)<='0';
                  shf_beight(14 downto 0) <= shf_bseven(15 downto 1);
                  shf_beight(15)<='0';
                  
                elsif Bcon(7)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_aseven;
                   
                
                shf_aeight(15 downto 1) <= shf_aseven(14 downto 0);
                  shf_aeight(0)<='0';
                  shf_beight(14 downto 0) <= shf_bseven(15 downto 1);
                  shf_beight(15)<='0';
                end if;
                    state<=s9;
                
  
            
            when s9 => 
                if Bcon(8)='0' then
                A_temp<=C_temp;
                  B_temp <= (others => '0');
                  
                 
                  shf_anine(15 downto 1) <= shf_aeight(14 downto 0);
                  shf_anine(0)<='0';
                  shf_bnine(14 downto 0) <= shf_beight(15 downto 1);
                  shf_bnine(15)<='0';
                  
                elsif Bcon(8)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_aeight;
                   
                   
                  shf_anine(15 downto 1) <= shf_aeight(14 downto 0);
                  shf_anine(0)<='0';
                  shf_bnine(14 downto 0) <= shf_beight(15 downto 1);
                  shf_bnine(15)<='0';
                  
                     
                end if;
                  state<=s10;
            
            when s10 => 
                if Bcon(9)='0' then
                  A_temp<=C_temp;
                  B_temp <= (others => '0');
                  
              
                  shf_aten(15 downto 1) <= shf_anine(14 downto 0);
                  shf_aten(0)<='0';
                  shf_bten(14 downto 0) <= shf_bnine(15 downto 1);
                  shf_bten(15)<='0';
                  
                elsif Bcon(9)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_anine;
                  
                  
                  shf_aten(15 downto 1) <= shf_anine(14 downto 0);
                  shf_aten(0)<='0';
                  shf_bten(14 downto 0) <= shf_bnine(15 downto 1);
                  shf_bten(15)<='0';
                     
                end if;
              state<=s11;
            when s11 => 
               if Bcon(10)='0' then
               A_temp<=C_temp;
                   B_temp <= (others => '0');
                   
              
                  shf_aeleven(15 downto 1) <= shf_aten(14 downto 0);
                  shf_aeleven(0)<='0';
                  shf_beleven(14 downto 0) <= shf_bten(15 downto 1);
                  shf_beleven(15)<='0';
                  
                elsif Bcon(10)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_aten;
                   
                
                 shf_aeleven(15 downto 1) <= shf_aten(14 downto 0);
                  shf_aeleven(0)<='0';
                  shf_beleven(14 downto 0) <= shf_bten(15 downto 1);
                  shf_beleven(15)<='0';
                     
                end if;
                state<=s12;

            when s12 => 
                if Bcon(11)='0' then
                A_temp<=C_temp;
                   B_temp <= (others => '0');
                   
                
                  shf_atwelve(15 downto 1) <= shf_aeleven(14 downto 0);
                  shf_atwelve(0)<='0';
                  shf_btwelve(14 downto 0) <= shf_beleven(15 downto 1);
                  shf_btwelve(15)<='0';
                  
                elsif Bcon(11)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_aeleven;
                   
                
                 shf_atwelve(15 downto 1) <= shf_aeleven(14 downto 0);
                  shf_atwelve(0)<='0';
                  shf_btwelve(14 downto 0) <= shf_beleven(15 downto 1);
                  shf_btwelve(15)<='0';
                  
                end if;
                state<=s13;
            
             when s13 => 
                if Bcon(12)='0' then
               A_temp<=C_temp;
                  B_temp <= (others => '0');
                 
               
                  shf_athirteen(15 downto 1) <= shf_atwelve(14 downto 0);
                  shf_athirteen(0)<='0';
                  shf_bthirteen(14 downto 0) <= shf_btwelve(15 downto 1);
                  shf_bthirteen(15)<='0';
                  
                elsif Bcon(12)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_atwelve;
                   
                 
                shf_athirteen(15 downto 1) <= shf_atwelve(14 downto 0);
                  shf_athirteen(0)<='0';
                  shf_bthirteen(14 downto 0) <= shf_btwelve(15 downto 1);
                  shf_bthirteen(15)<='0';
                     
                     
                end if;
                state<=s14;
            
            when s14 => 
                if Bcon(13)='0' then
                A_temp<=C_temp;
                 B_temp <= (others => '0');
                
          
                  shf_afourteen(15 downto 1) <= shf_athirteen(14 downto 0);
                  shf_afourteen(0)<='0';
                  shf_bfourteen(14 downto 0) <= shf_bthirteen(15 downto 1);
                  shf_bfourteen(15)<='0';
                  
                elsif Bcon(13)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_athirteen;
                   
                 
                shf_afourteen(15 downto 1) <= shf_athirteen(14 downto 0);
                  shf_afourteen(0)<='0';
                  shf_bfourteen(14 downto 0) <= shf_bthirteen(15 downto 1);
                  shf_bfourteen(15)<='0';
                     
                end if;
                 state<=s15;

             when s15 => 
                if Bcon(14)='0' then
                A_temp<=C_temp;
                   B_temp <= (others => '0');
                  
                 
                  shf_afifteen(15 downto 1) <= shf_afourteen(14 downto 0);
                  shf_afifteen(0)<='0';
                  shf_bfifteen(14 downto 0) <= shf_bfourteen(15 downto 1);
                  shf_bfifteen(15)<='0';
                  
                elsif Bcon(14)='1' then
                   A_temp<=C_temp;
                   B_temp<=shf_afourteen;
                   
                   
               shf_afifteen(15 downto 1) <= shf_afourteen(14 downto 0);
                  shf_afifteen(0)<='0';
                  shf_bfifteen(14 downto 0) <= shf_bfourteen(15 downto 1);
                  shf_bfifteen(15)<='0';
               end if;  
 
             state<=s16;
             
               when s16 => 
               if Bcon(15)='0' then
                A_temp<=C_temp;
                   B_temp <= (others => '0');
                  end_op_temp<='1';
                    

               elsif Bcon(15)='1' then
                  A_temp<=C_temp;
                  B_temp<=shf_afIfteen;
                  end_op_temp<='1';
                   

                end if;
                -- end_op_temp<='1';
                
            state <= init; 
            
            when others => NULL;            
        end case;             
    end if;
               
end process;

DATA_C <= C_temp;
END_OP <= end_op_temp;

end Behavioral; 