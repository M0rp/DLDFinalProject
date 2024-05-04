`timescale 1ns / 1ps
module tb ();
    logic clk, reset, lfsr_load, start;

    logic [63:0] q;
    logic [63:0] grid_evolve;
    logic [63:0] debug;
    logic [1:0] debug2;

    integer handle3;
    integer desc3;
   
    game dut (clk, reset, lfsr_load, start, q, grid_evolve, debug, debug2);

    // 20 ns clock
    initial begin	
        clk = 1'b1;
        forever #5 clk = ~clk;
    end


    initial begin
        handle3 = $fopen("game.out");
        #500 $finish;
    end

    always begin
        desc3 = handle3;
        #5 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            debug[63], debug[62], debug[61], debug[60],
            debug[59], debug[58], debug[57], debug[56]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            debug[55], debug[54], debug[53], debug[52],
            debug[51], debug[50], debug[49], debug[48]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            debug[47], debug[46], debug[45], debug[44],
            debug[43], debug[42], debug[41], debug[40]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            debug[39], debug[38], debug[37], debug[36],
            debug[35], debug[34], debug[33], debug[32]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            debug[31], debug[30], debug[29], debug[28],
            debug[27], debug[26], debug[25], debug[24]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            debug[23], debug[22], debug[21], debug[20],
            debug[19], debug[18], debug[17], debug[16]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            debug[15], debug[14], debug[13], debug[12],
            debug[11], debug[10], debug[9], debug[8]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            debug[7], debug[6], debug[5], debug[4],
            debug[3], debug[2], debug[1], debug[0]
        );

        #0 $fdisplay(desc3, "%d || %d", clk, reset);
        #0 $fdisplay(desc3, "%d || %d", debug2[0], debug2[1]);
        
        #0 $fdisplay(desc3, "---------------------------------");

        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            grid_evolve[63], grid_evolve[62], grid_evolve[61], grid_evolve[60],
            grid_evolve[59], grid_evolve[58], grid_evolve[57], grid_evolve[56]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            grid_evolve[55], grid_evolve[54], grid_evolve[53], grid_evolve[52],
            grid_evolve[51], grid_evolve[50], grid_evolve[49], grid_evolve[48]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            grid_evolve[47], grid_evolve[46], grid_evolve[45], grid_evolve[44],
            grid_evolve[43], grid_evolve[42], grid_evolve[41], grid_evolve[40]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            grid_evolve[39], grid_evolve[38], grid_evolve[37], grid_evolve[36],
            grid_evolve[35], grid_evolve[34], grid_evolve[33], grid_evolve[32]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            grid_evolve[31], grid_evolve[30], grid_evolve[29], grid_evolve[28],
            grid_evolve[27], grid_evolve[26], grid_evolve[25], grid_evolve[24]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            grid_evolve[23], grid_evolve[22], grid_evolve[21], grid_evolve[20],
            grid_evolve[19], grid_evolve[18], grid_evolve[17], grid_evolve[16]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            grid_evolve[15], grid_evolve[14], grid_evolve[13], grid_evolve[12],
            grid_evolve[11], grid_evolve[10], grid_evolve[9], grid_evolve[8]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            grid_evolve[7], grid_evolve[6], grid_evolve[5], grid_evolve[4],
            grid_evolve[3], grid_evolve[2], grid_evolve[1], grid_evolve[0]
        );
        
        #0 $fdisplay(desc3, "---------------------------------");
        
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            q[63], q[62], q[61], q[60],
            q[59], q[58], q[57], q[56]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            q[55], q[54], q[53], q[52],
            q[51], q[50], q[49], q[48]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            q[47], q[46], q[45], q[44],
            q[43], q[42], q[41], q[40]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            q[39], q[38], q[37], q[36],
            q[35], q[34], q[33], q[32]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            q[31], q[30], q[29], q[28],
            q[27], q[26], q[25], q[24]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            q[23], q[22], q[21], q[20],
            q[19], q[18], q[17], q[16]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            q[15], q[14], q[13], q[12],
            q[11], q[10], q[9], q[8]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            q[7], q[6], q[5], q[4],
            q[3], q[2], q[1], q[0]
        );
        
        #0 $fdisplay(desc3, "======================================");
    end

    initial begin
        desc3 = handle3;

        #0 reset = 1'b1;
        #0 reset = 1'b0;
        #0 start = 1'b0;
        #0 lfsr_load = 1'b0;

        #20 start = 1'b1;

        #20 lfsr_load = 1'b1;

        #40 lfsr_load = 1'b0;
        
        #40 start = 1'b1;
    end
endmodule