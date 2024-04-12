module add_sub_4 (A, B, Cin, Sum, Cout);
    input [3:0] A, B;
    input Cin;
    output [3:0] Sum;
    output Cout;
    wire t1,t2,t3,t4,t5,t6,t7;


          xor x3(t3,B[0],Cin);
          xor x4(t4,B[1],Cin);
          xor x5(t5,B[2],Cin);
          xor x6(t6,B[3],Cin);
          fadder f5(A[0],t3,Cin,Sum[0],t1);
          fadder f6(A[1],t4,t1,Sum[1],t2);
          fadder f7(A[2],t5,t2,Sum[2],t3);
          fadder f8(A[3],t6,t3,Sum[3],Cout);  
endmodule   



module fadder (A, B, CCin, Sum, CCout);
    input A, B;
    input CCin;
    output Sum;
    output CCout;
    wire t1,t2,t3,t4;
  xor x1(t1,A,B);
  xor x2(Sum,t1,CCin);
  and g1(t2,A,B);
  and g2(t3,B,CCin);
  and g3(t4,CCin,A);
  or  g4(CCout,t2,t3,t4);  
endmodule
