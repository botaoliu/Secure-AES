`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:57:14 01/22/2018 
// Design Name: 
// Module Name:    aes_state_regs1 
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
//state register 
module aes_state_regs(
   input        ClkxCI,
   input [7:0]  StateInxDI,   //state in
   input        ShiftRowsxSI,   //do StateSHIFTROWSxS
   input        MixColumnsxSI,   //do MixColumns
   output       StateOutxDO   //state output
    );
 
   (* keep = "true" *) reg[7:0] StateOutxDO; 
    
   (* keep = "true" *) reg [7:0]    S00xDN;
   (* keep = "true" *) reg [7:0]    S00xDP;
   (* keep = "true" *) reg [7:0]    S01xDN;
   (* keep = "true" *) reg [7:0]    S01xDP;
   (* keep = "true" *) reg [7:0]    S02xDN;
   (* keep = "true" *) reg [7:0]    S02xDP;
   (* keep = "true" *) reg [7:0]    S03xDN;
   (* keep = "true" *) reg [7:0]    S03xDP;
   (* keep = "true" *) reg [7:0]    S10xDN;
   (* keep = "true" *) reg [7:0]    S10xDP;
   (* keep = "true" *) reg [7:0]    S11xDN;
   (* keep = "true" *) reg [7:0]    S11xDP;
   (* keep = "true" *) reg [7:0]    S12xDN;
   (* keep = "true" *) reg [7:0]    S12xDP;
   (* keep = "true" *) reg [7:0]    S13xDN;
   (* keep = "true" *) reg [7:0]    S13xDP;
   (* keep = "true" *) reg [7:0]    S20xDN;
   (* keep = "true" *) reg [7:0]    S20xDP;
   (* keep = "true" *) reg [7:0]    S21xDN;
   (* keep = "true" *) reg [7:0]    S21xDP;
   (* keep = "true" *) reg [7:0]    S22xDN;
   (* keep = "true" *) reg [7:0]    S22xDP;
   (* keep = "true" *) reg [7:0]    S23xDN;
   (* keep = "true" *) reg [7:0]    S23xDP;
   (* keep = "true" *) reg [7:0]    S30xDN;
   (* keep = "true" *) reg [7:0]    S30xDP;
   (* keep = "true" *) reg [7:0]    S31xDN;
   (* keep = "true" *) reg [7:0]    S31xDP;
   (* keep = "true" *) reg [7:0]    S32xDN;
   (* keep = "true" *) reg [7:0]    S32xDP;
   (* keep = "true" *) reg [7:0]    S33xDN;
   (* keep = "true" *) reg [7:0]    S33xDP;
   (* keep = "true" *) wire [7:0]   MixColumnsS0xD;
   (* keep = "true" *) wire [7:0]   MixColumnsS1xD;
   (* keep = "true" *) wire [7:0]   MixColumnsS2xD;
   (* keep = "true" *) wire [7:0]   MixColumnsS3xD;
   
   always @(MixColumnsS0xD or MixColumnsS1xD or MixColumnsS2xD or MixColumnsS3xD or MixColumnsxSI or S00xDP or S01xDP or S02xDP or S03xDP 
       or S10xDP or S11xDP or S12xDP or S13xDP or S20xDP or S21xDP or S22xDP or S23xDP or S30xDP or S31xDP or S32xDP or S33xDP or ShiftRowsxSI
        or StateInxDI)
   begin
       StateOutxDO = S00xDP;
        
        //ShiftRows movement (one cycle before last byte is written)
      if (ShiftRowsxSI == 1'b1)
      begin        
         S00xDN = S10xDP;
         S01xDN = S11xDP;
         S02xDN = S12xDP;
         S03xDN = S13xDP;
         S10xDN = S21xDP;
         S11xDN = S22xDP;
         S12xDN = S23xDP;
         S13xDN = S20xDP;
         S20xDN = S32xDP;
         S21xDN = S33xDP;
         S22xDN = S30xDP;
         S23xDN = S31xDP;
         S30xDN = StateInxDI;
         S31xDN = S01xDP;
         S32xDN = S02xDP;
         S33xDN = S03xDP;
      end
      else if (MixColumnsxSI == 1'b1)
      begin
           //MixColumns movement
         StateOutxDO = MixColumnsS0xD;
         S00xDN = MixColumnsS1xD;
         S01xDN = S11xDP;
         S02xDN = S12xDP;
         S03xDN = S13xDP;
         S10xDN = MixColumnsS2xD;
         S11xDN = S21xDP;
         S12xDN = S22xDP;
         S13xDN = S23xDP;
         S20xDN = MixColumnsS3xD;
         S21xDN = S31xDP;
         S22xDN = S32xDP;
         S23xDN = S33xDP;
         S30xDN = S01xDP;
         S31xDN = S02xDP;
         S32xDN = S03xDP;
         S33xDN = StateInxDI;
      end
      else
      begin
           //Normal register movement
         S00xDN = S10xDP;
         S01xDN = S11xDP;
         S02xDN = S12xDP;
         S03xDN = S13xDP;
         S10xDN = S20xDP;
         S11xDN = S21xDP;
         S12xDN = S22xDP;
         S13xDN = S23xDP;
         S20xDN = S30xDP;
         S21xDN = S31xDP;
         S22xDN = S32xDP;
         S23xDN = S33xDP;
         S30xDN = S01xDP;
         S31xDN = S02xDP;
         S32xDN = S03xDP;
         S33xDN = StateInxDI;
      end
   end
   
   //perform Mixcolumns
   (*keep = "true" , keep_hierarchy = "yes" *) mix_columns mix_columns_1(.A0xDI(S00xDP), .A1xDI(S10xDP), .A2xDI(S20xDP), .A3xDI(S30xDP), .B0xDO(MixColumnsS0xD), .B1xDO(MixColumnsS1xD),
    .B2xDO(MixColumnsS2xD), .B3xDO(MixColumnsS3xD)); 
   
   always @(posedge ClkxCI)
   begin
         S00xDP <= S00xDN;
         S01xDP <= S01xDN;
         S02xDP <= S02xDN;
         S03xDP <= S03xDN;
         S10xDP <= S10xDN;
         S11xDP <= S11xDN;
         S12xDP <= S12xDN;
         S13xDP <= S13xDN;
         S20xDP <= S20xDN;
         S21xDP <= S21xDN;
         S22xDP <= S22xDN;
         S23xDP <= S23xDN;
         S30xDP <= S30xDN;
         S31xDP <= S31xDN;
         S32xDP <= S32xDN;
         S33xDP <= S33xDN;
   end
   
endmodule


