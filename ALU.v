module ALU (
    input wire [31:0] a,
    input wire [31:0] b,
    input wire [2:0] alu_control,
    output reg [31:0] result
);
    always @(*) begin
        case (alu_control)
            3'b010: result = a + b; // ADD
            3'b110: result = a - b; // SUB
            3'b000: result = a & b; // AND
            // Agrega aquí otros casos para diferentes operaciones ALU
            default: result = 0;
        endcase
    end
endmodule
