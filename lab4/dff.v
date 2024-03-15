module d_ff(clk,
           reset,
           d,
           q,
           qb);

// Step1 : Declare Port Directions

  input clk,reset,d;	
  output reg q;
  output qb;

// Step2 : Write the behavioral logic for D flip-flop functionality.

  always@(posedge clk)
  begin
    if(reset)
      q=0;
    else
      q=d;
  end

//Step3. Assign complement of q to qb.

  assign qb=~q;       

endmodule         


