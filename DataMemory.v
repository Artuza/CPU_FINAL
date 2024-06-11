module DataMemory (
    input wire clk,
    input wire we,
    input wire [31:0] addr,
    input wire [31:0] wd,
    output wire [31:0] rd
);
    reg [31:0] memory [0:1023];
    always @(posedge clk) begin
        if (we)
            memory[addr >> 2] <= wd; // Escritura en memoria alineada a 4 bytes
    end
    assign rd = memory[addr >> 2]; // Lectura de memoria alineada a 4 bytes
endmodule
