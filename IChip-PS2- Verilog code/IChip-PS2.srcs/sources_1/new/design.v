`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2022 03:11:43 PM
// Design Name: 
// Module Name: top_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//Make sure there should only be 64+22+100 = 186 positive edges of clk1
module top_module(
    input clk1,
    input clk2,
    input [63:0]secret,
    output reg [18:0]lfsr1=19'd0,
    output reg [21:0]lfsr2=22'd0,
    output reg [22:0]lfsr3=23'd0,
    output  pseudo
    );
    reg [21:0]public=22'b1101001110000110010001;
    wire maj;
    wire w1,w2,w3;
    assign w1= lfsr1[13]^lfsr1[16]^lfsr1[17]^lfsr1[18];
    assign w2=lfsr2[20]^lfsr2[21];
    assign w3=lfsr3[7]^lfsr3[20]^lfsr3[21]^lfsr3[22];
    reg [8:0]count=8'b0;
    majority ins({lfsr1[8],lfsr2[10],lfsr3[10]},maj);
    always @(posedge clk1)   begin
        if(count<=63)   begin
            lfsr1<={lfsr1[17:0],secret[count]^w1};
            lfsr2<={lfsr2[20:0],secret[count]^w2};
            lfsr3<={lfsr3[21:0],secret[count]^w3};
        end
        else if(count<=85) begin
            lfsr1<={lfsr1[17:0],public[count-64]^w1};
            lfsr2<={lfsr2[20:0],public[count-64]^w2};
            lfsr3<={lfsr3[21:0],public[count-64]^w3};
        end
        
        else begin
            
            lfsr1<= (maj==lfsr1[8])?({lfsr1[17:0],w1}):lfsr1;
            lfsr2<= (maj==lfsr2[10])?({lfsr2[20:0],w2}):lfsr2;
            lfsr3<= (maj==lfsr3[10])?{lfsr3[21:0],w3}:lfsr3;       
        end
        count<=count+1;
    end
    
    always @(posedge clk2) begin
        lfsr1<= (maj==lfsr1[8])?({lfsr1[17:0],w1}):lfsr1;
        lfsr2<= (maj==lfsr2[10])?({lfsr2[20:0],w2}):lfsr2;
        lfsr3<= (maj==lfsr3[10])?{lfsr3[21:0],w3}:lfsr3;
        //pseudo = lfsr1[18]^lfsr2[21]^lfsr3[22];
    end
    assign pseudo = lfsr1[18]^lfsr2[21]^lfsr3[22];
endmodule

module majority(input [2:0]a, output reg x);
    always @(*) begin
        case(a)
            3'b000: x=0;
            3'b001: x=0;
            3'b010: x=0;
            3'b011: x=1;
            3'b100: x=0;
            3'b101: x=1;
            3'b110: x=1;
            3'b111: x=1;
        endcase
    end
endmodule

