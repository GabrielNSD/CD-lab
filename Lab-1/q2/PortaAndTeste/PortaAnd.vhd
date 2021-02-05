ENTITY PortaAnd IS
	PORT(A, B: IN BIT;
	S: OUT BIT);
END PortaAnd;

ARCHITECTURE behave OF PortaAnd IS

BEGIN
	S <= A AND B;
END behave;