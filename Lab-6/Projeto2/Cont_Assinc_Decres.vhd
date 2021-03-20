ENTITY Cont_Assinc_Decres IS
	PORT(clk : IN BIT;
			Q0, Q1, Q2, Q3: OUT BIT);
END;

ARCHITECTURE behav OF Cont_Assinc_Decres IS

COMPONENT FlipflopJK IS
	PORT(J, K, C : IN BIT;
			Q, Qbarra : OUT BIT);
END COMPONENT;

SIGNAL x0 : BIT;
SIGNAL x1 : BIT;
SIGNAL x2 : BIT;
SIGNAL x3 : BIT;

BEGIN

u1 : FlipflopJK PORT MAP(J=>'1', K=>'1', C=>clk, Q=>x0, Qbarra=> Q0); 
u2 : FlipflopJK PORT MAP(J=>'1', K=>'1', C=>x0, Q=>x1, Qbarra=> Q1); 
u3 : FlipflopJK PORT MAP(J=>'1', K=>'1', C=>x1, Q=>x2, Qbarra=> Q2); 
u4 : FlipflopJK PORT MAP(J=>'1', K=>'1', C=>x2, Q=>x3, Qbarra=> Q3);

END;