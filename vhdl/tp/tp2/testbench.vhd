

entity test is
end entity;

architecture bench_1 of test is

	component mem_control is
		port (
			ready, rw, h, rst:	bit;
			oe,we:			out bit
		);
	end component;

	signal ready, rw, h, rst, oe, we:	bit;

	for UUT: mem_control use entity work.mem_control(beh_2);

begin

	UUT:	mem_control port map (ready=>ready, rw=>rw, h=>h, rst=>rst, oe=>oe, we=>we);

	rst	<=	'1';
	h	<=	not h after 5 ns;
	ready	<=	'1' after 12 ns, '0' after 30 ns, '1' after 40 ns, '0' after 67 ns, '1' after 80 ns, '0' after 90 ns;
	rw	<=	'1' after 22 ns, '0' after 27 ns;

end architecture;

architecture bench_2 of test is

	component mem_control_burst is
		port (
			ready, rw, h, rst, burst :	bit;
			oe, we :			out bit;
			adr :	out bit_vector (1 downto 0)
		);
	end component;

	signal ready, rw, h, rst, oe, we, burst:	bit;
	signal adr:	bit_vector (1 downto 0);

	for UUT: mem_control_burst use entity work.mem_control_burst(beh);

begin

	UUT:	mem_control_burst port map (ready=>ready, rw=>rw, h=>h, rst=>rst, oe=>oe, we=>we, burst=>burst, adr=>adr);

	rst	<=	'1';
	h	<=	not h after 5 ns;
	ready	<=	'1' after 12 ns, '0' after 30 ns, '1' after 40 ns, '0' after 67 ns, '1' after 80 ns;
	rw	<=	'1' after 22 ns, '0' after 27 ns;
	burst	<=	'1' after 25 ns, '0' after 45 ns;

end architecture;

architecture bench_3 of test is

	component compteur is
		port (
			s, e, clk, rst :	bit;
			cup :	out bit
		);
	end component;

	signal s, e, clk, rst, z :	bit;

begin

	UUT: compteur port map (s=>s,e=>e,clk=>clk,rst=>rst,cup=>z);

	clk	<= 	not clk after 5 ns;

	rst	<= 	'1';
	e	<= 	'1' after 16 ns, '0' after 56 ns;
	s	<= 	'1' after 56 ns, '0' after 66 ns;
	
end architecture;

architecture bench_4 of test is

	component compteur is
		port (
			s, e, clk, rst :	bit;
			cup :	out bit
		);
	end component;

	signal s, e, clk, rst, z :	bit;

begin
	UUT: compteur port map (s=>s,e=>e,clk=>clk,rst=>rst,cup=>z);

	clk	<=	not clk after 5 ns;

	rst	<=	'1';
	e	<=	'1' after 14 ns, '0' after 54 ns;
	s	<=	'1' after 54 ns, '0' after 64 ns;

end architecture;




