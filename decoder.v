module decoder(
input[1:0] a,
output reg [3:0] out);

always @(a)
begin
if (a == 2'b00)
    out = 4'b1110;
else if (a == 2'b01)
    out = 4'b1101;
else if (a == 2'b10)
 out = 4'b1011;
 else if (a == 2'b11)
  out = 4'b0111;
end    
endmodule
