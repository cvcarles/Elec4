library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;

entity monostable is
	generic (T:	time := 20 ns);
	port (
		clk:	std_logic;
		q:	out std_logic
	);
end entity;

architecture beh of monostable is

begin
	process
	begin
		q	<=	'0';
		wait until clk = '1';
		q	<=	'1';
		wait for T;
	end process;

end architecture;

architecture redec_beh of monostable is
begin
	process
	begin
		q	<=	'0';
		wait until clk = '1';
		q	<=	'1';
		loop 
			wait until clk = '1' for T;
			exit when clk'stable;
		end loop;
	end process;
end architecture;