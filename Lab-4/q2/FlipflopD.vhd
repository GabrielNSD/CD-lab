ENTITY FlipflopD IS
	PORT(D, clk : IN BIT;
			Q : OUT BIT);
END;

ARCHITECTURE behav OF FlipflopD IS
BEGIN
	PROCESS(D, clk)
	BEGIN
		IF(clk'EVENT AND clk = '1' AND D = '0') THEN
		Q <= '0';
		ELSIF(clk'EVENT AND clk = '1' AND D = '1') THEN
		Q <= '1';
		END IF;
	END PROCESS;
END;