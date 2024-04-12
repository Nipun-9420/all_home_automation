module test;
  reg [3:0]a,b;
  reg cin;
  reg [3:0]sum;
  
    Adder DUV(a,b,cin,sum,cout);

    initial 
      begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    //#100000;
    end
  
    initial
  begin
$monitor("A=%0b,B=%0b,In=%0b,Res=%0b,Out=%0b",a,b,cin,sum,cout);
  #10; cin=0; a=4'b1010; b=4'b0101;
  #10; cin=0; a=4'b0101; b=4'b0010;
  #10; cin=0; a=4'b0111; b=4'b0011;
  #10; cin=0; a=4'b0111; b=4'b0001;
  #10000;$finish;
  end 
endmodule