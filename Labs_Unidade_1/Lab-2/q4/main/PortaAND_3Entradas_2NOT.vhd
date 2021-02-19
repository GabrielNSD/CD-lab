ENTITY PortaAND_3Entradas_2NOT IS
PORT(en1, en2, en3 : IN BIT;
		s : OUT BIT);
END PortaAND_3Entradas_2NOT;

ARCHITECTURE behav of portaAND_3Entradas_2NOT IS
BEGIN
s <= not(en1) and not(en2) and en3;
END;