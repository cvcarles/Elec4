entity cell is
	port (
		c3,c2,c1,c0,rd,rg,ei,h:	bit;
		qi:	out bit
	);
end entity;


architecture algo of cell is

begin
process (h)
	variable d:	bit;
begin
	if h='1' and h'event then
		d := (ei and c1) or (d and c0) or (rd and c2) or (c3 and rg);
	end if;
	qi <= d;
end process;
end architecture;

architecture gene of reg is
component cell is
	port (
		c3,c2,c1,c0,rd,rg,ei,h:	bit;
		qi:	out bit
	);
end component;
	signal qint:	bit_vector (N-1 downto 0);
	signal c0,c1,c2,c3:	bit;
begin
	c0<= (not s(1)) and (not s(0));
	c1<= (not s(1)) and (s(0));
	c2<= (s(1)) and (not s(0));
	c3<= (s(1)) and (s(0));

	cell0: cell port map (c0=>c0,c1=>c1,c2=>c2,c3=>c3,rd=>ir,rg=>qint(1),ei=>e(0),h=>h,qi=>qint(0));
	link: for i in 1 to N-2 generate
		celli: cell port map (c0=>c0,c1=>c1,c2=>c2,c3=>c3,rd=>qint(i-1),rg=>qint(i+1),ei=>e(i),h=>h,qi=>qint(i));
	end generate;
	celln: cell port map (c0=>c0,c1=>c1,c2=>c2,c3=>c3,rd=>qint(N-2),rg=>il,ei=>e(N-1),h=>h,qi=>qint(N-1));
	q <= qint;
end architecture;






















