// just inverted input
module t_ff(qq,qqbar,t,cclk);
    input t,cclk;
    output qq, qqbar;
    wire w1,w2,w3;
      not(w3,t);
      nd_ff_gate m1(w1,w2,w3,cclk);
      d_ff_gate m2(qq,qqbar,w1,cclk);
    
    endmodule
    module d_ff_gate(q,qbar,d,clk);
    input d,clk;
    output q, qbar;
    wire dbar; //output of not1
    wire nand1_out; // output of nand1
    wire nand2_out; // output of nand2
    not ( dbar,d); 
    nand (nand1_out,clk,d);
    nand (nand2_out,clk,dbar);
      nand (q,qbar,nand1_out);
      nand (qbar,q,nand2_out);
    endmodule
    
    module nd_ff_gate(q,qbar,d,nclk);
    input d,nclk;
    output q, qbar;
    wire dbar; //output of not1
    wire nand1_out; // output of nand1
    wire nand2_out; // output of nand2
    wire clk;
    not (clk,nclk);
    not ( dbar,d); 
    nand (nand1_out,clk,d);
    nand (nand2_out,clk,dbar);
      nand (q,qbar,nand1_out);
      nand (qbar,q,nand2_out);
    endmodule