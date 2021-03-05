ENTITY Mux4x1Comp IS
PORT(e0, e1, e2, e3, se0, se1 : IN BIT;
		sa : OUT BIT);
END;
ARCHITECTURE behav OF Mux4x1Comp IS
	SIGNAL x0 : BIT;
	SIGNAL x1 : BIT;
	COMPONENT Mux2x1 IS
		PORT(i0, i1, s0 : IN BIT; 
				d : OUT BIT);
	END COMPONENT;
BEGIN
	u1 : Mux2x1 PORT MAP(i0=>e0, i1=>e1, s0=>se0, d=>x0);
	u2 : Mux2x1 PORT MAP(i0=>e2, i1=>e3, s0=>se0, d=>x1);
	u3 : Mux2x1 PORT MAP(i0=>x0, i1=>x1, s0=>se1, d=>sa);
END;