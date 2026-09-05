`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:14:25 01/22/2018 
// Design Name: 
// Module Name:    aes_top 
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
//top module of aes encryption core, 226 cycles
module aes_top(
   input        ClkxCI,
   input        RstxBI,
   input [7:0]  PTxDI0,    //plain text share0 P0=randombits
   input [7:0]  PTxDI1,    //plain text share1 P1=randombits xor plaintext
   input [21:0] random,
   input [7:0]  KxDI0,    //key
   input [7:0]  KxDI1,    //key
   input        StartxSI,    //start the core
   output [7:0] CxDO0,    //cipher text share0
   output [7:0] CxDO1,   //cipher text share1
   output       DonexS    //cipher text is ready    
);  
   //state signals
   wire         StateIDLExS;    //waits for StartxSI signal
   wire         State1xS;    //at first cycle
   wire         StateKEYADDITION1o3xS;    // cycle 1  -> 4
   wire         StateSBOXxS;
   wire         forthcylies1;    // key_sbox_clt cycle 4
   wire         forthcylies2;    // key_sbox_clt cycle 4
   wire         forthcylies3;    // key_sbox_clt cycle 4
   wire         forthcylies4;    // key_sbox_clt cycle 4
   wire         StateKEYADDITION2o3xS;    //cycle 5  -> 12
   wire         StateKEYADDITION3o3xS;    //cycle 13 -> 16
   wire         StateKEYSCHEDULExS;    //cycle 17 -> 20
   wire         StateSHIFTROWSxS;    //cycle 21 , performs StateSHIFTROWSxS at S output
   wire         doMixColumnsxS;    //cycle 1,5,9,13, performs MixColumns every 4th cycle exept for the last round
    //RCON signals
   wire         LastRoundxS;    //round 10 started
   wire         FinishedxS;    //round 0(done with round 10)
   wire [7:0]   RCONxD;    //RCON value
    //controll signals
   wire         nextRCONxS;    //calculate next RCON value
   wire         showRCONxS;    //show or hide RCON 
   wire         moveKupxS;    //roll K vertically
    //shared data signals
   reg  [7:0]   KeyInxD0;    //K register input
   reg  [7:0]   KeyInxD1;    //K register input
   wire [7:0]   KeyOutxD0;    //K register output
   wire [7:0]   KeyOutxD1;    //K register output
   wire [7:0]   KeyToSboxOutxD0;    //K13 register output
   wire [7:0]   KeyToSboxOutxD1;    //K13 register output
   reg  [7:0]   keySboxOutxD0;    //K Sbox output
   reg  [7:0]   keySboxOutxD1;    //K Sbox output
   wire [7:0]   K03xD0;    // K03 register output
   wire [7:0]   K03xD1;    // K03 register output
   reg  [7:0]   StateInxD0;    //S register input share0
   reg  [7:0]   StateInxD1;    //S register input share1
   wire [7:0]   StateOutxD0;    //S register output share0
   wire [7:0]   StateOutxD1;    //S register output share1
   wire [7:0]   SboxOutxD0;    //Sbox output share0
   wire [7:0]   SboxOutxD1;    //Sbox output share1
   reg  [7:0]   SboxInxD0;    //Sbox input share0
   reg  [7:0]   SboxInxD1;    //Sbox input share1

   wire forthcyline;
   wire statepreliminary;
   wire keypreliminary;
   
   assign nextRCONxS = StateSHIFTROWSxS;    //calculate next RCON value
   assign showRCONxS = State1xS;   //RCON value appears on output
    
   assign statepreliminary = FinishedxS & StateSBOXxS; 
   assign keypreliminary = FinishedxS & forthcyline; 
   assign forthcyline = forthcylies1 | forthcylies2 | forthcylies3 | forthcylies4;  
   //input of Sbox
   always @(statepreliminary or PTxDI0 or KxDI0 or PTxDI1 or KxDI1 or KeyToSboxOutxD0 or KeyToSboxOutxD1 or StateSBOXxS or StateOutxD0 or KeyInxD0 or StateOutxD1 or KeyInxD1 or forthcyline)
      begin
      SboxInxD0 = 8'b00000000;
      SboxInxD1 = 8'b00000000;

      if (forthcyline == 1'b1)   //in preliminary round
      begin
         SboxInxD0 = KeyToSboxOutxD0;
         SboxInxD1 = KeyToSboxOutxD1;
      end
      else if (statepreliminary == 1'b1)
      begin
         SboxInxD0 = PTxDI0 ^ KxDI0;
         SboxInxD1 = PTxDI1 ^ KxDI1;
      end
      else if (StateSBOXxS == 1'b1)
      begin
         SboxInxD0 = StateOutxD0 ^ KeyInxD0;
         SboxInxD1 = StateOutxD1 ^ KeyInxD1;
      end
    end 
        
   //output of Sbox
   always @(StateKEYADDITION1o3xS or SboxOutxD0 or SboxOutxD1)
      begin
         keySboxOutxD0 = 8'b00000000;
         keySboxOutxD1 = 8'b00000000;
      if (StateKEYADDITION1o3xS == 1'b1)   //in preliminary round
      begin
         keySboxOutxD0 = SboxOutxD0;
         keySboxOutxD1 = SboxOutxD1;
      end
    end 

   always @(StateKEYADDITION2o3xS or StateKEYADDITION3o3xS or StateKEYSCHEDULExS or StateSHIFTROWSxS or SboxOutxD0 or SboxOutxD1)
      begin 
         StateInxD0 = 8'b00000000;    
         StateInxD1 = 8'b00000000;
      if (StateKEYADDITION2o3xS == 1'b1 | StateKEYADDITION3o3xS == 1'b1 | StateKEYSCHEDULExS == 1'b1 | StateSHIFTROWSxS == 1'b1)   //in preliminary round
      begin
         StateInxD0 = SboxOutxD0;
         StateInxD1 = SboxOutxD1;
      end
    end 
      
   //input of Key register
    always @(FinishedxS or KxDI0 or KxDI1 or StateKEYADDITION1o3xS or KeyOutxD0 or keySboxOutxD0 or RCONxD or KeyOutxD1 or keySboxOutxD1 or KeyOutxD0 or K03xD0 or KeyOutxD1 or K03xD1)
      begin
      if (FinishedxS == 1'b1)   //in preliminary round
         begin
         KeyInxD0 = KxDI0;
         KeyInxD1 = KxDI1;
         end
      else if (StateKEYADDITION1o3xS == 1'b1)   //in first 4 cycles
         begin
         KeyInxD0 = KeyOutxD0 ^ keySboxOutxD0 ^ RCONxD;
         KeyInxD1 = KeyOutxD1 ^ keySboxOutxD1;
         end
      else
        begin
         KeyInxD0 = KeyOutxD0 ^ K03xD0;
         KeyInxD1 = KeyOutxD1 ^ K03xD1;
         end            
    end

    //outputs last State xor last round key
    assign CxDO0 = SboxInxD0;
    assign CxDO1 = SboxInxD1;
        
    //move K register up during cycles 17 - 21
    assign moveKupxS = StateKEYSCHEDULExS | StateSHIFTROWSxS;
    //assign moveKupxS = StateKEYSCHEDULExS;
    //signal that calculations are finished and CT appears at output
    assign DonexS = LastRoundxS & StateSBOXxS;

   //LSFR generates the state transitions
    aes_ctrl_lsfr aes_ctrl_lsfr(.ClkxCI(ClkxCI), .RstxBI(RstxBI), .StartxSI(StartxSI), .LastRoundxSI(LastRoundxS), 
    .StateIDLExS(StateIDLExS), .StateSHIFTROWSxS(StateSHIFTROWSxS), .StateKEYADDITION1o3xS(StateKEYADDITION1o3xS), 
    .StateKEYADDITION2o3xS(StateKEYADDITION2o3xS), .StateKEYADDITION3o3xS(StateKEYADDITION3o3xS),
    .StateKEYSCHEDULExS(StateKEYSCHEDULExS), .State1xS(State1xS), .doMixColumnsxS(doMixColumnsxS), .StateSBOXxS(StateSBOXxS), .forthcylies1(forthcylies1),.forthcylies2(forthcylies2),.forthcylies3(forthcylies3),.forthcylies4(forthcylies4));
   
    //Round constant (RCON) calculation
    rcon rcon(.ClkxCI(ClkxCI), .RstxBI(RstxBI), .NextxSI(nextRCONxS), .ActivexSI(showRCONxS), 
    .LastRoundxSO(LastRoundxS), .FinishedxSO(FinishedxS),.RCONxDO(RCONxD));
    
    sbox aes_sbox(.clock(ClkxCI), .I_share0(SboxInxD0), .I_share1(SboxInxD1), .random_rotate(random), .O_share0(SboxOutxD0), .O_share1(SboxOutxD1));

   //key register 
     aes_key_regs aes_key_regs1(.ClkxCI(ClkxCI), .KeyInxDI(KeyInxD0), .forthcylies1(forthcylies1),.forthcylies2(forthcylies2),.forthcylies3(forthcylies3),.forthcylies4(forthcylies4),.KeySchedulexSI(moveKupxS),
    .KeyOutxDO(KeyOutxD0), .KeyToSboxOutxDO(KeyToSboxOutxD0), .K03xDO(K03xD0));
  
     aes_key_regs aes_key_regs2(.ClkxCI(ClkxCI), .KeyInxDI(KeyInxD1), .forthcylies1(forthcylies1),.forthcylies2(forthcylies2),.forthcylies3(forthcylies3),.forthcylies4(forthcylies4),.KeySchedulexSI(moveKupxS),
    .KeyOutxDO(KeyOutxD1), .KeyToSboxOutxDO(KeyToSboxOutxD1), .K03xDO(K03xD1));
   //state register 1
     aes_state_regs aes_state_regs1(.ClkxCI(ClkxCI), .StateInxDI(StateInxD0), .ShiftRowsxSI(StateSHIFTROWSxS), 
    .MixColumnsxSI(doMixColumnsxS), .StateOutxDO(StateOutxD0));
     
    //state register 2  
     aes_state_regs aes_state_regs2(.ClkxCI(ClkxCI), .StateInxDI(StateInxD1), .ShiftRowsxSI(StateSHIFTROWSxS), 
    .MixColumnsxSI(doMixColumnsxS), .StateOutxDO(StateOutxD1));
        
endmodule




