ENTITY Decode3x8 IS
	PORT(A2, A1, A0, E : IN BIT;
			Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7 : OUT BIT);
END;

ARCHITECTURE behav OF Decode3x8 IS
	SIGNAL out_aux: BIT_VECTOR(7 DOWNTO 0);
	SIGNAL in_aux : BIT_VECTOR(3 DOWNTO 0);
BEGIN
	in_aux <= E & A2 & A1 & A0 ;
	WITH in_aux SELECT
		out_aux <= "00000001" WHEN "1000",
					  "00000010" WHEN "1001",
					  "00000100" WHEN "1010",
					  "00001000" WHEN "1011",
					  "00010000" WHEN "1100",
					  "00100000" WHEN "1101",
					  "01000000" WHEN "1110",
					  "10000000" WHEN "1111",
					  "00000000" WHEN OTHERS;
Y0 <= out_aux(0);
Y1 <= out_aux(1);
Y2 <= out_aux(2);
Y3 <= out_aux(3);
Y4 <= out_aux(4);
Y5 <= out_aux(5);
Y6 <= out_aux(6);
Y7 <= out_aux(7);
END;
