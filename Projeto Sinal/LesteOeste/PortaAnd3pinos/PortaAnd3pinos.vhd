ENTITY PortaAnd3pinos IS 
PORT(en1, en2, en3 : IN BIT;
		s0 : OUT BIT
);
END;

ARCHITECTURE behav OF PortaAnd3pinos IS
BEGIN 
s0 <= en1 AND en2 AND en3;

END;  