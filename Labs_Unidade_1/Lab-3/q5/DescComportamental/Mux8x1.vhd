ENTITY Mux8x1 IS
PORT(en0, en1, en2, en3, en4, en5, en6, en7, c0, c1, c2 : IN BIT;
		saida : OUT BIT);
END;
ARCHITECTURE behav OF Mux8x1 IS
	SIGNAL x0 : BIT;
	SIGNAL x1 : BIT;
	SIGNAL v : bit_vector(1 downto 0);
BEGIN
	v <= c1 & c0;
	WITH v SELECT
	x0 <= en0 WHEN "00",
		en1 WHEN "01",
		en2 WHEN "10",
		en3 WHEN "11";
		
	WITH v SELECT
	x1 <= en4 WHEN "00",
		en5 WHEN "01",
		en6 WHEN "10",
		en7 WHEN "11";
		
	WITH c2 SELECT
	saida <= x0 WHEN '0',
			x1 WHEN '1';
END;