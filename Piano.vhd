library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--4 octav                    
--C    262        50000000        190840
--D    294        50000000        170068
--E    330        50000000        151515
--F    349        50000000        143266
--G    392        50000000        127551
--A    440        50000000        113636
--B    492        50000000        101626
--C    523        50000000        95602

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity audiojack is
 --4 octav                    
--C    262        50000000        190840
--D    294        50000000        170068
--E    330        50000000        151515
--F    349        50000000        143266
--G    392        50000000        127551
--A    440        50000000        113636
--B    492        50000000        101626
--C    523        50000000        95602


    Port ( C : in  STD_LOGIC; --do
           D : in  STD_LOGIC; --re
           E : in  STD_LOGIC; --me
           F : in  STD_LOGIC; --fa 
           G : in  STD_LOGIC; --so
           A : in  STD_LOGIC; --la
           B : in  STD_LOGIC; --ti
              Ch : in  STD_LOGIC; 
           clk_50mhz : in  STD_LOGIC; --using the exterrnal clock of 8mhz.
           spek : out  STD_LOGIC);   --o/p connected to the speaker.
end audiojack;

architecture pbev of audiojack is

 signal Cc: integer := 190840; 
 signal Dc: integer := 170068; 
 signal Ec: integer := 151515; 
 signal Fc: integer := 143266; 
 signal Gc: integer := 127551; 
 signal Ac: integer := 113636;
 signal Bc: integer := 101626;
 signal Chc: integer := 95602;

 signal Counter2093: integer:= 0;
 signal Counter2349: integer:= 0;
 signal Counter2637: integer:= 0;
 signal Counter2794: integer:= 0;
 signal Counter3136: integer:= 0;
 signal Counter3520: integer:= 0;
 signal Counter3951: integer:= 0;
 signal Counter4186: integer:= 0;
 signal temp: integer:= 0;
 
 --    NOTE        FREQUENCY        NUMBER
--C    2093        50000000        23889 === 50Mhz/23889 = 2093Hz
--D    2349        50000000        21286
--E    2637        50000000        18961
--F    2794        50000000        17895
--G    3136        50000000        15944
--A    3520        50000000        14205
--B    3951        50000000        12655
--Ch    4186        50000000        11945

 signal clk_2093hz: std_logic:= '0';
 signal clk_2349hz: std_logic:= '0'; --494hz
 signal clk_2637hz: std_logic:= '0';
 signal clk_2794hz: std_logic:= '0';
 signal clk_3136hz: std_logic:= '0';
 signal clk_3520hz: std_logic:= '0';
 signal clk_3951hz: std_logic:= '0';
 signal clk_4186hz: std_logic:= '0';
 
begin
----------------------------------------------------------------------------------------C
 Prescaler2093 : process(clk_50mhz) --process to convert 50mhz freq to 2093hz freq..
 begin
        if rising_edge(clk_50mhz) then
            if Counter2093 < Cc then 
                Counter2093 <= Counter2093 + 1;
            else
                clk_2093hz <= not clk_2093hz;
                Counter2093 <= 0;
            end if;
        end if;
 end process Prescaler2093; --gives o/p clk_2093 as sq. wave of 2093hz freq.

-----------------------------------------------------------------------------------------
--D    2349        50000000        21286
 Prescaler2349 : process(clk_50mhz) --process to convert 50mhz freq to 2349hz freq..
 begin
        if rising_edge(clk_50mhz) then
            if Counter2349 < Dc then 
                Counter2349 <= Counter2349 + 1;
            else
                clk_2349hz <= not clk_2349hz;
                Counter2349 <= 0;
            end if;
        end if;
 end process Prescaler2349; --gives o/p clk_2349 as sq. wave of 2349hz freq.

-----------------------------------------------------------------------------------------
 --E    2637        50000000        18961
 Prescaler2637 : process(clk_50mhz) --process to convert 50mhz freq to 2637hz freq..
 begin
        if rising_edge(clk_50mhz) then
            if Counter2637 < Ec then 
                Counter2637  <= Counter2637 + 1;
            else
                clk_2637hz <= not clk_2637hz;
                Counter2637 <= 0;
            end if;
        end if;
 end process Prescaler2637 ; --gives o/p clk_2637 as sq. wave of 2637hz freq.

