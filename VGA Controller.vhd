library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vgaspa is
  port(clk  : in std_logic;
       red_out   : out std_logic_vector(3 downto 0);
       green_out : out std_logic_vector(3 downto 0);
       blue_out  : out std_logic_vector(3 downto 0);
         
         sw:in std_logic_vector(3 downto 0);
         
       hs_out    : out std_logic;
       vs_out    : out std_logic);
end vgaspa;

architecture Behavioral of vgaspa is

signal clk25              : std_logic;
signal horizontal_counter : std_logic_vector (9 downto 0);
signal vertical_counter   : std_logic_vector (9 downto 0);

begin

-- generate a 25Mhz clock
process (clk)

begin

  if rising_edge(clk) then
    if (clk25 = '0') then
      clk25 <= '1';
    else
      clk25 <= '0';
    end if;
  end if;
end process;

process (clk25) 
begin
  if clk25'event and clk25 = '1' then
    if (horizontal_counter >= "0010010000" ) -- 144
    and (horizontal_counter < "1100010000" ) -- 784
    and (vertical_counter >= "0000100111" ) -- 39
    and (vertical_counter < "1000000111" ) -- 519
    then
     -- display different color
     
     if ( (horizontal_counter >= "0110010000" and horizontal_counter <= "0111110100" ) and 
           (vertical_counter >= "0011111010" and vertical_counter <= "0100011000") ) then
      
          red_out<= "1111";
            green_out<= "1111";
            blue_out<= "1111";-- display red
     
            elsif (sw="0000") then --0
            red_out<= "1111";
            green_out<= "0000";
            blue_out<= "0000";-- display red
           
            elsif(sw="0001") then --1
            red_out<= "0000";
            green_out<= "1111";
            blue_out<= "0000";-- display green
            
            elsif(sw="0010") then --2
            red_out<= "0000";
            green_out<= "0000";
            blue_out<= "1111";-- display blue
            
            elsif(sw="0011") then --3
            red_out<= "0011";
            green_out<= "0011";
            blue_out<= "0011";-- display 
            
            elsif(sw="0100") then
            red_out<= "0000";
            green_out<= "1111";
            blue_out<= "1111";-- display Cyan
            
            elsif(sw="0101") then
            red_out<= "1111";
            green_out<= "0000";
            blue_out<= "1111";-- display Magenta
            elsif(sw="0110") then
            red_out<= "1111";
            green_out<= "1111";
            blue_out<= "0000";-- display yellow
            
            elsif(sw="0111") then 
            red_out<= "1111";
            green_out<= "0000";
            blue_out<= "1111";-- display blue
            
            elsif(sw="1000") then
            red_out<= "1111";
            green_out<= "1111";
            blue_out<= "1111";-- display white
            
            elsif(sw="1001") then
            red_out<= "1000";
            green_out<= "0010";
            blue_out<= "1100";-- display 
            
            elsif(sw="1010") then
            red_out<= "1111";
            green_out<= "0100";
            blue_out<= "1111";-- display 
            
            elsif(sw="1011") then
            red_out<= "1110";
            green_out<= "1001";
            blue_out<= "1111";-- display 
            
            elsif(sw="1100") then
            red_out<= "1111";
            green_out<= "1000";
            blue_out<= "1011";-- display 
            
            elsif(sw="1101") then
            red_out<= "1111";
            green_out<= "0010";
            blue_out<= "1100";-- display 
            
            elsif(sw="1110") then
            red_out<= "1111";
            green_out<= "1100";
            blue_out<= "1111";-- display 
            
            elsif(sw="1111") then
red_out<= "1011";
            green_out<= "0000";
            blue_out<= "1001";-- display 
            end if ;
    else
      red_out <= "0000";
      green_out <= "0000";
      blue_out <= "0000";
    end if;
     
    if (horizontal_counter > "0000000000" )and (horizontal_counter < "0001100001" ) -- 96+1
    then
      hs_out <= '0';
    else
      hs_out <= '1';
    end if;
     
    if (vertical_counter > "0000000000" ) and (vertical_counter < "0000000011" ) -- 2+1
    then
      vs_out <= '0';
    else
      vs_out <= '1';
    end if;
     
    horizontal_counter <= horizontal_counter+"0000000001";
     
    if (horizontal_counter="1100100000") then
      vertical_counter <= vertical_counter+"0000000001";
      horizontal_counter <= "0000000000";
    end if;
     
    if (vertical_counter="1000001001") then            
      vertical_counter <= "0000000000";
    end if;
  end if;
end process;

end Behavioral;
