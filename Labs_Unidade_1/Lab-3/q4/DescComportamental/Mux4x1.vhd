ENTITY Mux4x1 IS
PORT(e0, e1, e2, e3, se0, se1 : IN BIT;
		sa : OUT BIT);
END;
ARCHITECTURE behav OF Mux4x1 IS
	SIGNAL x0 : BIT;
	SIGNAL x1 : BIT;
BEGIN

	WITH se0 SELECT
	x0 <= e0 WHEN '0',
			e1 WHEN '1';
	WITH se0 SELECT
	x1 <= e2 WHEN '0',
			e3 WHEN '1';
	WITH se1 SELECT
	sa <= x0 WHEN '0',
			x1 WHEN '1';
END;