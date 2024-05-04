`timescale 1ns / 1ps
module tb ();
    logic clk, start, lfsr_load, reset;

    logic rst, en;

    //Out vars
    integer handle3;
    integer desc3;

    fsm state(clk, start, lfsr_load, reset, en, rst);

    // 20 ns clock
    initial begin	
        clk = 1'b1;
        forever #5 clk = ~clk;
    end


    initial begin
        handle3 = $fopen("fsm.out");
        #500 $finish;
    end

    always @(negedge clk) begin
        desc3 = handle3;
        $fdisplay(desc3, "%b || %b || %b || %b", start, lfsr_load, en, rst);
    end

    initial begin
        #0 start = 1'b0;
        #0 lfsr_load = 1'b0;

        #20 start = 1'b1;

        #20 lfsr_load = 1'b1;
        
        #40 lfsr_load = 1'b0;

        #40 start = 1'b1;
    end
endmodule