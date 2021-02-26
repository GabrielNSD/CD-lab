ENTITY Marcapasso_Comb IS
PORT(s2, s1, s0, sa, za, sv, zv : IN BIT;
		n2, n1, n0, pa, ta, pv, tv : OUT BIT);
END;
ARCHITECTURE behav OF Marcapasso_Comb IS
BEGIN

n2 <= (not(s2) and s1 and s0) or (s2 and not(s1) and not(s0) and not(sv));
n1 <= (not(s2) and not(s1) and s0 and sa) or (not(s2) and not(s1) and s0 and za) or (not(s2) and s1 and not(s0));
n0 <= (not(s2) and not(s0)) or (not(s2) and not(s1) and s0 and sa) or (not(s2) and not(s1) and s0 and not(za))
		or (s2 and not(s1) and not(s0) and not(sv) and zv);
		
pa <= not(s2) and s1 and not(s0);
ta <= not(s2) and not(s1) and not(s0);
pv <= s2 and not(s1) and s0;
tv <= not(s2) and s1 and s0;

--n2 = s2's1s0 + s2s1's0'sv'
--n1 = s2's1's0sa + s2's1's0za + s2's1s0'
--n0 = s2's0' + s2's1's0sa + s2's1's0za' + s2s1's0'sv'zv

--pa = s2's1s0'
--ta = s2's1's0'
--pv = s2s1's0
--tv = s2's1s0
END;