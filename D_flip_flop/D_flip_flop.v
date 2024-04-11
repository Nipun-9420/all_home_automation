
module d_ff(q,qbar,d,rst,clk);
  input d,clk,rst;
  output q, qbar;
  wire w1,w2;
nd_ff_latch m1	(w1,w2,rst,d,clk);
d_ff_latch m2  (q,qbar,rst,w1,clk);
  
  endmodule
module d_ff_latch(q,qbar,rst,d,clk);
  input d,clk,rst;
  output q, qbar;
  wire dbar; //output of not1
  wire nand1_out; // output of nand1
  wire nand2_out; // output of nand2
wire rstn;
not(rstn,rst);
  not ( dbar,d); 
  nand (nand1_out,rstn,clk,d);
  nand (nand2_out,rstn,clk,dbar);
    nand (q,qbar,rstn,nand1_out);
    nand (qbar,rstn,q,nand2_out);
  endmodule
  
module nd_ff_latch(q,qbar,rst,d,nclk);
  input d,nclk,rst;
  output q, qbar;
    wire rstn;
  not(rstn,rst);
  wire dbar; //output of not1
  wire nand1_out; // output of nand1
  wire nand2_out; // output of nand2
  wire clk;
  not (clk,nclk);
  not ( dbar,d); 
  nand (nand1_out,rstn,clk,d);
  nand (nand2_out,rstn,clk,dbar);
    nand (q,qbar,rstn,nand1_out);
    nand (qbar,rstn,q,nand2_out);
  endmodule