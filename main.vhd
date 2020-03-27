library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity main is
port(
clk: in std_logic;
reset: in std_logic;
pause: in std_logic;
downward: in std_logic;
chronToClock: in std_logic;
slowclk: out std_logic;
SevenSegControlMod: out std_logic_vector (7 downto 0):=x"ff";
SevenSegBusMod: out std_logic_vector(7 downto 0)
);
end main;

architecture Behavioral of main is
	COMPONENT sevenSegment
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		C : IN std_logic_vector(3 downto 0);
		D : IN std_logic_vector(3 downto 0);
		E : IN std_logic_vector(3 downto 0);
		F : IN std_logic_vector(3 downto 0);
		G : IN std_logic_vector(3 downto 0);
		H : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;          
		SevenSegControl : OUT std_logic_vector(7 downto 0);
		SevenSegBus : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
		COMPONENT debounce
	PORT(
		clk : IN std_logic;
		button : IN std_logic;          
		result : OUT std_logic
		);
	END COMPONENT;
	COMPONENT clk_divider
	PORT(
		mclk : IN std_logic;
		incr : integer:=0;  
		sclk : OUT std_logic
		);
	END COMPONENT;
	signal toInt: integer:=100; --the increment passed to the divided clock counter
	signal increment: std_logic_vector(3 downto 0):=x"1"; --increment/decrement to the time
	signal D1: std_logic_vector(3 downto 0); --x
	signal D2: std_logic_vector(3 downto 0); --x
	signal D3: std_logic_vector(3 downto 0); --s
	signal D4: std_logic_vector(3 downto 0); --s
	signal D5: std_logic_vector(3 downto 0); --m
	signal D6: std_logic_vector(3 downto 0); --m
	signal D7: std_logic_vector(3 downto 0); --h
	signal D8: std_logic_vector(3 downto 0); --h
	--signals that hold what info should be displayed on the seven segments (from a to h, excluding the dashes at C and F)
	signal DisplayOption1: std_logic_vector(3 downto 0); 
	signal DisplayOption2: std_logic_vector(3 downto 0);
	signal DisplayOption3: std_logic_vector(3 downto 0);
	signal DisplayOption4: std_logic_vector(3 downto 0);
	signal DisplayOption5: std_logic_vector(3 downto 0);
	signal DisplayOption6: std_logic_vector(3 downto 0);
	-----------------------------------------------------------------------------------------------------------------
	signal newClock: std_logic; --the divided clock (100 hz)
	signal pausing: std_logic; --holds the debounced signal of the pause button
	signal wasPaused: std_logic:='0'; --a signal to remember the last state of the pause button
begin


	process
	begin
--------------for the pause button-------------------------------	
if ((wasPaused = '0') and (pausing = '1')) then
	if(increment = x"1") then
		increment <= x"0";
	elsif(increment = x"0") then
		increment <= x"1";
	end if;
wasPaused <='1';
elsif (pausing = '0') then
	wasPaused <= '0';
end if;

-----------------for switching between clock and chronometer----------------------------
if (chronToClock = '0') then
	DisplayOption1 <= D1;
	DisplayOption2 <= D2;
	DisplayOption3 <= D3;
	DisplayOption4 <= D4;
	DisplayOption5 <= D5;
	DisplayOption6 <= D6;
else
	DisplayOption1 <= D3;
	DisplayOption2 <= D4;
	DisplayOption3 <= D5;
	DisplayOption4 <= D6;
	DisplayOption5 <= D7;
	DisplayOption6 <= D8;
end if;
-------------the following is for increasing or decreasing the clock/chronometer------------------
if (rising_edge(newClock)) then
	if (reset = '1') then -- sets all values to 0 if the reset button is clicked
		D1 <= x"0";
		D2 <= x"0";
		D3 <= x"0";
		D4 <= x"0";
		D5 <= x"0";
		D6 <= x"0";
		D7 <= x"0";
		D8 <= x"0";
				else
	if (downward = '0') then
			if D1 = x"9" then 
				D1 <= x"0";
				D2 <= D2 + increment;
				else
				D1 <= D1 + increment;
				end if;
			if D2 = x"a" then 
				D2 <= x"0";
				D3 <= D3 + increment;
				end if;
			if D3 = x"a" then 
				D3 <= x"0";
				D4 <= D4 + increment;
				end if;
			if D4 = x"6" then 
				D4 <= x"0";
				D5 <= D5 + increment;
				end if;
			if D5 = x"a" then 
				D5 <= x"0";
				D6 <= D6 + increment;
			end if;
			if D6 = x"6" then 
				D6 <= x"0";
				D7 <= D7 + increment;
			end if;
			if D7 = x"a" then 
				D7 <= x"0";
				D8 <= D8 + increment;
			end if;
			if D8 = x"6" then 
				D1 <= x"0";
				D2 <= x"0";
				D3 <= x"0";
				D4 <= x"0";
				D5 <= x"0";
				D6 <= x"0";
				D7 <= x"0";
				D8 <= x"0";
			end if;
				else --for backwards
				if D1 = x"0" then
					D1 <= x"9";
					if D2 = x"0" then
					D2 <= x"9";
						if D3 = x"0" then
						D3 <= x"9";
							if D4 = x"0" then
							D4 <= x"5";
								if D5 = x"0" then
								D5 <= x"9";
								if D6 = x"0" then
								D6 <= x"5";
									if D7 = x"0" then
									D7 <= x"9";
										if D8 = x"0" then
										D8 <= x"5";
										else D8 <= D8 - increment; end if;
									else D7 <= D7 - increment; end if;
								else D6 <= D6 - increment; end if;
							else D5 <= D5 - increment; end if;
						else D4 <= D4 - increment; end if;
					else D3 <= D3 - increment; end if;
				else D2 <= D2 - increment; end if;
			else D1 <= D1 - increment; end if;
	end if;
end if;
end if;
end process;
mysvsg: sevenSegment PORT MAP(
		A => DisplayOption1, 
		B => DisplayOption2,
		C => x"a",
		D => DisplayOption3,
		E => DisplayOption4,
		F => x"a",
		G => DisplayOption5,
		H => DisplayOption6,
		clk => clk,
		SevenSegControl => SevenSegControlMod,
		SevenSegBus => SevenSegBusMod
	);
	
	Inst_debounce: debounce PORT MAP(
		clk => clk,
		button => pause,
		result => pausing
	);

	
		Inst_clk_divider: clk_divider PORT MAP(
		mclk => clk,
		sclk => newClock,
		incr => toInt
	);


end Behavioral;

