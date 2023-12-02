`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CPP
// Engineer: Alex Beckes
// 
// Create Date: 09/13/2023 11:00:10 PM
// Design Name: Decoder_Hierarchical With TestBench
// Module Name: Decoder_4x16
// Project Name: 
// Target Devices: Artix-7 100T
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


//module Decoder_4x16(
//    input En,
//    input [1:0] A, B,
//    output [15:0] out
//    );
//    wire [3:0] out1, out2, out3, out4;
//    wire [3:0] between;
//    Decoder_2x4 a (
//    .En(En),
//    .A(B),
//    .f(between)
//    );
//    Decoder_2x4 b (
//    .En(between[0]),
//    .A(A),
//    .f(out1)
//    );
//    Decoder_2x4 c (
//    .En(between[1]),
//    .A(A),
//    .f(out2)
//    );
//    Decoder_2x4 d (
//    .En(between[2]),
//    .A(A),
//    .f(out3)
//    );
//    Decoder_2x4 e (
//    .En(between[3]),
//    .A(A),
//    .f(out4)
//    );
////    assign out2 = out2 << 4;
////    assign out3 = out3 << 8;
////    assign out4 = out4 << 12;
//    assign out = {out4, out3, out2, out1};
////    assign out = out1 + out2 + out3 + out4;
//endmodule
module Decoder_4x16(
    input En,
    input [3:0] A,
    output [15:0] out
    );
    wire [3:0] between;
    Decoder_2x4 first (
    .En(En),
    .A(A[3:2]),
    .f(between)
    );
    genvar x;
    generate
    for(x = 0; x <= 3; x = x + 1)
    begin 
        Decoder_2x4 x (
        .En(between[x]),
        .A(A[1:0]),
        .f(out[4*x+3:4*x])
        );
    end
    endgenerate
    
endmodule