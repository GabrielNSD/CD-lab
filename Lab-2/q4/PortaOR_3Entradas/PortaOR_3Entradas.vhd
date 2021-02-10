ENTITY PortaOR_3Entradas IS
PORT(en1, en2, en3 : IN BIT;
		s : OUT BIT);
END PortaOR_3Entradas;

ARCHITECTURE behav of portaOR_3Entradas IS
BEGIN
s <= en1 or en2 or en3;
END;
