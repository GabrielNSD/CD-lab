ENTITY PortaAND_3Entradas IS
PORT(en1, en2, en3 : IN BIT;
		s : OUT BIT);
END PortaAND_3Entradas;

ARCHITECTURE behav of portaAND_3Entradas IS
BEGIN
s <= en1 and en2 and en3;
END;
