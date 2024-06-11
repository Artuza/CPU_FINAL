module CPU (
    input wire clk,
    input wire reset
);

    // Señales de interconexión
    wire [31:0] instr, rd1, rd2, alu_out, mem_out, pc, next_pc;
    wire we_reg, we_mem, mem_read;
    wire [2:0] alu_control;

    // Instanciar Program Counter
    ProgramCounter pc_reg (
        .clk(clk),
        .reset(reset),
        .next_pc(next_pc),
        .pc(pc)
    );

    // Instanciar memoria de instrucciones (Program Memory)
    ProgramMemory pmem (
        .addr(pc),
        .instr(instr)
    );

    // Instanciar banco de registros
    RegisterFile rf (
        .clk(clk),
        .reset(reset),
        .we(we_reg),
        .ra1(instr[25:21]),
        .ra2(instr[20:16]),
        .wa(instr[20:16]), // Para LW
        .wd(mem_out), // Dato proveniente de la memoria de datos
        .rd1(rd1),
        .rd2(rd2)
    );

    // Instanciar memoria de datos (Data Memory)
    DataMemory dmem (
        .clk(clk),
        .we(we_mem),
        .addr(alu_out),
        .wd(rd2),
        .rd(mem_out)
    );

    // Instanciar ALU
    ALU alu (
        .a(rd1),
        .b({{16{instr[15]}}, instr[15:0]}), // Sign-extend immediate
        .alu_control(alu_control),
        .result(alu_out)
    );

    // Instanciar unidad de control
    ControlUnit cu (
        .opcode(instr[31:26]),
        .we_reg(we_reg),
        .we_mem(we_mem),
        .mem_read(mem_read),
        .alu_control(alu_control)
    );

    // Calcular la siguiente dirección del PC
    assign next_pc = pc + 4;

endmodule
