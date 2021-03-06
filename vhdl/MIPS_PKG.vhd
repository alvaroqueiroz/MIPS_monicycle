library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;	
	
package	mips_pkg	is	
	
--	Declaracao	de	componentes

		component	ula	is
		generic	(	WSIZE	:	natural	:=	32);
		port	(
			ulop	:	in	std_logic_vector(3	downto	0);
			A,	B	:	in	std_logic_vector(WSIZE-1	downto	0);
			aluout:	out	std_logic_vector(WSIZE-1	downto	0);
			zero	:	out	std_logic
		);
		end	component;

		component	c_ula	is
		port	(
			func			:	in	std_logic_vector(5	downto	0);
			opUla		:	in	std_logic_vector(1	downto	0);
			ctrula			:	out	std_logic_vector(3	downto	0)
		);
		end	component;

		component	breg	is
		generic	(	WSIZE	:	natural	:=	32;
						ISIZE	:	natural	:=	5;
						BREGSIZE	:	natural	:=	32	);
		port
		(
			clk		:	in		std_logic;
			we			:	in		std_logic;	
			rs			:	in		std_logic_vector(ISIZE-1	downto	0);
			rt			:	in		std_logic_vector(ISIZE-1	downto	0);
			rd			:	in		std_logic_vector(ISIZE-1	downto	0);
			d_in		:	in		std_logic_vector(WSIZE-1	downto	0);
			regA			:	out	std_logic_vector(WSIZE-1	downto	0);
			regB			:	out	std_logic_vector(WSIZE-1	downto	0)
		);
		end	component;	
	
	--	Controle	ULAmips

	constant	ULA_AND		:	std_logic_vector(3	downto	0)	:=	"0000";	--	0
	constant	ULA_OR		:	std_logic_vector(3	downto	0)	:=	"0001";	--	1
	constant	ULA_ADD		:	std_logic_vector(3	downto	0)	:=	"0010";	--	2
	constant	ULA_SUB		:	std_logic_vector(3	downto	0)	:=	"0110";	--	6
	constant	ULA_SLT		:	std_logic_vector(3	downto	0)	:=	"0111";	--	7
	constant	ULA_NOR		:	std_logic_vector(3	downto	0)	:=	"1100";	--	12
	constant	ULA_XOR		:	std_logic_vector(3	downto	0)	:=	"1101";	--	13
	constant	ULA_UKW		:	std_logic_vector(3	downto	0)	:=	"XXXX";

end	mips_pkg;	