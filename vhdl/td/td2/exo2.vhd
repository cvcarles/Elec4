
entity latch is
	port (
		d:		bit;
		clk, rst:	bit;
		q,qb:		out bit
	);
end entity;

architecture beh of latch is
begin
	process (clk, rst)
	variable v:	bit;	
	begin
		if rst = '1' then
			v := '0';	
		elsif clk'event and clk = '1' then
			v := d;
		end if;
	q <= v;
	qb <= not v;
	end process;
end beh;