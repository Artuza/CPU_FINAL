module RAM (
    input wire clk,
    input wire we,
    input wire [31:0] addr,
    input wire [31:0] wd,
    output wire [31:0] rd
);
    reg [31:0] memory [0:255]; // Memoria de 256 palabras de 32 bits

    assign rd = memory[addr[7:0]];

    always @(posedge clk) begin
        if (we) begin
            memory[addr[7:0]] <= wd;
        end
    end
endmodule
