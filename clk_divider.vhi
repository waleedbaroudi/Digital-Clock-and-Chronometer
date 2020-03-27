
-- VHDL Instantiation Created from source file clk_divider.vhd -- 00:37:07 11/25/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT clk_divider
	PORT(
		mclk : IN std_logic;
		incr : IN std_logic_vector(27 downto 0);          
		sclk : OUT std_logic
		);
	END COMPONENT;

	Inst_clk_divider: clk_divider PORT MAP(
		mclk => ,
		sclk => ,
		incr => 
	);


