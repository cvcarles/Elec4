entity compteur is
	port (
		s, e, clk, rst :	bit;
		cup :	out bit
	);
end entity;

architecture beh of compteur is

	type defetat is (q0, q1, q2);
	signal etat, netat :	defetat; 
	signal z:	bit;
begin
	p1: process (clk, rst)
	begin
		if rst = '0' then etat <= q0;
		elsif clk = '1' and clk'event then etat <= netat;
		end if;
	end process;

	p2: process (etat, s, e)
	begin
		netat <= etat;
		z <= '0';
		if e = '1' then 
			case etat is
				when q0 =>
					if s = '1' then z <= '1'; netat <= q2;
					else netat <= q1;
					end if;
				when q1 =>
					if s = '1' then netat <= q0;
					else netat <= q2;
					end if;
				when q2 =>
					if s = '1' then netat <= q1;
					else z <= '1'; netat <= q0;
					end if;
			end case;
		end if;
	cup <= z;
	end process;
end architecture;
