module fsm(clk, start, lfsr_load, reset, en, rst);
    input logic clk, start, lfsr_load, reset;

    output logic rst, en;

    typedef enum logic [1:0] {S0, S1, S2} statetype;
    statetype state, nextstate;

    always_ff @(posedge clk, posedge reset) begin
        if(reset) state <= S0;
        else state <= nextstate;
    end

    always_comb begin
        case(state)
            S0: begin
                rst = 1'b1;
                en = 1'b1;

                if(start && ~lfsr_load) nextstate <= S1;
                else nextstate <= S0;
            end

            S1: begin
                rst = 1'b0;
                en = 1'b0;

                if(lfsr_load) nextstate <= S2;
                else nextstate <= S1;
            end

            S2: begin
                rst = 1'b0;
                en = 1'b1;

                if(~lfsr_load && start) nextstate <= S1;
                else nextstate <= S2;
            end

            default: begin
                rst = 1'b1;
                en = 1'b1;
                nextstate <= S0;
            end
        endcase
    end
endmodule