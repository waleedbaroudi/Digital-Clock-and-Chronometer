----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:10:07 11/24/2019 
-- Design Name: 
-- Module Name:    twoBitAdder - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity twoBitAdder is
    Port (A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  cin: in std_logic;
			  cout: out std_logic;
           SUM : out  std_logic);
end twoBitAdder;

architecture Behavioral of twoBitAdder is
begin
SUM<= A xor B xor cin;
cout <= (A and B) or ((A xor B) and cin);
end Behavioral;

