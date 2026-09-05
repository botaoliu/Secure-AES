`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:55:55 01/22/2018 
// Design Name: 
// Module Name:    aes_key_regs 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//key register 
(*keep = "true" , keep_hierarchy = "yes" *) module aes_key_regs(
   input        ClkxCI,
   input [7:0]  KeyInxDI,   //key in
   input        forthcylies1,   //key_sbox_clt cycle 4
   input        forthcylies2,   //key_sbox_clt cycle 4
   input        forthcylies3,   //key_sbox_clt cycle 4
   input        forthcylies4,   //key_sbox_clt cycle 4
   input        KeySchedulexSI,   //do Sbox 
   output       KeyOutxDO,   //key out
   output       KeyToSboxOutxDO,   //enter Sbox 
   output       K03xDO   //for key schedule
    );
   
   (* keep = "true" *) reg [7:0] KeyOutxDO;
   (* keep = "true" *) reg [7:0] KeyToSboxOutxDO;
   (* keep = "true" *) reg [7:0] K03xDO;

   (* keep = "true" *) reg [7:0]    K00xDN;
   (* keep = "true" *) reg [7:0]    K00xDP;
   (* keep = "true" *) reg [7:0]    K01xDN;
   (* keep = "true" *) reg [7:0]    K01xDP;
   (* keep = "true" *) reg [7:0]    K02xDN;
   (* keep = "true" *) reg [7:0]    K02xDP;
   (* keep = "true" *) reg [7:0]    K03xDN;
   (* keep = "true" *) reg [7:0]    K03xDP;
   (* keep = "true" *) reg [7:0]    K10xDN;
   (* keep = "true" *) reg [7:0]    K10xDP;
   (* keep = "true" *) reg [7:0]    K11xDN;
   (* keep = "true" *) reg [7:0]    K11xDP;
   (* keep = "true" *) reg [7:0]    K12xDN;
   (* keep = "true" *) reg [7:0]    K12xDP;
   (* keep = "true" *) reg [7:0]    K13xDN;
   (* keep = "true" *) reg [7:0]    K13xDP;
   (* keep = "true" *) reg [7:0]    K20xDN;
   (* keep = "true" *) reg [7:0]    K20xDP;
   (* keep = "true" *) reg [7:0]    K21xDN;
   (* keep = "true" *) reg [7:0]    K21xDP;
   (* keep = "true" *) reg [7:0]    K22xDN;
   (* keep = "true" *) reg [7:0]    K22xDP;
   (* keep = "true" *) reg [7:0]    K23xDN;
   (* keep = "true" *) reg [7:0]    K23xDP;
   (* keep = "true" *) reg [7:0]    K30xDN;
   (* keep = "true" *) reg [7:0]    K30xDP;
   (* keep = "true" *) reg [7:0]    K31xDN;
   (* keep = "true" *) reg [7:0]    K31xDP;
   (* keep = "true" *) reg [7:0]    K32xDN;
   (* keep = "true" *) reg [7:0]    K32xDP;
   (* keep = "true" *) reg [7:0]    K33xDN;
   (* keep = "true" *) reg [7:0]    K33xDP;
   
   
   always @(K00xDP or K01xDP or K02xDP or K03xDP or K10xDP or K11xDP or K12xDP or K13xDP or K20xDP or K21xDP or K22xDP or K23xDP
      or K30xDP or K31xDP or K32xDP or K33xDP or KeyInxDI or KeySchedulexSI or forthcylies1 or forthcylies2 or forthcylies3 or forthcylies4)
   begin
      KeyToSboxOutxDO = 8'b00000000;
      KeyOutxDO = K00xDP;   
     
       //output for key schedule
      K03xDO = K03xDP;
        
      if (forthcylies1 == 1'b1)
      KeyToSboxOutxDO = K13xDP;
      else if (forthcylies2 == 1'b1)
      KeyToSboxOutxDO = K23xDP;
      else if (forthcylies3 == 1'b1)
      KeyToSboxOutxDO = K33xDP;
      else if (forthcylies4 == 1'b1)
      KeyToSboxOutxDO = K03xDP;       
      //do key schedule
      
      if (KeySchedulexSI == 1'b1)
      begin
         K00xDN = K00xDP;
         K01xDN = K01xDP;
         K02xDN = K02xDP;
         K03xDN = K03xDP;
         K10xDN = K10xDP;
         K11xDN = K11xDP;
         K12xDN = K12xDP;
         K13xDN = K13xDP;
         K20xDN = K20xDP;
         K21xDN = K21xDP;
         K22xDN = K22xDP;
         K23xDN = K23xDP;
         K30xDN = K30xDP;
         K31xDN = K31xDP;
         K32xDN = K32xDP;
         K33xDN = K33xDP;
      end
      else
      begin
        //Normal register movement
         K00xDN = K10xDP;
         K01xDN = K11xDP;
         K02xDN = K12xDP;
         K03xDN = K13xDP;
         K10xDN = K20xDP;
         K11xDN = K21xDP;
         K12xDN = K22xDP;
         K13xDN = K23xDP;
         K20xDN = K30xDP;
         K21xDN = K31xDP;
         K22xDN = K32xDP;
         K23xDN = K33xDP;
         K30xDN = K01xDP;
         K31xDN = K02xDP;
         K32xDN = K03xDP;
         K33xDN = KeyInxDI;
      end
   end
    
   always @(posedge ClkxCI)
   begin
         K00xDP <= K00xDN;
         K01xDP <= K01xDN;
         K02xDP <= K02xDN;
         K03xDP <= K03xDN;
         K10xDP <= K10xDN;
         K11xDP <= K11xDN;
         K12xDP <= K12xDN;
         K13xDP <= K13xDN;
         K20xDP <= K20xDN;
         K21xDP <= K21xDN;
         K22xDP <= K22xDN;
         K23xDP <= K23xDN;
         K30xDP <= K30xDN;
         K31xDP <= K31xDN;
         K32xDP <= K32xDN;
         K33xDP <= K33xDN;
   end
   
endmodule




