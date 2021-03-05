ENTITY Registrador_LatchD IS
	PORT(I0, I1, I2, I3, c : IN BIT;
			Q0, Q1, Q2, Q3, Qbarra0, Qbarra1, Qbarra2, Qbarra3 : OUT BIT);
END;

ARCHITECTURE behav OF Registrador_LatchD IS

COMPONENT LatchD IS
	PORT(D, clk : IN BIT;
			Q, Qbarra : OUT BIT);
END COMPONENT;

BEGIN

u1 : LatchD PORT MAP(D=>I3, clk=>c, Q=>Q3, Qbarra=>Qbarra3); 
u2 : LatchD PORT MAP(D=>I2, clk=>c, Q=>Q2, Qbarra=>Qbarra2); 
u3 : LatchD PORT MAP(D=>I1, clk=>c, Q=>Q1, Qbarra=>Qbarra1); 
u4 : LatchD PORT MAP(D=>I0, clk=>c, Q=>Q0, Qbarra=>Qbarra0); 

END;
	