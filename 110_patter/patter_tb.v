module d_ff_gate_tb;
    reg clk,rst,in;
    reg out;
    pattern DUV (in,clk,out,rst);
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
      in=1;#10;
      in=1;#10;
      in=0;#10;
      in=1;#10;
      in=1;#10;
      in=0;#10;
      in=0;#10;
      in=0;#10;
      in=0;#10;
      in=1;#10;
      in=1;#10;
      in=0;#10;
      in=1;#10;
      in=1;#10;
      in=0;#10;
      in=1;#10;
      in=1;#10;
      in=0;#10;
      in=0;#10;
      in=0;#10;
      in=0;#10;
      in=1;#10;
      in=1;#10;
      in=0;#10;
      #300;
      $finish;
    end
  endmodule