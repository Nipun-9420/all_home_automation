module d_ff_gate_tb;
    reg clk,rst;
    reg [1:0]d_out;
    counter DUV (clk,rst,d_out) ;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
    initial begin
      clk=0;
      rst =1;
      #10;
      rst =0;
      #10;
    end
    always
      begin
      clk= ~ clk;#10;
      end
    
    initial begin
      #1000;
      $finish;
    end
  endmodule