ENTITY FlipflopJK IS
	PORT(J, K, C : IN BIT;
			Q, Qbarra : OUT BIT);
END;

ARCHITECTURE behav OF FlipflopJK IS
SIGNAL x : BIT;
SIGNAL xbarra : BIT :='1';
BEGIN
	PROCESS(J, K, C)
	BEGIN
		IF(C'EVENT AND C = '0' AND J = '0' AND K = '0') THEN
			x <= x;
			xbarra <= xbarra;
		ELSIF(C'EVENT AND C = '0' AND J = '1' AND K = '0') THEN
			x <= '1';
			xbarra <= '0';
		ELSIF(C'EVENT AND C = '0' AND J = '0' AND K = '1') THEN
			x <= '0';
			xbarra <= '1';
		ELSIF(C'EVENT AND C = '0' AND J = '1' AND K = '1') THEN
			x <= not(x);
			xbarra <= not(xbarra);
		END IF;
	END PROCESS;
	Q <= x;
	Qbarra <= xbarra;
END;