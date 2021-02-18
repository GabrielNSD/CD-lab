ENTITY PortaAnd4pinos IS 
PORT(en1, en2, en3,en4 : IN BIT;
		s0 : OUT BIT
);
END;

ARCHITECTURE behav OF PortaAnd4pinos IS
BEGIN 
s0 <= en1 AND en2 AND en3 AND en4;

END;  