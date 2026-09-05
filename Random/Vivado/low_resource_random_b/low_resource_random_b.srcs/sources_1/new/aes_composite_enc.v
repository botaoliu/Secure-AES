`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/20 22:41:19
// Design Name: 
// Module Name: aes_composite_enc
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
//module AES_Composite_enc(
//    input               rst_n,        // Async reset.
//    input               clk,          // clk.
//    input               enc_dec,      // Encrypt/Decrypt select. 0:Encrypt  1:Decrypt
//    input               key_exp,      // Round Key Expansion
//    input               start,        // Encrypt or Decrypt Start
//    output reg          key_val,      // Round Key valid
//    output reg          text_val,     // Cipher Text or Inverse Cipher Text valid
//    input      [383:0]  key_in,       // Key input
//    input      [383:0]  text_in,      // Cipher Text or Inverse Cipher Text input
//    output     [383:0]  text_out,     // Cipher Text or Inverse Cipher Text output
//    output reg          busy          // AES unit Busy
//    );
(*keep = "true" , keep_hierarchy = "yes" *)  module AES_Composite_enc
  (Kin, Din, Dout, Krdy, Drdy, Kvld, Dvld, EN, BSY, CLK, RSTn);

   //------------------------------------------------
   input  [383:0] Kin;  // Key input
   input [383:0]  Din;  // Data input
   output [383:0] Dout; // Data output
   input          Krdy; // Key input ready
   input          Drdy; // Data input ready
   output         Kvld; // Data output valid
   output         Dvld; // Data output valid

   input          EN;   // AES circuit enable
   output         BSY;  // Busy signal
   input          CLK;  // System clock
   input          RSTn; // Reset (Low active)


    //parameter [127:0] key_real  = 128'h2b7e1516_28aed2a6_abf71588_09cf4f3c;

    (* keep = "true" *) reg BSY;
    (* keep = "true" *) reg Kvld;
    (* keep = "true" *) reg Dvld;
    (* keep = "true" *) wire   rst;
    assign rst = ~ RSTn;

    (* keep = "true" *) wire rst_n;
    assign rst_n = ~ rst;  

    (* keep = "true" *) reg  [127:000]   Plain;
    (* keep = "true" *) reg  [127:000]   Key;
    (* keep = "true" *) reg  [127:000]   Cipher0;
    (* keep = "true" *) reg  [127:000]   Cipher1;
    (* keep = "true" *) reg  [123:000]   random;

    (* keep = "true" *) reg [7:0] PTxDI0;
    (* keep = "true" *) reg [7:0] PTxDI1;
    (* keep = "true" *) reg [7:0] KxDI0;
    (* keep = "true" *) reg [7:0] KxDI1;

    (* keep = "true" *) wire [7:0] CxDO0;
    (* keep = "true" *) wire [7:0] CxDO1;

    (* keep = "true" *) wire           Mask_Plain_Sig;
    (* keep = "true" *) wire           Mask_Cipher_Sig;
    (* keep = "true" *) reg  [3:0]     Mask_Plain_Count;
    (* keep = "true" *) reg  [3:0]     Mask_Cipher_Count;
    (* keep = "true" *) reg            PlainToAES_Sig;
    (* keep = "true" *) reg  [127:000] state_random;
    (* keep = "true" *) reg  [127:000] key_random; 
    (* keep = "true" *) reg rg_start;

    always @(posedge CLK or posedge rst)
    if(rst)
        begin
            PTxDI0 <= 8'd0;
            PTxDI1 <= 8'd0;
        end
    else 
        begin
            PTxDI0 <= state_random[127:120];
            PTxDI1 <= Plain[127:120];
        end

    always @(posedge CLK or posedge rst)
    if(rst)
        begin
            KxDI0 <= 8'd0;
            KxDI1 <= 8'd0;
        end
    else 
        begin
            KxDI0 <= key_random[127:120];
            KxDI1 <= Key[127:120];
        end    
    
    assign Mask_Plain_Sig = PlainToAES_Sig;
    assign Dout = {128'h00000000_00000000__00000000_00000000,Cipher0,Cipher1};   

    always @(posedge CLK or posedge rst)
    if(rst)
        begin
            Plain <= 128'd0;
            Key   <= 128'd0;
            state_random <= 128'd0;
            key_random   <= 128'd0;
            random <= 124'd0;
        end
    else if(Drdy)
        begin
            random <= Din[379:256];
            Plain <= Din[255:128];
            Key   <= Kin[255:128];
            state_random <= Din[127:000];
            key_random   <= Kin[127:000];
        end
    else if(PlainToAES_Sig)
        begin
            Plain <= {Plain[119:000], Plain[127:120]};
            Key <= {Key[119:000], Key[127:120]};
            state_random <= {state_random[119:000], state_random[127:120]};
            key_random   <= {key_random[119:000], key_random[127:120]};
        end

    always @(posedge CLK or posedge rst)
    if(rst)
        begin
             Cipher0 <= 128'd0;
             Cipher1 <= 128'd0;
        end
    else if(Mask_Cipher_Sig)
        begin
             Cipher0 <= {Cipher0[119:000], CxDO0};
             Cipher1 <= {Cipher1[119:000], CxDO1};
        end

    always @(posedge CLK or posedge rst)
    if(rst)
        Mask_Plain_Count <= 4'd0;
    else if(PlainToAES_Sig)
        Mask_Plain_Count <= Mask_Plain_Count + 1'b1;
    else
        Mask_Plain_Count <= 4'd0;

    always @(posedge CLK or posedge rst)
    if(rst)
        Mask_Cipher_Count <= 4'd0;
    else if(Mask_Cipher_Sig)
        Mask_Cipher_Count <= Mask_Cipher_Count + 1'b1;
    else
        Mask_Cipher_Count <= 4'd0;

    always @(posedge CLK or posedge rst)
    if(rst)
        BSY <= 1'b0;
    else if(Drdy)
        BSY <= 1'b1;
    else if(Dvld)
        BSY <= 1'b0;
    else
        BSY <= BSY;
        
    always @(posedge CLK or posedge rst)
    if(rst)
        Kvld <= 1'b0;
    else if(Drdy)
        Kvld <= 1'b1;
    else
        Kvld <= 1'b0;

    always @(posedge CLK or posedge rst)
    if(rst)
        Dvld <= 1'b0;
    else if(Mask_Cipher_Sig && Mask_Cipher_Count == 4'd15)
        Dvld <= 1'b1;
    else
        Dvld <= 1'b0;

    always @(posedge CLK or posedge rst)
    if(rst)
        PlainToAES_Sig <= 1'b0;
    else if(Drdy) 
        PlainToAES_Sig <= 1'b1;
    else if(PlainToAES_Sig && Mask_Plain_Count == 4'd15)
        PlainToAES_Sig <= 1'b0;
    else 
        PlainToAES_Sig <= PlainToAES_Sig;

    always @(posedge CLK or posedge rst)
    if(rst)
        rg_start <= 1'b0;
    else if(Drdy) 
        rg_start <= 1'b1; 
    else
        rg_start <= 1'b0; 

(*keep = "true" , keep_hierarchy = "yes" *) aes_top aes_top(
       .ClkxCI(CLK),
       .RstxBI(rst_n),
       .PTxDI0(PTxDI0),    //plain text share0 P0=randombits
       .PTxDI1(PTxDI1),    //plain text share1 P1=randombits xor plaintext
       .random(random),
       .KxDI0(KxDI0),     //key
       .KxDI1(KxDI1),     //key
       .StartxSI(Mask_Plain_Sig),    //Mask_Plain_Sig the core
       .rg_start(rg_start),
       .CxDO0(CxDO0),    //cipher text share0
       .CxDO1(CxDO1),   //cipher text share1
       .DonexS(Mask_Cipher_Sig)    //Mask_Cipher_Sig text is ready
    ); 

endmodule
