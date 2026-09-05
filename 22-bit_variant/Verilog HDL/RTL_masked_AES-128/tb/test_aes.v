`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/10 12:12:49
// Design Name: 
// Module Name: test_aes
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

module test_aes;

    // Inputs
    reg ClkxCI;
    reg RstxBI;
    wire [7:0] PTxDI0;
    reg  [7:0] PTxDI1;
    reg  [21:0] random;
    wire  [7:0] KxDI0;
    reg  [7:0] KxDI1;
    reg  StartxSI;

    

    // Outputs
    wire [7:0] CxDO0;
    wire [7:0] CxDO1;
    reg  [7:0] Plaintext;
    reg  [7:0] Key;
    wire [7:0] Ciphertext;
    wire DonexS;
    assign Ciphertext = CxDO0 ^ CxDO1;
    
    assign PTxDI0 = Plaintext ^ PTxDI1;
    assign KxDI0 = Key ^ KxDI1;
    
    // Instantiate the Unit Under Test (UUT)
    //CT = 0x3925841d02dc09fbdc118597196a0b32
    
    aes_top uut (
        .ClkxCI(ClkxCI), 
        .RstxBI(RstxBI), 
        .PTxDI0(PTxDI0), 
        .PTxDI1(PTxDI1),
        .random(random), 
        .KxDI0(KxDI0), 
        .KxDI1(KxDI1),
        .StartxSI(StartxSI),
        .CxDO0(CxDO0), 
        .CxDO1(CxDO1), 
        .DonexS(DonexS)
    );

    initial begin
        // Initialize Inputs
        ClkxCI = 1;
        RstxBI = 0;
        StartxSI = 0;
        #20
        RstxBI = 1;
        StartxSI = 0;
        //#10
        //RstxBI = 1;
        //rg_start = 1;
        //StartxSI = 1;
        #20
        //RstxBI = 1;
        StartxSI = 1;
        Plaintext = 8'h32;
        Key = 8'h2b;
        random = 22'b1000_0000_0000_0000_0000_00;
        #20
        StartxSI = 0;
        Plaintext = 8'h43;
        Key = 8'h7e;
        random = 22'b0111_0000_1111_0000_1111_00;
        #20
        Plaintext = 8'hf6;
        Key = 8'h15;
        #20
        Plaintext = 8'ha8;
        Key = 8'h16;
        #20
        Plaintext = 8'h88;
        Key = 8'h28;
        #20
        Plaintext = 8'h5a;
        Key = 8'hae;
        #20
        Plaintext = 8'h30;
        Key = 8'hd2;
        #20
        Plaintext = 8'h8d;
        Key = 8'ha6;
        #20
        Plaintext = 8'h31;
        Key = 8'hab;
        #20
        Plaintext = 8'h31;
        Key = 8'hf7;
        #20
        Plaintext = 8'h98;
        Key = 8'h15;
        #20
        Plaintext = 8'ha2;
        Key = 8'h88;
        #20
        Plaintext = 8'he0;
        Key = 8'h09;
        #20
        Plaintext = 8'h37;
        Key = 8'hcf;
        #20
        Plaintext = 8'h07;
        Key = 8'h4f;
        #20
        Plaintext = 8'h34;
        Key = 8'h3c;

        #10000
        //RstxBI = 0;
        StartxSI = 0;
        #20
        //RstxBI = 1;
        StartxSI = 1;
        #20
        StartxSI = 0;
        Plaintext = 8'h32;
        Key = 8'h2b;
        #20
        StartxSI = 0;
        Plaintext = 8'h43;
        Key = 8'h7e;
        #20
        Plaintext = 8'hf6;
        Key = 8'h15;
        #20
        Plaintext = 8'ha8;
        Key = 8'h16;
        #20
        Plaintext = 8'h88;
        Key = 8'h28;
        #20
        Plaintext = 8'h5a;
        Key = 8'hae;
        #20
        Plaintext = 8'h30;
        Key = 8'hd2;
        #20
        Plaintext = 8'h8d;
        Key = 8'ha6;
        #20
        Plaintext = 8'h31;
        Key = 8'hab;
        #20
        Plaintext = 8'h31;
        Key = 8'hf7;
        #20
        Plaintext = 8'h98;
        Key = 8'h15;
        #20
        Plaintext = 8'ha2;
        Key = 8'h88;
        #20
        Plaintext = 8'he0;
        Key = 8'h09;
        #20
        Plaintext = 8'h37;
        Key = 8'hcf;
        #20
        Plaintext = 8'h07;
        Key = 8'h4f;
        #20
        Plaintext = 8'h34;
        Key = 8'h3c;
    end
     always #10 ClkxCI = ~ClkxCI;
      
      always @(negedge ClkxCI) begin
            //input2 = $random;
            PTxDI1 = 8'h00;
            KxDI1 = 8'h00;
      end

      //always @(negedge ClkxCI) begin
            //input2 = $random;
            //random = $random;
            //guard = $random;
            //random = 23'b1000_0000_0000_0000_0000_000;
            //guard = 8'b1000_0000;
     // end
endmodule







