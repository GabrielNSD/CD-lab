ENTITY PortaAND_2Entradas IS
PORT(en1, en2 : IN BIT;
		s : OUT BIT);
END PortaAND_2Entradas;

ARCHITECTURE behav of portaAND_2Entradas IS
BEGIN
s <= en1 and en2;
END;
