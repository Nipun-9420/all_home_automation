//----------PSTER UNLOCK 110
module pattern(in,clk,out,rst);
    input in,clk,rst;
    output out;
      wire w1,w2;
      not n1(w1,in);
      d_ff f1(w2,w5,w1,rst,clk);
      and a1(w3,w2,in);
      d_ff(w4,w6,w3,rst,clk);
      and(out,x,w4);
      
    endmodule
    /*
    module counter(clk,rst,d_out) ;
        input clk,rst;
        output reg[1:0] d_out;
          wire w1;
        reg sig =1;
        t_ff t1(d_out[0],w1,sig,rst,clk);
        t_ff t2(d_out[1],qbar,sig,rst,w1);
      endmodule
    */
      module t_ff(q,qbar,t,rst,clk);
         input t,clk,rst;
          output q, qbar;
        wire w1;
        xor(w1,t,q);
        d_ff(q,qbar,w1,rst,clk);
      endmodule
    
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