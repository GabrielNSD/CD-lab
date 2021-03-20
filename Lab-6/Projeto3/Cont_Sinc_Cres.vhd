ENTITY Cont_Sinc_Cres IS
	PORT(clk : IN BIT;
			Q0, Q1, Q2, Q3: OUT BIT);
END;

ARCHITECTURE behav OF Cont_Sinc_Cres IS

COMPONENT FlipflopJK IS
	PORT(J, K, C : IN BIT;
			Q, Qbarra : OUT BIT);
END COMPONENT;

SIGNAL x0 : BIT;
SIGNAL x1 : BIT;
SIGNAL x2 : BIT;
SIGNAL x3 : BIT;

BEGIN

u1 : FlipflopJK PORT MAP(J=>'1', K=>'1', C=>clk, Q=>x0); 
u2 : FlipflopJK PORT MAP(J=>x0, K=>x0, C=>clk, Q=>x1); 
u3 : FlipflopJK PORT MAP(J=>x0 AND x1, K=>x0 AND x1, C=>clk, Q=>x2); 
u4 : FlipflopJK PORT MAP(J=>x0 AND x1 AND x2, K=>x0 AND x1 AND x2, C=>clk, Q=>x3);

Q0 <= x0;
Q1 <= x1;
Q2 <= x2;
Q3 <= x3;

END;