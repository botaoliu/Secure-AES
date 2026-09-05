`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:54:06 01/22/2018 
// Design Name: 
// Module Name:    aes_ctrl_lsfr 
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
//LSFR generates the state transitions
(*keep = "true" , keep_hierarchy = "yes" *) module aes_ctrl_lsfr(
   input   ClkxCI,
   input   RstxBI,
   input   StartxSI,   //start signal
   input   LastRoundxSI,   //last round
   output  StateIDLExS,   //IDLE State
   output  State1xS,   //State 1 is active
   output  StateKEYADDITION1o3xS,   // cycle 1  -> 4
   output  StateKEYADDITION2o3xS,   //cycle 5  -> 12
   output  StateKEYADDITION3o3xS,   //cycle 13 -> 16
   output  StateKEYSCHEDULExS,   //cycle 17 -> 20
   output  StateSHIFTROWSxS,   //cycle 21 , performs StateSHIFTROWSxS at S output
   output  doMixColumnsxS,   //cycle 1,5,9,13, performs MixColumns every 4th cycle exept for the last round
   output  StateSBOXxS,     //cycle 1->16, performs s-box 
   output  forthcylies1,   //key_sbox_clt cycle 4
   output  forthcylies2,   //key_sbox_clt cycle 4
   output  forthcylies3,   //key_sbox_clt cycle 4
   output  forthcylies4   //key_sbox_clt cycle 4
);
   parameter [4:0] STATE_0  = 5'b00000;
   parameter [4:0] STATE_1  = 5'b00001;
   parameter [4:0] STATE_2  = 5'b00010;
   parameter [4:0] STATE_3  = 5'b00011;
   parameter [4:0] STATE_4  = 5'b00100;
   parameter [4:0] STATE_5  = 5'b00101;
   parameter [4:0] STATE_6  = 5'b00110;
   parameter [4:0] STATE_7  = 5'b00111;
   parameter [4:0] STATE_8  = 5'b01000;
   parameter [4:0] STATE_9  = 5'b01001;
   parameter [4:0] STATE_10 = 5'b01010;
   parameter [4:0] STATE_11 = 5'b01011;
   parameter [4:0] STATE_12 = 5'b01100;
   parameter [4:0] STATE_13 = 5'b01101;
   parameter [4:0] STATE_14 = 5'b01110;
   parameter [4:0] STATE_15 = 5'b01111;
   parameter [4:0] STATE_16 = 5'b10000;
   parameter [4:0] STATE_17 = 5'b10001;
   parameter [4:0] STATE_18 = 5'b10010;
   parameter [4:0] STATE_19 = 5'b10011;
   parameter [4:0] STATE_20 = 5'b10100;
   parameter [4:0] STATE_21 = 5'b10101;
   parameter [4:0] STATE_22 = 5'b10110;


   (* keep = "true" *) reg StateIDLExS;
   (* keep = "true" *) reg State1xS;
   (* keep = "true" *) reg StateKEYADDITION1o3xS;
   (* keep = "true" *) reg StateKEYADDITION2o3xS;
   (* keep = "true" *) reg StateKEYADDITION3o3xS;
   (* keep = "true" *) reg StateKEYSCHEDULExS;
   (* keep = "true" *) reg StateSHIFTROWSxS;
   (* keep = "true" *) reg doMixColumnsxS;
   (* keep = "true" *) reg StateSBOXxS;
   (* keep = "true" *) reg forthcylies1;
   (* keep = "true" *) reg forthcylies2;
   (* keep = "true" *) reg forthcylies3;
   (* keep = "true" *) reg forthcylies4;

   (* keep = "true" *) reg [4:0]       LSFRxDN;   //LSFR registers
   (* keep = "true" *) reg [4:0]       LSFRxDP;
   
   always @(LSFRxDP or LastRoundxSI)
   begin
      //default assignments
      StateIDLExS = 1'b0;
      State1xS = 1'b0;
      StateKEYADDITION1o3xS = 1'b0;
      StateKEYADDITION2o3xS = 1'b0;
      StateKEYADDITION3o3xS = 1'b0;
      StateKEYSCHEDULExS = 1'b0;
      StateSHIFTROWSxS = 1'b0;
      doMixColumnsxS = 1'b0;
      StateSBOXxS = 1'b0;
      forthcylies1= 1'b0;
      forthcylies2= 1'b0;
      forthcylies3= 1'b0;
      forthcylies4= 1'b0;
      
      // key_sbox_clt cycle 4
       if (LSFRxDP == STATE_17)
          forthcylies1 = 1'b1;
       else
          forthcylies1 = 1'b0;
       
       if (LSFRxDP == STATE_18)
          forthcylies2 = 1'b1; 
       else
          forthcylies2 = 1'b0;
          
       if (LSFRxDP == STATE_19)
          forthcylies3 = 1'b1;
       else
          forthcylies3 = 1'b0;
          
       if (LSFRxDP == STATE_20)
          forthcylies4 = 1'b1; 
       else
          forthcylies4 = 1'b0;        
         
      // cycle 1  
      if (LSFRxDP == STATE_1)
         State1xS = 1'b1;
      else
         State1xS = 1'b0;
        
      //MixColumns every 4th cycle exept for the last round
      if (LastRoundxSI == 1'b0 & (LSFRxDP == STATE_1 | LSFRxDP == STATE_5 | LSFRxDP == STATE_9 | LSFRxDP == STATE_13))
         doMixColumnsxS = 1'b1;
      else
         doMixColumnsxS = 1'b0;

      case (LSFRxDP)
         STATE_0 :
            StateIDLExS = 1'b1;
         STATE_1, STATE_2, STATE_3, STATE_4 :
            begin
            StateSBOXxS = 1'b1; 
            StateKEYADDITION1o3xS = 1'b1;
            end
         STATE_5, STATE_6, STATE_7, STATE_8, STATE_9, STATE_10, STATE_11, STATE_12 :
            begin
            StateSBOXxS = 1'b1; 
            StateKEYADDITION2o3xS = 1'b1;
            end
         STATE_13, STATE_14, STATE_15, STATE_16 :
            begin
            StateSBOXxS = 1'b1; 
            StateKEYADDITION3o3xS = 1'b1;
            end
         STATE_17, STATE_18, STATE_19, STATE_20, STATE_21:
            StateKEYSCHEDULExS = 1'b1;
         STATE_22 :
            StateSHIFTROWSxS = 1'b1;
         default :
         begin
           StateIDLExS = 1'b0;
           StateKEYADDITION1o3xS = 1'b0;
           StateKEYADDITION2o3xS = 1'b0;
           StateKEYADDITION3o3xS = 1'b0;
           StateSBOXxS = 1'b0;
           StateKEYSCHEDULExS = 1'b0;
           StateSHIFTROWSxS = 1'b0;
         end
      endcase
   end
  
always @(posedge ClkxCI or negedge RstxBI)
   begin
      if (RstxBI == 1'b0)
         LSFRxDP <= STATE_0;
      else 
         LSFRxDP <= LSFRxDN;
end
   //state transitions
always @(LSFRxDP or LastRoundxSI or StartxSI)
   begin
      case (LSFRxDP)
         STATE_0 :
         begin
            if (StartxSI == 1'b1)
                LSFRxDN = STATE_1;
            else 
                LSFRxDN = LSFRxDP;
         end
         STATE_1:
          LSFRxDN = STATE_2;
         STATE_2 :
            LSFRxDN = STATE_3;
         STATE_3 :
            LSFRxDN = STATE_4;
         STATE_4 :
            LSFRxDN = STATE_5;
         STATE_5 :
            LSFRxDN = STATE_6;
         STATE_6 :
            LSFRxDN = STATE_7;
         STATE_7 :
            LSFRxDN = STATE_8;
         STATE_8 :
            LSFRxDN = STATE_9;
         STATE_9 :
            LSFRxDN = STATE_10;
         STATE_10 :
            LSFRxDN = STATE_11;
         STATE_11 :
            LSFRxDN = STATE_12;
         STATE_12 :
            LSFRxDN = STATE_13;
         STATE_13 :
            LSFRxDN = STATE_14;
         STATE_14 :
            LSFRxDN = STATE_15;
         STATE_15 :
            LSFRxDN = STATE_16;
         STATE_16 :
            LSFRxDN = STATE_17;
         STATE_17 :
            LSFRxDN = STATE_18;
         STATE_18 :
            LSFRxDN = STATE_19;
         STATE_19 :
            LSFRxDN = STATE_20;
         STATE_20 :
            LSFRxDN = STATE_21;
         STATE_21 :
            LSFRxDN = STATE_22;
         STATE_22:
         begin
             if (LastRoundxSI == 1'b1)
                LSFRxDN = STATE_0;
             else 
                LSFRxDN = STATE_1;
         end
         default : LSFRxDN = STATE_0;
      endcase
   end
   
endmodule





