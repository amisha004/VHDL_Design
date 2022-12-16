library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity lcd_vhdl is
  port
    (clk                : in  std_logic;
     sf_ce0             : out std_logic;
     lcd_rs             : out std_logic;
     lcd_rw             : out std_logic;
     lcd_e              : out std_logic;  
     lcd_0              : out std_logic; 
     lcd_1              : out std_logic; 
     lcd_2              : out std_logic;
     lcd_3              : out std_logic
     );
end lcd_vhdl;

architecture behave of lcd_vhdl is
  -- clock counter    
  signal count_clk      : std_logic_vector(25 downto 0):= (others =>'0');
  -- signal to hold count clk bits from 25 to 20
  signal hold_count     : std_logic_vector(5 downto 0):= (others =>'0');
  --  lcd code signal to be assigned as per the text to be displayed
  signal lcd_code       : std_logic_vector(7 downto 0);
    
begin

---------------------------------------------------------------------------------------
-- Data2display process:
---------------------------------------------------------------------------------------
-- This process accepts the text to be displayed on LCD screen. The text sould be
-- edited as per the user desired data. Kindly refer the board documents to learn the
-- different values corresponding to texts
---------------------------------------------------------------------------------------  
  data2display:process(clk)
  
  begin
  
  
  
    if rising_edge(clk) then
      count_clk         <= count_clk + 1;
      -- case statement for text entry at every rising edge of clock
        
      case hold_count is
        
        when "000000" => lcd_code <= X"03";       -- power-on initialization 
        when "000001" => lcd_code <= X"03"; 
          
        when "000010" => lcd_code <= X"03"; 
        when "000011" => lcd_code <= X"02"; 
          
        when "000100" => lcd_code <= X"02";        -- function set 
        when "000101" => lcd_code <= X"08"; 
          
        when "000110" => lcd_code <= X"00";        -- entry mode set 
        when "000111" => lcd_code <= X"06"; 
          
        when "001000" => lcd_code <= X"00";        -- display on/off control 
        when "001001" => lcd_code <= X"0C"; 
          
        when "001010" => lcd_code <= X"00";        -- display clear 
        when "001011" => lcd_code <= X"01"; 
          -- Here MSB 2 => 0010  
          
--          -------------------------------------------------------BVM EC
--          when "001100" => lcd_code <= X"24";        -- B 
--        when "001101" => lcd_code <= X"22";
--          -- Display O ...Four Bit data interface
--        when "001110" => lcd_code <= X"25";        -- V 
--        when "001111" => lcd_code <= X"26"; 
--          -- Display B ...Four Bit data interface
--        when "010000" => lcd_code <= X"24";        -- M 
--        when "010001" => lcd_code <= X"2D"; 
--          -- Display I ...Four Bit data interface
--        when "010010" => lcd_code <= X"22";        -- SPACE 
--        when "010011" => lcd_code <= X"20"; 
--          -- Display N ...Four Bit data interface
--        when "010100" => lcd_code <= X"24";        -- E
--        when "010101" => lcd_code <= X"25"; 
--          -- Display S ...Four Bit data interface
--          when "010110" => lcd_code <= X"24";        -- C
--        when "010111" => lcd_code <= X"23"; 
--          
--          
--          -------------------------------------------------------
          
          
          -----------------------------------------------------ROBINSON PAUL
          -- Display R ...Four Bit data interface
        when "001100" => lcd_code <= X"25";        -- R 
        when "001101" => lcd_code <= X"22"; 
          -- Display O ...Four Bit data interface
        when "001110" => lcd_code <= X"24";        -- 0 
        when "001111" => lcd_code <= X"2F"; 
          -- Display B ...Four Bit data interface
        when "010000" => lcd_code <= X"24";        -- B 
        when "010001" => lcd_code <= X"22"; 
          -- Display I ...Four Bit data interface
        when "010010" => lcd_code <= X"24";        -- I 
        when "010011" => lcd_code <= X"29"; 
          -- Display N ...Four Bit data interface
        when "010100" => lcd_code <= X"24";        -- N
        when "010101" => lcd_code <= X"2E"; 
          -- Display S ...Four Bit data interface
          when "010110" => lcd_code <= X"25";        -- S
        when "010111" => lcd_code <= X"23"; 
          -- Display 0 ...Four Bit data interface
          when "011000" => lcd_code <= X"24";        -- O
        when "011001" => lcd_code <= X"2F"; 
          -- Display N ...Four Bit data interface
          when "011010" => lcd_code <= X"24";        -- N
        when "011011" => lcd_code <= X"2E"; 
          -- Display SPACE ...Four Bit data interface
        when "011100" => lcd_code <= X"22";         --space
        when "011101" => lcd_code <= X"20"; 
          
        when "011110" => lcd_code <= X"25";        -- P 
        when "011111" => lcd_code <= X"20"; 
        
          when "100000" => lcd_code <= X"24";        -- A 
        when "100001" => lcd_code <= X"21"; 
        
          when "100010" => lcd_code <= X"25";        -- U
        when "100011" => lcd_code <= X"25"; 
        
          when "100100" => lcd_code <= X"24";        -- L 
        when "100101" => lcd_code <= X"2C"; 
          ----------------------------------------------------------------
          when others=> lcd_code <= X"10"; 
      end case; 
    end if;  
  end process;
   -- assigning the case dependent signal
    -- Assigning the TOP 6 MSB Bit to hold_count
  hold_count            <= count_clk(25 downto 20);
  -- Disabling the strata flash
  sf_ce0                <= '1';
  -- Assigning different LCD interfaces as per the requirement. 
  lcd_e                 <= count_clk(19) xor count_clk(18);
  lcd_rs                <= lcd_code(5);
  lcd_rw                <= lcd_code(4);
  -- Assiging Lower Nibble from lcd_code . e.g. X"25" ===> 0010 0 1 0 1  
  --                                               lcd_code---> 3|2|1|0 
  lcd_3                 <= lcd_code(3);
  lcd_2                 <= lcd_code(2);
  lcd_1                 <= lcd_code(1);
  lcd_0                 <= lcd_code(0);
end behave;
