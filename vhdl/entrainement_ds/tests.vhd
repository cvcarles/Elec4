package monpack is
	subtype mon_vecteur is bit_vector (3 downto 0);
end package;
package body monpack is
end package body;

library work;
	use work.monpack.all;

entity dummy is
	port (
		a,b:	mon_vecteur;
		s:	bit
	);
end entity;

architecture test of dummy is

begin

end architecture;