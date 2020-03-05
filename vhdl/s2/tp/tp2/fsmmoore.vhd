library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;

--entity ctrlrs232c is
--	port(
--		dsr: out std_logic;
--		cts: out std_logic;
--		mam: out std_logic;
--		mad: out std_logic;
--		rst, clk:	std_logic;
--		m, dtr, rts:	std_logic;
--	);
--end entity;

architecture moore of ctrlrs232c is
	subtype DEFETAT is std_logic_vector(2 downto 0);
	constant CONFIG : DEFETAT := "00"; 
	constant FD : DEFETAT := "11"; 
	constant EMIS : DEFETAT := "01"; 
	constant RECEP : DEFETAT := "10"; 

	signal etat_courrant : DEFETAT;
	signal etat_suivant : DEFETAT;
begin
	seq: process (clk, rst)
	begin
		if rst ='0' then 
			etat_courrant <= CONFIG;
			dsr <= '1';
			cts <= '0';
			mam <= '0';
			mad <= '0';
	   	elsif clk'event and clk = '1' and dtr = '1' then
			etat_courrant <= etat_suivant;
		end if;
	end process;

	mad <= etat_courrant(0);
	mam <= etat_courrant(1);

	suivant: process (etat_courrant)
	begin
		case (etat_courrant) is
			when CONFIG =>
				if dtr = '1' then 
					etat_suivant <= CONFIG
				elsif m = '1' then
					etat_suivant <= FD;
				else
					etat_suivant <= RECEP;
				end if;

			when FD =>
				if dtr = '1' then 
					etat_suivant <= CONFIG;
				else
					etat_suivant <= FD;
				end if;

			when RECEP =>
				if dtr = '1' then 
					etat_suivant <= CONFIG;
				elsif rts = '0' then 
					etat_suivant <= EMIS;
				else
					etat_suivant <= RECEP;
				end if;

			when EMIS =>
				if dtr = '1' then 
					etat_suivant <= CONFIG;
				elsif rts = '0' then 
					etat_suivant <= EMIS;
				else
					etat_suivant <= RECEP;
				end if;
		end case;
	end process;

	sorties: process (etat_courrant)
	begin
		case (etat_courrant) is
			when CONFIG =>
				dsr <= '1';

			when FD =>
				dsr <= '0';

			when RECEP =>
				cts <= '1';
				dsr <= '0';

			when EMIS =>
				cts <= '0';
				dsr <= '0';
		end case; 
	end process;

end architecture moore;