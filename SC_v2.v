
module SC_v2(
input B1, 
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
output reg [6:0] result, 
output reg decimalpoint,
output [3:0] nandos,// anodes
output reg [3:0] digit1 = 0, digit2 = 0, digit3 = 0, digit4 = 0
    );
    
reg [6:0] num1, num2;
wire [1:0] twobits;
wire clkout;
reg[6:0] div;
reg[7:0] sub;
reg[7:0] add; 
reg[13:0] multi;
reg [3:0] digitone = 0, digittwo = 0, digitthree = 0, digitfour = 0;
wire[6:0] LED0, LED1, LED2, LED3;

clockDivider #(500000) o1( clk, rst, clkout);
binary_counter o2(clkout, rst, twobits);
decoder o3(twobits, nandos);
ssdproced o4(digit1, LED0); //NUM1 RIGIT DIGIT
ssdproced o5(digit2, LED1); //NUM1 LEFT DIGIT
ssdproced o6(digit3, LED2); //NUM2 RIGIT DIGIT
ssdproced o7(digit4, LED3); //NUM2 LEFT DIGIT
 
always @(twobits) begin //count++ and select a result 
    if(rst) begin 
    result = 0;
    end
    else begin
    case(twobits)
    0 : result = LED0;
    1 : result = LED1;
    2 : result = LED2;
    3 : result = LED3;
    endcase 
    end
end

always @(twobits) begin
    case(twobits)
    0 : decimalpoint = 1;
    1 : decimalpoint = 1;
    2 : decimalpoint = 0;
    3 : decimalpoint = 1;
    endcase 
end

always @(posedge B1, posedge B2,posedge B3,posedge B4,posedge B5,posedge B6, posedge B7, posedge B8, posedge B9)
begin 

if( B1 == 1) begin
if(digitfour != 9)begin
        digitfour = digitfour + 1;
        digit4 = digitfour;
    end
    else begin
        digitfour = 0;
        digit4 = digitfour;
    end
end
    
   if( B2 == 1) begin
   if(digitthree != 9) begin
            digitthree = digitthree + 1;
            digit3= digitthree;
        end
        else begin
            digitthree = 0;
            digit3 = digitthree;
        end
    end
        
    if( B3 == 1) begin
    if(digittwo != 9) begin
                digittwo = digittwo + 1;
                digit2 = digittwo;
        end
    else begin
                digittwo = 0;
                digit2 = digittwo;
        end
    end
        
    if( B4 == 1) begin
    if(digitone != 9) begin
                digitone = digitone + 1;
                digit1 = digitone;
        end
    else begin
                digitone = 0;
                digit1 = digitone;
        end
    end
    
    if(B5 == 1) 
    begin
         num1 = digitone + digittwo*10;
         num2 = digitthree + digitfour*10;
         add = num2 + num1;
         digit1 = add % 10;
         add = add / 10;
         digit2 = add % 10;
         add = add / 10;
         digit3 = add % 10;
         digit4 = 0;
    end
    
    if(B6 == 1)
    begin 
        num1 = digitone + digittwo*10;
        num2 = digitthree + digitfour*10;
        sub = num2 - num1;
       if(num1 > num2) begin
       sub[7] = ~sub[7];
       sub[6] = ~sub[6];
       sub[5] = ~sub[5];
       sub[4] = ~sub[4];
       sub[3] = ~sub[3];
       sub[2] = ~sub[2];
       sub[1] = ~sub[1];
       sub[0] = ~sub[0];
       sub = sub +1; 
       digit4 = 4'b1010;
       end
        else begin
        digit4 = 0;
        end 
       
         digit1 = sub % 10;
         sub = sub / 10;
         digit2 = sub % 10;
         sub = sub / 10;
         digit3 = sub % 10;
        
    end
    
    if(B7 == 1)
    begin
        num1 = digitone + digittwo*10;
        num2 = digitthree + digitfour*10;
        multi = num2 * num1;
        digit1 = multi % 10;
        multi = multi / 10;
        digit2 = multi % 10;
        multi = multi / 10;
        digit3 = multi % 10;
        multi = multi / 10;
        digit4 = multi % 10;
     end
     
     if(B8 == 1)
     begin
        num1 = digitone + digittwo*10;
        num2 = digitthree + digitfour*10;
        if(num1 > num2) div = 0;
        else div = num2 / num1;
        digit1 = div % 10;
        div = div / 10;
        digit2 = div % 10;
        digit3 = 0;
        digit4 = 0;
      end
      
      
      if(B9 == 1) begin 
          digit1 = digitone;
          digit2 = digittwo;
          digit3 = digitthree;
          digit4 = digitfour;
      
      end
end
   
endmodule
