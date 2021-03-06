LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

---------------------------------------------------------------------
-- top level entity, no sesitivity list, can add generics that can be
-- passed in at simulation time
---------------------------------------------------------------------
ENTITY full_adder_tst IS
END full_adder_tst;

-------------------------
-- top level architecture
-------------------------

ARCHITECTURE full_adder_tst_arch OF full_adder_tst IS

----------------------
-- signal declarations
----------------------

SIGNAL clk : STD_LOGIC := '0';	-- give the clock a default value
SIGNAL a : STD_LOGIC := '0';  	-- give the input 'a' default value
SIGNAL b : STD_LOGIC := '1';  	-- give the input 'b' default value
SIGNAL cin : STD_LOGIC := '1';  -- give the input 'cin' default value
SIGNAL sum : STD_LOGIC;
SIGNAL cout : STD_LOGIC;

-------------------------------------------------------
-- this is the actual fpga design component declaration
-------------------------------------------------------

COMPONENT full_adder
	PORT(a, b, cin, clk : IN STD_LOGIC;
	     sum, cout : OUT STD_LOGIC);
END COMPONENT;

--------------------------------
-- beginning of the architecture
--------------------------------
BEGIN
	
   -------------------------------------------------
   -- instantiate the FPGA design into the testbench
	-------------------------------------------------
	i1 : full_adder
	PORT MAP (
		-- list connections between master ports and signals
		clk => clk,
		a => a,
		b => b,
		cin => cin,
		sum => sum,
		cout => cout
	);

	
	clocking: block
	BEGIN
		clk <= not clk after 5 ns;
	END block;
	
	

END full_adder_tst_arch;
