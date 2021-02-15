ENTITY Mux8x1 IS
PORT(en0, en1, en2, en3, en4, en5, en6, en7, c0, c1, c2 : IN BIT;
		saida : OUT BIT);
END;
ARCHITECTURE behav OF Mux8x1 IS
	SIGNAL x0 : BIT;
	SIGNAL x1 : BIT;
	COMPONENT Mux2x1 IS
		PORT(i0, i1, s0 : IN BIT; 
				d : OUT BIT);
	END COMPONENT;
	COMPONENT Mux4x1Comp IS
		PORT(e0, e1, e2, e3, se0, se1 : IN BIT;
				sa : OUT BIT);
	END COMPONENT;
BEGIN
	u1 : Mux4x1Comp PORT MAP(e0=>en0, e1=>en1, e2=>en2, e3=>en3, se0=>c0, se1=>c1, sa=>x0);
	u2 : Mux4x1Comp PORT MAP(e0=>en4, e1=>en5, e2=>en6, e3=>en7, se0=>c0, se1=>c1, sa=>x1);
	u3 : Mux2x1 PORT MAP(i0=>x0, i1=>x1, s0=>c2, d=>saida);
END;