-----------------------------------------------------------------------------------------
--F    2794        50000000        17895
 Prescaler2794 : process(clk_50mhz) --process to convert 50mhz freq to 2794hz freq..
 begin
        if rising_edge(clk_50mhz) then
            if Counter2794 < Fc then 
                Counter2794 <= Counter2794 + 1;
            else
                clk_2794hz <= not clk_2794hz;
                Counter2794 <= 0;
            end if;
        end if;
 end process Prescaler2794; --gives o/p clk_2637 as sq. wave of 2794hz freq.

----------------------------------------------------------------------------------------------
--G    3136        50000000        15944
 Prescaler3136 : process(clk_50mhz) --process to convert 50mhz freq to 3136hz freq..
 begin
        if rising_edge(clk_50mhz) then
            if Counter3136 < Gc then 
                Counter3136<= Counter3136 + 1;
            else
                clk_3136hz <= not clk_3136hz;
                Counter3136<= 0;
            end if;
        end if;
 end process Prescaler3136; --gives o/p clk_2637 as sq. wave of 3136hz freq.

--------------------------------------------------------------------------------------------
--A    3520        50000000        14205
 Prescaler3520 : process(clk_50mhz) --process to convert 50mhz freq to 3520hz freq..
 begin
        if rising_edge(clk_50mhz) then
            if Counter3520 < Ac then 
                Counter3520 <= Counter3520  + 1;
            else
                clk_3520hz <= not clk_3520hz;
                Counter3520 <= 0;
            end if;
        end if;
 end process Prescaler3520 ; --gives o/p clk_3520 as sq. wave of 3520hz freq.

--------------------------------------------------------------------------------------
--B    3951        50000000        12655
 Prescaler3951 : process(clk_50mhz) --process to convert 50mhz freq to 3951hz freq..
 begin
        if rising_edge(clk_50mhz) then
            if Counter3951  < Bc then 
                Counter3951 <= Counter3951  + 1;
            else
                clk_3951hz <= not clk_3951hz;
                Counter3951 <= 0;
            end if;
        end if;
 end process Prescaler3951 ; --gives o/p clk_3951 as sq. wave of 3951hz freq.

---------------------------------------------------------------------------------------
--Ch    4186        50000000        11945
 Prescaler4186 : process(clk_50mhz) --process to convert 50mhz freq to 4186hz freq..
 begin
        if rising_edge(clk_50mhz) then
            if Counter4186  < Chc then 
                Counter4186 <= Counter4186  + 1;
            else
                clk_4186hz <= not clk_4186hz;
                Counter4186 <= 0;
            end if;
        end if;
 end process Prescaler4186 ; --gives o/p clk_4186 as sq. wave of 4186hz freq.

--------------------------------------------------------------------------------------

pianoproc : process(C,D,E,F,G,A,B,Ch,clk_50mhz)
begin

 --    NOTE        FREQUENCY        NUMBER
--C    2093        50000000        23889 === 50Mhz/23889 = 2093Hz
--D    2349        50000000        21286
--E    2637        50000000        18961
--F    2794        50000000        17895
--G    3136        50000000        15944
--A    3520        50000000        14205
--B    3951        50000000        12655
--Ch    4186        50000000        11945

if (C = '1') then
 spek <= clk_2093hz; 

elsif (D = '1') then
 spek <= clk_2349hz; 
 
elsif (E = '1') then
 spek <= clk_2637hz; 
 
elsif (F = '1') then
 spek <= clk_2794hz; 
 
elsif (G = '1') then
 spek <= clk_3136hz; 
 
elsif (A = '1') then
 spek <= clk_3520hz; 
 
elsif (B = '1') then
 spek <= clk_3951hz; 

elsif (Ch = '1') then
spek <= clk_4186hz;

else
spek <= '0';
 
end if;
end process pianoproc;
end pbev;
