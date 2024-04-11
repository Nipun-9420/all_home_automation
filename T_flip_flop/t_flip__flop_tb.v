module d_ff_gate_tb;
  reg t, clk,rst;
  wire q, qbar;
  t_ff DUV(q,qbar,t,rst,clk);
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
  initial begin
    clk=0;
    rst =1;
    #10;
    rst =0;
  end
  always
    begin
    clk= ~ clk;#10;
    end
  
  initial begin
    clk = 0;
    t= 0;
    #10 t = 1'b1;
    #10 t = 1'b1;

    #1000;

    $stop;
  end
endmodule