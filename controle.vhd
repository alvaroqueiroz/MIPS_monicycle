library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controle is
	port(
		instrucao: in signed(5 downto 0);
		Jump, RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite: out std_logic;
		ALUOp: out signed(1 downto 0)
	);
end controle;

architecture behavior of controle is
begin
    process(instrucao)
    begin
        case instrucao is
            -- R-Format
            when "000000" =>
                RegDst   <= '1';
                Jump     <= '0';
                Branch   <= '0';
                MemRead  <= '0';   
                MemtoReg <= '0';
                MemWrite <= '0';
                ALUSrc   <= '0';
                RegWrite <= '1';
                ALUOp    <= "10";
            
            -- LW
            when "100011" =>
                RegDst   <= '0';
                Jump     <= '0';
                Branch   <= '0';
                MemRead  <= '1';   
                MemtoReg <= '1';
                MemWrite <= '0';
                ALUSrc   <= '1';
                RegWrite <= '1';
                ALUOp    <= "00";
            
            -- SW
            when "101011" =>
                RegDst   <= '0';
                Jump     <= '0';
                Branch   <= '0';
                MemRead  <= '0';   
                MemtoReg <= '0';
                MemWrite <= '1';
                ALUSrc   <= '1';
                RegWrite <= '0';
                ALUOp    <= "00";
                
            -- BEQ
            when "000100" =>
                RegDst   <= '0';
                Jump     <= '0';
                Branch   <= '1';
                MemRead  <= '0';   
                MemtoReg <= '0';
                MemWrite <= '0';
                ALUSrc   <= '0';
                RegWrite <= '0';
                ALUOp    <= "01";
            
            -- BNE
            when "000101" =>
                RegDst   <= '0';
                Jump     <= '0';
                Branch   <= '1';
                MemRead  <= '0';   
                MemtoReg <= '0';
                MemWrite <= '0';
                ALUSrc   <= '0';
                RegWrite <= '0';
                ALUOp    <= "01";
            
            -- J
            when "000010" =>
                RegDst   <= '0';
                Jump     <= '1';
                Branch   <= '0';
                MemRead  <= '0';   
                MemtoReg <= '0';
                MemWrite <= '0';
                ALUSrc   <= '0';
                RegWrite <= '0';
                ALUOp    <= "00";
            

            -- ADDI
            when "001000" =>
                RegDst   <= '0';
                Jump     <= '0';
                Branch   <= '0';
                MemRead  <= '0';   
                MemtoReg <= '0';
                MemWrite <= '0';
                ALUSrc   <= '1';
                RegWrite <= '1';
                ALUOp    <= "00";
                            

        end case;
    end process;
end behavior;