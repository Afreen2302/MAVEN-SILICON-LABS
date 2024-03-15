module full_adder_tb();

  reg   a,b,cin;
  wire  sum,carry;
 
  integer i;

  //Instantiate the full adder
  full_adder FA1(.a(a), .b(b), .c(cin), .sum(sum), .carry(carry));

  initial 
  begin
    a   = 1'b0;
    b   = 1'b0;
    cin = 1'b0;
  end

  initial
  begin 
    for (i=0;i<8;i=i+1)
    begin
      {a,b,cin}=i;
      #10;
    end
  end

  initial $monitor("Input a=%b, b=%b, c=%b, Output sum =%b, carry=%b",
                  a,b,cin,sum,carry);

  initial #100 $finish;

endmodule
