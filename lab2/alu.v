module alu(a,
           b,
           command,
           oe,
           y);

  parameter ADD  = 4'b0000, // Add two 4 bit numbers a and b.
            INC  = 4'b0001, // Increment a by 1. 
            SUB  = 4'b0010, // Subtracts b from a.
            DEC  = 4'b0011, // Decrement a by 1.
            MUL  = 4'b0100, // Multiply 4 bit numbers a and b.
            DIV  = 4'b0101, // Divide a by b.
            SHL  = 4'b0110, // Shift a to left side by 1 bit.
            SHR  = 4'b0111, // Shift a to right by 1 bit.
            AND  = 4'b1000, // Logical AND
            OR   = 4'b1001, // Logical OR
            INV  = 4'b1010, // Compement
            NAND = 4'b1011, // Logical NAND
            NOR  = 4'b1100, // Logical NOR
            XOR  = 4'b1101, // Logical EXOR
            XNOR = 4'b1110, // Logical EXNOR
            BUF  = 4'b1111; // Buffer

  input [7:0] a,
              b;
  input [3:0] command;
  input oe;

  output [15:0] y;
  reg    [15:0] out;


// Step 1. Write down the functionality of ALU based on commands given above.
//         *Use arithmetic and logical operators
    always@(*)
    begin
       case (command)
  	
      //--------- write the functionality here -------  
        
	ADD	:	out	=a+b;
	INC	:	out	=a+1;
	SUB	:	out	=a-b;
	DEC	:	out	=a-1;
	MUL	:	out	=a*b;
	DIV	:	out	=a/b;
	SHL	:	out	=a<<b;
	SHR	:	out	=a>>b;
	AND	:	out	=a&b;
	OR	:	out	=a|b;
	INV	:	out	=~a;
	NAND	:	out	=~(a&b);
	NOR	:	out	=~(a|b);
	XOR	:	out	=a^b;
	XNOR	:	out	=~(a^b);
	BUF	:	out	=a;
        default :       out     =16'hxxxx;
 	
       endcase
    end

// Step 2. Understand the tri-state output logic
  assign y = (oe) ? out : 16'hzzzz;

endmodule
