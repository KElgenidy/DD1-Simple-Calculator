`timescale 1ns / 1ps
module TB(
);

reg B1 = 0, 
B2 = 0, 
B3 = 0, 
B4 = 0, 
B5 = 0 , 
B6 = 0, 
B7 = 0, 
B8 = 0, 
B9 = 0,
clk, 
rst;

wire [6:0] result;
wire decimalpoint;
wire [3:0] nandos, digit1, digit2, digit3, digit4; 

SC_v2 dut(
B1, 
B2, 
B3, 
B4, 
B5, 
B6,  
B7, 
B8,
B9, 
clk, 
rst, 
result,
decimalpoint,
nandos,
digit1,
digit2,
digit3,
digit4); 

 
initial begin
forever begin
clk = 0;
#10 clk = ~clk;
end
end

initial begin
rst = 0; #10;
rst = 1; #10;

 
for(integer i = 0; i < 9; i = i + 1) begin
B1 = ~B1; #10;
B1 = ~B1; #10; 
end 

for(integer i = 0; i < 9; i = i + 1) begin
B2 = ~B2; #10;
B2 = ~B2; #10; 
end 

for(integer i = 0; i < 9; i = i + 1) begin
B3 = ~B3; #10;
B3 = ~B3; #10; 
end 

for(integer i = 0; i < 9; i = i + 1) begin
B4 = ~B4; #10;
B4 = ~B4; #10; 
end 
#30;
//multiplication
B7 = ~B7; #5; 
B7 = ~B7; #5; 
#40;
//addition
B5 = ~B5; #5;
B5 = ~B5; #5;
#50;
//subtraction 
B6 = ~B6; #5;
B6 = ~B6; #5;
#60;
//division 
B8 = ~B8; #5; 
B8 = ~B8; #5;
#70;
//display 
B9 = ~B9; #5;
B9 = ~B9; #5;


#50;
for(integer i = 0; i < 9; i = i + 1) begin
B4 = ~B4; #10;
B4 = ~B4; #10; 
end

#50; 
B6 = ~B6; #5;
B6 = ~B6; #5;

#50; 
B8 = ~B8; #5; 
B8 = ~B8; #5;

#50; 
B9 = ~B9; #5;
B9 = ~B9; #5;

#50; 
for(integer i = 0; i < 4; i = i + 1) begin
B1 = ~B1; #10;
B1 = ~B1; #10; 
end 

for(integer i = 0; i < 3; i = i + 1) begin
B2 = ~B2; #10;
B2 = ~B2; #10; 
end 

#50; 
B6 = ~B6; #5;
B6 = ~B6; #5;

#50; 
B8 = ~B8; #5; 
B8 = ~B8; #5;

#50;
B7 = ~B7; #5; 
B7 = ~B7; #5; 

#50; 
B9 = ~B9; #5;
B9 = ~B9; #5;

for(integer i = 0; i < 2; i = i + 1) begin
B3 = ~B3; #10;
B3 = ~B3; #10; 
end 

for(integer i = 0; i < 2; i = i + 1) begin
B4 = ~B4; #10;
B4 = ~B4; #10; 
end

#50; 
B8 = ~B8; #5; 
B8 = ~B8; #5;

end
endmodule

