
-- VHDL Instantiation Created from source file driver.vhd -- 22:43:37 11/26/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT driver
	PORT(
		clk : IN std_logic;
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		C : IN std_logic_vector(3 downto 0);
		D : IN std_logic_vector(3 downto 0);
		E : IN std_logic_vector(3 downto 0);
		F : IN std_logic_vector(3 downto 0);
		G : IN std_logic_vector(3 downto 0);
		H : IN std_logic_vector(3 downto 0);          
		sevenSegNumber : OUT std_logic_vector(7 downto 0);
		sevenSegValue : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_driver: driver PORT MAP(
		clk => ,
		A => ,
		B => ,
		C => ,
		D => ,
		E => ,
		F => ,
		G => ,
		H => ,
		sevenSegNumber => ,
		sevenSegValue => 
	);


