  module ssdproced (x, out);
input [3:0] x;

output reg [6:0] out;

// procedural

always @(*) begin 

case(x)

0: out = 7'b0000_001;
1: out = 7'b1001_111;
2: out = 7'b0010_010;
3: out = 7'b0000_110;
4: out = 7'b1001_100;
5: out = 7'b0100_100;
6: out = 7'b0100_000;
7: out = 7'b0001_111;
8: out = 7'b0000_000;
9: out = 7'b0000_100;
10: out = 7'b1111_110; // negative sign
/*4'h10: out = 7'b0001_000;
4'hb: out = 7'b1100_001;
4'hc: out = 7'b0110_001;
4'hd: out = 7'b1000_010;
4'he: out = 7'b0110_000;*/
//default: out = 7'b0111_000;
endcase


end

endmodule
