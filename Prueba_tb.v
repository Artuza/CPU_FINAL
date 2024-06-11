`timescale 1ns / 1ps

module Prueba_tb;

    // Parámetros del módulo
    parameter CLK_PERIOD = 10; // Periodo del reloj en unidades de tiempo

    // Señales de entrada
    reg clk;
    reg reset;

    // Señales de salida
    wire [31:0] instr;
    wire [31:0] rd1, rd2, alu_out, mem_out, pc, next_pc;
    wire we_reg, we_mem;
    wire [2:0] alu_control;

    // Instanciación del módulo bajo prueba
    CPU dut (
        .clk(clk),
        .reset(reset),
        .instr(instr),
        .rd1(rd1),
        .rd2(rd2),
        .alu_out(alu_out),
        .mem_out(mem_out),
        .pc(pc),
        .next_pc(next_pc),
        .we_reg(we_reg),
        .we_mem(we_mem),
        .alu_control(alu_control)
    );

    // Generación de señal de reloj
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Inicialización de la simulación
    initial begin
        $dumpfile("cpu_waveform.vcd"); // Archivo para guardar las ondas
        $dumpvars(0, Prueba_tb); // Guardar todas las señales
        clk = 0; // Inicializar reloj
        reset = 1; // Inicializar señal de reset
        #100; // Esperar un poco
        reset = 0; // Desactivar reset

        // Simulación de operaciones de Fibonacci
        // Supongamos que ya se han realizado todas las configuraciones necesarias para calcular Fibonacci en el hardware

        // Simulación de carga de valores iniciales
        #10;
        // Simular carga de los primeros valores de Fibonacci en los registros
        // Esto puede requerir configuraciones específicas en el hardware, que no se incluyen en este testbench

        // Simulación del cálculo de Fibonacci y escritura en memoria
        #10;
        // Simular la ejecución del bucle para calcular y escribir los términos de Fibonacci en la memoria
        // Esto también requeriría configuraciones específicas en el hardware, que no se incluyen aquí

        // Simulación de otras operaciones o pruebas según sea necesario
        // Aquí puedes agregar más pasos de simulación para probar otras funcionalidades del hardware

        // Terminar la simulación después de un tiempo suficiente
        #1000; // Ejecutar la simulación durante un tiempo
        $finish; // Terminar simulación
    end

endmodule
