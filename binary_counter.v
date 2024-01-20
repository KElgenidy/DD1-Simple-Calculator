module binary_counter (input clk, reset,  output reg [1:0] count);

always @( posedge clk, posedge reset) begin
if (reset == 1) 
count <= 0; // non-blockingassignment
else begin
if (count == 3)
    count <= 0;
    else 
    count <= count + 1;
end
end



endmodule
