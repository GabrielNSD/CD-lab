ENTITY PortaAnd2pinos IS 
PORT(en1, en2 : IN BIT;
		s0 : OUT BIT
);
END;

ARCHITECTURE behav OF PortaAnd2pinos IS
BEGIN 
s0 <= en1 AND en2;

END;  