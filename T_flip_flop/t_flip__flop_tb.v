module d_ff_gate_tb;
  reg t, clk;
  wire q, qbar;
  t_ff DUV(qq,qqbar,t,cclk);
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
    #10 t = 1'b1;
    #10 t = 1'b1;
    #10 t = 1'b1;
    #05 t = 1'b1;
    #20 t = 1'b1;
    #17 t = 1'b1;
    #17 t = 1'b1;
    #17 t = 1'b1;
    #17 t = 1'b1;
    #17 t = 1'b1;
    #17 t = 1'b1;    
    #17 t = 1'b1;
    #17 t = 1'b1;    
    #10 t = 1'b1;
    #10 t = 1'b1;
    #10 t = 1'b1;
    #10 t = 1'b1;
    #100;

    $stop;
  end
endmodule