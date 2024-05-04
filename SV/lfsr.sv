module lfsr(seed, clk, reset, shift_seed);
    input logic [15:0] seed;
    input logic clk, reset;

    output logic [15:0] shift_seed;

    always @(posedge clk) begin
        if(reset) shift_seed <= seed[15:0];
        else shift_seed <= {shift_seed[14:0], (shift_seed[15] ^ shift_seed[14] ^ shift_seed[12] ^ shift_seed[3])};
    end
endmodule

module lfsrx64(seed, clk, reset, shift_seed);
    input logic [63:0] seed;
    input logic clk, reset;

    output logic [63:0] shift_seed;

    logic [15:0] start_seed4 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
                                1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
    logic [15:0] start_seed3 = {1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
                                1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
    logic [15:0] start_seed2 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
                                1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0};
    logic [15:0] start_seed1 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 
                                1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};    

    logic [15:0] shift_seed1, shift_seed2, shift_seed3, shift_seed4;

    lfsr l1(start_seed1, clk, reset, shift_seed1);
    lfsr l2(start_seed2, clk, reset, shift_seed2);
    lfsr l3(start_seed3, clk, reset, shift_seed3);
    lfsr l4(start_seed4, clk, reset, shift_seed4);

    always @(posedge clk) begin
        if(reset) shift_seed = {start_seed4, start_seed3, start_seed2, start_seed1};
        else shift_seed = {shift_seed4, shift_seed3, shift_seed2, shift_seed1};
    end
endmodule