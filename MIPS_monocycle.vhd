library ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity MIPS_monocycle is

-- entradas e saidas aqui

end MIPS_monocycle;

architecture arch_MIPS_monocycle of MIPS_monocycle is

entity controle is
	port(
		instrucao: in signed(5 downto 0);
		Jump, RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite: out std_logic;
		ALUOp: out signed(1 downto 0)
	);
end controle;

component PC IS
	PORT(
		CLK :							IN		STD_LOGIC;
		RESET :						IN		STD_LOGIC;
		IN_PC :						IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
		OUT_PC :						OUT	STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END PC;


component MD IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		inclock		: IN STD_LOGIC  := '1';
		outclock		: IN STD_LOGIC ;
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END MD;

component MI IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END MI;


component	ula	is
generic	(	WSIZE	:	natural	:=	32);
port	(	
ulop :	in	std_logic_vector(3	downto	0);
A,	B :	in	std_logic_vector(WSIZE-1	downto	0);	
aluout:	out	std_logic_vector(WSIZE-1	downto	0);	
zero :	out	std_logic	
);
end	component;


component	c_ula	is
port	(
func	 :	in	std_logic_vector(5	downto	0);
opUla :	in	std_logic_vector(1	downto	0);
ctrula	 :	out	std_logic_vector(3	downto	0)
);
end	component;


component	breg	is
generic	(	

WSIZE	:	natural	:=	32;
ISIZE	:	natural	:=	5;
BREGSIZE	:	natural	:=	32	
);
end arch_MIPS_monocycle;

signal instrucao : std_logic_vector(31	downto	0);






process(instrucao)
begin

instrucao <= OUT_PC;

