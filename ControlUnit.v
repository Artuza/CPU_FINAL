module ControlUnit (
    input [5:0] opcode,
    output reg we_reg,
    output reg we_mem,
    output reg mem_read,
    output reg [2:0] alu_control
);

    always @(*) begin
        // Inicializar las señales de control
        we_reg = 1'b0;
        we_mem = 1'b0;
        mem_read = 1'b0;
        alu_control = 3'b000; // Default (NOP)

        case (opcode)
            6'b100011: begin // LW
                we_reg = 1'b1;
                mem_read = 1'b1;
                alu_control = 3'b010; // Suma para calcular la dirección de memoria
            end
            6'b101011: begin // SW
                we_mem = 1'b1;
                alu_control = 3'b010; // Suma para calcular la dirección de memoria
            end
            6'b000000: begin // ADD
                we_reg = 1'b1;
                alu_control = 3'b010; // Operación de suma en la ALU
            end
            // Agrega aquí otros casos para diferentes instrucciones
            default: begin
                // Señales de control por defecto ya inicializadas
            end
        endcase
    end
endmodule
