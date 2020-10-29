module testbench();

reg[31:0] A;
reg[31:0] B;

wire[31:0] S;

Adder_32 myAdder(A, B, S);

initial begin
A=45; B=27;   #10; 
if (S !== A+B) begin
           $display("Error adding %d+%d: Should be %d but got %d", A, B, A+B, S); $stop;
end
A=33; B=142;   #10; 
if (S !== A+B) begin
           $display("Error adding %d+%d: Should be %d but got %d", A, B, A+B, S); $stop;
end
A=0; B=0;  #10; 
if (S !== A+B) begin
           $display("Error adding %d+%d: Should be %d but got %d", A, B, A+B, S); $stop;
end
A=4294967295; B=1; #10; 
if (S !== 0) begin
           $display("Error adding %d+%d: Should be %d but got %d", A, B, 0, S); $stop;
end
$display("All tests passed.");
end

endmodule
