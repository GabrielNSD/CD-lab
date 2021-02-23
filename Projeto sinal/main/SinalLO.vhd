ENTITY SinalLO IS
PORT(a,b,c,d : IN BIT;
		S, Sl : OUT BIT);
END;
ARCHITECTURE bevah OF SinalLO IS 
COMPONENT PortaAnd2pinos IS 
PORT(en1, en2 : IN BIT;
		s0 : OUT BIT
);
END COMPONENT;

COMPONENT PortaOr6pinos IS 
PORT(en1, en2, en3, en4, en5, en6  : IN BIT;
		sOr : OUT BIT
);

END COMPONENT;
COMPONENT PortaOr4pinos IS 
PORT(en1, en2, en3, en4: IN BIT;
		sOr : OUT BIT
);
END COMPONENT;

COMPONENT PortaAnd3pinos IS 
PORT(en1, en2, en3 : IN BIT;
		s0 : OUT BIT
);
END COMPONENT;
COMPONENT PortaAnd4pinos IS 
PORT(en1, en2, en3,en4 : IN BIT;
		s0 : OUT BIT
);
END COMPONENT;


SIGNAL S1: BIT;
SIGNAL S2: BIT;
SIGNAL S3: BIT;
SIGNAL S4: BIT;
SIGNAL S5: BIT;
SIGNAL S6: BIT;
SIGNAL S7: BIT;
SIGNAL S8: BIT;
SIGNAL S9: BIT;
SIGNAL S10: BIT;
BEGIN 
u1 : PortaAnd2pinos PORT MAP(en1 => c, en2 => d, s0 => S1);
u2 : PortaAnd2pinos PORT MAP(en1 => c, en2 => not(b), s0 => S2);
u3 : PortaAnd2pinos PORT MAP(en1 => not(b), en2 => d, s0 => S3);
u4 : PortaAnd2pinos PORT MAP(en1 => not(a), en2 => c, s0 => S4);
u5 : PortaAnd2pinos PORT MAP(en1 => not(a), en2 => d, s0 => S5);
u6 : PortaAnd2pinos PORT MAP(en1 => not(a), en2 => not(b), s0 => S6);

u7 : PortaAnd4pinos PORT MAP(en1 => a, en2 => b, en3 => c , en4 => not(d), s0 => S7);
u8 : PortaAnd4pinos PORT MAP(en1 => a, en2 => b, en3 => not(c) , en4 => d, s0 => S8);
u9 :PortaAnd3pinos PORT MAP(en1 => a, en2 => not(c), en3 => not(d) , s0 => S9);
u10 : PortaAnd4pinos PORT MAP(en1 => not(a), en2 => b, en3 => not(c) , en4 => not(d), s0 => S10);



usaida1 : portaOr6pinos PORT MAP(en1 => S1, en2 => S2,en3 => S3,en4 => S4,en5 => S5,en6 => S6,sOr => S);
usaida2 : PortaOr4pinos PORT MAP(en1 => S7, en2 => S8,en3 => s9,en4 => s10,sOr => Sl);

END;
