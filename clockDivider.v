module clockDivider #(parameter n = 5000000)(input clk, rst, output reg clk_out);
reg [31:0] count;
always @ (posedge(clk), posedge(rst)) begin // Asynchronous Reset
if (rst == 1)
count <= 32'b0;
else if (count == n-1)
count <= 32'b0;
else
 count <= count + 1;
end
// Handle the output clock
always @ (posedge(clk), posedge(rst)) begin // Asynchronous Reset
if (rst == 1)
clk_out <= 0;
else if (count == n-1)
clk_out <= ~clk_out;
else
clk_out <= clk_out; 
end
endmodule