ENTITY Decode4x7 IS
	PORT(A4, A3, A2, A1 : IN BIT;
			S6, S5, S4, S3, S2, S1, S0 : OUT BIT);
END;

ARCHITECTURE behav OF Decode4x7 IS
	SIGNAL out_aux: BIT_VECTOR(6 DOWNTO 0);
	SIGNAL in_aux : BIT_VECTOR(3 DOWNTO 0);
BEGIN
	in_aux <= A4 & A3 & A2 & A1;
	WITH in_aux SELECT
		out_aux <= "0111111" WHEN "0000",
					  "0000110" WHEN "0001",
					  "1011011" WHEN "0010",
					  "1001111" WHEN "0011",
					  "1100110" WHEN "0100",
					  "1101101" WHEN "0101",
					  "1111101" WHEN "0110",
					  "0000111" WHEN "0111",
					  "1111111" WHEN "1000",
					  "1101111" WHEN "1001",
					  "0000000" WHEN OTHERS;
S0 <= out_aux(0);
S1 <= out_aux(1);
S2 <= out_aux(2);
S3 <= out_aux(3);
S4 <= out_aux(4);
S5 <= out_aux(5);
S6 <= out_aux(6);
END;
