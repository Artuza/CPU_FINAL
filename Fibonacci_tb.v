`timescale 1ns / 1ps

module Fibonacci_tb;

    // Señales de testbench
    reg clk;
    reg reset;
    
    // Instancia del CPU
    CPU cpu (
        .clk(clk),
        .reset(reset)
    );
    
    // Generación de reloj
    always #5 clk = ~clk;
    
    // Programa de Fibonacci en la memoria de instrucciones
    initial begin
        // Inicializar el clock y el reset
        clk = 0;
        reset = 1;
        
        // Cargar el programa de Fibonacci en la memoria de instrucciones
        // Suponiendo que la memoria de instrucciones está mapeada de 0 a 255
        // Programa simple:
        // 1. Initialize: R1 = 0, R2 = 1
        // 2. Calculate next: R3 = R1 + R2
        // 3. Shift: R1 = R2, R2 = R3
        // 4. Repeat
        
        // Instrucciones en memoria de programa (Ejemplo en hexadecimal)
        // LOAD R1, 0
        // LOAD R2, 1
        // LOOP: ADD R3, R1, R2
        // LOAD R1, R2
        // LOAD R2, R3
        // JMP LOOP (vuelve a la instrucción en índice 2)
        
        cpu.pmem.memory[0] = 32'h20010000; // LOAD R1, 0
        cpu.pmem.memory[1] = 32'h20020001; // LOAD R2, 1
        cpu.pmem.memory[2] = 32'h00221820; // ADD R3, R1, R2
        cpu.pmem.memory[3] = 32'h20410000; // LOAD R1, R2
        cpu.pmem.memory[4] = 32'h20420003; // LOAD R2, R3
        cpu.pmem.memory[5] = 32'h08000002; // JMP LOOP (vuelve a la instrucción en índice 2)
        
        // Liberar el reset
        #10 reset = 0;
    end
    
    initial begin
        // Finalizar la simulación después de un tiempo
        #1000 $finish;
    end

endmodule
