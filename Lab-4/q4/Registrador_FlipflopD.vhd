ENTITY Registrador_FlipflopD IS
	PORT(I0, I1, I2, I3, c : IN BIT;
			Q0, Q1, Q2, Q3: OUT BIT);
END;

ARCHITECTURE behav OF Registrador_FlipflopD IS

COMPONENT FlipflopD IS
	PORT(D, clk : IN BIT;
			Q : OUT BIT);
END COMPONENT;

BEGIN

u1 : FlipflopD PORT MAP(D=>I3, clk=>c, Q=>Q3); 
u2 : FlipflopD PORT MAP(D=>I2, clk=>c, Q=>Q2); 
u3 : FlipflopD PORT MAP(D=>I1, clk=>c, Q=>Q1); 
u4 : FlipflopD PORT MAP(D=>I0, clk=>c, Q=>Q0); 

END;
	