module ProgramMemory (
    input wire [31:0] addr,
    output wire [31:0] instr
);
    // Suponiendo que la memoria está preinicializada con instrucciones
    reg [31:0] memory [0:1023];
    assign instr = memory[addr >> 2]; // Supone que la memoria está alineada a 4 bytes
endmodule
