module RegisterFile (
    input wire clk,
    input wire reset,
    input wire we,
    input wire [4:0] ra1,
    input wire [4:0] ra2,
    input wire [4:0] wa,
    input wire [31:0] wd,
    output wire [31:0] rd1,
    output wire [31:0] rd2
);
    reg [31:0] registers [0:31];
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end else if (we) begin
            registers[wa] <= wd;
        end
    end

    assign rd1 = registers[ra1];
    assign rd2 = registers[ra2];
endmodule
