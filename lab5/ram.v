module ram(data,
           we,
           enable,
           addr);
      
  input we,
        enable;
  input [3:0] addr;
  inout [7:0] data;
// Step 1. Declare a 8 bit wide memory having 16 locations.
  reg [7:0]mem[15:0];

// Step 2. Understand the logic for writing data into a memory location 
  always@(data,we,enable,addr)
  if (we && !enable)
      mem[addr]=data;

// Step 3. Understand the logic of reading data from a memory location 
  assign data= (enable && !we) ? mem[addr] : 8'hzz;

endmodule 

