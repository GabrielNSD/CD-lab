ENTITY Mux4x1 IS
PORT(i0, i1, i2, i3, s0, s1 : IN BIT;
		d : OUT BIT);
END;
ARCHITECTURE behav OF Mux4x1 IS
	SIGNAL x : bit_vector(1 downto 0);
BEGIN
	x <= s1 & s0;
	WITH x SELECT
	d <= i0 WHEN "00",
		i1 WHEN "01",
		i2 WHEN "10",
		i3 WHEN "11";
END;