ENTITY main IS
	PORT(A, B, C : IN BIT;
		S1, S2 : OUT BIT);
END main;

ARCHITECTURE behav of main IS
	SIGNAL c1_l1 : BIT; -- Circuito 1 Linha 1
	SIGNAL c1_l2 : BIT;
	SIGNAL c1_l3 : BIT;
	SIGNAL c2_l1 : BIT;
	SIGNAL c2_l2 : BIT;
	SIGNAL c2_l3 : BIT;
	SIGNAL c2_l4 : BIT;
	COMPONENT PortaAND_2Entradas IS
	PORT(en1, en2 : IN BIT;
			s : OUT BIT);
	END COMPONENT;
	COMPONENT PortaAND_3Entradas IS
	PORT(en1, en2, en3 : IN BIT;
			s : OUT BIT);
	END COMPONENT;
	COMPONENT PortaAND_3Entradas_2NOT IS -- Porta AND com 3 entradas, onde as duas primeiras são negadas
	PORT(en1, en2, en3 : IN BIT;
			s : OUT BIT);
	END COMPONENT;
	COMPONENT PortaOR_3Entradas IS
	PORT(en1, en2, en3 : IN BIT;
			s : OUT BIT);
	END COMPONENT;
	COMPONENT PortaOR_4Entradas IS
	PORT(en1, en2, en3, en4 : IN BIT;
			s : OUT BIT);
	END COMPONENT;
BEGIN
-- Circuito 1
u1 : PortaAND_2Entradas PORT MAP(en1=>A, en2=>C, s=>c1_l1); -- A and C
u2 : PortaAND_2Entradas PORT MAP(en1=>B, en2=>C, s=>c1_l2); -- B and C
u3 : PortaAND_2Entradas PORT MAP(en1=>A, en2=>B, s=>c1_l3); -- A and B
u4 : PortaOR_3Entradas PORT MAP(en1=>c1_l1, en2=>c1_l2, en3=>c1_l3, s=>S1); -- AC or BC or AB
-- Circuito 2
u5 : PortaAND_3Entradas_2NOT PORT MAP(en1=>A, en2=>B, en3=>C, s=>c2_l1); -- not(A) and not(B) and C 
u6 : PortaAND_3Entradas_2NOT PORT MAP(en1=>A, en2=>C, en3=>B, s=>c2_l2); -- not(A) and not(C) and B 
u7 : PortaAND_3Entradas_2NOT PORT MAP(en1=>B, en2=>C, en3=>A, s=>c2_l3); -- not(B) and not(C) and A
u8 : PortaAND_3Entradas PORT MAP(en1=>A, en2=>B, en3=>C, s=>c2_l4); -- A and B and C
u9 : PortaOR_4Entradas PORT MAP(en1=>c2_l1, en2=>c2_l2, en3=>c2_l3, en4=>c2_l4, s=>S2); -- A'B'C or A'BC' or AB'C' or ABC 

END;