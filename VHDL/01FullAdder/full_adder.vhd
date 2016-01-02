LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY full_adder IS
	PORT(a, b, cin, clk : IN STD_LOGIC;	-- a,b are input bits and cin is carry-in bit and clock input
	     sum, cout : OUT STD_LOGIC);		-- sum and clock outputs
END full_adder;

ARCHITECTURE dataflow OF full_adder IS
BEGIN
	
	PROCESS(clk)
	BEGIN
		IF (rising_edge(clk)) THEN
			sum <= a XOR b XOR cin;
			cout <= (a AND b) OR (a AND cin) OR (b AND cin);
		END IF;
	END PROCESS;
END dataflow;