`timescale 1ns / 1ps
module tb ();

    logic [63:0] state = {
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0
    };
    logic [63:0] nextState;
    logic clk;

    integer handle3;
    integer desc3;
   
    datapath dp (state, nextState);

    // 20 ns clock
    initial begin	
        clk = 1'b1;
        forever #10 clk = ~clk;
    end


    initial begin
        handle3 = $fopen("datapath.out");
        #100 $finish;
    end

    always begin
        desc3 = handle3;
        
        #5 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            state[63], state[62], state[61], state[60],
            state[59], state[58], state[57], state[56]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            state[55], state[54], state[53], state[52],
            state[51], state[50], state[49], state[48]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            state[47], state[46], state[45], state[44],
            state[43], state[42], state[41], state[40]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            state[39], state[38], state[37], state[36],
            state[35], state[34], state[33], state[32]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            state[31], state[30], state[29], state[28],
            state[27], state[26], state[25], state[24]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            state[23], state[22], state[21], state[20],
            state[19], state[18], state[17], state[16]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            state[15], state[14], state[13], state[12],
            state[11], state[10], state[9], state[8]
        );
        #0 $fdisplay(desc3, "%d|%d|%d|%d|%d|%d|%d|%d",
            state[7], state[6], state[5], state[4],
            state[3], state[2], state[1], state[0]
        );
        
        #0 $fdisplay(desc3, "---------------");
        #0 state = nextState;
    end
   
endmodule
