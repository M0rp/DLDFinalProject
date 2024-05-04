module test ();
  logic [63:0] seed, out;

  logic clk, reset;

  logic [31:0] vectornum;

  integer handle3;
  integer desc3;

  lfsrx64 dut(seed, clk, reset, out);
  
  initial begin
    clk = 1'b1;
    forever #5 clk = ~clk;
  end
   
  initial begin
    handle3 = $fopen("lfsr.out");
    desc3 = handle3;

    vectornum = 0;

    #500 $fdisplay(desc3, "Test");
  end

  always @(negedge clk) begin
    desc3 = handle3;

    $fdisplay(desc3, "%b", out);
    vectornum = vectornum + 1;
    if(vectornum == 65537) begin
      $fdisplay(desc3, "Test2");
      $finish;
    end

		// if(~reset) begin
    //   //check if your output equals the initial output 
    //   //if so, report how many iterations it took to repeat
    //   //this should be (2^n) - 1
    //   //if the output never repeats for 2^n iterations, report that
    //   if(seed == out) begin
    //     desc3 = handle3;
    //     $fdisplay(desc3, "FOUND: %d", count);
    //   end

    //   if(count[64] && ~flag) begin
    //     flag = 1'b1;
    //     desc3 = handle3;
    //     $fdisplay(desc3, "EXCEEDS COUNT");
    //   end
		// end
	end

  initial begin
    #0 reset = 1'b1;
    #0 seed = {
      1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
      1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
      1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
      1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
      1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
      1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0,
      1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0,
      1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0
    };
    #20 reset = 1'b0;
  end
   
endmodule // tb

