library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity blinky_ex01_Amisha is
    Port ( clk_amisha : in  STD_LOGIC;
           led_amisha : out  STD_LOGIC);
end blinky_ex01_Amisha;
architecture Behavioral_amisha of blinky_ex01_Amisha is
	signal clk_counter_amisha : natural range 0 to 50000000 := 0;
	signal blinker_amisha : std_logic := '0';
begin	
	process(clk_amisha) is
	begin 
		if rising_edge(clk_amisha) then 
			clk_counter_amisha <= clk_counter_amisha + 1; 
			if clk_counter_amisha >= 50000000 then 
			  blinker_amisha <= not blinker_amisha;
			  clk_counter_amisha <= 0;
			end if; 
		end if; 
	end process;
	
	led_amisha <= blinker_amisha;
end Behavioral_amisha;
