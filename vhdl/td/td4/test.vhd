entity test is
end test;

architecture simu of test is
	component genpwm is
		port (
			CV:		natural range 0 to 255;
			rst,clk:	bit;
			pwm:		out bit
		);
	end component;
	signal CV:		natural range 0 to 255;
	signal rst,clk,pwm:	bit;
begin
	UUT:	genpwm port map (CV,rst,clk,pwm);
	clk <=	'1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns,
		'1' after 25 ns, '0' after 30 ns, '1' after 35 ns, '0' after 40 ns, 
		'1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns,
		'1' after 65 ns, '0' after 70 ns, '1' after 75 ns, '0' after 80 ns;
	rst <=	'1';
	CV <=	3;
end simu;