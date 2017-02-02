library ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
use	work.mips_pkg.all;
 
 
entity	c_ula	is
port	(
func	 :	in	std_logic_vector(5	downto	0);
opUla :	in	std_logic_vector(1	downto	0);
ctrula	 :	out	std_logic_vector(3	downto	0)
);
end	c_ula;

ARCHITECTURE behavioral OF c_ula IS
BEGIN PROCESS (func)
		BEGIN				
			CASE opULA IS
					WHEN "10" => --tipo R
						CASE func IS
							WHEN "100000" => --add
								ctrula <= "0010";
							WHEN "100010" => --sub
								ctrula <= "0110";
							WHEN "100100" => --and
								ctrula <= "0000";
							WHEN "100101" => --or
								ctrula <= "0001";
							WHEN "101010" => --slt
								ctrula <= "0111";
							WHEN "100111" => -- nor
								ctrula <= "1100";
							WHEN "100110" => --xor
								ctrula <= "1111";
							WHEN "000000" => -- sll
								ctrula <= "1010";
							WHEN "000010" => --srl
								ctrula <= "1011";
							WHEN "000011" => --sra
								ctrula <= "1110";
							
							WHEN OTHERS =>
								ctrula <= "XXXX";
						END CASE;
					WHEN "00" => --add
						ctrula <= "0010";
					WHEN "01" => -- sub
						ctrula <= "0110";
					WHEN OTHERS =>
						ctrula <= "XXXX";
						
				END CASE;			
		END PROCESS;
END behavioral;