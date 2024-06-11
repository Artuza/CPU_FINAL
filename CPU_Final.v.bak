module ControlUnit (
    input wire [5:0] opcode,
    output reg we_reg, we_mem, // Write enable para registros y memoria
    output reg [2:0] alu_control // Señal de control para ALU
);
    always @(*) begin
        case (opcode)
            6'b000000: begin // Código de operación para LOAD
                we_reg = 1;
                we_mem = 0;
                alu_control = 3'b000; // Suma para calcular la dirección efectiva
            end
            6'b000001: begin // Código de operación para SAVE
                we_reg = 0;
                we_mem = 1;
                alu_control = 3'b000; // Suma para calcular la dirección efectiva
            end
            // Otros códigos de operación
            default: begin
                we_reg = 0;
                we_mem = 0;
                alu_control = 3'b000;
            end
        endcase
    end
endmodule
