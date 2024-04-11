module d_ff_gate_tb;
  reg d, clk;
  wire q, qbar;
  d_ff DUV (q, qbar, d, clk);
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
  initial begin
    clk=0;
  end
  always
    begin
    clk= ~ clk;#10;
    end
  
  initial begin
    clk = 0;
    d = 0;
    #10 d = 1'b1;
    #10 d = 1'b0;
    #10 d = 1'b1;
    #05 d = 1'b0;
    #20 d = 1'b0;
    #17 d = 1'b1;
    #17 d = 1'b0;
    #17 d = 1'b1;
    #17 d = 1'b0;
    #17 d = 1'b1;
    #17 d = 1'b1;    
    #17 d = 1'b1;
    #17 d = 1'b1;    
    #10 d = 1'b0;
    #10 d = 1'b0;
    #10 d = 1'b1;
    #10 d = 1'b1;
    #100;

    $stop;
  end
endmodule