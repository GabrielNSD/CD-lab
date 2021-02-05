ENTITY PortaOr IS
	PORT(A, B: IN BIT;
	S: OUT BIT);
END PortaOr;

ARCHITECTURE behave OF PortaOr IS
BEGIN
	S <= A OR B;
END behave;