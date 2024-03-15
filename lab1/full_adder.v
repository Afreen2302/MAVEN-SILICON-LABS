module full_adder(a,
                  b,
                  c,
                  sum,
                  carry);

  // Step 1. Write down the directions for the ports	     
  input a,b,c;
  output sum, carry;

  // Step 2. Declare the internal wires    
  wire w1, w2, w3;

  // Step 3. Instantiate two Half-Adders
  half_adder HA1(.a(a), .b(b), .sum(w1), .carry(w2));
  half_adder HA2(.a(w1), .b(c), .sum(sum), .carry(w3));

  // Step 4. Instantiate the OR gate
  or or1(carry, w2, w3);

endmodule

