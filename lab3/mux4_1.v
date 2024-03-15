module mux4_1(a,
              sel,
              y);

// Step 1 : Define the port directions with proper datatypes and ranges. 
     
  input [3:0] a;	
  input [1:0] sel;
  output reg y;


// Step 2 : Write the MUX behaviour as a parallel logic using case statement in behaviour modelling.


  always@(*)	
  begin
    case(sel)
      2'd0:y=a[0];
      2'd1:y=a[1];
      2'd2:y=a[2];
      2'd3:y=a[3];
    endcase
  end

endmodule
  
