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


module sbox(clock, I_share0, I_share1, random_rotate, guard_sbox, O_share0, O_share1);
  input clock;
  input  [7:0]  I_share0,I_share1;
  input  [22:0] random_rotate;
  input  [7:0]  guard_sbox;
  output [7:0] O_share0,O_share1;

  reg [1:0] U0_0;
  reg [1:0] U1_0;
  reg [1:0] U2_0;
  reg [1:0] U3_0;
  reg [1:0] U4_0;
  reg [1:0] U5_0;
  reg [1:0] U6_0;
  reg [1:0] U7_0;

  ////////reg//////
  reg [15:0] random_1;
  reg [15:0] random_2;
  reg [7:0] random_3;  
  reg [7:0] random_4; 

  reg [7:0] guard_sbox_0;
  reg [7:0] guard_sbox_1;
  reg [7:0] guard_sbox_2;
  reg [7:0] guard_sbox_3;
  reg [7:0] guard_sbox_4;


  //t10
  wire [1:0] linear_U1_0U2_0;
  wire [1:0] linear_U4_0U6_0;
  wire [1:0] linear_U4_0U5_0;
  wire [1:0] linear_U0_0U6_0;
  wire [1:0] linear_U0_0U3_0U6_0;

  //t11
  wire [1:0] linear_U5_0U7_0;
  wire [1:0] linear_U0_0U5_0U7_0;
  wire [1:0] linear_U1_0U4_0;

  //t13
  wire [1:0] linear_U3_0U5_0;
  wire [1:0] linear_U3_0U4_0;

  //t14
  wire [1:0] linear_U0_0U4_0U5_0;
  wire [1:0] linear_U6_0U7_0;

  //t15
  wire [1:0] linear_U5_0U6_0;
  wire [1:0] linear_U2_0U4_0U7_0;

  //t16
  wire [1:0] linear_U1_0U3_0U7_0;
  wire [1:0] linear_U1_0U3_0U5_0U7_0;
  wire [1:0] linear_U1_0U2_0U5_0;


  reg [1:0] t10_0_1, t10_1_1;
  reg [1:0] t11_0_1, t11_1_1;
  reg [1:0] t12_0_1, t12_1_1;
  reg [1:0] t13_0_1, t13_1_1;
  reg [1:0] t14_0_1, t14_1_1;
  reg [1:0] t15_0_1, t15_1_1;
  reg [1:0] t16_0_1, t16_1_1;

  reg [1:0] U0_1;
  reg [1:0] U1_1;
  reg [1:0] U2_1;
  reg [1:0] U3_1;
  reg [1:0] U4_1;  
  reg [1:0] U5_1;
  reg [1:0] U6_1;
  reg [1:0] U7_1;

  //2 floor
  reg [1:0] t21_2;
  reg [1:0] t22_2;
  reg [1:0] t23_2;
  reg [1:0] t24_2;

  reg [1:0] U0_2;
  reg [1:0] U1_2;
  reg [1:0] U2_2;
  reg [1:0] U3_2;
  reg [1:0] U4_2;  
  reg [1:0] U5_2;
  reg [1:0] U6_2;
  reg [1:0] U7_2;

  //3 floor
  //t29、t33、t40
  wire [1:0] linear_t23_2t24_2;
  //t37
  wire [1:0] linear_t21_2t22_2;

  wire temp_t21_2t23_2_00, temp_t21_2t23_2_01, temp_t21_2t23_2_10, temp_t21_2t23_2_11;
  wire temp_t22_2t24_2_00, temp_t22_2t24_2_01, temp_t22_2t24_2_10, temp_t22_2t24_2_11;

  reg [1:0] t29_0_3, t29_1_3, t29_2_3, t29_3_3;
  reg [1:0] t33_0_3, t33_1_3, t33_2_3, t33_3_3;
  reg [1:0] t37_0_3, t37_1_3, t37_2_3, t37_3_3;
  reg [1:0] t40_0_3, t40_1_3, t40_2_3, t40_3_3;

  reg [1:0] U0_3;
  reg [1:0] U1_3;
  reg [1:0] U2_3;
  reg [1:0] U3_3;
  reg [1:0] U4_3;  
  reg [1:0] U5_3;
  reg [1:0] U6_3;
  reg [1:0] U7_3;

  //4 floor
  reg [1:0] t29_4;
  reg [1:0] t33_4;
  reg [1:0] t37_4;
  reg [1:0] t40_4;

  reg [1:0] U0_4;
  reg [1:0] U1_4;
  reg [1:0] U2_4;
  reg [1:0] U3_4;
  reg [1:0] U4_4;  
  reg [1:0] U5_4;
  reg [1:0] U6_4;
  reg [1:0] U7_4;

  //5 floor
  reg [1:0] s0_0_5, s0_1_5; 
  reg [1:0] s1_0_5, s1_1_5; 
  reg [1:0] s2_0_5, s2_1_5; 
  reg [1:0] s3_0_5, s3_1_5; 
  reg [1:0] s4_0_5, s4_1_5; 
  reg [1:0] s5_0_5, s5_1_5; 
  reg [1:0] s6_0_5, s6_1_5; 
  reg [1:0] s7_0_5, s7_1_5; 


  wire [1:0] linear_U4_4U6_4;
  wire [1:0] linear_U1_4U2_4;
  wire [1:0] linear_U1_4U3_4U7_4;
  wire [1:0] linear_U6_4U7_4;
  wire [1:0] linear_U0_4U5_4;
  wire [1:0] linear_U1_4U4_4;
  wire [1:0] linear_U3_4U6_4;

  //S3
  wire [1:0] linear_U0_4U2_4U4_4U6_4;
  wire [1:0] linear_U0_4U4_4;
  wire [1:0] linear_U1_4U2_4U5_4;
  wire [1:0] linear_U1_4U3_4U4_4U6_4U7_4;

  //S7
  wire [1:0] linear_U1_4U2_4U5_4U6_4U7_4;  
  wire [1:0] linear_U3_4U4_4U5_4U6_4U7_4; 
  wire [1:0] linear_U0_4U4_4U5_4U6_4;
  wire [1:0] linear_U0_4U1_4U3_4U4_4U6_4U7_4; 

  //S0
  wire [1:0] linear_U1_4U3_4;  
  wire [1:0] linear_U0_4U1_4U2_4U4_4; 
  wire [1:0] linear_U0_4U1_4U3_4U7_4;
  wire [1:0] linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4;

  //S6
  wire [1:0] linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4;
  wire [1:0] linear_U2_4U3_4;  
  wire [1:0] linear_U1_4U3_4U4_4U6_4;
  wire [1:0] linear_U0_4U1_4U3_4U4_4U6_4;//5

  //S4
  wire [1:0] linear_U0_4U1_4U4_4U6_4U7_4;
  wire [1:0] linear_U3_4U6_4U7_4;
  wire [1:0] linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4;
  wire [1:0] linear_U1_4U2_4U3_4U5_4U7_4;

  //S1
  wire [1:0] linear_U1_4U2_4U3_4U4_4U5_4U6_4; 
  wire [1:0] linear_U1_4U2_4U3_4U6_4;
  wire [1:0] linear_U0_4U1_4U3_4;
  wire [1:0] linear_U0_4U2_4;

  //S2
  wire [1:0] linear_U0_4U2_4U3_4U4_4U5_4U7_4; 
  wire [1:0] linear_U1_4U5_4U7_4; 
  wire [1:0] linear_U0_4U1_4U2_4U5_4; 
  wire [1:0] linear_U0_4U1_4U2_4U3_4U4_4U5_4;

  //S5
  wire [1:0] linear_U1_4U2_4U3_4U4_4U5_4U7_4; 
  wire [1:0] linear_U2_4U5_4U6_4U7_4;
  wire [1:0] linear_U0_4U3_4U5_4U6_4U7_4;

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

        guard_sbox_0 <= guard_sbox;
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
        t10_0_1[0] <= U0_0[0] & U6_0[0] ^ linear_U1_0U2_0[0] & linear_U4_0U6_0[0] ^ U7_0[0] & linear_U4_0U5_0[0] ^ linear_U0_0U3_0U6_0[0] ^ U7_0[0];
        t10_0_1[1] <= U0_0[0] & U6_0[1] ^ linear_U1_0U2_0[0] & linear_U4_0U6_0[1] ^ U7_0[0] & linear_U4_0U5_0[1] ^ random_rotate[0];
        t10_1_1[0] <= U0_0[1] & U6_0[0] ^ linear_U1_0U2_0[1] & linear_U4_0U6_0[0] ^ U7_0[1] & linear_U4_0U5_0[0] ^ random_rotate[0];
        t10_1_1[1] <= U0_0[1] & U6_0[1] ^ linear_U1_0U2_0[1] & linear_U4_0U6_0[1] ^ U7_0[1] & linear_U4_0U5_0[1] ^ linear_U0_0U3_0U6_0[1] ^ U7_0[1];

        t11_0_1[0] <= U1_0[0] & U7_0[0] ^ U2_0[0] & linear_U0_0U5_0U7_0[0] ^ U3_0[0] & linear_U5_0U7_0[0] ^ U4_0[0] & U0_0[0] ^ linear_U1_0U4_0[0]; 
        t11_0_1[1] <= U1_0[0] & U7_0[1] ^ U2_0[0] & linear_U0_0U5_0U7_0[1] ^ U3_0[0] & linear_U5_0U7_0[1] ^ U4_0[0] & U0_0[1] ^ random_rotate[1];
        t11_1_1[0] <= U1_0[1] & U7_0[0] ^ U2_0[1] & linear_U0_0U5_0U7_0[0] ^ U3_0[1] & linear_U5_0U7_0[0] ^ U4_0[1] & U0_0[0] ^ random_rotate[1];
        t11_1_1[1] <= U1_0[1] & U7_0[1] ^ U2_0[1] & linear_U0_0U5_0U7_0[1] ^ U3_0[1] & linear_U5_0U7_0[1] ^ U4_0[1] & U0_0[1] ^ linear_U1_0U4_0[1];

        t12_0_1[0] <= U1_0[0] & U5_0[0] ^ linear_U5_0U7_0[0];
        t12_0_1[1] <= U1_0[0] & U5_0[1] ^ random_rotate[2]; 
        t12_1_1[0] <= U1_0[1] & U5_0[0] ^ random_rotate[2];  
        t12_1_1[1] <= U1_0[1] & U5_0[1] ^ linear_U5_0U7_0[1];

        t13_0_1[0] <= U0_0[0] & linear_U3_0U5_0[0] ^ U1_0[0] & U3_0[0] ^ U6_0[0] & linear_U3_0U4_0[0] ^ U2_0[0];
        t13_0_1[1] <= U0_0[0] & linear_U3_0U5_0[1] ^ U1_0[0] & U3_0[1] ^ U6_0[0] & linear_U3_0U4_0[1] ^ random_rotate[3];
        t13_1_1[0] <= U0_0[1] & linear_U3_0U5_0[0] ^ U1_0[1] & U3_0[0] ^ U6_0[1] & linear_U3_0U4_0[0] ^ random_rotate[3];
        t13_1_1[1] <= U0_0[1] & linear_U3_0U5_0[1] ^ U1_0[1] & U3_0[1] ^ U6_0[1] & linear_U3_0U4_0[1] ^ U2_0[1];

        t14_0_1[0] <= U2_0[0] & linear_U0_0U4_0U5_0[0] ^ U3_0[0] & linear_U4_0U5_0[0] ^ linear_U6_0U7_0[0] & U5_0[0] ^ U1_0[0] ^ linear_U0_0U3_0U6_0[0];
        t14_0_1[1] <= U2_0[0] & linear_U0_0U4_0U5_0[1] ^ U3_0[0] & linear_U4_0U5_0[1] ^ linear_U6_0U7_0[0] & U5_0[1] ^ random_rotate[4];
        t14_1_1[0] <= U2_0[1] & linear_U0_0U4_0U5_0[0] ^ U3_0[1] & linear_U4_0U5_0[0] ^ linear_U6_0U7_0[1] & U5_0[0] ^ random_rotate[4];
        t14_1_1[1] <= U2_0[1] & linear_U0_0U4_0U5_0[1] ^ U3_0[1] & linear_U4_0U5_0[1] ^ linear_U6_0U7_0[1] & U5_0[1] ^ U1_0[1] ^ linear_U0_0U3_0U6_0[1];

        t15_0_1[0] <= U1_0[0] & linear_U0_0U6_0[0] ^ U2_0[0] & linear_U3_0U4_0[0] ^ U7_0[0] & linear_U5_0U6_0[0] ^ linear_U2_0U4_0U7_0[0];
        t15_0_1[1] <= U1_0[0] & linear_U0_0U6_0[1] ^ U2_0[0] & linear_U3_0U4_0[1] ^ U7_0[0] & linear_U5_0U6_0[1] ^ random_rotate[5]; 
        t15_1_1[0] <= U1_0[1] & linear_U0_0U6_0[0] ^ U2_0[1] & linear_U3_0U4_0[0] ^ U7_0[1] & linear_U5_0U6_0[0] ^ random_rotate[5]; 
        t15_1_1[1] <= U1_0[1] & linear_U0_0U6_0[1] ^ U2_0[1] & linear_U3_0U4_0[1] ^ U7_0[1] & linear_U5_0U6_0[1] ^ linear_U2_0U4_0U7_0[1];

        t16_0_1[0] <= U0_0[0] & linear_U5_0U7_0[0] ^ U2_0[0] & linear_U1_0U3_0U7_0[0] ^ U4_0[0] & linear_U1_0U3_0U5_0U7_0[0] ^ linear_U1_0U2_0U5_0[0];
        t16_0_1[1] <= U0_0[0] & linear_U5_0U7_0[1] ^ U2_0[0] & linear_U1_0U3_0U7_0[1] ^ U4_0[0] & linear_U1_0U3_0U5_0U7_0[1] ^ random_rotate[6];
        t16_1_1[0] <= U0_0[1] & linear_U5_0U7_0[0] ^ U2_0[1] & linear_U1_0U3_0U7_0[0] ^ U4_0[1] & linear_U1_0U3_0U5_0U7_0[0] ^ random_rotate[6];
        t16_1_1[1] <= U0_0[1] & linear_U5_0U7_0[1] ^ U2_0[1] & linear_U1_0U3_0U7_0[1] ^ U4_0[1] & linear_U1_0U3_0U5_0U7_0[1] ^ linear_U1_0U2_0U5_0[1];

        guard_sbox_1 <= guard_sbox_0;
        random_1 <= random_rotate[22:7];

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
        t21_2[0] <= (t10_0_1[0] ^ t10_0_1[1] ^ t11_0_1[0] ^ t11_0_1[1]);
        t21_2[1] <= (t10_1_1[0] ^ t10_1_1[1] ^ t11_1_1[0] ^ t11_1_1[1]);

        t22_2[0] <= (t11_0_1[0] ^ t11_0_1[1] ^ t12_0_1[0] ^ t12_0_1[1] ^ t13_0_1[0] ^ t13_0_1[1]);
        t22_2[1] <= (t11_1_1[0] ^ t11_1_1[1] ^ t12_1_1[0] ^ t12_1_1[1] ^ t13_1_1[0] ^ t13_1_1[1]);

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

        guard_sbox_2 <= guard_sbox_1;
        random_2 <= random_1;
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
        t29_0_3[0] <= t22_2[0] & temp_t21_2t23_2_00 ^ temp_t22_2t24_2_00 ^ t21_2[0] & linear_t23_2t24_2[0] ^ t22_2[0] ^ random_2[0];
        t29_1_3[0] <= t22_2[0] & temp_t21_2t23_2_01 ^ temp_t22_2t24_2_01 ^ t21_2[0] & linear_t23_2t24_2[1]            ^ random_2[1];
        t29_2_3[0] <= t22_2[0] & temp_t21_2t23_2_10                                                                    ^ linear_t23_2t24_2[0];
        t29_3_3[0] <= t22_2[0] & temp_t21_2t23_2_11                                                                    ^ t24_2[0];
        t29_0_3[1] <= t22_2[1] & temp_t21_2t23_2_00                                                                    ^ linear_t23_2t24_2[0];
        t29_1_3[1] <= t22_2[1] & temp_t21_2t23_2_01                                                                    ^ t24_2[0];
        t29_2_3[1] <= t22_2[1] & temp_t21_2t23_2_10 ^ temp_t22_2t24_2_10 ^ t21_2[1] & linear_t23_2t24_2[0]            ^ random_2[1];
        t29_3_3[1] <= t22_2[1] & temp_t21_2t23_2_11 ^ temp_t22_2t24_2_11 ^ t21_2[1] & linear_t23_2t24_2[1] ^ t22_2[1] ^ random_2[0];
        
        t33_0_3[0] <= t24_2[0] & temp_t21_2t23_2_00 ^ temp_t21_2t23_2_00 ^ t22_2[0] & linear_t23_2t24_2[0] ^ t24_2[0] ^ random_2[2];
        t33_1_3[0] <= t24_2[0] & temp_t21_2t23_2_01                                                                    ^ linear_t21_2t22_2[0];
        t33_2_3[0] <= t24_2[0] & temp_t21_2t23_2_10 ^ temp_t21_2t23_2_10 ^ t22_2[1] & linear_t23_2t24_2[0]            ^ random_2[3];
        t33_3_3[0] <= t24_2[0] & temp_t21_2t23_2_11                                                                    ^ t22_2[0];
        t33_0_3[1] <= t24_2[1] & temp_t21_2t23_2_00                                                                    ^ linear_t21_2t22_2[0];
        t33_1_3[1] <= t24_2[1] & temp_t21_2t23_2_01 ^ temp_t21_2t23_2_01 ^ t22_2[0] & linear_t23_2t24_2[1]            ^ random_2[3];
        t33_2_3[1] <= t24_2[1] & temp_t21_2t23_2_10                                                                    ^ t22_2[0]; 
        t33_3_3[1] <= t24_2[1] & temp_t21_2t23_2_11 ^ temp_t21_2t23_2_11 ^ t22_2[1] & linear_t23_2t24_2[1] ^ t24_2[1] ^ random_2[2];

        t37_0_3[0] <= t23_2[0] & temp_t22_2t24_2_00 ^ t23_2[0] & linear_t21_2t22_2[0] ^ linear_t23_2t24_2[0]           ^ random_2[4];
        t37_1_3[0] <= t23_2[0] & temp_t22_2t24_2_01                                                                    ^ linear_t21_2t22_2[0];
        t37_2_3[0] <= t23_2[0] & temp_t22_2t24_2_10 ^ t23_2[0] & linear_t21_2t22_2[1]                                  ^ random_2[5];
        t37_3_3[0] <= t23_2[0] & temp_t22_2t24_2_11                                                                    ^ t21_2[0]; 
        t37_0_3[1] <= t23_2[1] & temp_t22_2t24_2_00                                                                    ^ linear_t21_2t22_2[0];
        t37_1_3[1] <= t23_2[1] & temp_t22_2t24_2_01 ^ t23_2[1] & linear_t21_2t22_2[0]                                  ^ random_2[5];
        t37_2_3[1] <= t23_2[1] & temp_t22_2t24_2_10                                                                    ^ t21_2[0];
        t37_3_3[1] <= t23_2[1] & temp_t22_2t24_2_11 ^ t23_2[1] & linear_t21_2t22_2[1] ^ linear_t23_2t24_2[1]           ^ random_2[4];

        t40_0_3[0] <= t21_2[0] & temp_t22_2t24_2_00 ^ t21_2[0] & linear_t23_2t24_2[0] ^ linear_t21_2t22_2[0]           ^ random_2[6];
        t40_1_3[0] <= t21_2[0] & temp_t22_2t24_2_01 ^ t21_2[0] & linear_t23_2t24_2[1]                                  ^ random_2[7];
        t40_2_3[0] <= t21_2[0] & temp_t22_2t24_2_10                                                                    ^ linear_t23_2t24_2[0];
        t40_3_3[0] <= t21_2[0] & temp_t22_2t24_2_11                                                                    ^ t23_2[0];
        t40_0_3[1] <= t21_2[1] & temp_t22_2t24_2_00                                                                    ^ linear_t23_2t24_2[0];
        t40_1_3[1] <= t21_2[1] & temp_t22_2t24_2_01                                                                    ^ t23_2[0];
        t40_2_3[1] <= t21_2[1] & temp_t22_2t24_2_10 ^ t21_2[1] & linear_t23_2t24_2[0]                                  ^ random_2[7];
        t40_3_3[1] <= t21_2[1] & temp_t22_2t24_2_11 ^ t21_2[1] & linear_t23_2t24_2[1] ^ linear_t21_2t22_2[1]           ^ random_2[6];

        random_3 <= random_2[15:8];
        guard_sbox_3 <= guard_sbox_2;

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

        guard_sbox_4 <= guard_sbox_3;
        random_4 <= random_3;
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
        s3_0_5[0] <= t29_4[0] & linear_U0_4U2_4U4_4U6_4[0] ^ t33_4[0] & linear_U0_4U4_4[0] ^ t37_4[0] & linear_U1_4U2_4U5_4[0] ^ t40_4[0] & linear_U1_4U3_4U4_4U6_4U7_4[0] ^ guard_sbox_4[0]; 
        s3_0_5[1] <= t29_4[0] & linear_U0_4U2_4U4_4U6_4[1] ^ t33_4[0] & linear_U0_4U4_4[1] ^ t37_4[0] & linear_U1_4U2_4U5_4[1] ^ t40_4[0] & linear_U1_4U3_4U4_4U6_4U7_4[1] ^ random_4[0];
        s3_1_5[0] <= t29_4[1] & linear_U0_4U2_4U4_4U6_4[0] ^ t33_4[1] & linear_U0_4U4_4[0] ^ t37_4[1] & linear_U1_4U2_4U5_4[0] ^ t40_4[1] & linear_U1_4U3_4U4_4U6_4U7_4[0] ^ guard_sbox_4[0];
        s3_1_5[1] <= t29_4[1] & linear_U0_4U2_4U4_4U6_4[1] ^ t33_4[1] & linear_U0_4U4_4[1] ^ t37_4[1] & linear_U1_4U2_4U5_4[1] ^ t40_4[1] & linear_U1_4U3_4U4_4U6_4U7_4[1] ^ random_4[0]; 

        //S7
        s7_0_5[0] <= t29_4[0] & linear_U1_4U2_4U5_4U6_4U7_4[0] ^ t33_4[0] & linear_U3_4U4_4U5_4U6_4U7_4[0] ^ t37_4[0] & linear_U0_4U4_4U5_4U6_4[0] ^ t40_4[0] & linear_U0_4U1_4U3_4U4_4U6_4U7_4[0] ^ guard_sbox_4[1]; 
        s7_0_5[1] <= t29_4[0] & linear_U1_4U2_4U5_4U6_4U7_4[1] ^ t33_4[0] & linear_U3_4U4_4U5_4U6_4U7_4[1] ^ t37_4[0] & linear_U0_4U4_4U5_4U6_4[1] ^ t40_4[0] & linear_U0_4U1_4U3_4U4_4U6_4U7_4[1] ^ random_4[1];
        s7_1_5[0] <= t29_4[1] & linear_U1_4U2_4U5_4U6_4U7_4[0] ^ t33_4[1] & linear_U3_4U4_4U5_4U6_4U7_4[0] ^ t37_4[1] & linear_U0_4U4_4U5_4U6_4[0] ^ t40_4[1] & linear_U0_4U1_4U3_4U4_4U6_4U7_4[0] ^ guard_sbox_4[1];
        s7_1_5[1] <= t29_4[1] & linear_U1_4U2_4U5_4U6_4U7_4[1] ^ t33_4[1] & linear_U3_4U4_4U5_4U6_4U7_4[1] ^ t37_4[1] & linear_U0_4U4_4U5_4U6_4[1] ^ t40_4[1] & linear_U0_4U1_4U3_4U4_4U6_4U7_4[1] ^ random_4[1]; 

        //S0
        s0_0_5[0] <= t29_4[0] & linear_U1_4U3_4[0] ^ t33_4[0] & linear_U0_4U1_4U2_4U4_4[0] ^ t37_4[0] & linear_U0_4U1_4U3_4U7_4[0] ^ t40_4[0] & linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4[0] ^ guard_sbox_4[2]; 
        s0_0_5[1] <= t29_4[0] & linear_U1_4U3_4[1] ^ t33_4[0] & linear_U0_4U1_4U2_4U4_4[1] ^ t37_4[0] & linear_U0_4U1_4U3_4U7_4[1] ^ t40_4[0] & linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4[1] ^ random_4[2];
        s0_1_5[0] <= t29_4[1] & linear_U1_4U3_4[0] ^ t33_4[1] & linear_U0_4U1_4U2_4U4_4[0] ^ t37_4[1] & linear_U0_4U1_4U3_4U7_4[0] ^ t40_4[1] & linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4[0] ^ guard_sbox_4[2];
        s0_1_5[1] <= t29_4[1] & linear_U1_4U3_4[1] ^ t33_4[1] & linear_U0_4U1_4U2_4U4_4[1] ^ t37_4[1] & linear_U0_4U1_4U3_4U7_4[1] ^ t40_4[1] & linear_U0_4U1_4U2_4U4_4U5_4U6_4U7_4[1] ^ random_4[2];  

        //S6
        s6_0_5[0] <= t29_4[0] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[0] ^ t33_4[0] & linear_U2_4U3_4[0] ^ t37_4[0] & linear_U1_4U3_4U4_4U6_4[0] ^ t40_4[0] & linear_U0_4U1_4U3_4U4_4U6_4[0] ^ guard_sbox_4[3];  
        s6_0_5[1] <= t29_4[0] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[1] ^ t33_4[0] & linear_U2_4U3_4[1] ^ t37_4[0] & linear_U1_4U3_4U4_4U6_4[1] ^ t40_4[0] & linear_U0_4U1_4U3_4U4_4U6_4[1] ^ random_4[3]; 
        s6_1_5[0] <= t29_4[1] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[0] ^ t33_4[1] & linear_U2_4U3_4[0] ^ t37_4[1] & linear_U1_4U3_4U4_4U6_4[0] ^ t40_4[1] & linear_U0_4U1_4U3_4U4_4U6_4[0] ^ guard_sbox_4[3]; 
        s6_1_5[1] <= t29_4[1] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U7_4[1] ^ t33_4[1] & linear_U2_4U3_4[1] ^ t37_4[1] & linear_U1_4U3_4U4_4U6_4[1] ^ t40_4[1] & linear_U0_4U1_4U3_4U4_4U6_4[1] ^ random_4[3];   

        //S4
        s4_0_5[0] <= t29_4[0] & linear_U0_4U1_4U4_4U6_4U7_4[0] ^ t33_4[0] & linear_U3_4U6_4U7_4[0] ^ t37_4[0] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4[0] ^ t40_4[0] & linear_U1_4U2_4U3_4U5_4U7_4[0] ^ guard_sbox_4[4]; 
        s4_0_5[1] <= t29_4[0] & linear_U0_4U1_4U4_4U6_4U7_4[1] ^ t33_4[0] & linear_U3_4U6_4U7_4[1] ^ t37_4[0] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4[1] ^ t40_4[0] & linear_U1_4U2_4U3_4U5_4U7_4[1] ^ random_4[4];
        s4_1_5[0] <= t29_4[1] & linear_U0_4U1_4U4_4U6_4U7_4[0] ^ t33_4[1] & linear_U3_4U6_4U7_4[0] ^ t37_4[1] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4[0] ^ t40_4[1] & linear_U1_4U2_4U3_4U5_4U7_4[0] ^ guard_sbox_4[4];
        s4_1_5[1] <= t29_4[1] & linear_U0_4U1_4U4_4U6_4U7_4[1] ^ t33_4[1] & linear_U3_4U6_4U7_4[1] ^ t37_4[1] & linear_U0_4U1_4U2_4U3_4U4_4U5_4U6_4[1] ^ t40_4[1] & linear_U1_4U2_4U3_4U5_4U7_4[1] ^ random_4[4];   

        //S1
        s1_0_5[0] <= t29_4[0] & linear_U1_4U2_4U3_4U4_4U5_4U6_4[0] ^ t33_4[0] & linear_U1_4U2_4U3_4U6_4[0] ^ t37_4[0] & linear_U0_4U1_4U3_4[0] ^ t40_4[0] & linear_U0_4U2_4[0] ^ guard_sbox_4[5];  
        s1_0_5[1] <= t29_4[0] & linear_U1_4U2_4U3_4U4_4U5_4U6_4[1] ^ t33_4[0] & linear_U1_4U2_4U3_4U6_4[1] ^ t37_4[0] & linear_U0_4U1_4U3_4[1] ^ t40_4[0] & linear_U0_4U2_4[1] ^ random_4[5]; 
        s1_1_5[0] <= t29_4[1] & linear_U1_4U2_4U3_4U4_4U5_4U6_4[0] ^ t33_4[1] & linear_U1_4U2_4U3_4U6_4[0] ^ t37_4[1] & linear_U0_4U1_4U3_4[0] ^ t40_4[1] & linear_U0_4U2_4[0] ^ guard_sbox_4[5]; 
        s1_1_5[1] <= t29_4[1] & linear_U1_4U2_4U3_4U4_4U5_4U6_4[1] ^ t33_4[1] & linear_U1_4U2_4U3_4U6_4[1] ^ t37_4[1] & linear_U0_4U1_4U3_4[1] ^ t40_4[1] & linear_U0_4U2_4[1] ^ random_4[5];    

        //S2
        s2_0_5[0] <= t29_4[0] & linear_U0_4U2_4U3_4U4_4U5_4U7_4[0] ^ t33_4[0] & linear_U1_4U5_4U7_4[0] ^ t37_4[0] & linear_U0_4U1_4U2_4U5_4[0] ^ t40_4[0] & linear_U0_4U1_4U2_4U3_4U4_4U5_4[0] ^ guard_sbox_4[6];  
        s2_0_5[1] <= t29_4[0] & linear_U0_4U2_4U3_4U4_4U5_4U7_4[1] ^ t33_4[0] & linear_U1_4U5_4U7_4[1] ^ t37_4[0] & linear_U0_4U1_4U2_4U5_4[1] ^ t40_4[0] & linear_U0_4U1_4U2_4U3_4U4_4U5_4[1] ^ random_4[6];
        s2_1_5[0] <= t29_4[1] & linear_U0_4U2_4U3_4U4_4U5_4U7_4[0] ^ t33_4[1] & linear_U1_4U5_4U7_4[0] ^ t37_4[1] & linear_U0_4U1_4U2_4U5_4[0] ^ t40_4[1] & linear_U0_4U1_4U2_4U3_4U4_4U5_4[0] ^ guard_sbox_4[6];
        s2_1_5[1] <= t29_4[1] & linear_U0_4U2_4U3_4U4_4U5_4U7_4[1] ^ t33_4[1] & linear_U1_4U5_4U7_4[1] ^ t37_4[1] & linear_U0_4U1_4U2_4U5_4[1] ^ t40_4[1] & linear_U0_4U1_4U2_4U3_4U4_4U5_4[1] ^ random_4[6];  

        //S5
        s5_0_5[0] <= t29_4[0] & linear_U1_4U2_4U3_4U4_4U5_4U7_4[0] ^ t33_4[0] & linear_U0_4U1_4U3_4U4_4U6_4[0] ^ t37_4[0] & linear_U2_4U5_4U6_4U7_4[0] ^ t40_4[0] & linear_U0_4U3_4U5_4U6_4U7_4[0] ^ guard_sbox_4[7];  
        s5_0_5[1] <= t29_4[0] & linear_U1_4U2_4U3_4U4_4U5_4U7_4[1] ^ t33_4[0] & linear_U0_4U1_4U3_4U4_4U6_4[1] ^ t37_4[0] & linear_U2_4U5_4U6_4U7_4[1] ^ t40_4[0] & linear_U0_4U3_4U5_4U6_4U7_4[1] ^ random_4[7];
        s5_1_5[0] <= t29_4[1] & linear_U1_4U2_4U3_4U4_4U5_4U7_4[0] ^ t33_4[1] & linear_U0_4U1_4U3_4U4_4U6_4[0] ^ t37_4[1] & linear_U2_4U5_4U6_4U7_4[0] ^ t40_4[1] & linear_U0_4U3_4U5_4U6_4U7_4[0] ^ guard_sbox_4[7];
        s5_1_5[1] <= t29_4[1] & linear_U1_4U2_4U3_4U4_4U5_4U7_4[1] ^ t33_4[1] & linear_U0_4U1_4U3_4U4_4U6_4[1] ^ t37_4[1] & linear_U2_4U5_4U6_4U7_4[1] ^ t40_4[1] & linear_U0_4U3_4U5_4U6_4U7_4[1] ^ random_4[7];  
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













