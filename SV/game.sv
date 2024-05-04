module game(clk, reset, lfsr_load, start, q, grid_evolve, debug, debug2);
    input logic clk, reset, lfsr_load, start;

    output logic [63:0] q;
    output logic [63:0] grid_evolve;
    output logic [63:0] debug;
    output logic [1:0] debug2;

    logic [63:0] shift_seed, grid;
    logic rst, en;
    logic [63:0] seed, d;

    fsm state(clk, start, lfsr_load, reset, en, rst);

    assign debug2[0] = en;
    assign debug2[1] = rst;

    lfsrx64 random(seed, clk, rst, shift_seed);

    assign debug = shift_seed;

    mux2 #(64) plex (
        .d0(q),
        .d1(shift_seed),
        .s(en),
        .y(grid)
    );

    datapath dut(grid, grid_evolve);

    flopr #(64) timing (
        .clk(clk),
        .reset(rst),
        .d(grid_evolve),
        .q(q)
    );
endmodule