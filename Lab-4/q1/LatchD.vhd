ENTITY LatchD IS
	PORT(D, clk : IN BIT;
			Q, Qbarra : OUT BIT);
END;

ARCHITECTURE behav OF LatchD IS
BEGIN
	PROCESS(D, clk)
	BEGIN
		IF(clk = '1' AND D = '0') THEN
		Q <= '0';
		Qbarra <= '1';
		ELSIF(clk = '1' AND D = '1') THEN
		Q <= '1';
		Qbarra <= '0';
		END IF;
	END PROCESS;
END;
	
	