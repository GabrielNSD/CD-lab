ENTITY PortaOr6pinos IS 
PORT(en1, en2, en3, en4, en5, en6  : IN BIT;
		sOr : OUT BIT
);
END;

ARCHITECTURE behav OF PortaOr6pinos IS
BEGIN 
sOr <= en1 OR en2 OR en3 OR en4 OR en5 OR en6;

END;  