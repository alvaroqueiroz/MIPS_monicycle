library	ieee;
use	ieee.std_logic_1164.all;	
use	ieee.numeric_std.all;

entity	ula	is

generic	(	WSIZE	:	natural	:=	32);

port	(	
ulop :	in	std_logic_vector(3	downto	0);
A,	B :	in	std_logic_vector(WSIZE-1	downto	0);	
aluout:	out	std_logic_vector(WSIZE-1	downto	0);	
zero :	out	std_logic	
);
end	ula;

architecture	behavioral	of	ula	is
signal	tmp	:	std_logic_vector(WSIZE-1	downto	0);	
signal	a32	:	std_logic_vector(WSIZE-1	downto	0);
constant	C_ZERO	:	std_logic_vector(WSIZE-1	downto	0)	:=	(others	=>	'0');

begin
tmp	<=	std_logic_vector(signed(A)	- signed(B));
aluout	<=	a32;	

proc_ula:	process	(A,	B,	ulop,	a32,	tmp)
begin

if	(a32	=	C_ZERO)
then	zero	<=	'1';
else	zero	<=	'0';	
end	if;	

case	ulop	is
when	"0000"	=>	--and
a32	<=	A	and	B;
when	"0001"		=>	-- or
a32	<=	A	or	B;
when	 "0010"	 => -- sum
a32	 <=	 std_logic_vector(signed(A)	 +	 signed(B));
when	"0110"	=>	-- sub
a32	<=	tmp;
when	"0111"	=>	-- slt
a32	<=	(0	=>	tmp(31),	others	=>	'0');	
when	"1100"	=>	-- nor
a32	<=	A	nor	B;
when  "1010" => -- SLL A,B
a32 <= (std_logic_vector(unsigned(B) sll to_integer(unsigned(A))));
when  "1011" => -- SRL A,B
a32 <= (std_logic_vector(unsigned(B) srl to_integer(unsigned(A))));
when  "1110" => -- SRA A,B
a32 <= (to_stdlogicvector(to_bitvector(B) sra to_integer(unsigned(A))));
when  "1111" => -- xor A,B
a32	<=	A	xor	B;

when	others	=>	
a32	<=	(others	=>	'X');	
end	case;

end	process;
end	architecture	behavioral;
