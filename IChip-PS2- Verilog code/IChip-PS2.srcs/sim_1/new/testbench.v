`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2022 08:36:07 PM
// Design Name: 
// Module Name: testbench
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


module testbench;
    reg clk1=2'b0;
    reg clk2;
    wire [63:0]secret;
    wire [18:0]lfsr1_ins1;
    wire [21:0]lfsr2_ins1;
    wire [22:0]lfsr3_ins1;
    wire [18:0]lfsr1_ins2;
    wire [21:0]lfsr2_ins2;
    wire [22:0]lfsr3_ins2;
    wire [18:0]lfsr1_ins3;
    wire [21:0]lfsr2_ins3;
    wire [22:0]lfsr3_ins3;
    wire [18:0]lfsr1_ins4;
    wire [21:0]lfsr2_ins4;
    wire [22:0]lfsr3_ins4;
    wire [18:0]lfsr1_ins5;
    wire [21:0]lfsr2_ins5;
    wire [22:0]lfsr3_ins5;
    wire [18:0]lfsr1_ins6;
    wire [21:0]lfsr2_ins6;
    wire [22:0]lfsr3_ins6;
    wire [18:0]lfsr1_ins7;
    wire [21:0]lfsr2_ins7;
    wire [22:0]lfsr3_ins7;
    wire [18:0]lfsr1_ins8;
    wire [21:0]lfsr2_ins8;
    wire [22:0]lfsr3_ins8;
    wire [7:0]pseudo;
    reg [7:0]value[0:32040];
    reg [7:0]finalop[0:32040];
    integer count;
    integer i;
    
    assign secret = 64'b0110100001100001011100100110010001110111011000010111001001100101;
    
    top_module ins1(.clk1(clk1),.clk2(clk2),.secret(secret),.lfsr1(lfsr1_ins1),.lfsr2(lfsr2_ins1),.lfsr3(lfsr3_ins1),.pseudo(pseudo[0]));
    top_module ins2(.clk1(clk1),.clk2(clk2),.secret(secret),.lfsr1(lfsr1_ins2),.lfsr2(lfsr2_ins2),.lfsr3(lfsr3_ins2),.pseudo(pseudo[1]));
    top_module ins3(.clk1(clk1),.clk2(clk2),.secret(secret),.lfsr1(lfsr1_ins3),.lfsr2(lfsr2_ins3),.lfsr3(lfsr3_ins3),.pseudo(pseudo[2]));
    top_module ins4(.clk1(clk1),.clk2(clk2),.secret(secret),.lfsr1(lfsr1_ins4),.lfsr2(lfsr2_ins4),.lfsr3(lfsr3_ins4),.pseudo(pseudo[3]));
    top_module ins5(.clk1(clk1),.clk2(clk2),.secret(secret),.lfsr1(lfsr1_ins5),.lfsr2(lfsr2_ins5),.lfsr3(lfsr3_ins5),.pseudo(pseudo[4]));
    top_module ins6(.clk1(clk1),.clk2(clk2),.secret(secret),.lfsr1(lfsr1_ins6),.lfsr2(lfsr2_ins6),.lfsr3(lfsr3_ins6),.pseudo(pseudo[5]));
    top_module ins7(.clk1(clk1),.clk2(clk2),.secret(secret),.lfsr1(lfsr1_ins7),.lfsr2(lfsr2_ins7),.lfsr3(lfsr3_ins7),.pseudo(pseudo[6]));
    top_module ins8(.clk1(clk1),.clk2(clk2),.secret(secret),.lfsr1(lfsr1_ins8),.lfsr2(lfsr2_ins8),.lfsr3(lfsr3_ins8),.pseudo(pseudo[7]));
    
    integer file_id;   
    
    initial begin
        clk2 = 1'b0;
            repeat(372)
                #0.0005 clk1 = ~clk1;
        #0.2;
        forever
            #0.0005 clk2= ~clk2;

        /*$readmemb("E:\\ichip\\ps2\\binary.txt",value);
        file_id = $fopen("E:\\ichip\\ps2\\binaryenc.txt","w");
        
        #73 for(i=0;i<32041;i=i+1)
        begin
            #0.001 $fwrite(file_id,"%b , ",finalop[i]);
        end
     
        $fclose(file_id);
        #10 $finish;*/
        
        end
    initial begin
        $readmemb("E:\\ichip\\ps2\\enc_binary.txt",value);
        #40;
        for(count=0;count<32041;count=count+1) 
            #0.001 finalop[count] = pseudo ^ value[count];

            //finalop[count][1]<= pseudo[1]^value[count][1];
            //finalop[count][2]<= pseudo[2]^value[count][2];
            //finalop[count][3]<= pseudo[3]^value[count][3];
            //finalop[count][4]<= pseudo[4]^value[count][4];
            //finalop[count][5]<= pseudo[5]^value[count][5];
            //finalop[count][6]<= pseudo[6]^value[count][6];
            //finalop[count][7]<= pseudo[7]^value[count][7];
            //#0.001;
       
        
        
        //$fwrite(file_id,"%b , ",{01010101});
        
        //for(i=0;i<32041;i=i+1)
        //begin
        //    #0.001 $fwrite(file_id,"%b , ",finalop[i]);
        //end
     
        //$fclose(file_id);
        //#10 $finish;
        
        file_id = $fopen("E:\\ichip\\ps2\\binarydecrypted.txt","w");
        #5 for(i=0;i<=32040;i=i+1)
        begin
            #0.001 $fwrite(file_id,"%b , ",finalop[i]);
        end
     
        $fclose(file_id);
        #10 $finish;
        end
        

endmodule
