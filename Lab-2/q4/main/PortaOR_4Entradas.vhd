ENTITY PortaOR_4Entradas IS
PORT(en1, en2, en3, en4 : IN BIT;
		s : OUT BIT);
END PortaOR_4Entradas;

ARCHITECTURE behav of portaOR_4Entradas IS
BEGIN
s <= en1 or en2 or en3 or en4;
END;