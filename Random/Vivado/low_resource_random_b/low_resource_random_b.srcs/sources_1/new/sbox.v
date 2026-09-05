`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/04 15:59:08
// Design Name: 
// Module Name: first_aes_sbox_shares
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


(*keep = "true" , keep_hierarchy = "yes" *) module sbox(I_share0, I_share1, random_rotate, O_share0, O_share1, clock);
  input clock;
  input  [7:0]  I_share0,I_share1;
  input  [21:0] random_rotate;
  output        O_share0,O_share1;

  wire [7:0] O_share0;
  wire [7:0] O_share1;

  (* keep = "true" *) reg [1:0] U0_0;
  (* keep = "true" *) reg [1:0] U1_0;
  (* keep = "true" *) reg [1:0] U2_0;
  (* keep = "true" *) reg [1:0] U3_0;
  (* keep = "true" *) reg [1:0] U4_0;
  (* keep = "true" *) reg [1:0] U5_0;
  (* keep = "true" *) reg [1:0] U6_0;
  (* keep = "true" *) reg [1:0] U7_0;

  ////////reg//////

  //t10
  (* keep = "true" *) wire [1:0] linear_U1_0U2_0;
  (* keep = "true" *) wire [1:0] linear_U4_0U6_0;
  (* keep = "true" *) wire [1:0] linear_U4_0U5_0;
  (* keep = "true" *) wire [1:0] linear_U0_0U6_0;
  (* keep = "true" *) wire [1:0] linear_U0_0U3_0U6_0;

  //t11
  (* keep = "true" *) wire [1:0] linear_U5_0U7_0;
  (* keep = "true" *) wire [1:0] linear_U0_0U5_0U7_0;
  (* keep = "true" *) wire [1:0] linear_U1_0U4_0;

  //t13
  (* keep = "true" *) wire [1:0] linear_U3_0U5_0;
  (* keep = "true" *) wire [1:0] linear_U3_0U4_0;

  //t14
  (* keep = "true" *) wire [1:0] linear_U0_0U4_0U5_0;
  (* keep = "true" *) wire [1:0] linear_U6_0U7_0;

  //t15
  (* keep = "true" *) wire [1:0] linear_U5_0U6_0;
  (* keep = "true" *) wire [1:0] linear_U2_0U4_0U7_0;

  //t16
  (* keep = "true" *) wire [1:0] linear_U1_0U3_0U7_0;
  (* keep = "true" *) wire [1:0] linear_U1_0U3_0U5_0U7_0;
  (* keep = "true" *) wire [1:0] linear_U1_0U2_0U5_0;

  (* keep = "true" *) reg [1:0] t11_0_1, t11_1_1;
  (* keep = "true" *) reg [1:0] t12_0_1, t12_1_1;
  (* keep = "true" *) reg [1:0] t13_0_1, t13_1_1;
  (* keep = "true" *) reg [1:0] t14_0_1, t14_1_1;
  (* keep = "true" *) reg [1:0] t15_0_1, t15_1_1;
  (* keep = "true" *) reg [1:0] t16_0_1, t16_1_1;

  (* keep = "true" *) reg [1:0] U0_1;
  (* keep = "true" *) reg [1:0] U1_1;
  (* keep = "true" *) reg [1:0] U2_1;
  (* keep = "true" *) reg [1:0] U3_1;
  (* keep = "true" *) reg [1:0] U4_1;  
  (* keep = "true" *) reg [1:0] U5_1;
  (* keep = "true" *) reg [1:0] U6_1;
  (* keep = "true" *) reg [1:0] U7_1;

  //2 floor
  (* keep = "true" *) reg [1:0] t21_2;
  (* keep = "true" *) reg [1:0] t22_2;
  (* keep = "true" *) reg [1:0] t23_2;
  (* keep = "true" *) reg [1:0] t24_2;

  (* keep = "true" *) reg [1:0] U0_2;
  (* keep = "true" *) reg [1:0] U1_2;
  (* keep = "true" *) reg [1:0] U2_2;
  (* keep = "true" *) reg [1:0] U3_2;
  (* keep = "true" *) reg [1:0] U4_2;  
  (* keep = "true" *) reg [1:0] U5_2;
  (* keep = "true" *) reg [1:0] U6_2;
  (* keep = "true" *) reg [1:0] U7_2;

  //3 floor
  //t29、t33、t40
  (* keep = "true" *) wire [1:0] linear_t23_2t24_2;
  //t37
  (* keep = "true" *) wire [1:0] linear_t21_2t22_2;

  (* keep = "true" *) wire temp_t21_2t23_2_00, temp_t21_2t23_2_01, temp_t21_2t23_2_10, temp_t21_2t23_2_11;
  (* keep = "true" *) wire temp_t22_2t24_2_00, temp_t22_2t24_2_01, temp_t22_2t24_2_10, temp_t22_2t24_2_11;

  (* keep = "true" *) reg [1:0] t29_0_3, t29_1_3, t29_2_3, t29_3_3;
  (* keep = "true" *) reg [1:0] t33_0_3, t33_1_3, t33_2_3, t33_3_3;
  (* keep = "true" *) reg [1:0] t37_0_3, t37_1_3, t37_2_3, t37_3_3;
  (* keep = "true" *) reg [1:0] t40_0_3, t40_1_3, t40_2_3, t40_3_3;

  (* keep = "true" *) reg [1:0] U0_3;
  (* keep = "true" *) reg [1:0] U1_3;
  (* keep = "true" *) reg [1:0] U2_3;
  (* keep = "true" *) reg [1:0] U3_3;
  (* keep = "true" *) reg [1:0] U4_3;  
  (* keep = "true" *) reg [1:0] U5_3;
  (* keep = "true" *) reg [1:0] U6_3;
  (* keep = "true" *) reg [1:0] U7_3;

  //4 floor
  (* keep = "true" *) reg [1:0] t29_4;
  (* keep = "true" *) reg [1:0] t33_4;
  (* keep = "true" *) reg [1:0] t37_4;
  (* keep = "true" *) reg [1:0] t40_4;

  (* keep = "true" *) reg [1:0] U0_4;
  (* keep = "true" *) reg [1:0] U1_4;
  (* keep = "true" *) reg [1:0] U2_4;
  (* keep = "true" *) reg [1:0] U3_4;
  (* keep = "true" *) reg [1:0] U4_4;  
  (* keep = "true" *) reg [1:0] U5_4;
  (* keep = "true" *) reg [1:0] U6_4;
  (* keep = "true" *) reg [1:0] U7_4;

  //5 floor
  (* keep = "true" *) reg [1:0] s0_0_5, s0_1_5; 
  (* keep = "true" *) reg [1:0] s1_0_5, s1_1_5; 
  (* keep = "true" *) reg [1:0] s2_0_5, s2_1_5; 
  (* keep = "true" *) reg [1:0] s3_0_5, s3_1_5; 
  (* keep = "true" *) reg [1:0] s4_0_5, s4_1_5; 
  (* keep = "true" *) reg [1:0] s5_0_5, s5_1_5; 
  (* keep = "true" *) reg [1:0] s6_0_5, s6_1_5; 
  (* keep = "true" *) reg [1:0] s7_0_5, s7_1_5; 


  (* keep = "true" *) wire [1:0] linear_U4_4U6_4;
  (* keep = "true" *) wire [1:0] linear_U1_4U2_4;
  (* keep = "true" *) wire [1:0] linear_U1_4U3_4U7_4;
  (* keep = "true" *) wire [1:0] linear_U6_4U7_4;
  (* keep = "true" *) wire [1:0] linear_U0_4U5_4;
  (* keep = "true" *) wire [1:0] linear_U1_4U4_4;
  (* keep = "true" *) wire [1:0] linear_U3_4U6_4;

  //S3
  (* keep = "true" *) wire [1:0] linear_U0_4U2_4U4_4U6_4;
  (* keep = "true" *) wire [1:0] linear_U0_4U4_4;
  (* keep = "true" *) wire [1:0] linear_U1_4U2_4U5_4;
  (* keep = "true" *) wire [1:0] linear_U1_4U3_4U4_4U6_4U7_4;

  //S7
  (* keep = "true" *) wire [1:0] linear_U1_4U2_4U5_4U6_4U7_4;  
  (* keep = "true" *) wire [1:0] linear_U3_4U4_4U5_4U6_4U7_4; 
  (* keep = "true" *) wire [1:0] linear_U0_4U4_4U5_4U6_4;
  (* keep = "true" *) wire [1:0] linear_U0_4U1_4U3_4U4_4U6_4U7_4; 

  //S0
  (* keep = "true" *) wire [1:0] linear_U1_4U3_4;  
  (* keep = "true" *) wire [1:0] linear_U0_4U1_4U2_4U4_4; 
  (* keep = "true" *) wire [1:0] linear_U0_4U1_4U3_4U7_4;
  (* keep = "true" *) wire [1:0] linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4;

  //S6
  (* keep = "true" *) wire [1:0] linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4;
  (* keep = "true" *) wire [1:0] linear_U2_4U3_4;  
  (* keep = "true" *) wire [1:0] linear_U1_4U3_4U4_4U6_4;
  (* keep = "true" *) wire [1:0] linear_U0_4U1_4U3_4U4_4U6_4;//5

  //S4
  (* keep = "true" *) wire [1:0] linear_U0_4U1_4U4_4U6_4U7_4;
  (* keep = "true" *) wire [1:0] linear_U3_4U6_4U7_4;
  (* keep = "true" *) wire [1:0] linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4;
  (* keep = "true" *) wire [1:0] linear_U1_4U2_4U3_4U5_4U7_4;

  //S1
  (* keep = "true" *) wire [1:0] linear_U1_4U2_4U3_4U4_4U5_4U6_4; 
  (* keep = "true" *) wire [1:0] linear_U1_4U2_4U3_4U6_4;
  (* keep = "true" *) wire [1:0] linear_U0_4U1_4U3_4;
  (* keep = "true" *) wire [1:0] linear_U0_4U2_4;

  //S2
  (* keep = "true" *) wire [1:0] linear_U0_4U2_4U3_4U4_4U5_4U7_4; 
  (* keep = "true" *) wire [1:0] linear_U1_4U5_4U7_4; 
  (* keep = "true" *) wire [1:0] linear_U0_4U1_4U2_4U5_4; 
  (* keep = "true" *) wire [1:0] linear_U0_4U1_4U2_4U3_4U4_4U5_4;

  //S5
  (* keep = "true" *) wire [1:0] linear_U1_4U2_4U3_4U4_4U5_4U7_4; 
  (* keep = "true" *) wire [1:0] linear_U2_4U5_4U6_4U7_4;
  (* keep = "true" *) wire [1:0] linear_U0_4U3_4U5_4U6_4U7_4;

  //0 floor 
  always @(posedge clock) begin
        U0_0[0] <= I_share0[7];
        U1_0[0] <= I_share0[6];
        U2_0[0] <= I_share0[5];
        U3_0[0] <= I_share0[4];
        U4_0[0] <= I_share0[3];
        U5_0[0] <= I_share0[2];
        U6_0[0] <= I_share0[1];
        U7_0[0] <= I_share0[0];
  
        U0_0[1] <= I_share1[7];
        U1_0[1] <= I_share1[6];
        U2_0[1] <= I_share1[5];
        U3_0[1] <= I_share1[4];
        U4_0[1] <= I_share1[3];
        U5_0[1] <= I_share1[2];
        U6_0[1] <= I_share1[1];
        U7_0[1] <= I_share1[0];
   end


  //t10
  assign linear_U1_0U2_0[0] = (U1_0[0] ^ U2_0[0]);
  assign linear_U1_0U2_0[1] = (U1_0[1] ^ U2_0[1]);

  assign linear_U4_0U6_0[0] = (U4_0[0] ^ U6_0[0]);
  assign linear_U4_0U6_0[1] = (U4_0[1] ^ U6_0[1]);  

  assign linear_U4_0U5_0[0] = (U4_0[0] ^ U5_0[0]);
  assign linear_U4_0U5_0[1] = (U4_0[1] ^ U5_0[1]); 

  assign linear_U0_0U6_0[0] = (U0_0[0] ^ U6_0[0]);
  assign linear_U0_0U6_0[1] = (U0_0[1] ^ U6_0[1]);

  assign linear_U0_0U3_0U6_0[0] = (U3_0[0] ^ linear_U0_0U6_0[0]);
  assign linear_U0_0U3_0U6_0[1] = (U3_0[1] ^ linear_U0_0U6_0[1]);

  //t11
  assign linear_U5_0U7_0[0] = (U5_0[0] ^ U7_0[0]);
  assign linear_U5_0U7_0[1] = (U5_0[1] ^ U7_0[1]);
  
  assign linear_U0_0U5_0U7_0[0] = (U0_0[0] ^ linear_U5_0U7_0[0]);
  assign linear_U0_0U5_0U7_0[1] = (U0_0[1] ^ linear_U5_0U7_0[1]);

  assign linear_U1_0U4_0[0] = (U1_0[0] ^ U4_0[0]);
  assign linear_U1_0U4_0[1] = (U1_0[1] ^ U4_0[1]);

  //t13
  assign linear_U3_0U5_0[0] = (U3_0[0] ^ U5_0[0]);
  assign linear_U3_0U5_0[1] = (U3_0[1] ^ U5_0[1]);

  assign linear_U3_0U4_0[0] = (U3_0[0] ^ U4_0[0]);
  assign linear_U3_0U4_0[1] = (U3_0[1] ^ U4_0[1]);

  //t14
  assign linear_U0_0U4_0U5_0[0] = (U0_0[0] ^ linear_U4_0U5_0[0]);
  assign linear_U0_0U4_0U5_0[1] = (U0_0[1] ^ linear_U4_0U5_0[1]);

  assign linear_U6_0U7_0[0] = (U6_0[0] ^ U7_0[0]);
  assign linear_U6_0U7_0[1] = (U6_0[1] ^ U7_0[1]);

  //t15
  assign linear_U5_0U6_0[0] = (U5_0[0] ^ U6_0[0]);
  assign linear_U5_0U6_0[1] = (U5_0[1] ^ U6_0[1]);

  assign linear_U2_0U4_0U7_0[0] = (U2_0[0] ^ U4_0[0] ^ U7_0[0]);
  assign linear_U2_0U4_0U7_0[1] = (U2_0[1] ^ U4_0[1] ^ U7_0[1]);

  //t16
  assign linear_U1_0U3_0U7_0[0] = (U1_0[0] ^ U3_0[0] ^ U7_0[0]);
  assign linear_U1_0U3_0U7_0[1] = (U1_0[1] ^ U3_0[1] ^ U7_0[1]);

  assign linear_U1_0U3_0U5_0U7_0[0] = (U5_0[0] ^ linear_U1_0U3_0U7_0[0]);
  assign linear_U1_0U3_0U5_0U7_0[1] = (U5_0[1] ^ linear_U1_0U3_0U7_0[1]);

  assign linear_U1_0U2_0U5_0[0] = (U1_0[0] ^ U2_0[0] ^ U5_0[0]);
  assign linear_U1_0U2_0U5_0[1] = (U1_0[1] ^ U2_0[1] ^ U5_0[1]);

  //1 floor 
  always @(posedge clock) begin
        t11_0_1[0] <= U0_0[0] & U6_0[0] ^ U1_0[0] & U5_0[0] ^ linear_U1_0U2_0[0] & linear_U4_0U6_0[0] ^ U7_0[0] & linear_U4_0U5_0[0] ^ linear_U0_0U3_0U6_0[0] ^ U5_0[0];
        t11_0_1[1] <= U0_0[0] & U6_0[1] ^ U1_0[0] & U5_0[1] ^ linear_U1_0U2_0[0] & linear_U4_0U6_0[1] ^ U7_0[0] & linear_U4_0U5_0[1] ^ random_rotate[0];
        t11_1_1[0] <= U0_0[1] & U6_0[0] ^ U1_0[1] & U5_0[0] ^ linear_U1_0U2_0[1] & linear_U4_0U6_0[0] ^ U7_0[1] & linear_U4_0U5_0[0] ^ random_rotate[0];
        t11_1_1[1] <= U0_0[1] & U6_0[1] ^ U1_0[1] & U5_0[1] ^ linear_U1_0U2_0[1] & linear_U4_0U6_0[1] ^ U7_0[1] & linear_U4_0U5_0[1] ^ linear_U0_0U3_0U6_0[1] ^ U5_0[1];

        t12_0_1[0] <= U1_0[0] & linear_U5_0U7_0[0] ^ U2_0[0] & linear_U0_0U5_0U7_0[0] ^ U3_0[0] & linear_U5_0U7_0[0] ^ U4_0[0] & U0_0[0] ^ linear_U1_0U4_0[0] ^ linear_U5_0U7_0[0]; 
        t12_0_1[1] <= U1_0[0] & linear_U5_0U7_0[1] ^ U2_0[0] & linear_U0_0U5_0U7_0[1] ^ U3_0[0] & linear_U5_0U7_0[1] ^ U4_0[0] & U0_0[1] ^ random_rotate[1];
        t12_1_1[0] <= U1_0[1] & linear_U5_0U7_0[0] ^ U2_0[1] & linear_U0_0U5_0U7_0[0] ^ U3_0[1] & linear_U5_0U7_0[0] ^ U4_0[1] & U0_0[0] ^ random_rotate[1];
        t12_1_1[1] <= U1_0[1] & linear_U5_0U7_0[1] ^ U2_0[1] & linear_U0_0U5_0U7_0[1] ^ U3_0[1] & linear_U5_0U7_0[1] ^ U4_0[1] & U0_0[1] ^ linear_U1_0U4_0[1] ^ linear_U5_0U7_0[1];

        t13_0_1[0] <= U0_0[0] & linear_U3_0U5_0[0] ^ U1_0[0] & U3_0[0] ^ U6_0[0] & linear_U3_0U4_0[0] ^ U2_0[0];
        t13_0_1[1] <= U0_0[0] & linear_U3_0U5_0[1] ^ U1_0[0] & U3_0[1] ^ U6_0[0] & linear_U3_0U4_0[1] ^ random_rotate[2];
        t13_1_1[0] <= U0_0[1] & linear_U3_0U5_0[0] ^ U1_0[1] & U3_0[0] ^ U6_0[1] & linear_U3_0U4_0[0] ^ random_rotate[2];
        t13_1_1[1] <= U0_0[1] & linear_U3_0U5_0[1] ^ U1_0[1] & U3_0[1] ^ U6_0[1] & linear_U3_0U4_0[1] ^ U2_0[1];

        t14_0_1[0] <= U2_0[0] & linear_U0_0U4_0U5_0[0] ^ U3_0[0] & linear_U4_0U5_0[0] ^ linear_U6_0U7_0[0] & U5_0[0] ^ U1_0[0] ^ linear_U0_0U3_0U6_0[0];
        t14_0_1[1] <= U2_0[0] & linear_U0_0U4_0U5_0[1] ^ U3_0[0] & linear_U4_0U5_0[1] ^ linear_U6_0U7_0[0] & U5_0[1] ^ random_rotate[3];
        t14_1_1[0] <= U2_0[1] & linear_U0_0U4_0U5_0[0] ^ U3_0[1] & linear_U4_0U5_0[0] ^ linear_U6_0U7_0[1] & U5_0[0] ^ random_rotate[3];
        t14_1_1[1] <= U2_0[1] & linear_U0_0U4_0U5_0[1] ^ U3_0[1] & linear_U4_0U5_0[1] ^ linear_U6_0U7_0[1] & U5_0[1] ^ U1_0[1] ^ linear_U0_0U3_0U6_0[1];

        t15_0_1[0] <= U1_0[0] & linear_U0_0U6_0[0] ^ U2_0[0] & linear_U3_0U4_0[0] ^ U7_0[0] & linear_U5_0U6_0[0] ^ linear_U2_0U4_0U7_0[0];
        t15_0_1[1] <= U1_0[0] & linear_U0_0U6_0[1] ^ U2_0[0] & linear_U3_0U4_0[1] ^ U7_0[0] & linear_U5_0U6_0[1] ^ random_rotate[4]; 
        t15_1_1[0] <= U1_0[1] & linear_U0_0U6_0[0] ^ U2_0[1] & linear_U3_0U4_0[0] ^ U7_0[1] & linear_U5_0U6_0[0] ^ random_rotate[4]; 
        t15_1_1[1] <= U1_0[1] & linear_U0_0U6_0[1] ^ U2_0[1] & linear_U3_0U4_0[1] ^ U7_0[1] & linear_U5_0U6_0[1] ^ linear_U2_0U4_0U7_0[1];

        t16_0_1[0] <= U0_0[0] & linear_U5_0U7_0[0] ^ U2_0[0] & linear_U1_0U3_0U7_0[0] ^ U4_0[0] & linear_U1_0U3_0U5_0U7_0[0] ^ linear_U1_0U2_0U5_0[0];
        t16_0_1[1] <= U0_0[0] & linear_U5_0U7_0[1] ^ U2_0[0] & linear_U1_0U3_0U7_0[1] ^ U4_0[0] & linear_U1_0U3_0U5_0U7_0[1] ^ random_rotate[5];
        t16_1_1[0] <= U0_0[1] & linear_U5_0U7_0[0] ^ U2_0[1] & linear_U1_0U3_0U7_0[0] ^ U4_0[1] & linear_U1_0U3_0U5_0U7_0[0] ^ random_rotate[5];
        t16_1_1[1] <= U0_0[1] & linear_U5_0U7_0[1] ^ U2_0[1] & linear_U1_0U3_0U7_0[1] ^ U4_0[1] & linear_U1_0U3_0U5_0U7_0[1] ^ linear_U1_0U2_0U5_0[1];

        U0_1[0] <= U0_0[0];
        U0_1[1] <= U0_0[1];
        U1_1[0] <= U1_0[0];
        U1_1[1] <= U1_0[1];
        U2_1[0] <= U2_0[0];
        U2_1[1] <= U2_0[1];
        U3_1[0] <= U3_0[0];
        U3_1[1] <= U3_0[1]; 
        U4_1[0] <= U4_0[0];
        U4_1[1] <= U4_0[1];
        U5_1[0] <= U5_0[0];
        U5_1[1] <= U5_0[1];
        U6_1[0] <= U6_0[0];
        U6_1[1] <= U6_0[1];
        U7_1[0] <= U7_0[0];
        U7_1[1] <= U7_0[1];
    end

    // 2 floor 
  always @(posedge clock) begin
        t21_2[0] <= (t11_0_1[0] ^ t11_0_1[1] ^ t12_0_1[0] ^ t12_0_1[1]);
        t21_2[1] <= (t11_1_1[0] ^ t11_1_1[1] ^ t12_1_1[0] ^ t12_1_1[1]);

        t22_2[0] <= (t12_0_1[0] ^ t12_0_1[1] ^ t13_0_1[0] ^ t13_0_1[1]);
        t22_2[1] <= (t12_1_1[0] ^ t12_1_1[1] ^ t13_1_1[0] ^ t13_1_1[1]);

        t23_2[0] <= (t13_0_1[0] ^ t13_0_1[1] ^ t14_0_1[0] ^ t14_0_1[1] ^ t15_0_1[0] ^ t15_0_1[1]);
        t23_2[1] <= (t13_1_1[0] ^ t13_1_1[1] ^ t14_1_1[0] ^ t14_1_1[1] ^ t15_1_1[0] ^ t15_1_1[1]);  

        t24_2[0] <= (t13_0_1[0] ^ t13_0_1[1] ^ t15_0_1[0] ^ t15_0_1[1] ^ t16_0_1[0] ^ t16_0_1[1]);
        t24_2[1] <= (t13_1_1[0] ^ t13_1_1[1] ^ t15_1_1[0] ^ t15_1_1[1] ^ t16_1_1[0] ^ t16_1_1[1]);
      
        U0_2[0] <= U0_1[0];
        U0_2[1] <= U0_1[1];
        U1_2[0] <= U1_1[0];
        U1_2[1] <= U1_1[1];
        U2_2[0] <= U2_1[0];
        U2_2[1] <= U2_1[1];
        U3_2[0] <= U3_1[0];
        U3_2[1] <= U3_1[1]; 
        U4_2[0] <= U4_1[0];
        U4_2[1] <= U4_1[1];
        U5_2[0] <= U5_1[0];
        U5_2[1] <= U5_1[1];
        U6_2[0] <= U6_1[0];
        U6_2[1] <= U6_1[1];
        U7_2[0] <= U7_1[0];
        U7_2[1] <= U7_1[1];

    end

  assign linear_t23_2t24_2[0] = (t23_2[0] ^ t24_2[0]);
  assign linear_t23_2t24_2[1] = (t23_2[1] ^ t24_2[1]);

  assign linear_t21_2t22_2[0] = (t21_2[0] ^ t22_2[0]);
  assign linear_t21_2t22_2[1] = (t21_2[1] ^ t22_2[1]);

  assign temp_t21_2t23_2_00 = t21_2[0] & t23_2[0];
  assign temp_t21_2t23_2_01 = t21_2[0] & t23_2[1];
  assign temp_t21_2t23_2_10 = t21_2[1] & t23_2[0];
  assign temp_t21_2t23_2_11 = t21_2[1] & t23_2[1];

  assign temp_t22_2t24_2_00 = t22_2[0] & t24_2[0];
  assign temp_t22_2t24_2_01 = t22_2[0] & t24_2[1];
  assign temp_t22_2t24_2_10 = t22_2[1] & t24_2[0];
  assign temp_t22_2t24_2_11 = t22_2[1] & t24_2[1];


  // 3 floor 
  always @(posedge clock) begin
        t29_0_3[0] <= t22_2[0] & temp_t21_2t23_2_00 ^ temp_t22_2t24_2_00 ^ t21_2[0] & linear_t23_2t24_2[0] ^ t22_2[0]  ^ random_rotate[6];
        t29_1_3[0] <= t22_2[0] & temp_t21_2t23_2_01 ^ temp_t22_2t24_2_01 ^ t21_2[0] & linear_t23_2t24_2[1]             ^ random_rotate[7];
        t29_2_3[0] <= t22_2[0] & temp_t21_2t23_2_10                                                                    ^ linear_t23_2t24_2[0];
        t29_3_3[0] <= t22_2[0] & temp_t21_2t23_2_11                                                                    ^ t24_2[0];
        t29_0_3[1] <= t22_2[1] & temp_t21_2t23_2_00                                                                    ^ linear_t23_2t24_2[0];
        t29_1_3[1] <= t22_2[1] & temp_t21_2t23_2_01                                                                    ^ t24_2[0];
        t29_2_3[1] <= t22_2[1] & temp_t21_2t23_2_10 ^ temp_t22_2t24_2_10 ^ t21_2[1] & linear_t23_2t24_2[0]             ^ random_rotate[7];
        t29_3_3[1] <= t22_2[1] & temp_t21_2t23_2_11 ^ temp_t22_2t24_2_11 ^ t21_2[1] & linear_t23_2t24_2[1] ^ t22_2[1]  ^ random_rotate[6];
        
        t33_0_3[0] <= t24_2[0] & temp_t21_2t23_2_00 ^ temp_t21_2t23_2_00 ^ t22_2[0] & linear_t23_2t24_2[0] ^ t24_2[0]  ^ random_rotate[8];
        t33_1_3[0] <= t24_2[0] & temp_t21_2t23_2_01                                                                    ^ linear_t21_2t22_2[0];
        t33_2_3[0] <= t24_2[0] & temp_t21_2t23_2_10 ^ temp_t21_2t23_2_10 ^ t22_2[1] & linear_t23_2t24_2[0]             ^ random_rotate[9];
        t33_3_3[0] <= t24_2[0] & temp_t21_2t23_2_11                                                                    ^ t22_2[0];
        t33_0_3[1] <= t24_2[1] & temp_t21_2t23_2_00                                                                    ^ linear_t21_2t22_2[0];
        t33_1_3[1] <= t24_2[1] & temp_t21_2t23_2_01 ^ temp_t21_2t23_2_01 ^ t22_2[0] & linear_t23_2t24_2[1]             ^ random_rotate[9];
        t33_2_3[1] <= t24_2[1] & temp_t21_2t23_2_10                                                                    ^ t22_2[0]; 
        t33_3_3[1] <= t24_2[1] & temp_t21_2t23_2_11 ^ temp_t21_2t23_2_11 ^ t22_2[1] & linear_t23_2t24_2[1] ^ t24_2[1]  ^ random_rotate[8];

        t37_0_3[0] <= t23_2[0] & temp_t22_2t24_2_00 ^ t23_2[0] & linear_t21_2t22_2[0] ^ linear_t23_2t24_2[0]           ^ random_rotate[10];
        t37_1_3[0] <= t23_2[0] & temp_t22_2t24_2_01                                                                    ^ linear_t21_2t22_2[0];
        t37_2_3[0] <= t23_2[0] & temp_t22_2t24_2_10 ^ t23_2[0] & linear_t21_2t22_2[1]                                  ^ random_rotate[11];
        t37_3_3[0] <= t23_2[0] & temp_t22_2t24_2_11                                                                    ^ t21_2[0]; 
        t37_0_3[1] <= t23_2[1] & temp_t22_2t24_2_00                                                                    ^ linear_t21_2t22_2[0];
        t37_1_3[1] <= t23_2[1] & temp_t22_2t24_2_01 ^ t23_2[1] & linear_t21_2t22_2[0]                                  ^ random_rotate[11];
        t37_2_3[1] <= t23_2[1] & temp_t22_2t24_2_10                                                                    ^ t21_2[0];
        t37_3_3[1] <= t23_2[1] & temp_t22_2t24_2_11 ^ t23_2[1] & linear_t21_2t22_2[1] ^ linear_t23_2t24_2[1]           ^ random_rotate[10];

        t40_0_3[0] <= t21_2[0] & temp_t22_2t24_2_00 ^ t21_2[0] & linear_t23_2t24_2[0] ^ linear_t21_2t22_2[0]           ^ random_rotate[12];
        t40_1_3[0] <= t21_2[0] & temp_t22_2t24_2_01 ^ t21_2[0] & linear_t23_2t24_2[1]                                  ^ random_rotate[13];
        t40_2_3[0] <= t21_2[0] & temp_t22_2t24_2_10                                                                    ^ linear_t23_2t24_2[0];
        t40_3_3[0] <= t21_2[0] & temp_t22_2t24_2_11                                                                    ^ t23_2[0];
        t40_0_3[1] <= t21_2[1] & temp_t22_2t24_2_00                                                                    ^ linear_t23_2t24_2[0];
        t40_1_3[1] <= t21_2[1] & temp_t22_2t24_2_01                                                                    ^ t23_2[0];
        t40_2_3[1] <= t21_2[1] & temp_t22_2t24_2_10 ^ t21_2[1] & linear_t23_2t24_2[0]                                  ^ random_rotate[13];
        t40_3_3[1] <= t21_2[1] & temp_t22_2t24_2_11 ^ t21_2[1] & linear_t23_2t24_2[1] ^ linear_t21_2t22_2[1]           ^ random_rotate[12];
        
        U0_3[0] <= U0_2[0];
        U0_3[1] <= U0_2[1];
        U1_3[0] <= U1_2[0];
        U1_3[1] <= U1_2[1];
        U2_3[0] <= U2_2[0];
        U2_3[1] <= U2_2[1];
        U3_3[0] <= U3_2[0];
        U3_3[1] <= U3_2[1]; 
        U4_3[0] <= U4_2[0];
        U4_3[1] <= U4_2[1];
        U5_3[0] <= U5_2[0];
        U5_3[1] <= U5_2[1];
        U6_3[0] <= U6_2[0];
        U6_3[1] <= U6_2[1];
        U7_3[0] <= U7_2[0];
        U7_3[1] <= U7_2[1];
    end

   // 4 floor 
  always @(posedge clock) begin

        t29_4[0] <= (t29_0_3[0] ^ t29_1_3[0] ^ t29_2_3[0] ^ t29_3_3[0]);
        t29_4[1] <= (t29_0_3[1] ^ t29_1_3[1] ^ t29_2_3[1] ^ t29_3_3[1]);

        t33_4[0] <= (t33_0_3[0] ^ t33_1_3[0] ^ t33_2_3[0] ^ t33_3_3[0]);
        t33_4[1] <= (t33_0_3[1] ^ t33_1_3[1] ^ t33_2_3[1] ^ t33_3_3[1]);

        t37_4[0] <= (t37_0_3[0] ^ t37_1_3[0] ^ t37_2_3[0] ^ t37_3_3[0]);
        t37_4[1] <= (t37_0_3[1] ^ t37_1_3[1] ^ t37_2_3[1] ^ t37_3_3[1]);

        t40_4[0] <= (t40_0_3[0] ^ t40_1_3[0] ^ t40_2_3[0] ^ t40_3_3[0]);
        t40_4[1] <= (t40_0_3[1] ^ t40_1_3[1] ^ t40_2_3[1] ^ t40_3_3[1]); 
      
        U0_4[0] <= U0_3[0];
        U0_4[1] <= U0_3[1];
        U1_4[0] <= U1_3[0];
        U1_4[1] <= U1_3[1];
        U2_4[0] <= U2_3[0];
        U2_4[1] <= U2_3[1];
        U3_4[0] <= U3_3[0];
        U3_4[1] <= U3_3[1]; 
        U4_4[0] <= U4_3[0];
        U4_4[1] <= U4_3[1];
        U5_4[0] <= U5_3[0];
        U5_4[1] <= U5_3[1];
        U6_4[0] <= U6_3[0];
        U6_4[1] <= U6_3[1];
        U7_4[0] <= U7_3[0];
        U7_4[1] <= U7_3[1];
    end

  assign linear_U4_4U6_4[0] = (U4_4[0] ^ U6_4[0]);
  assign linear_U4_4U6_4[1] = (U4_4[1] ^ U6_4[1]);

  assign linear_U1_4U2_4[0] = (U1_4[0] ^ U2_4[0]);
  assign linear_U1_4U2_4[1] = (U1_4[1] ^ U2_4[1]);

  assign linear_U1_4U3_4U7_4[0] = (U1_4[0] ^ U3_4[0] ^ U7_4[0]);
  assign linear_U1_4U3_4U7_4[1] = (U1_4[1] ^ U3_4[1] ^ U7_4[1]);

  assign linear_U6_4U7_4[0] = (U6_4[0] ^ U7_4[0]);
  assign linear_U6_4U7_4[1] = (U6_4[1] ^ U7_4[1]);

  assign linear_U0_4U5_4[0] = (U0_4[0] ^ U5_4[0]);
  assign linear_U0_4U5_4[1] = (U0_4[1] ^ U5_4[1]);

  assign linear_U1_4U4_4[0] = (U1_4[0] ^ U4_4[0]);
  assign linear_U1_4U4_4[1] = (U1_4[1] ^ U4_4[1]);

  assign linear_U3_4U6_4[0] = (U3_4[0] ^ U6_4[0]);
  assign linear_U3_4U6_4[1] = (U3_4[1] ^ U6_4[1]);

  //S3
  assign linear_U0_4U2_4U4_4U6_4[0] = (linear_U0_4U2_4[0] ^ linear_U4_4U6_4[0]);
  assign linear_U0_4U2_4U4_4U6_4[1] = (linear_U0_4U2_4[1] ^ linear_U4_4U6_4[1]);

  assign linear_U0_4U4_4[0] = (U0_4[0] ^ U4_4[0]);
  assign linear_U0_4U4_4[1] = (U0_4[1] ^ U4_4[1]);

  assign linear_U1_4U2_4U5_4[0] = (linear_U1_4U2_4[0] ^ U5_4[0]);
  assign linear_U1_4U2_4U5_4[1] = (linear_U1_4U2_4[1] ^ U5_4[1]);

  assign linear_U1_4U3_4U4_4U6_4U7_4[0] = (linear_U4_4U6_4[0] ^ linear_U1_4U3_4U7_4[0]);
  assign linear_U1_4U3_4U4_4U6_4U7_4[1] = (linear_U4_4U6_4[1] ^ linear_U1_4U3_4U7_4[1]);

  //S7
  assign linear_U1_4U2_4U5_4U6_4U7_4[0] = (linear_U1_4U2_4U5_4[0] ^ linear_U6_4U7_4[0]);
  assign linear_U1_4U2_4U5_4U6_4U7_4[1] = (linear_U1_4U2_4U5_4[1] ^ linear_U6_4U7_4[1]);

  assign linear_U3_4U4_4U5_4U6_4U7_4[0] = (linear_U1_4U3_4U4_4U6_4U7_4[0] ^ linear_U1_4U2_4U5_4[0] ^ U2_4[0]);
  assign linear_U3_4U4_4U5_4U6_4U7_4[1] = (linear_U1_4U3_4U4_4U6_4U7_4[1] ^ linear_U1_4U2_4U5_4[1] ^ U2_4[1]);

  assign linear_U0_4U4_4U5_4U6_4[0] = (linear_U0_4U5_4[0] ^ linear_U4_4U6_4[0]);
  assign linear_U0_4U4_4U5_4U6_4[1] = (linear_U0_4U5_4[1] ^ linear_U4_4U6_4[1]);

  assign linear_U0_4U1_4U3_4U4_4U6_4U7_4[0] = (linear_U1_4U3_4U7_4[0] ^ linear_U4_4U6_4[0] ^ U0_4[0]);
  assign linear_U0_4U1_4U3_4U4_4U6_4U7_4[1] = (linear_U1_4U3_4U7_4[1] ^ linear_U4_4U6_4[1] ^ U0_4[1]); 

  //S0
  assign linear_U1_4U3_4[0] = (U1_4[0] ^ U3_4[0]);
  assign linear_U1_4U3_4[1] = (U1_4[1] ^ U3_4[1]);

  assign linear_U0_4U1_4U2_4U4_4[0] = (linear_U0_4U2_4[0] ^ linear_U1_4U4_4[0]);
  assign linear_U0_4U1_4U2_4U4_4[1] = (linear_U0_4U2_4[1] ^ linear_U1_4U4_4[1]);

  assign linear_U0_4U1_4U3_4U7_4[0] = (linear_U1_4U3_4U7_4[0] ^ U0_4[0]);
  assign linear_U0_4U1_4U3_4U7_4[1] = (linear_U1_4U3_4U7_4[1] ^ U0_4[1]);

  assign linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4[0] = (linear_U1_4U2_4U5_4U6_4U7_4[0] ^ linear_U0_4U4_4[0]);
  assign linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4[1] = (linear_U1_4U2_4U5_4U6_4U7_4[1] ^ linear_U0_4U4_4[1]); 

  //S6
  assign linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[0] = (linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4[0] ^ linear_U3_4U6_4[0]);
  assign linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[1] = (linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4[1] ^ linear_U3_4U6_4[1]); 

  assign linear_U2_4U3_4[0] = (U2_4[0] ^ U3_4[0]);
  assign linear_U2_4U3_4[1] = (U2_4[1] ^ U3_4[1]);

  assign linear_U1_4U3_4U4_4U6_4[0] = (linear_U1_4U4_4[0] ^ linear_U3_4U6_4[0]);
  assign linear_U1_4U3_4U4_4U6_4[1] = (linear_U1_4U4_4[1] ^ linear_U3_4U6_4[1]);

  assign linear_U0_4U1_4U3_4U4_4U6_4[0] = (linear_U1_4U3_4U4_4U6_4[0] ^ U0_4[0]);
  assign linear_U0_4U1_4U3_4U4_4U6_4[1] = (linear_U1_4U3_4U4_4U6_4[1] ^ U0_4[1]);

  //S4
  assign linear_U0_4U1_4U4_4U6_4U7_4[0] = (linear_U0_4U1_4U3_4U4_4U6_4U7_4[0] ^ U3_4[0]);
  assign linear_U0_4U1_4U4_4U6_4U7_4[1] = (linear_U0_4U1_4U3_4U4_4U6_4U7_4[1] ^ U3_4[1]);

  assign linear_U3_4U6_4U7_4[0] = (linear_U6_4U7_4[0] ^ U3_4[0]);
  assign linear_U3_4U6_4U7_4[1] = (linear_U6_4U7_4[1] ^ U3_4[1]);

  assign linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4[0] = (linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[0] ^ linear_U6_4U7_4[0]);
  assign linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4[1] = (linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[1] ^ linear_U6_4U7_4[1]);

  assign linear_U1_4U2_4U3_4U5_4U7_4[0] = (linear_U1_4U2_4U5_4U6_4U7_4[0] ^ linear_U3_4U6_4[0]);
  assign linear_U1_4U2_4U3_4U5_4U7_4[1] = (linear_U1_4U2_4U5_4U6_4U7_4[1] ^ linear_U3_4U6_4[1]);

  //S1
  assign linear_U1_4U2_4U3_4U4_4U5_4U6_4[0] = (linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4[0] ^ U0_4[0]);
  assign linear_U1_4U2_4U3_4U4_4U5_4U6_4[1] = (linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4[1] ^ U0_4[1]);

  assign linear_U1_4U2_4U3_4U6_4[0] = (linear_U1_4U2_4[0] ^ linear_U3_4U6_4[0]);
  assign linear_U1_4U2_4U3_4U6_4[1] = (linear_U1_4U2_4[1] ^ linear_U3_4U6_4[1]);

  assign linear_U0_4U1_4U3_4[0] = (linear_U1_4U3_4[0]  ^ U0_4[0]);
  assign linear_U0_4U1_4U3_4[1] = (linear_U1_4U3_4[1]  ^ U0_4[1]);

  assign linear_U0_4U2_4[0] = (U0_4[0] ^ U2_4[0]);
  assign linear_U0_4U2_4[1] = (U0_4[1] ^ U2_4[1]);

  //S2
  assign linear_U0_4U2_4U3_4U4_4U5_4U7_4[0] = (linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[0] ^ U1_4[0]);
  assign linear_U0_4U2_4U3_4U4_4U5_4U7_4[1] = (linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[1] ^ U1_4[1]);

  assign linear_U1_4U5_4U7_4[0] = (linear_U1_4U2_4U3_4U5_4U7_4[0] ^ linear_U2_4U3_4[0]);
  assign linear_U1_4U5_4U7_4[1] = (linear_U1_4U2_4U3_4U5_4U7_4[1] ^ linear_U2_4U3_4[1]);

  assign linear_U0_4U1_4U2_4U5_4[0] = (linear_U1_4U2_4U5_4[0] ^ U0_4[0]);
  assign linear_U0_4U1_4U2_4U5_4[1] = (linear_U1_4U2_4U5_4[1] ^ U0_4[1]);

  assign linear_U0_4U1_4U2_4U3_4U4_4U5_4[0] = (linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[0] ^ U7_4[0]);
  assign linear_U0_4U1_4U2_4U3_4U4_4U5_4[1] = (linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[1] ^ U7_4[1]); 

  //S5
  assign linear_U1_4U2_4U3_4U4_4U5_4U7_4[0] = (linear_U1_4U2_4U3_4U5_4U7_4[0] ^ U4_4[0]);
  assign linear_U1_4U2_4U3_4U4_4U5_4U7_4[1] = (linear_U1_4U2_4U3_4U5_4U7_4[1] ^ U4_4[1]);

  assign linear_U2_4U5_4U6_4U7_4[0] = (linear_U1_4U2_4U5_4U6_4U7_4[0] ^ U1_4[0]);
  assign linear_U2_4U5_4U6_4U7_4[1] = (linear_U1_4U2_4U5_4U6_4U7_4[1] ^ U1_4[1]); 

  assign linear_U0_4U3_4U5_4U6_4U7_4[0] = (linear_U0_4U5_4[0] ^ linear_U3_4U6_4U7_4[0]);
  assign linear_U0_4U3_4U5_4U6_4U7_4[1] = (linear_U0_4U5_4[1] ^ linear_U3_4U6_4U7_4[1]);
   // 5 floor 
  always @(posedge clock) begin
        //S3
        s3_0_5[0] <= t29_4[0] & linear_U0_4U2_4U4_4U6_4[0] ^ t33_4[0] & linear_U0_4U4_4[0] ^ t37_4[0] & linear_U1_4U2_4U5_4[0] ^ t40_4[0] & linear_U1_4U3_4U4_4U6_4U7_4[0] ^ random_rotate[14]; 
        s3_0_5[1] <= t29_4[0] & linear_U0_4U2_4U4_4U6_4[1] ^ t33_4[0] & linear_U0_4U4_4[1] ^ t37_4[0] & linear_U1_4U2_4U5_4[1] ^ t40_4[0] & linear_U1_4U3_4U4_4U6_4U7_4[1];
        s3_1_5[0] <= t29_4[1] & linear_U0_4U2_4U4_4U6_4[0] ^ t33_4[1] & linear_U0_4U4_4[0] ^ t37_4[1] & linear_U1_4U2_4U5_4[0] ^ t40_4[1] & linear_U1_4U3_4U4_4U6_4U7_4[0];
        s3_1_5[1] <= t29_4[1] & linear_U0_4U2_4U4_4U6_4[1] ^ t33_4[1] & linear_U0_4U4_4[1] ^ t37_4[1] & linear_U1_4U2_4U5_4[1] ^ t40_4[1] & linear_U1_4U3_4U4_4U6_4U7_4[1] ^ random_rotate[14]; 

        //S7
        s7_0_5[0] <= t29_4[0] & linear_U1_4U2_4U5_4U6_4U7_4[0] ^ t33_4[0] & linear_U3_4U4_4U5_4U6_4U7_4[0] ^ t37_4[0] & linear_U0_4U4_4U5_4U6_4[0] ^ t40_4[0] & linear_U0_4U1_4U3_4U4_4U6_4U7_4[0] ^ random_rotate[15]; 
        s7_0_5[1] <= t29_4[0] & linear_U1_4U2_4U5_4U6_4U7_4[1] ^ t33_4[0] & linear_U3_4U4_4U5_4U6_4U7_4[1] ^ t37_4[0] & linear_U0_4U4_4U5_4U6_4[1] ^ t40_4[0] & linear_U0_4U1_4U3_4U4_4U6_4U7_4[1];
        s7_1_5[0] <= t29_4[1] & linear_U1_4U2_4U5_4U6_4U7_4[0] ^ t33_4[1] & linear_U3_4U4_4U5_4U6_4U7_4[0] ^ t37_4[1] & linear_U0_4U4_4U5_4U6_4[0] ^ t40_4[1] & linear_U0_4U1_4U3_4U4_4U6_4U7_4[0];
        s7_1_5[1] <= t29_4[1] & linear_U1_4U2_4U5_4U6_4U7_4[1] ^ t33_4[1] & linear_U3_4U4_4U5_4U6_4U7_4[1] ^ t37_4[1] & linear_U0_4U4_4U5_4U6_4[1] ^ t40_4[1] & linear_U0_4U1_4U3_4U4_4U6_4U7_4[1] ^ random_rotate[15]; 

        //S0
        s0_0_5[0] <= t29_4[0] & linear_U1_4U3_4[0] ^ t33_4[0] & linear_U0_4U1_4U2_4U4_4[0] ^ t37_4[0] & linear_U0_4U1_4U3_4U7_4[0] ^ t40_4[0] & linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4[0] ^ random_rotate[16]; 
        s0_0_5[1] <= t29_4[0] & linear_U1_4U3_4[1] ^ t33_4[0] & linear_U0_4U1_4U2_4U4_4[1] ^ t37_4[0] & linear_U0_4U1_4U3_4U7_4[1] ^ t40_4[0] & linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4[1];
        s0_1_5[0] <= t29_4[1] & linear_U1_4U3_4[0] ^ t33_4[1] & linear_U0_4U1_4U2_4U4_4[0] ^ t37_4[1] & linear_U0_4U1_4U3_4U7_4[0] ^ t40_4[1] & linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4[0];
        s0_1_5[1] <= t29_4[1] & linear_U1_4U3_4[1] ^ t33_4[1] & linear_U0_4U1_4U2_4U4_4[1] ^ t37_4[1] & linear_U0_4U1_4U3_4U7_4[1] ^ t40_4[1] & linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4[1] ^ random_rotate[16];  

        //S6
        s6_0_5[0] <= t29_4[0] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[0] ^ t33_4[0] & linear_U2_4U3_4[0] ^ t37_4[0] & linear_U1_4U3_4U4_4U6_4[0] ^ t40_4[0] & linear_U0_4U1_4U3_4U4_4U6_4[0] ^ random_rotate[17];  
        s6_0_5[1] <= t29_4[0] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[1] ^ t33_4[0] & linear_U2_4U3_4[1] ^ t37_4[0] & linear_U1_4U3_4U4_4U6_4[1] ^ t40_4[0] & linear_U0_4U1_4U3_4U4_4U6_4[1]; 
        s6_1_5[0] <= t29_4[1] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[0] ^ t33_4[1] & linear_U2_4U3_4[0] ^ t37_4[1] & linear_U1_4U3_4U4_4U6_4[0] ^ t40_4[1] & linear_U0_4U1_4U3_4U4_4U6_4[0]; 
        s6_1_5[1] <= t29_4[1] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[1] ^ t33_4[1] & linear_U2_4U3_4[1] ^ t37_4[1] & linear_U1_4U3_4U4_4U6_4[1] ^ t40_4[1] & linear_U0_4U1_4U3_4U4_4U6_4[1] ^ random_rotate[17];   

        //S4
        s4_0_5[0] <= t29_4[0] & linear_U0_4U1_4U4_4U6_4U7_4[0] ^ t33_4[0] & linear_U3_4U6_4U7_4[0] ^ t37_4[0] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4[0] ^ t40_4[0] & linear_U1_4U2_4U3_4U5_4U7_4[0] ^ random_rotate[18]; 
        s4_0_5[1] <= t29_4[0] & linear_U0_4U1_4U4_4U6_4U7_4[1] ^ t33_4[0] & linear_U3_4U6_4U7_4[1] ^ t37_4[0] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4[1] ^ t40_4[0] & linear_U1_4U2_4U3_4U5_4U7_4[1];
        s4_1_5[0] <= t29_4[1] & linear_U0_4U1_4U4_4U6_4U7_4[0] ^ t33_4[1] & linear_U3_4U6_4U7_4[0] ^ t37_4[1] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4[0] ^ t40_4[1] & linear_U1_4U2_4U3_4U5_4U7_4[0];
        s4_1_5[1] <= t29_4[1] & linear_U0_4U1_4U4_4U6_4U7_4[1] ^ t33_4[1] & linear_U3_4U6_4U7_4[1] ^ t37_4[1] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4[1] ^ t40_4[1] & linear_U1_4U2_4U3_4U5_4U7_4[1] ^ random_rotate[18];   

        //S1
        s1_0_5[0] <= t29_4[0] & linear_U1_4U2_4U3_4U4_4U5_4U6_4[0] ^ t33_4[0] & linear_U1_4U2_4U3_4U6_4[0] ^ t37_4[0] & linear_U0_4U1_4U3_4[0] ^ t40_4[0] & linear_U0_4U2_4[0] ^ random_rotate[19];  
        s1_0_5[1] <= t29_4[0] & linear_U1_4U2_4U3_4U4_4U5_4U6_4[1] ^ t33_4[0] & linear_U1_4U2_4U3_4U6_4[1] ^ t37_4[0] & linear_U0_4U1_4U3_4[1] ^ t40_4[0] & linear_U0_4U2_4[1]; 
        s1_1_5[0] <= t29_4[1] & linear_U1_4U2_4U3_4U4_4U5_4U6_4[0] ^ t33_4[1] & linear_U1_4U2_4U3_4U6_4[0] ^ t37_4[1] & linear_U0_4U1_4U3_4[0] ^ t40_4[1] & linear_U0_4U2_4[0]; 
        s1_1_5[1] <= t29_4[1] & linear_U1_4U2_4U3_4U4_4U5_4U6_4[1] ^ t33_4[1] & linear_U1_4U2_4U3_4U6_4[1] ^ t37_4[1] & linear_U0_4U1_4U3_4[1] ^ t40_4[1] & linear_U0_4U2_4[1] ^ random_rotate[19];    

        //S2
        s2_0_5[0] <= t29_4[0] & linear_U0_4U2_4U3_4U4_4U5_4U7_4[0] ^ t33_4[0] & linear_U1_4U5_4U7_4[0] ^ t37_4[0] & linear_U0_4U1_4U2_4U5_4[0] ^ t40_4[0] & linear_U0_4U1_4U2_4U3_4U4_4U5_4[0] ^ random_rotate[20];  
        s2_0_5[1] <= t29_4[0] & linear_U0_4U2_4U3_4U4_4U5_4U7_4[1] ^ t33_4[0] & linear_U1_4U5_4U7_4[1] ^ t37_4[0] & linear_U0_4U1_4U2_4U5_4[1] ^ t40_4[0] & linear_U0_4U1_4U2_4U3_4U4_4U5_4[1];
        s2_1_5[0] <= t29_4[1] & linear_U0_4U2_4U3_4U4_4U5_4U7_4[0] ^ t33_4[1] & linear_U1_4U5_4U7_4[0] ^ t37_4[1] & linear_U0_4U1_4U2_4U5_4[0] ^ t40_4[1] & linear_U0_4U1_4U2_4U3_4U4_4U5_4[0];
        s2_1_5[1] <= t29_4[1] & linear_U0_4U2_4U3_4U4_4U5_4U7_4[1] ^ t33_4[1] & linear_U1_4U5_4U7_4[1] ^ t37_4[1] & linear_U0_4U1_4U2_4U5_4[1] ^ t40_4[1] & linear_U0_4U1_4U2_4U3_4U4_4U5_4[1] ^ random_rotate[20];  

        //S5
        s5_0_5[0] <= t29_4[0] & linear_U1_4U2_4U3_4U4_4U5_4U7_4[0] ^ t33_4[0] & linear_U0_4U1_4U3_4U4_4U6_4[0] ^ t37_4[0] & linear_U2_4U5_4U6_4U7_4[0] ^ t40_4[0] & linear_U0_4U3_4U5_4U6_4U7_4[0] ^ random_rotate[21];  
        s5_0_5[1] <= t29_4[0] & linear_U1_4U2_4U3_4U4_4U5_4U7_4[1] ^ t33_4[0] & linear_U0_4U1_4U3_4U4_4U6_4[1] ^ t37_4[0] & linear_U2_4U5_4U6_4U7_4[1] ^ t40_4[0] & linear_U0_4U3_4U5_4U6_4U7_4[1];
        s5_1_5[0] <= t29_4[1] & linear_U1_4U2_4U3_4U4_4U5_4U7_4[0] ^ t33_4[1] & linear_U0_4U1_4U3_4U4_4U6_4[0] ^ t37_4[1] & linear_U2_4U5_4U6_4U7_4[0] ^ t40_4[1] & linear_U0_4U3_4U5_4U6_4U7_4[0];
        s5_1_5[1] <= t29_4[1] & linear_U1_4U2_4U3_4U4_4U5_4U7_4[1] ^ t33_4[1] & linear_U0_4U1_4U3_4U4_4U6_4[1] ^ t37_4[1] & linear_U2_4U5_4U6_4U7_4[1] ^ t40_4[1] & linear_U0_4U3_4U5_4U6_4U7_4[1] ^ random_rotate[21];  
    end

  ////////////output value/////////
  assign O_share0[7] = s0_0_5[0] ^ s0_0_5[1];
  assign O_share0[6] = s1_0_5[0] ^ s1_0_5[1] ^ 1;
  assign O_share0[5] = s2_0_5[0] ^ s2_0_5[1] ^ 1;
  assign O_share0[4] = s3_0_5[0] ^ s3_0_5[1];
  assign O_share0[3] = s4_0_5[0] ^ s4_0_5[1];
  assign O_share0[2] = s5_0_5[0] ^ s5_0_5[1];
  assign O_share0[1] = s6_0_5[0] ^ s6_0_5[1] ^ 1;
  assign O_share0[0] = s7_0_5[0] ^ s7_0_5[1] ^ 1;
  
  assign O_share1[7] = s0_1_5[0] ^ s0_1_5[1];
  assign O_share1[6] = s1_1_5[0] ^ s1_1_5[1];
  assign O_share1[5] = s2_1_5[0] ^ s2_1_5[1];
  assign O_share1[4] = s3_1_5[0] ^ s3_1_5[1];
  assign O_share1[3] = s4_1_5[0] ^ s4_1_5[1];
  assign O_share1[2] = s5_1_5[0] ^ s5_1_5[1];
  assign O_share1[1] = s6_1_5[0] ^ s6_1_5[1];
  assign O_share1[0] = s7_1_5[0] ^ s7_1_5[1];


endmodule















