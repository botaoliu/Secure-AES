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
(*keep = "true" , keep_hierarchy = "yes" *) module aes_top(
   input         ClkxCI,
   input         RstxBI,
   input [7:0]   PTxDI0,    //plain text share0 P0=randombits
   input [7:0]   PTxDI1,    //plain text share1 P1=randombits xor plaintext
   input [123:0] random,
   input [7:0]   KxDI0,    //key
   input [7:0]   KxDI1,    //key
   input         StartxSI,    //start the core
   input         rg_start,
   output [7:0]  CxDO0,    //cipher text share0
   output [7:0]  CxDO1,   //cipher text share1
   output        DonexS    //cipher text is ready    
);  
   //state signals
   (* keep = "true" *) wire         StateIDLExS;    //waits for StartxSI signal
   (* keep = "true" *) wire         State1xS;    //at first cycle
   (* keep = "true" *) wire         StateKEYADDITION1o3xS;    // cycle 1  -> 4
   (* keep = "true" *) wire         StateSBOXxS;
   (* keep = "true" *) wire         forthcylies1;    // key_sbox_clt cycle 4
   (* keep = "true" *) wire         forthcylies2;    // key_sbox_clt cycle 4
   (* keep = "true" *) wire         forthcylies3;    // key_sbox_clt cycle 4
   (* keep = "true" *) wire         forthcylies4;    // key_sbox_clt cycle 4
   (* keep = "true" *) wire         StateKEYADDITION2o3xS;    //cycle 5  -> 12
   (* keep = "true" *) wire         StateKEYADDITION3o3xS;    //cycle 13 -> 16
   (* keep = "true" *) wire         StateKEYSCHEDULExS;    //cycle 17 -> 20
   (* keep = "true" *) wire         StateSHIFTROWSxS;    //cycle 21 , performs StateSHIFTROWSxS at S output
   (* keep = "true" *) wire         doMixColumnsxS;    //cycle 1,5,9,13, performs MixColumns every 4th cycle exept for the last round
    //RCON signals
   (* keep = "true" *) wire         LastRoundxS;    //round 10 started
   (* keep = "true" *) wire         FinishedxS;    //round 0(done with round 10)
   (* keep = "true" *) wire [7:0]   RCONxD;    //RCON value
    //controll signals
   (* keep = "true" *) wire         nextRCONxS;    //calculate next RCON value
   (* keep = "true" *) wire         showRCONxS;    //show or hide RCON 
   (* keep = "true" *) wire         moveKupxS;    //roll K vertically
    //shared data signals
   (* keep = "true" *) reg  [7:0]   KeyInxD0;    //K register input
   (* keep = "true" *) reg  [7:0]   KeyInxD1;    //K register input
   (* keep = "true" *) wire [7:0]   KeyOutxD0;    //K register output
   (* keep = "true" *) wire [7:0]   KeyOutxD1;    //K register output
   (* keep = "true" *) wire [7:0]   KeyToSboxOutxD0;    //K13 register output
   (* keep = "true" *) wire [7:0]   KeyToSboxOutxD1;    //K13 register output
   (* keep = "true" *) reg  [7:0]   keySboxOutxD0;    //K Sbox output
   (* keep = "true" *) reg  [7:0]   keySboxOutxD1;    //K Sbox output
   (* keep = "true" *) wire [7:0]   K03xD0;    // K03 register output
   (* keep = "true" *) wire [7:0]   K03xD1;    // K03 register output
   (* keep = "true" *) reg  [7:0]   StateInxD0;    //S register input share0
   (* keep = "true" *) reg  [7:0]   StateInxD1;    //S register input share1
   (* keep = "true" *) wire [7:0]   StateOutxD0;    //S register output share0
   (* keep = "true" *) wire [7:0]   StateOutxD1;    //S register output share1
   (* keep = "true" *) wire [7:0]   SboxOutxD0;    //Sbox output share0
   (* keep = "true" *) wire [7:0]   SboxOutxD1;    //Sbox output share1
   (* keep = "true" *) reg  [7:0]   SboxInxD0;    //Sbox input share0
   (* keep = "true" *) reg  [7:0]   SboxInxD1;    //Sbox input share1

   (* keep = "true" *) reg  [30:0]   random_rotate_0;    
   (* keep = "true" *) reg  [30:0]   random_rotate_1;    
   (* keep = "true" *) reg  [30:0]   random_rotate_2;    
   (* keep = "true" *) reg  [30:0]   random_rotate_3;    
   (* keep = "true" *) wire [21:0]   random_rotate;     

   (* keep = "true" *) wire forthcyline;
   (* keep = "true" *) wire statepreliminary;
   (* keep = "true" *) wire keypreliminary;
   
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

    //random product 
    always @(posedge ClkxCI or negedge RstxBI) begin
    if (!RstxBI) begin
        random_rotate_0 <= 0;
    end
    else if (rg_start) begin
        random_rotate_0 <= random[30:0];
      end
    else begin
            random_rotate_0[0]  <= random_rotate_0[30] ^ random_rotate_0[27]; // 反馈多项式 x^31 + x^28 + 1
            random_rotate_0[1]  <= random_rotate_0[0];
            random_rotate_0[2]  <= random_rotate_0[1];
            random_rotate_0[3]  <= random_rotate_0[2];
            random_rotate_0[4]  <= random_rotate_0[3];
            random_rotate_0[5]  <= random_rotate_0[4];
            random_rotate_0[6]  <= random_rotate_0[5];
            random_rotate_0[7]  <= random_rotate_0[6];
            random_rotate_0[8]  <= random_rotate_0[7];
            random_rotate_0[9]  <= random_rotate_0[8];
            random_rotate_0[10] <= random_rotate_0[9];
            random_rotate_0[11] <= random_rotate_0[10];
            random_rotate_0[12] <= random_rotate_0[11];
            random_rotate_0[13] <= random_rotate_0[12];
            random_rotate_0[14] <= random_rotate_0[13];
            random_rotate_0[15] <= random_rotate_0[14];
            random_rotate_0[16] <= random_rotate_0[15];
            random_rotate_0[17] <= random_rotate_0[16];
            random_rotate_0[18] <= random_rotate_0[17];
            random_rotate_0[19] <= random_rotate_0[18];
            random_rotate_0[20] <= random_rotate_0[19];
            random_rotate_0[21] <= random_rotate_0[20];
            random_rotate_0[22] <= random_rotate_0[21];
            random_rotate_0[23] <= random_rotate_0[22];
            random_rotate_0[24] <= random_rotate_0[23];
            random_rotate_0[25] <= random_rotate_0[24];
            random_rotate_0[26] <= random_rotate_0[25];
            random_rotate_0[27] <= random_rotate_0[26];
            random_rotate_0[28] <= random_rotate_0[27];
            random_rotate_0[29] <= random_rotate_0[28];
            random_rotate_0[30] <= random_rotate_0[29];
      end
    end

   always @(posedge ClkxCI or negedge RstxBI) begin
    if (!RstxBI) begin
        random_rotate_1 <= 0;
    end
    else if (rg_start) begin
        random_rotate_1 <= random[61:31];
      end
    else begin
            random_rotate_1[0]  <= random_rotate_1[30] ^ random_rotate_1[29] ^ random_rotate_1[26]; // 反馈多项式 x^31 + x^30 + x^27 + 1
            random_rotate_1[1]  <= random_rotate_1[0];
            random_rotate_1[2]  <= random_rotate_1[1];
            random_rotate_1[3]  <= random_rotate_1[2];
            random_rotate_1[4]  <= random_rotate_1[3];
            random_rotate_1[5]  <= random_rotate_1[4];
            random_rotate_1[6]  <= random_rotate_1[5];
            random_rotate_1[7]  <= random_rotate_1[6];
            random_rotate_1[8]  <= random_rotate_1[7];
            random_rotate_1[9]  <= random_rotate_1[8];
            random_rotate_1[10] <= random_rotate_1[9];
            random_rotate_1[11] <= random_rotate_1[10];
            random_rotate_1[12] <= random_rotate_1[11];
            random_rotate_1[13] <= random_rotate_1[12];
            random_rotate_1[14] <= random_rotate_1[13];
            random_rotate_1[15] <= random_rotate_1[14];
            random_rotate_1[16] <= random_rotate_1[15];
            random_rotate_1[17] <= random_rotate_1[16];
            random_rotate_1[18] <= random_rotate_1[17];
            random_rotate_1[19] <= random_rotate_1[18];
            random_rotate_1[20] <= random_rotate_1[19];
            random_rotate_1[21] <= random_rotate_1[20];
            random_rotate_1[22] <= random_rotate_1[21];
            random_rotate_1[23] <= random_rotate_1[22];
            random_rotate_1[24] <= random_rotate_1[23];
            random_rotate_1[25] <= random_rotate_1[24];
            random_rotate_1[26] <= random_rotate_1[25];
            random_rotate_1[27] <= random_rotate_1[26];
            random_rotate_1[28] <= random_rotate_1[27];
            random_rotate_1[29] <= random_rotate_1[28];
            random_rotate_1[30] <= random_rotate_1[29];
      end
    end
   
   always @(posedge ClkxCI or negedge RstxBI) begin
    if (!RstxBI) begin
        random_rotate_2 <= 0;
    end
    else if (rg_start) begin
        random_rotate_2 <= random[92:62];
      end
    else begin
            random_rotate_2[0]  <= random_rotate_2[30] ^ random_rotate_2[27] ^ random_rotate_2[24] ^ random_rotate_2[23]; // 反馈多项式 x^31 + x^28 + x^25 + x^24 + 1
            random_rotate_2[1]  <= random_rotate_2[0];
            random_rotate_2[2]  <= random_rotate_2[1];
            random_rotate_2[3]  <= random_rotate_2[2];
            random_rotate_2[4]  <= random_rotate_2[3];
            random_rotate_2[5]  <= random_rotate_2[4];
            random_rotate_2[6]  <= random_rotate_2[5];
            random_rotate_2[7]  <= random_rotate_2[6];
            random_rotate_2[8]  <= random_rotate_2[7];
            random_rotate_2[9]  <= random_rotate_2[8];
            random_rotate_2[10] <= random_rotate_2[9];
            random_rotate_2[11] <= random_rotate_2[10];
            random_rotate_2[12] <= random_rotate_2[11];
            random_rotate_2[13] <= random_rotate_2[12];
            random_rotate_2[14] <= random_rotate_2[13];
            random_rotate_2[15] <= random_rotate_2[14];
            random_rotate_2[16] <= random_rotate_2[15];
            random_rotate_2[17] <= random_rotate_2[16];
            random_rotate_2[18] <= random_rotate_2[17];
            random_rotate_2[19] <= random_rotate_2[18];
            random_rotate_2[20] <= random_rotate_2[19];
            random_rotate_2[21] <= random_rotate_2[20];
            random_rotate_2[22] <= random_rotate_2[21];
            random_rotate_2[23] <= random_rotate_2[22];
            random_rotate_2[24] <= random_rotate_2[23];
            random_rotate_2[25] <= random_rotate_2[24];
            random_rotate_2[26] <= random_rotate_2[25];
            random_rotate_2[27] <= random_rotate_2[26];
            random_rotate_2[28] <= random_rotate_2[27];
            random_rotate_2[29] <= random_rotate_2[28];
            random_rotate_2[30] <= random_rotate_2[29];
      end
    end

       always @(posedge ClkxCI or negedge RstxBI) begin
    if (!RstxBI) begin
        random_rotate_3 <= 0;
    end
    else if (rg_start) begin
        random_rotate_3 <= random[123:93];
      end
    else begin
            random_rotate_3[0]  <= random_rotate_3[30] ^ random_rotate_3[28] ^ random_rotate_3[24]; // 反馈多项式 x^31 + x^29 + x^25 + 1
            random_rotate_3[1]  <= random_rotate_3[0];
            random_rotate_3[2]  <= random_rotate_3[1];
            random_rotate_3[3]  <= random_rotate_3[2];
            random_rotate_3[4]  <= random_rotate_3[3];
            random_rotate_3[5]  <= random_rotate_3[4];
            random_rotate_3[6]  <= random_rotate_3[5];
            random_rotate_3[7]  <= random_rotate_3[6];
            random_rotate_3[8]  <= random_rotate_3[7];
            random_rotate_3[9]  <= random_rotate_3[8];
            random_rotate_3[10] <= random_rotate_3[9];
            random_rotate_3[11] <= random_rotate_3[10];
            random_rotate_3[12] <= random_rotate_3[11];
            random_rotate_3[13] <= random_rotate_3[12];
            random_rotate_3[14] <= random_rotate_3[13];
            random_rotate_3[15] <= random_rotate_3[14];
            random_rotate_3[16] <= random_rotate_3[15];
            random_rotate_3[17] <= random_rotate_3[16];
            random_rotate_3[18] <= random_rotate_3[17];
            random_rotate_3[19] <= random_rotate_3[18];
            random_rotate_3[20] <= random_rotate_3[19];
            random_rotate_3[21] <= random_rotate_3[20];
            random_rotate_3[22] <= random_rotate_3[21];
            random_rotate_3[23] <= random_rotate_3[22];
            random_rotate_3[24] <= random_rotate_3[23];
            random_rotate_3[25] <= random_rotate_3[24];
            random_rotate_3[26] <= random_rotate_3[25];
            random_rotate_3[27] <= random_rotate_3[26];
            random_rotate_3[28] <= random_rotate_3[27];
            random_rotate_3[29] <= random_rotate_3[28];
            random_rotate_3[30] <= random_rotate_3[29];
      end
    end

    assign random_rotate = {random_rotate_0[5:0], random_rotate_1[5:0],random_rotate_2[4:0], random_rotate_3[4:0]};

    //outputs last State xor last round key
    assign CxDO0 = SboxInxD0;
    assign CxDO1 = SboxInxD1;
        
    //move K register up during cycles 17 - 21
    assign moveKupxS = StateKEYSCHEDULExS | StateSHIFTROWSxS;
    //assign moveKupxS = StateKEYSCHEDULExS;
    //signal that calculations are finished and CT appears at output
    assign DonexS = LastRoundxS & StateSBOXxS;

   //LSFR generates the state transitions
    (*keep = "true" , keep_hierarchy = "yes" *) aes_ctrl_lsfr aes_ctrl_lsfr(.ClkxCI(ClkxCI), .RstxBI(RstxBI), .StartxSI(StartxSI), .LastRoundxSI(LastRoundxS), 
    .StateIDLExS(StateIDLExS), .StateSHIFTROWSxS(StateSHIFTROWSxS), .StateKEYADDITION1o3xS(StateKEYADDITION1o3xS), 
    .StateKEYADDITION2o3xS(StateKEYADDITION2o3xS), .StateKEYADDITION3o3xS(StateKEYADDITION3o3xS),
    .StateKEYSCHEDULExS(StateKEYSCHEDULExS), .State1xS(State1xS), .doMixColumnsxS(doMixColumnsxS), .StateSBOXxS(StateSBOXxS), .forthcylies1(forthcylies1),.forthcylies2(forthcylies2),.forthcylies3(forthcylies3),.forthcylies4(forthcylies4));
   
    //Round constant (RCON) calculation
    (*keep = "true" , keep_hierarchy = "yes" *) rcon rcon(.ClkxCI(ClkxCI), .RstxBI(RstxBI), .NextxSI(nextRCONxS), .ActivexSI(showRCONxS), 
    .LastRoundxSO(LastRoundxS), .FinishedxSO(FinishedxS),.RCONxDO(RCONxD));
    
    (*keep = "true" , keep_hierarchy = "yes" *) sbox aes_sbox(.clock(ClkxCI), .I_share0(SboxInxD0), .I_share1(SboxInxD1), .random_rotate(random_rotate), .O_share0(SboxOutxD0), .O_share1(SboxOutxD1));

   //key register 
    (*keep = "true" , keep_hierarchy = "yes" *) aes_key_regs aes_key_regs1(.ClkxCI(ClkxCI), .KeyInxDI(KeyInxD0), .forthcylies1(forthcylies1),.forthcylies2(forthcylies2),.forthcylies3(forthcylies3),.forthcylies4(forthcylies4),.KeySchedulexSI(moveKupxS),
    .KeyOutxDO(KeyOutxD0), .KeyToSboxOutxDO(KeyToSboxOutxD0), .K03xDO(K03xD0));
  
    (*keep = "true" , keep_hierarchy = "yes" *) aes_key_regs aes_key_regs2(.ClkxCI(ClkxCI), .KeyInxDI(KeyInxD1), .forthcylies1(forthcylies1),.forthcylies2(forthcylies2),.forthcylies3(forthcylies3),.forthcylies4(forthcylies4),.KeySchedulexSI(moveKupxS),
    .KeyOutxDO(KeyOutxD1), .KeyToSboxOutxDO(KeyToSboxOutxD1), .K03xDO(K03xD1));
   //state register 1
    (*keep = "true" , keep_hierarchy = "yes" *) aes_state_regs aes_state_regs1(.ClkxCI(ClkxCI), .StateInxDI(StateInxD0), .ShiftRowsxSI(StateSHIFTROWSxS), 
    .MixColumnsxSI(doMixColumnsxS), .StateOutxDO(StateOutxD0));
     
    //state register 2  
   (*keep = "true" , keep_hierarchy = "yes" *) aes_state_regs aes_state_regs2(.ClkxCI(ClkxCI), .StateInxDI(StateInxD1), .ShiftRowsxSI(StateSHIFTROWSxS), 
    .MixColumnsxSI(doMixColumnsxS), .StateOutxDO(StateOutxD1));
        
endmodule






