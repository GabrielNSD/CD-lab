ENTITY PortaOr4pinos IS 
PORT(en1, en2, en3, en4: IN BIT;
		sOr : OUT BIT
);
END;

ARCHITECTURE behav OF PortaOr4pinos IS
BEGIN 
sOr <= en1 OR en2 OR en3 OR en4;

END;  