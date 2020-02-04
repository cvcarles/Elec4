entity decodeur is
	port (
		E:	 	bit_vector ( 1 downto 0);
		S0, S1, S2, S3:	out bit
	);
end entity;


architecture beh of decodeur is
begin
	process (E)	
	begin
		case E is
			when "00" => S0 <= '1'; S1<= '0'; S2<= '0'; S3 <= '0';  
			when "01" => S0 <= '0'; S1<= '1'; S2<= '0'; S3 <= '0';  
			when "10" => S0 <= '0'; S1<= '0'; S2<= '1'; S3 <= '0';  
			when "11" => S0 <= '0'; S1<= '0'; S2<= '0'; S3 <= '1';
		end case;
	end process;
end architecture;  