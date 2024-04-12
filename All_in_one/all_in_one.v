module test(FA,FAout,AC_OUT,Lig_in,lig_out,Lin,clk,Lout,rst);
    input [3:0]FA;
    output [3:0]FAout;
    output AC_OUT;

    input [3:0]Lig_in;
    output lig_out;

    wire [3:0]B;
    wire [3:0]Light_B;

    wire [3:0]W1;
    wire [3:0]W2;
    wire [3:0]L_W1;
    wire [3:0]L_W2;
	 
	 wire [3:0]AC_W2;
	 
	 wire a0,a1,a2,a3,a4,a5,a6;

    wire in,oout;
    wire lin,loout;
	 
	 input Lin,clk,rst;
    output Lout;
	 
    idle_temp IT(B);
    full_substracter dd1(FA,B,in,W1,oout);
    fan_speed fs(w2);
    Adder dd2(W1,w2,in,FAout,oout);

    //----------------light logic 
    idle_light(Light_B);
    full_substracter dl1(Lig_in,Light_B,lin,L_W1,loout);
    light_value ls(L_W2);
    Adder dl2(L_W1,L_W2,lin,lig_out,oout);
	 //------------------AC_logic 
	 ac_value(AC_W2);
	 not(a3,B[1]);
	 and(a0,a3,AC_W2[1]);
	 not(a4,B[0]);
	 and(a1,a4,AC_W2[1],AC_W2[0]);
	not(a6,B[1]);
	not(a5,B[0]);
	and(a2,a6,a5,AC_W2[0]);
	or(AC_OUT,a0,a1,a2);
	//---------------------lock 
	lOCK ll1(Lin,clk,Lout,rst);
	 
    endmodule
    module idle_light(light);
        output[3:0]light;
        reg [3:0]light_value =0101;
        assign light =light_value;
    endmodule

    module light_value(f_speed);
        output[3:0]f_speed;
        reg [3:0]vf_speed =1001;
        assign f_speed =vf_speed;
    endmodule

	 
    module ac_value(AC);
    output[3:0]AC;
    reg [3:0]AC_speed =1001;
    assign AC =AC_speed;
    endmodule
    


    module fan_speed(f_speed);
    output[3:0]f_speed;
    reg [3:0]vf_speed =1001;
    assign f_speed =vf_speed;
    endmodule
    
    
    
    module idle_temp(temp);
    output[3:0]temp;
    reg [3:0]temp_va =1101;
    assign temp =temp_va;
    endmodule
    
    
    module Adder(a,b,cin,sum,cout);
        input [3:0]a,b;
        input cin;
        output wire [3:0]sum;
        output cout;
        FullAdder FA1(a[0],b[0],cin,sum[0],cout1);
        FullAdder FA2(a[1],b[1],cout1,sum[1],cout2);
        FullAdder FA3(a[2],b[2],cout2,sum[2],cout3);
        FullAdder FA4(a[3],b[3],cout3,sum[3],cout);
        endmodule
        
        module FullAdder(a,b,cin,sum,cout);
        input a,b,cin;
        output wire sum,cout;
        wire s1,c1,c2,c3;
        xor(s1,a,b);
        xor(sum,s1,cin);
        and(c1,a,b);
        and(c2,b,cin);
        and(c3,a,cin);
        or(cout,c1,c2,c3);
        endmodule
        
    
    
    
    
    
    module full_substracter (
      input [3:0] A, // input: 4-bit value A
      input [3:0] B, // input: 4-bit value B
      input In,      // input: carry-in input
      output [3:0] Res, // output: 4-bit result
      output Out     // output: carry-out output
    );
    
      wire t1, t2, t3, t4, t5, t6, t7;
    
      // 4-bit XOR gate to calculate the difference between A and B
      xor (t1, A[0], B[0]);
      xor (t2, A[1], B[1]);
      xor (t3, A[2], B[2]);
      xor (t4, A[3], B[3]);
    
      // 4-bit full adder to calculate the result and carry-out
      full_adder fa0 (t1, In, 0, Res[0], t5);
      full_adder fa1 (t2, t5, 0, Res[1], t6);
      full_adder fa2 (t3, t6, 0, Res[2], t7);
      full_adder fa3 (t4, t7, 0, Res[3], Out);
    
    endmodule
    
    module full_adder (
      input A, B, Cin,
      output Sum, Cout
    );
    
      wire t1, t2;
    
      xor (t1, A, B);
      xor (Sum, t1, Cin);
      and (t2, A, B);
      or (Cout, t2, Cout);
    
    endmodule
	 
	 
	 //----------PSTER UNLOCK 110
module lOCK(in,clk,out,rst);
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
			 
			 