----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:14:06 11/25/2019 
-- Design Name: 
-- Module Name:    clk_divider - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_divider is
port(
mclk: in std_logic;
sclk: out std_logic;
incr: integer:=0
);
end clk_divider;

architecture Behavioral of clk_divider is
signal temp: std_logic :='0';
signal clkCounter: integer:=0;
begin
Process_clk: process(mclk)
begin
if(rising_edge(mclk)) then
clkCounter <= clkCounter + incr;
	if (clkCounter = 50000000) then
		temp <= not temp;
		clkCounter <= 0;
	end if;
end if;
end process;
sclk <= temp;

end Behavioral;

