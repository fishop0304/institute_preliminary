/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : S-2021.06-SP2
// Date      : Wed Mar 30 18:47:36 2022
/////////////////////////////////////////////////////////////


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XL U2 ( .A(A[8]), .B(n2), .Y(SUM[8]) );
  XOR2XL U3 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U4 ( .A(A[9]), .B(n3), .Y(SUM[9]) );
  XOR2X1 U5 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  NAND2X1 U6 ( .A(A[8]), .B(n2), .Y(n3) );
  AND2X2 U7 ( .A(A[7]), .B(carry[7]), .Y(n2) );
endmodule


module JAM_DW01_add_1 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n9, n1, n2, n3, n4, n6, n7, n8;
  wire   [9:1] carry;

  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX4 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_1 ( .A(A[1]), .B(B[1]), .CI(n6), .CO(carry[2]), .S(SUM[1]) );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  CLKINVX1 U1 ( .A(A[8]), .Y(n1) );
  CLKBUFX3 U2 ( .A(n9), .Y(SUM[0]) );
  NAND2X4 U3 ( .A(n3), .B(n4), .Y(SUM[8]) );
  NAND2X2 U4 ( .A(A[8]), .B(n2), .Y(n3) );
  NAND2X4 U5 ( .A(n1), .B(n7), .Y(n4) );
  CLKINVX4 U6 ( .A(n7), .Y(n2) );
  CLKAND2X12 U7 ( .A(A[7]), .B(carry[7]), .Y(n7) );
  CLKAND2X12 U8 ( .A(B[0]), .B(A[0]), .Y(n6) );
  XOR2X1 U9 ( .A(B[0]), .B(A[0]), .Y(n9) );
  XNOR2X1 U10 ( .A(A[9]), .B(n8), .Y(SUM[9]) );
  NAND2X1 U11 ( .A(A[8]), .B(n7), .Y(n8) );
  XOR2X1 U12 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N111, N112, N113, N115, N116, N117, N118, N119, N120, N121, N122,
         n718, n719, n720, n721, n722, n723, n724, n725, n726, n727, n728,
         n729, n730, \seq[0][2] , \seq[0][1] , \seq[0][0] , \seq[1][2] ,
         \seq[1][1] , \seq[1][0] , \seq[2][2] , \seq[2][1] , \seq[2][0] ,
         \seq[3][2] , \seq[3][1] , \seq[3][0] , \seq[4][2] , \seq[4][1] ,
         \seq[4][0] , \seq[5][2] , \seq[5][1] , \seq[5][0] , \seq[6][2] ,
         \seq[6][1] , \seq[6][0] , \seq[7][2] , \seq[7][1] , \seq[7][0] ,
         \seq_1[0][2] , \seq_1[0][1] , \seq_1[0][0] , \seq_1[1][2] ,
         \seq_1[1][1] , \seq_1[1][0] , \seq_1[2][2] , \seq_1[2][1] ,
         \seq_1[2][0] , \seq_1[3][2] , \seq_1[3][1] , \seq_1[3][0] ,
         \seq_1[4][2] , \seq_1[4][1] , \seq_1[4][0] , \seq_1[5][2] ,
         \seq_1[5][1] , \seq_1[5][0] , \seq_1[6][2] , \seq_1[6][1] ,
         \seq_1[6][0] , \seq_1[7][2] , \seq_1[7][1] , \seq_1[7][0] , N176,
         N177, N178, N179, N180, N181, N182, N183, N184, N185, N186, N187,
         N188, N189, N190, N191, N192, N193, N194, N195, N206, N218, N227,
         N228, N229, N230, N231, N232, N233, N234, N235, N236, N264, N265,
         N266, N267, N284, N285, N286, N380, N381, N382, N383, N384, N385,
         N474, N475, N476, N477, N478, N479, n74, n75, n77, n79, n80, n81, n82,
         n86, n87, n89, n90, n92, n94, n95, n96, n98, n99, n100, n102, n103,
         n105, n109, n112, n118, n121, n122, n123, n129, n130, n135, n138,
         n140, n145, n146, n148, n149, n153, n154, n155, n158, n159, n161,
         n162, n165, n166, n168, n169, n171, n173, n174, n177, n179, n180,
         n181, n182, n184, n185, n187, n188, n190, n192, n193, n195, n196,
         n197, n199, n201, n202, n203, n204, n205, n206, n207, n209, n211,
         n212, n213, n215, n216, n217, n218, n219, n220, n221, n223, n225,
         n226, n227, n228, n229, n231, n232, n233, n234, n235, n236, n238,
         n239, n240, n241, n243, n244, n245, n246, n248, n249, n250, n251,
         n252, n253, n254, n257, n258, n260, n261, n263, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n277, n279, n280,
         n281, n282, n284, n285, n287, n288, n289, n292, n293, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n309,
         n311, n312, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n378,
         n379, n380, n381, n382, n383, n387, n388, n391, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
         n684, n685, n686, n687, n688, n689, n690, n691, n692, n693, n694,
         n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, n705,
         n706, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716,
         n717;
  wire   [2:0] ns;
  wire   [9:0] tmp;

  OAI31X2 U252 ( .A0(n277), .A1(n656), .A2(n689), .B0(n546), .Y(n155) );
  JAM_DW01_add_0 add_76 ( .A(tmp), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(1'b0), 
        .SUM({N236, N235, N234, N233, N232, N231, N230, N229, N228, N227}) );
  JAM_DW01_add_1 r459 ( .A(tmp), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(1'b0), 
        .SUM({N185, N184, N183, N182, N181, N180, N179, N178, N177, N176}) );
  DFFSX1 \data_reg[0]  ( .D(n429), .CK(CLK), .SN(n542), .QN(n396) );
  DFFRX2 \count__reg[2]  ( .D(n422), .CK(CLK), .RN(n538), .Q(N119), .QN(n391)
         );
  DFFSX1 \data_reg[1]  ( .D(n397), .CK(CLK), .SN(n542), .QN(n395) );
  DFFRX2 \count__reg[0]  ( .D(n428), .CK(CLK), .RN(n537), .Q(N117), .QN(n393)
         );
  DFFRX1 \count_reg[2]  ( .D(n374), .CK(CLK), .RN(n537), .Q(N122), .QN(n388)
         );
  DFFRX1 \count_reg[0]  ( .D(n365), .CK(CLK), .RN(n539), .Q(N120), .QN(n619)
         );
  DFFRX1 \count_reg[1]  ( .D(n375), .CK(CLK), .RN(n537), .Q(N121), .QN(n621)
         );
  DFFSX1 \seq_1_reg[6][1]  ( .D(n359), .CK(CLK), .SN(n540), .Q(\seq_1[6][1] ), 
        .QN(n340) );
  DFFSX1 \seq_1_reg[7][1]  ( .D(n370), .CK(CLK), .SN(n541), .Q(\seq_1[7][1] ), 
        .QN(n330) );
  DFFSX1 \seq_1_reg[7][0]  ( .D(n368), .CK(CLK), .SN(n541), .Q(\seq_1[7][0] ), 
        .QN(n332) );
  DFFRX1 \seq_1_reg[6][0]  ( .D(n354), .CK(CLK), .RN(n539), .Q(\seq_1[6][0] ), 
        .QN(n345) );
  DFFSX1 \seq_1_reg[6][2]  ( .D(n364), .CK(CLK), .SN(n541), .Q(\seq_1[6][2] ), 
        .QN(n335) );
  DFFSX1 \seq_1_reg[7][2]  ( .D(n373), .CK(CLK), .SN(n541), .Q(\seq_1[7][2] ), 
        .QN(n327) );
  DFFRX1 \seq_1_reg[2][2]  ( .D(n360), .CK(CLK), .RN(n539), .Q(\seq_1[2][2] ), 
        .QN(n339) );
  DFFRX1 \seq_1_reg[3][2]  ( .D(n362), .CK(CLK), .RN(n539), .Q(\seq_1[3][2] ), 
        .QN(n337) );
  DFFSX1 \seq_1_reg[5][0]  ( .D(n353), .CK(CLK), .SN(n540), .Q(\seq_1[5][0] ), 
        .QN(n346) );
  DFFRX1 \seq_1_reg[5][1]  ( .D(n358), .CK(CLK), .RN(n539), .Q(\seq_1[5][1] ), 
        .QN(n341) );
  DFFSX1 \seq_1_reg[5][2]  ( .D(n363), .CK(CLK), .SN(n541), .Q(\seq_1[5][2] ), 
        .QN(n336) );
  DFFRX1 \seq_1_reg[4][1]  ( .D(n356), .CK(CLK), .RN(n539), .Q(\seq_1[4][1] ), 
        .QN(n343) );
  DFFRX1 \seq_1_reg[4][0]  ( .D(n351), .CK(CLK), .RN(n540), .Q(\seq_1[4][0] ), 
        .QN(n348) );
  DFFSX1 \seq_1_reg[4][2]  ( .D(n361), .CK(CLK), .SN(n541), .Q(\seq_1[4][2] ), 
        .QN(n338) );
  DFFRX1 \seq_1_reg[1][2]  ( .D(n372), .CK(CLK), .RN(n538), .Q(\seq_1[1][2] ), 
        .QN(n328) );
  DFFRX1 \seq_1_reg[0][2]  ( .D(n371), .CK(CLK), .RN(n538), .Q(\seq_1[0][2] ), 
        .QN(n329) );
  DFFSX1 \seq_reg[1][0]  ( .D(n401), .CK(CLK), .SN(n541), .Q(\seq[1][0] ), 
        .QN(n477) );
  DFFSX1 \seq_reg[5][2]  ( .D(n411), .CK(CLK), .SN(n541), .Q(\seq[5][2] ), 
        .QN(n708) );
  DFFSX1 \seq_reg[5][0]  ( .D(n413), .CK(CLK), .SN(n540), .Q(\seq[5][0] ), 
        .QN(n715) );
  DFFSX1 \seq_reg[7][2]  ( .D(n419), .CK(CLK), .SN(n541), .Q(\seq[7][2] ), 
        .QN(n475) );
  DFFSX1 \seq_reg[7][1]  ( .D(n420), .CK(CLK), .SN(n541), .Q(\seq[7][1] ), 
        .QN(n472) );
  DFFSX1 \seq_reg[7][0]  ( .D(n421), .CK(CLK), .SN(n541), .Q(\seq[7][0] ), 
        .QN(n481) );
  DFFSX1 \seq_1_reg[2][1]  ( .D(n355), .CK(CLK), .SN(n540), .Q(\seq_1[2][1] ), 
        .QN(n344) );
  DFFSX1 \seq_1_reg[3][1]  ( .D(n357), .CK(CLK), .SN(n540), .Q(\seq_1[3][1] ), 
        .QN(n342) );
  DFFSX1 \seq_1_reg[3][0]  ( .D(n352), .CK(CLK), .SN(n540), .Q(\seq_1[3][0] ), 
        .QN(n347) );
  DFFRX1 \seq_1_reg[2][0]  ( .D(n350), .CK(CLK), .RN(n540), .Q(\seq_1[2][0] ), 
        .QN(n349) );
  DFFSX1 \seq_1_reg[1][0]  ( .D(n367), .CK(CLK), .SN(n541), .Q(\seq_1[1][0] ), 
        .QN(n333) );
  DFFRX1 \seq_1_reg[1][1]  ( .D(n369), .CK(CLK), .RN(n538), .Q(\seq_1[1][1] ), 
        .QN(n331) );
  DFFRX1 \seq_1_reg[0][1]  ( .D(n376), .CK(CLK), .RN(n537), .Q(\seq_1[0][1] ), 
        .QN(n326) );
  DFFRX1 \seq_1_reg[0][0]  ( .D(n366), .CK(CLK), .RN(n538), .Q(\seq_1[0][0] ), 
        .QN(n334) );
  DFFRX1 \count__reg[1]  ( .D(n423), .CK(CLK), .RN(n538), .Q(N118), .QN(n602)
         );
  DFFSX1 \seq_reg[2][1]  ( .D(n403), .CK(CLK), .SN(n540), .Q(\seq[2][1] ), 
        .QN(n713) );
  DFFSX1 \seq_reg[4][2]  ( .D(n408), .CK(CLK), .SN(n541), .Q(\seq[4][2] ), 
        .QN(n479) );
  DFFSX1 \MinCost_reg[8]  ( .D(n437), .CK(CLK), .SN(n542), .Q(n723), .QN(n318)
         );
  DFFSX1 \MinCost_reg[4]  ( .D(n433), .CK(CLK), .SN(n542), .Q(n725), .QN(n322)
         );
  DFFSX1 \MinCost_reg[1]  ( .D(n430), .CK(CLK), .SN(n651), .Q(n728), .QN(n325)
         );
  DFFSX1 \MinCost_reg[0]  ( .D(n438), .CK(CLK), .SN(n542), .Q(n729), .QN(n317)
         );
  DFFSX1 \MinCost_reg[7]  ( .D(n436), .CK(CLK), .SN(n542), .QN(n319) );
  DFFSX1 \MinCost_reg[6]  ( .D(n435), .CK(CLK), .SN(n542), .QN(n320) );
  DFFSX1 \MinCost_reg[2]  ( .D(n431), .CK(CLK), .SN(n542), .Q(n727), .QN(n324)
         );
  DFFRX2 \MatchCount_reg[2]  ( .D(n440), .CK(CLK), .RN(n537), .QN(n381) );
  DFFRX2 \MatchCount_reg[3]  ( .D(n439), .CK(CLK), .RN(n537), .Q(n720), .QN(
        n316) );
  DFFRX2 \h_reg[2]  ( .D(N266), .CK(CLK), .RN(n536), .Q(n474), .QN(N116) );
  DFFRX2 \h_reg[1]  ( .D(N265), .CK(CLK), .RN(n536), .Q(n480), .QN(N115) );
  DFFSX1 \MinCost_reg[5]  ( .D(n434), .CK(CLK), .SN(n542), .Q(n724), .QN(n321)
         );
  DFFSX1 \MinCost_reg[9]  ( .D(n443), .CK(CLK), .SN(n651), .QN(n315) );
  DFFSX1 \MinCost_reg[3]  ( .D(n432), .CK(CLK), .SN(n542), .Q(n726), .QN(n323)
         );
  DFFRX1 \h_reg[3]  ( .D(N267), .CK(CLK), .RN(n651), .Q(n654), .QN(n387) );
  DFFSX1 \seq_reg[3][0]  ( .D(n407), .CK(CLK), .SN(n651), .Q(\seq[3][0] ), 
        .QN(n716) );
  DFFSX1 \seq_reg[6][2]  ( .D(n414), .CK(CLK), .SN(n541), .Q(\seq[6][2] ), 
        .QN(n707) );
  DFFSX1 \seq_reg[6][1]  ( .D(n415), .CK(CLK), .SN(n540), .Q(\seq[6][1] ), 
        .QN(n710) );
  DFFSXL \data_reg[2]  ( .D(n398), .CK(CLK), .SN(n651), .Q(n700), .QN(n394) );
  DFFRX1 \seq_reg[6][0]  ( .D(n416), .CK(CLK), .RN(n651), .Q(\seq[6][0] ), 
        .QN(n714) );
  DFFRX1 \seq_reg[2][0]  ( .D(n404), .CK(CLK), .RN(n651), .Q(\seq[2][0] ), 
        .QN(n518) );
  DFFRX1 \seq_reg[5][1]  ( .D(n412), .CK(CLK), .RN(n651), .Q(\seq[5][1] ), 
        .QN(n711) );
  DFFRX1 \tmp_reg[8]  ( .D(N194), .CK(CLK), .RN(n651), .Q(tmp[8]) );
  DFFRXL \tmp_reg[1]  ( .D(N187), .CK(CLK), .RN(n651), .Q(tmp[1]) );
  DFFRXL \tmp_reg[2]  ( .D(N188), .CK(CLK), .RN(n651), .Q(tmp[2]) );
  DFFRXL \tmp_reg[3]  ( .D(N189), .CK(CLK), .RN(n651), .Q(tmp[3]) );
  DFFRXL \tmp_reg[4]  ( .D(N190), .CK(CLK), .RN(n651), .Q(tmp[4]) );
  DFFRXL \tmp_reg[5]  ( .D(N191), .CK(CLK), .RN(n651), .Q(tmp[5]) );
  DFFRXL \tmp_reg[6]  ( .D(N192), .CK(CLK), .RN(n651), .Q(tmp[6]) );
  DFFRXL \tmp_reg[9]  ( .D(N195), .CK(CLK), .RN(n651), .Q(tmp[9]) );
  DFFSX4 \x_reg[2]  ( .D(n424), .CK(CLK), .SN(n651), .Q(N113), .QN(n566) );
  DFFSX2 \x_reg[1]  ( .D(n425), .CK(CLK), .SN(n651), .Q(N112), .QN(n521) );
  DFFRX1 \seq_reg[4][1]  ( .D(n409), .CK(CLK), .RN(n651), .Q(\seq[4][1] ), 
        .QN(n712) );
  DFFSX2 \x_reg[0]  ( .D(n426), .CK(CLK), .SN(n651), .Q(N111), .QN(n567) );
  DFFRX1 \seq_reg[1][1]  ( .D(n400), .CK(CLK), .RN(n651), .Q(\seq[1][1] ), 
        .QN(n704) );
  DFFRX2 \h_reg[0]  ( .D(N264), .CK(CLK), .RN(n651), .Q(n719), .QN(N264) );
  DFFRX2 \seq_reg[3][2]  ( .D(n405), .CK(CLK), .RN(n651), .Q(\seq[3][2] ), 
        .QN(n520) );
  DFFRX1 \seq_reg[4][0]  ( .D(n410), .CK(CLK), .RN(n651), .Q(\seq[4][0] ), 
        .QN(n717) );
  DFFRX1 \seq_reg[2][2]  ( .D(n402), .CK(CLK), .RN(n651), .Q(\seq[2][2] ), 
        .QN(n709) );
  DFFRX1 \seq_reg[0][1]  ( .D(n427), .CK(CLK), .RN(n651), .Q(\seq[0][1] ), 
        .QN(n678) );
  DFFRX1 \seq_reg[1][2]  ( .D(n399), .CK(CLK), .RN(n651), .Q(\seq[1][2] ), 
        .QN(n702) );
  DFFRX1 \seq_reg[0][0]  ( .D(n418), .CK(CLK), .RN(n651), .Q(\seq[0][0] ), 
        .QN(n705) );
  DFFRX1 \seq_reg[0][2]  ( .D(n417), .CK(CLK), .RN(n651), .Q(\seq[0][2] ), 
        .QN(n703) );
  DFFSX1 \seq_reg[3][1]  ( .D(n406), .CK(CLK), .SN(n651), .Q(\seq[3][1] ), 
        .QN(n519) );
  DFFRX1 \MatchCount_reg[1]  ( .D(n442), .CK(CLK), .RN(n537), .Q(n721), .QN(
        n382) );
  DFFRX2 \cs_reg[0]  ( .D(ns[0]), .CK(CLK), .RN(n537), .Q(n478), .QN(n380) );
  DFFRX2 \cs_reg[1]  ( .D(ns[1]), .CK(CLK), .RN(n538), .QN(n379) );
  DFFRX1 \tmp_reg[7]  ( .D(N193), .CK(CLK), .RN(n651), .Q(tmp[7]) );
  DFFRX1 \tmp_reg[0]  ( .D(N186), .CK(CLK), .RN(n651), .Q(tmp[0]) );
  DFFRX1 \cs_reg[2]  ( .D(ns[2]), .CK(CLK), .RN(n538), .Q(n471), .QN(n378) );
  DFFRX1 \MatchCount_reg[0]  ( .D(n441), .CK(CLK), .RN(n537), .Q(n722), .QN(
        n383) );
  AOI32X1 U368 ( .A0(n635), .A1(n634), .A2(n473), .B0(n723), .B1(n647), .Y(
        n636) );
  OR2X2 U369 ( .A(n647), .B(MinCost[8]), .Y(n473) );
  CLKAND2X12 U370 ( .A(n497), .B(n295), .Y(n293) );
  AOI222X1 U371 ( .A0(MinCost[5]), .A1(n646), .B0(MinCost[4]), .B1(n645), .C0(
        n629), .C1(n628), .Y(n633) );
  OAI221XL U372 ( .A0(N178), .A1(n643), .B0(N179), .B1(n323), .C0(n627), .Y(
        n628) );
  OR4X2 U373 ( .A(n299), .B(n300), .C(n301), .D(n302), .Y(n730) );
  NOR4X4 U374 ( .A(n642), .B(n641), .C(n640), .D(n639), .Y(N206) );
  INVX1 U375 ( .A(n473), .Y(n496) );
  NOR2X1 U376 ( .A(n689), .B(n699), .Y(n135) );
  CLKINVX1 U377 ( .A(n727), .Y(n643) );
  OAI211X1 U378 ( .A0(n684), .A1(n660), .B0(n192), .C0(n252), .Y(n241) );
  OAI211X1 U379 ( .A0(n174), .A1(n103), .B0(n192), .C0(n207), .Y(n196) );
  NOR3X2 U380 ( .A(n380), .B(n378), .C(n699), .Y(n244) );
  OAI211X1 U381 ( .A0(n694), .A1(n687), .B0(n192), .C0(n238), .Y(n226) );
  CLKBUFX3 U382 ( .A(n543), .Y(n548) );
  NOR2X1 U383 ( .A(n471), .B(n380), .Y(n138) );
  AND2X2 U384 ( .A(n652), .B(N218), .Y(n476) );
  NOR2X1 U385 ( .A(n521), .B(n567), .Y(n90) );
  NOR3XL U386 ( .A(\seq[3][0] ), .B(\seq[4][2] ), .C(\seq[3][1] ), .Y(n305) );
  NOR2X2 U387 ( .A(J[1]), .B(N264), .Y(n581) );
  NAND4XL U388 ( .A(\seq[0][0] ), .B(\seq[1][1] ), .C(\seq[2][0] ), .D(n303), 
        .Y(n302) );
  NOR2X2 U389 ( .A(n521), .B(N111), .Y(n563) );
  NAND4XL U390 ( .A(\seq[5][1] ), .B(\seq[4][1] ), .C(\seq[0][1] ), .D(n304), 
        .Y(n301) );
  NOR2XL U391 ( .A(N111), .B(n521), .Y(n254) );
  INVX6 U392 ( .A(RST), .Y(n651) );
  INVX6 U393 ( .A(n297), .Y(n649) );
  NOR2X1 U394 ( .A(n640), .B(n639), .Y(n629) );
  NOR2X4 U395 ( .A(n645), .B(n725), .Y(n639) );
  AO21X4 U396 ( .A0(n644), .A1(n626), .B0(n728), .Y(n625) );
  NOR2BX1 U397 ( .AN(n729), .B(N176), .Y(n626) );
  NOR2X1 U398 ( .A(n646), .B(MinCost[5]), .Y(n631) );
  INVX4 U399 ( .A(N184), .Y(n647) );
  NOR2BX2 U400 ( .AN(N179), .B(n726), .Y(n640) );
  OAI222X4 U401 ( .A0(n633), .A1(n632), .B0(N182), .B1(n320), .C0(N183), .C1(
        n319), .Y(n634) );
  OAI22X1 U402 ( .A0(n620), .A1(n610), .B0(N122), .B1(n609), .Y(N478) );
  OAI22X1 U403 ( .A0(n565), .A1(n566), .B0(N113), .B1(n564), .Y(N474) );
  INVX12 U404 ( .A(n323), .Y(MinCost[3]) );
  OAI22X1 U405 ( .A0(n566), .A1(n553), .B0(N113), .B1(n552), .Y(N476) );
  INVX12 U406 ( .A(n730), .Y(Valid) );
  INVX12 U407 ( .A(n315), .Y(MinCost[9]) );
  BUFX16 U408 ( .A(n724), .Y(MinCost[5]) );
  NOR2BX2 U409 ( .AN(n498), .B(N111), .Y(n514) );
  INVX16 U410 ( .A(N115), .Y(J[1]) );
  INVX16 U411 ( .A(N116), .Y(J[2]) );
  BUFX12 U412 ( .A(n722), .Y(MatchCount[0]) );
  NAND2XL U413 ( .A(n296), .B(n297), .Y(n441) );
  BUFX12 U414 ( .A(n721), .Y(MatchCount[1]) );
  BUFX12 U415 ( .A(n720), .Y(MatchCount[3]) );
  OAI21X2 U416 ( .A0(n287), .A1(n316), .B0(n288), .Y(n439) );
  INVX16 U417 ( .A(n381), .Y(MatchCount[2]) );
  OAI22X1 U418 ( .A0(n566), .A1(n557), .B0(N113), .B1(n556), .Y(N475) );
  INVX12 U419 ( .A(n643), .Y(MinCost[2]) );
  INVX12 U420 ( .A(n320), .Y(MinCost[6]) );
  INVX12 U421 ( .A(n319), .Y(MinCost[7]) );
  BUFX12 U422 ( .A(n729), .Y(MinCost[0]) );
  INVX12 U423 ( .A(n325), .Y(MinCost[1]) );
  BUFX12 U424 ( .A(n725), .Y(MinCost[4]) );
  BUFX12 U425 ( .A(n723), .Y(MinCost[8]) );
  AND2XL U426 ( .A(N184), .B(n528), .Y(N194) );
  INVX3 U427 ( .A(N180), .Y(n645) );
  INVX3 U428 ( .A(n289), .Y(n650) );
  NAND2X4 U429 ( .A(n297), .B(n650), .Y(n295) );
  OAI22X4 U430 ( .A0(N185), .A1(n315), .B0(n648), .B1(n636), .Y(N218) );
  NAND2X2 U431 ( .A(n476), .B(n292), .Y(n297) );
  OAI32XL U432 ( .A0(MatchCount[2]), .A1(n382), .A2(n650), .B0(n381), .B1(n293), .Y(n440) );
  OR2XL U433 ( .A(n292), .B(MatchCount[1]), .Y(n497) );
  OA21XL U434 ( .A0(n292), .A1(MatchCount[2]), .B0(n293), .Y(n287) );
  CLKINVX4 U435 ( .A(n638), .Y(n648) );
  NOR2X4 U436 ( .A(n292), .B(n383), .Y(n289) );
  NAND3BX4 U437 ( .AN(N218), .B(n638), .C(n637), .Y(n641) );
  NAND2X4 U438 ( .A(N206), .B(n652), .Y(n292) );
  INVXL U439 ( .A(N476), .Y(n695) );
  AOI22XL U440 ( .A0(\seq[4][1] ), .A1(n511), .B0(\seq[1][1] ), .B1(n510), .Y(
        n509) );
  AOI22XL U441 ( .A0(\seq[4][2] ), .A1(n511), .B0(\seq[1][2] ), .B1(n510), .Y(
        n516) );
  AOI22XL U442 ( .A0(\seq[4][0] ), .A1(n511), .B0(\seq[1][0] ), .B1(n510), .Y(
        n507) );
  CLKBUFX2 U443 ( .A(n543), .Y(n547) );
  NAND2X2 U444 ( .A(N185), .B(n315), .Y(n638) );
  AND2XL U445 ( .A(N185), .B(n528), .Y(N195) );
  AND2XL U446 ( .A(N183), .B(n528), .Y(N193) );
  AND2XL U447 ( .A(N182), .B(n528), .Y(N192) );
  AND2XL U448 ( .A(N177), .B(n528), .Y(N187) );
  AND2XL U449 ( .A(N178), .B(n528), .Y(N188) );
  NAND4BX1 U450 ( .AN(n220), .B(n531), .C(n685), .D(n221), .Y(n212) );
  CLKINVX1 U451 ( .A(n233), .Y(n672) );
  CLKINVX1 U452 ( .A(n236), .Y(n671) );
  CLKINVX1 U453 ( .A(n229), .Y(n673) );
  NOR2X1 U454 ( .A(n530), .B(n244), .Y(n79) );
  OAI22X1 U455 ( .A0(n684), .A1(n663), .B0(n174), .B1(n257), .Y(n258) );
  AOI221X1 U456 ( .A0(n162), .A1(n529), .B0(n680), .B1(n118), .C0(n173), .Y(
        n158) );
  NOR3X1 U457 ( .A(N119), .B(n701), .C(N117), .Y(n261) );
  XNOR2XL U458 ( .A(n383), .B(n292), .Y(n296) );
  NOR2BXL U459 ( .AN(N176), .B(MinCost[0]), .Y(n622) );
  AOI2BB2X1 U460 ( .B0(n474), .B1(n525), .A0N(J[2]), .A1N(n571), .Y(n524) );
  AOI2BB2X1 U461 ( .B0(n474), .B1(n527), .A0N(J[2]), .A1N(n575), .Y(n526) );
  NAND3XL U462 ( .A(n380), .B(n471), .C(n652), .Y(n87) );
  AOI31XL U463 ( .A0(n90), .A1(N113), .A2(n674), .B0(n471), .Y(n89) );
  NAND3BXL U464 ( .AN(n77), .B(n699), .C(n378), .Y(n81) );
  NAND3XL U465 ( .A(n379), .B(n478), .C(n674), .Y(n80) );
  NOR3XL U466 ( .A(n478), .B(n378), .C(n699), .Y(n171) );
  OAI221XL U467 ( .A0(n103), .A1(n713), .B0(n112), .B1(n704), .C0(n121), .Y(
        n98) );
  NAND2X1 U468 ( .A(n521), .B(N111), .Y(n109) );
  AOI2BB1XL U469 ( .A0N(n379), .A1N(N121), .B0(n148), .Y(n145) );
  NAND2X1 U470 ( .A(n566), .B(n254), .Y(n112) );
  AOI21X1 U471 ( .A0(n529), .A1(n271), .B0(n681), .Y(n265) );
  NAND2X1 U472 ( .A(n566), .B(n90), .Y(n103) );
  NOR3X1 U473 ( .A(n393), .B(n602), .C(N119), .Y(n197) );
  NOR3X1 U474 ( .A(n602), .B(n391), .C(N117), .Y(n246) );
  NAND3X1 U475 ( .A(n391), .B(n701), .C(n393), .Y(n180) );
  AOI32XL U476 ( .A0(n378), .A1(n699), .A2(n77), .B0(n379), .B1(n471), .Y(n75)
         );
  NAND3XL U477 ( .A(n82), .B(n699), .C(n380), .Y(n74) );
  INVX3 U478 ( .A(n548), .Y(n545) );
  INVX3 U479 ( .A(n547), .Y(n546) );
  CLKBUFX3 U480 ( .A(n544), .Y(n549) );
  CLKBUFX3 U481 ( .A(n135), .Y(n543) );
  CLKINVX1 U482 ( .A(n166), .Y(n675) );
  CLKINVX1 U483 ( .A(n161), .Y(n682) );
  CLKINVX1 U484 ( .A(n169), .Y(n683) );
  CLKBUFX3 U485 ( .A(n135), .Y(n544) );
  NOR2X1 U486 ( .A(n684), .B(n676), .Y(n166) );
  NOR2X1 U487 ( .A(n684), .B(n696), .Y(n161) );
  NOR2X1 U488 ( .A(n684), .B(n695), .Y(n169) );
  CLKINVX1 U489 ( .A(n173), .Y(n686) );
  AND2X2 U490 ( .A(n531), .B(n686), .Y(n192) );
  CLKINVX1 U491 ( .A(n196), .Y(n667) );
  OAI21X1 U492 ( .A0(n205), .A1(n530), .B0(n196), .Y(n193) );
  CLKINVX1 U493 ( .A(n177), .Y(n666) );
  CLKINVX1 U494 ( .A(n241), .Y(n659) );
  CLKINVX1 U495 ( .A(n205), .Y(n685) );
  CLKINVX1 U496 ( .A(n118), .Y(n691) );
  CLKINVX1 U497 ( .A(n212), .Y(n658) );
  OAI21X1 U498 ( .A0(n530), .A1(n220), .B0(n212), .Y(n209) );
  CLKINVX1 U499 ( .A(n158), .Y(n665) );
  CLKINVX1 U500 ( .A(n79), .Y(n681) );
  AND2X2 U501 ( .A(n531), .B(n679), .Y(n182) );
  CLKINVX1 U502 ( .A(n258), .Y(n662) );
  OAI21X1 U503 ( .A0(n684), .A1(n267), .B0(n679), .Y(n268) );
  CLKINVX1 U504 ( .A(n261), .Y(n663) );
  CLKINVX1 U505 ( .A(n530), .Y(n679) );
  CLKINVX1 U506 ( .A(n140), .Y(n688) );
  CLKBUFX3 U507 ( .A(n536), .Y(n541) );
  CLKBUFX3 U508 ( .A(n536), .Y(n542) );
  CLKBUFX3 U509 ( .A(n536), .Y(n540) );
  CLKBUFX3 U510 ( .A(n536), .Y(n539) );
  CLKBUFX3 U511 ( .A(n539), .Y(n538) );
  CLKBUFX3 U512 ( .A(n536), .Y(n537) );
  CLKINVX1 U513 ( .A(n138), .Y(n689) );
  CLKINVX1 U514 ( .A(N181), .Y(n646) );
  INVX3 U515 ( .A(n379), .Y(n699) );
  NOR3X1 U516 ( .A(n702), .B(n703), .C(n709), .Y(n304) );
  INVXL U517 ( .A(N478), .Y(n677) );
  OAI32XL U518 ( .A0(n677), .A1(N475), .A2(n285), .B0(N474), .B1(n698), .Y(
        n282) );
  NAND2X1 U519 ( .A(n379), .B(n155), .Y(n154) );
  AOI221XL U520 ( .A0(N476), .A1(n697), .B0(N475), .B1(n677), .C0(n285), .Y(
        n281) );
  NAND2X1 U521 ( .A(n699), .B(n155), .Y(n153) );
  AND2X2 U522 ( .A(N181), .B(n528), .Y(N191) );
  AND2X2 U523 ( .A(N180), .B(n528), .Y(N190) );
  CLKINVX1 U524 ( .A(N477), .Y(n698) );
  AND2X2 U525 ( .A(N179), .B(n528), .Y(N189) );
  INVX1 U526 ( .A(N474), .Y(n696) );
  NOR2XL U527 ( .A(n696), .B(N477), .Y(n285) );
  INVX1 U528 ( .A(N475), .Y(n676) );
  CLKINVX1 U529 ( .A(N479), .Y(n697) );
  OAI2BB1X1 U530 ( .A0N(n676), .A1N(n98), .B0(n99), .Y(n96) );
  OAI32X1 U531 ( .A0(n100), .A1(n695), .A2(n102), .B0(n98), .B1(n676), .Y(n99)
         );
  OAI2BB2XL U532 ( .B0(n103), .B1(n518), .A0N(n105), .A1N(N113), .Y(n102) );
  OAI222XL U533 ( .A0(n112), .A1(n477), .B0(n691), .B1(n705), .C0(n694), .C1(
        n716), .Y(n100) );
  CLKINVX1 U534 ( .A(n92), .Y(n674) );
  OAI2BB1X1 U535 ( .A0N(n696), .A1N(n94), .B0(n95), .Y(n92) );
  OAI21XL U536 ( .A0(n94), .A1(n696), .B0(n96), .Y(n95) );
  OAI221XL U537 ( .A0(n103), .A1(n709), .B0(n112), .B1(n702), .C0(n129), .Y(
        n94) );
  OAI22XL U538 ( .A0(n710), .A1(n241), .B0(n659), .B1(n248), .Y(n415) );
  AOI221XL U539 ( .A0(N384), .A1(n244), .B0(n530), .B1(n533), .C0(n249), .Y(
        n248) );
  OAI22XL U540 ( .A0(n246), .A1(n233), .B0(n675), .B1(n660), .Y(n249) );
  NAND2X1 U541 ( .A(n700), .B(n698), .Y(n280) );
  OAI222XL U542 ( .A0(n472), .A1(n209), .B0(n658), .B1(n216), .C0(n712), .C1(
        n212), .Y(n409) );
  AOI221XL U543 ( .A0(n213), .A1(n166), .B0(n672), .B1(n657), .C0(n217), .Y(
        n216) );
  OAI22XL U544 ( .A0(n710), .A1(n685), .B0(n711), .B1(n531), .Y(n217) );
  AND2X2 U545 ( .A(N176), .B(n528), .Y(N186) );
  OAI222XL U546 ( .A0(n472), .A1(n193), .B0(n667), .B1(n201), .C0(n519), .C1(
        n196), .Y(n406) );
  AOI221XL U547 ( .A0(n197), .A1(n166), .B0(n672), .B1(n668), .C0(n202), .Y(
        n201) );
  OAI22XL U548 ( .A0(n711), .A1(n686), .B0(n710), .B1(n531), .Y(n202) );
  OAI22XL U549 ( .A0(n704), .A1(n665), .B0(n158), .B1(n165), .Y(n400) );
  AOI222XL U550 ( .A0(n533), .A1(n681), .B0(n166), .B1(n162), .C0(n672), .C1(
        n664), .Y(n165) );
  OAI22XL U551 ( .A0(n678), .A1(n258), .B0(n662), .B1(n275), .Y(n427) );
  AOI222XL U552 ( .A0(n530), .A1(n533), .B0(n261), .B1(n166), .C0(n672), .C1(
        n663), .Y(n275) );
  OAI22XL U553 ( .A0(n707), .A1(n241), .B0(n659), .B1(n243), .Y(n414) );
  AOI221XL U554 ( .A0(N385), .A1(n244), .B0(n530), .B1(n534), .C0(n245), .Y(
        n243) );
  OAI22XL U555 ( .A0(n246), .A1(n229), .B0(n682), .B1(n660), .Y(n245) );
  OAI222XL U556 ( .A0(n475), .A1(n193), .B0(n667), .B1(n195), .C0(n520), .C1(
        n196), .Y(n405) );
  AOI221XL U557 ( .A0(n197), .A1(n161), .B0(n673), .B1(n668), .C0(n199), .Y(
        n195) );
  OAI22XL U558 ( .A0(n708), .A1(n686), .B0(n707), .B1(n531), .Y(n199) );
  OAI22XL U559 ( .A0(n714), .A1(n241), .B0(n659), .B1(n250), .Y(n416) );
  AOI221XL U560 ( .A0(N383), .A1(n244), .B0(n530), .B1(n532), .C0(n251), .Y(
        n250) );
  OAI22XL U561 ( .A0(n246), .A1(n236), .B0(n683), .B1(n660), .Y(n251) );
  OAI222XL U562 ( .A0(n475), .A1(n209), .B0(n658), .B1(n211), .C0(n479), .C1(
        n212), .Y(n408) );
  AOI221XL U563 ( .A0(n213), .A1(n161), .B0(n673), .B1(n657), .C0(n215), .Y(
        n211) );
  OAI22XL U564 ( .A0(n707), .A1(n685), .B0(n708), .B1(n531), .Y(n215) );
  OAI22XL U565 ( .A0(n702), .A1(n665), .B0(n158), .B1(n159), .Y(n399) );
  AOI222XL U566 ( .A0(n534), .A1(n681), .B0(n161), .B1(n162), .C0(n673), .C1(
        n664), .Y(n159) );
  OAI22XL U567 ( .A0(n703), .A1(n258), .B0(n662), .B1(n260), .Y(n417) );
  AOI222XL U568 ( .A0(n530), .A1(n534), .B0(n261), .B1(n161), .C0(n673), .C1(
        n663), .Y(n260) );
  OAI222XL U569 ( .A0(n481), .A1(n209), .B0(n658), .B1(n218), .C0(n717), .C1(
        n212), .Y(n410) );
  AOI221XL U570 ( .A0(n213), .A1(n169), .B0(n671), .B1(n657), .C0(n219), .Y(
        n218) );
  OAI22XL U571 ( .A0(n714), .A1(n685), .B0(n715), .B1(n531), .Y(n219) );
  OAI222XL U572 ( .A0(n481), .A1(n193), .B0(n667), .B1(n203), .C0(n716), .C1(
        n196), .Y(n407) );
  AOI221XL U573 ( .A0(n197), .A1(n169), .B0(n671), .B1(n668), .C0(n204), .Y(
        n203) );
  OAI22XL U574 ( .A0(n715), .A1(n686), .B0(n714), .B1(n531), .Y(n204) );
  OAI22XL U575 ( .A0(n705), .A1(n258), .B0(n662), .B1(n263), .Y(n418) );
  AOI222XL U576 ( .A0(n530), .A1(n532), .B0(n261), .B1(n169), .C0(n671), .C1(
        n663), .Y(n263) );
  OAI22XL U577 ( .A0(n477), .A1(n665), .B0(n158), .B1(n168), .Y(n401) );
  AOI222XL U578 ( .A0(n532), .A1(n681), .B0(n169), .B1(n162), .C0(n671), .C1(
        n664), .Y(n168) );
  OAI211X1 U579 ( .A0(n530), .A1(n123), .B0(n226), .C0(n681), .Y(n223) );
  NOR2X2 U580 ( .A(n257), .B(n687), .Y(n173) );
  CLKINVX1 U581 ( .A(n244), .Y(n687) );
  OA21XL U582 ( .A0(n684), .A1(n668), .B0(n685), .Y(n207) );
  CLKINVX1 U583 ( .A(n226), .Y(n670) );
  OAI221X1 U584 ( .A0(n684), .A1(n180), .B0(n174), .B1(n112), .C0(n192), .Y(
        n177) );
  AOI211X1 U585 ( .A0(n253), .A1(N113), .B0(n205), .C0(n220), .Y(n252) );
  OAI22XL U586 ( .A0(n174), .A1(n690), .B0(n693), .B1(n687), .Y(n253) );
  NOR2X2 U587 ( .A(n687), .B(n103), .Y(n220) );
  CLKINVX1 U588 ( .A(n505), .Y(n522) );
  NOR2X1 U589 ( .A(n687), .B(n112), .Y(n205) );
  CLKINVX1 U590 ( .A(n240), .Y(n693) );
  NOR2X1 U591 ( .A(N113), .B(n109), .Y(n118) );
  CLKBUFX3 U592 ( .A(n190), .Y(n531) );
  NAND2X1 U593 ( .A(n244), .B(n118), .Y(n190) );
  CLKINVX1 U594 ( .A(n254), .Y(n690) );
  AOI2BB2X1 U595 ( .B0(n529), .B1(n213), .A0N(n694), .A1N(n174), .Y(n221) );
  NOR2X2 U596 ( .A(n529), .B(n530), .Y(n174) );
  CLKBUFX3 U597 ( .A(n206), .Y(n530) );
  NOR3X1 U598 ( .A(n478), .B(n379), .C(n471), .Y(n206) );
  INVX3 U599 ( .A(n529), .Y(n684) );
  CLKINVX1 U600 ( .A(n123), .Y(n694) );
  CLKINVX1 U601 ( .A(n562), .Y(n692) );
  CLKINVX1 U602 ( .A(n174), .Y(n680) );
  OAI222XL U603 ( .A0(n714), .A1(n692), .B0(n717), .B1(n109), .C0(n715), .C1(
        n690), .Y(n105) );
  CLKINVX1 U604 ( .A(n197), .Y(n668) );
  CLKINVX1 U605 ( .A(n246), .Y(n660) );
  CLKINVX1 U606 ( .A(n82), .Y(n652) );
  CLKINVX1 U607 ( .A(n228), .Y(n669) );
  CLKINVX1 U608 ( .A(n265), .Y(n661) );
  OAI211X1 U609 ( .A0(n546), .A1(n257), .B0(n272), .C0(n79), .Y(n424) );
  OAI21XL U610 ( .A0(n240), .A1(n545), .B0(N113), .Y(n272) );
  NAND3X1 U611 ( .A(n701), .B(N119), .C(N117), .Y(n267) );
  CLKINVX1 U612 ( .A(n213), .Y(n657) );
  NOR2X1 U613 ( .A(n689), .B(n379), .Y(n140) );
  CLKINVX1 U614 ( .A(n162), .Y(n664) );
  OAI21XL U615 ( .A0(n379), .A1(n706), .B0(n138), .Y(n148) );
  CLKINVX1 U616 ( .A(n312), .Y(n653) );
  CLKBUFX3 U617 ( .A(n651), .Y(n536) );
  NAND4X1 U618 ( .A(n316), .B(n289), .C(n721), .D(MatchCount[2]), .Y(n288) );
  INVX12 U619 ( .A(n524), .Y(W[0]) );
  CLKINVX1 U620 ( .A(n570), .Y(n525) );
  INVX12 U621 ( .A(n526), .Y(W[1]) );
  CLKINVX1 U622 ( .A(n574), .Y(n527) );
  NAND4X1 U623 ( .A(n477), .B(n713), .C(\seq[3][2] ), .D(n305), .Y(n300) );
  NAND4X1 U624 ( .A(n708), .B(n710), .C(n715), .D(n306), .Y(n299) );
  NOR3X1 U625 ( .A(n545), .B(n717), .C(n714), .Y(n303) );
  CLKINVX1 U626 ( .A(N177), .Y(n644) );
  OAI2BB2XL U627 ( .B0(n317), .B1(n649), .A0N(N227), .A1N(n649), .Y(n438) );
  OAI2BB2XL U628 ( .B0(n318), .B1(n649), .A0N(N235), .A1N(n649), .Y(n437) );
  OAI2BB2XL U629 ( .B0(n319), .B1(n649), .A0N(N234), .A1N(n649), .Y(n436) );
  OAI2BB2XL U630 ( .B0(n320), .B1(n649), .A0N(N233), .A1N(n649), .Y(n435) );
  OAI2BB2XL U631 ( .B0(n321), .B1(n649), .A0N(N232), .A1N(n649), .Y(n434) );
  OAI2BB2XL U632 ( .B0(n322), .B1(n649), .A0N(N231), .A1N(n649), .Y(n433) );
  OAI2BB2XL U633 ( .B0(n323), .B1(n649), .A0N(N230), .A1N(n649), .Y(n432) );
  OAI2BB2XL U634 ( .B0(n324), .B1(n649), .A0N(N229), .A1N(n649), .Y(n431) );
  OAI2BB2XL U635 ( .B0(n325), .B1(n649), .A0N(N228), .A1N(n649), .Y(n430) );
  OAI2BB2XL U636 ( .B0(n315), .B1(n649), .A0N(N236), .A1N(n649), .Y(n443) );
  OAI22XL U637 ( .A0(n382), .A1(n295), .B0(n650), .B1(n721), .Y(n442) );
  NOR4X1 U638 ( .A(n534), .B(n533), .C(n532), .D(\seq[6][2] ), .Y(n306) );
  CLKBUFX3 U639 ( .A(\seq[7][0] ), .Y(n532) );
  CLKBUFX3 U640 ( .A(\seq[7][1] ), .Y(n533) );
  CLKBUFX3 U641 ( .A(\seq[7][2] ), .Y(n534) );
  CLKINVX1 U642 ( .A(n279), .Y(n656) );
  OAI221XL U643 ( .A0(n281), .A1(n282), .B0(n698), .B1(n700), .C0(n284), .Y(
        n277) );
  OAI221XL U644 ( .A0(N479), .A1(n396), .B0(N478), .B1(n395), .C0(n280), .Y(
        n279) );
  OAI222XL U645 ( .A0(n388), .A1(n153), .B0(n566), .B1(n154), .C0(n391), .C1(
        n155), .Y(n422) );
  OAI222XL U646 ( .A0(n621), .A1(n153), .B0(n521), .B1(n154), .C0(n602), .C1(
        n155), .Y(n423) );
  OAI222XL U647 ( .A0(n619), .A1(n153), .B0(n567), .B1(n154), .C0(n393), .C1(
        n155), .Y(n428) );
  OAI222XL U648 ( .A0(n677), .A1(n153), .B0(n676), .B1(n154), .C0(n395), .C1(
        n155), .Y(n397) );
  OAI222XL U649 ( .A0(n698), .A1(n153), .B0(n696), .B1(n154), .C0(n394), .C1(
        n155), .Y(n398) );
  OAI222XL U650 ( .A0(n153), .A1(n697), .B0(n695), .B1(n154), .C0(n396), .C1(
        n155), .Y(n429) );
  OAI222XL U651 ( .A0(n472), .A1(n223), .B0(n670), .B1(n231), .C0(n711), .C1(
        n226), .Y(n412) );
  AOI221XL U652 ( .A0(n173), .A1(\seq[3][1] ), .B0(n220), .B1(\seq[6][1] ), 
        .C0(n232), .Y(n231) );
  OAI222XL U653 ( .A0(n228), .A1(n233), .B0(n675), .B1(n669), .C0(n712), .C1(
        n531), .Y(n232) );
  BUFX12 U654 ( .A(n719), .Y(J[0]) );
  OAI211X1 U655 ( .A0(n77), .A1(n688), .B0(n86), .C0(n87), .Y(ns[0]) );
  OAI21XL U656 ( .A0(n89), .A1(n380), .B0(n379), .Y(n86) );
  OAI22XL U657 ( .A0(n713), .A1(n177), .B0(n666), .B1(n184), .Y(n403) );
  AOI221XL U658 ( .A0(n672), .A1(n180), .B0(n173), .B1(\seq[6][1] ), .C0(n185), 
        .Y(n184) );
  OAI22XL U659 ( .A0(n182), .A1(n472), .B0(n675), .B1(n180), .Y(n185) );
  OAI222XL U660 ( .A0(n475), .A1(n223), .B0(n670), .B1(n225), .C0(n708), .C1(
        n226), .Y(n411) );
  AOI221XL U661 ( .A0(n173), .A1(\seq[3][2] ), .B0(n220), .B1(\seq[6][2] ), 
        .C0(n227), .Y(n225) );
  OAI222XL U662 ( .A0(n228), .A1(n229), .B0(n682), .B1(n669), .C0(n479), .C1(
        n531), .Y(n227) );
  NAND4X1 U663 ( .A(n79), .B(n80), .C(n81), .D(n74), .Y(ns[1]) );
  NAND3XL U664 ( .A(n280), .B(N478), .C(n395), .Y(n284) );
  OAI222XL U665 ( .A0(n481), .A1(n223), .B0(n670), .B1(n234), .C0(n715), .C1(
        n226), .Y(n413) );
  AOI221XL U666 ( .A0(n173), .A1(\seq[3][0] ), .B0(n220), .B1(\seq[6][0] ), 
        .C0(n235), .Y(n234) );
  OAI222XL U667 ( .A0(n228), .A1(n236), .B0(n683), .B1(n669), .C0(n717), .C1(
        n531), .Y(n235) );
  OAI22XL U668 ( .A0(n709), .A1(n177), .B0(n666), .B1(n179), .Y(n402) );
  AOI221XL U669 ( .A0(n673), .A1(n180), .B0(n173), .B1(\seq[6][2] ), .C0(n181), 
        .Y(n179) );
  OAI22XL U670 ( .A0(n182), .A1(n475), .B0(n682), .B1(n180), .Y(n181) );
  CLKINVX1 U671 ( .A(N122), .Y(n620) );
  OAI22XL U672 ( .A0(n518), .A1(n177), .B0(n666), .B1(n187), .Y(n404) );
  AOI221XL U673 ( .A0(n671), .A1(n180), .B0(n173), .B1(\seq[6][0] ), .C0(n188), 
        .Y(n187) );
  OAI22XL U674 ( .A0(n182), .A1(n481), .B0(n683), .B1(n180), .Y(n188) );
  OAI22XL U675 ( .A0(n472), .A1(n661), .B0(n265), .B1(n269), .Y(n420) );
  AOI222XL U676 ( .A0(N381), .A1(n244), .B0(n672), .B1(n267), .C0(N475), .C1(
        n268), .Y(n269) );
  OAI22XL U677 ( .A0(n475), .A1(n661), .B0(n265), .B1(n266), .Y(n419) );
  AOI222XL U678 ( .A0(N382), .A1(n244), .B0(n673), .B1(n267), .C0(N474), .C1(
        n268), .Y(n266) );
  OAI22XL U679 ( .A0(n481), .A1(n661), .B0(n265), .B1(n270), .Y(n421) );
  AOI222XL U680 ( .A0(N380), .A1(n244), .B0(N476), .B1(n268), .C0(n671), .C1(
        n267), .Y(n270) );
  NAND2X1 U681 ( .A(N285), .B(n529), .Y(n233) );
  NAND2X1 U682 ( .A(N286), .B(n529), .Y(n236) );
  NAND2X1 U683 ( .A(N284), .B(n529), .Y(n229) );
  AOI211X1 U684 ( .A0(n228), .A1(n529), .B0(n220), .C0(n239), .Y(n238) );
  NOR3X1 U685 ( .A(n109), .B(n566), .C(n174), .Y(n239) );
  NAND2X1 U686 ( .A(n567), .B(n521), .Y(n240) );
  NAND2X1 U687 ( .A(n566), .B(n693), .Y(n257) );
  AOI222XL U688 ( .A0(\seq[0][1] ), .A1(n118), .B0(n122), .B1(N113), .C0(
        \seq[3][1] ), .C1(n123), .Y(n121) );
  OAI222XL U689 ( .A0(n690), .A1(n711), .B0(n109), .B1(n712), .C0(n692), .C1(
        n710), .Y(n122) );
  CLKBUFX3 U690 ( .A(n171), .Y(n529) );
  NOR2X1 U691 ( .A(n240), .B(n566), .Y(n123) );
  AOI222XL U692 ( .A0(\seq[0][2] ), .A1(n118), .B0(n130), .B1(N113), .C0(
        \seq[3][2] ), .C1(n123), .Y(n129) );
  OAI222XL U693 ( .A0(n690), .A1(n708), .B0(n109), .B1(n479), .C0(n692), .C1(
        n707), .Y(n130) );
  NOR3X2 U694 ( .A(n393), .B(n391), .C(n701), .Y(n228) );
  INVX3 U695 ( .A(n602), .Y(n701) );
  NOR3X1 U696 ( .A(n480), .B(n387), .C(n474), .Y(n298) );
  NAND2X1 U697 ( .A(N264), .B(n298), .Y(n82) );
  NOR3X2 U698 ( .A(n701), .B(n391), .C(N117), .Y(n213) );
  OAI21XL U699 ( .A0(n566), .A1(n692), .B0(n267), .Y(n271) );
  OAI221XL U700 ( .A0(n388), .A1(n145), .B0(n566), .B1(n546), .C0(n146), .Y(
        n374) );
  NAND4X1 U701 ( .A(n388), .B(n140), .C(n706), .D(N121), .Y(n146) );
  NOR3X2 U702 ( .A(n701), .B(n393), .C(N119), .Y(n162) );
  OAI222XL U703 ( .A0(n619), .A1(n138), .B0(n688), .B1(n706), .C0(n567), .C1(
        n546), .Y(n365) );
  NAND2X1 U704 ( .A(n79), .B(n274), .Y(n426) );
  XNOR2X1 U705 ( .A(n567), .B(n546), .Y(n274) );
  OAI211X1 U706 ( .A0(n240), .A1(n546), .B0(n692), .C0(n273), .Y(n425) );
  OA21XL U707 ( .A0(n544), .A1(n521), .B0(n79), .Y(n273) );
  OAI21XL U708 ( .A0(n521), .A1(n545), .B0(n149), .Y(n375) );
  AOI32X1 U709 ( .A0(n140), .A1(n706), .A2(n621), .B0(n148), .B1(N121), .Y(
        n149) );
  OAI22XL U710 ( .A0(n518), .A1(n545), .B0(n547), .B1(n349), .Y(n350) );
  OAI22XL U711 ( .A0(n717), .A1(n545), .B0(n548), .B1(n348), .Y(n351) );
  OAI22XL U712 ( .A0(n705), .A1(n545), .B0(n544), .B1(n334), .Y(n366) );
  OAI22XL U713 ( .A0(n704), .A1(n545), .B0(n544), .B1(n331), .Y(n369) );
  OAI22XL U714 ( .A0(n703), .A1(n545), .B0(n544), .B1(n329), .Y(n371) );
  OAI22XL U715 ( .A0(n702), .A1(n545), .B0(n544), .B1(n328), .Y(n372) );
  OAI22XL U716 ( .A0(n678), .A1(n545), .B0(n544), .B1(n326), .Y(n376) );
  OAI22XL U717 ( .A0(n714), .A1(n546), .B0(n544), .B1(n345), .Y(n354) );
  OAI22XL U718 ( .A0(n712), .A1(n546), .B0(n544), .B1(n343), .Y(n356) );
  OAI22XL U719 ( .A0(n711), .A1(n546), .B0(n544), .B1(n341), .Y(n358) );
  OAI22XL U720 ( .A0(n709), .A1(n546), .B0(n549), .B1(n339), .Y(n360) );
  OAI22XL U721 ( .A0(n520), .A1(n546), .B0(n549), .B1(n337), .Y(n362) );
  OAI22XL U722 ( .A0(n708), .A1(n545), .B0(n549), .B1(n336), .Y(n363) );
  OAI22XL U723 ( .A0(n707), .A1(n545), .B0(n544), .B1(n335), .Y(n364) );
  OAI22XL U724 ( .A0(n477), .A1(n545), .B0(n544), .B1(n333), .Y(n367) );
  OAI22XL U725 ( .A0(n716), .A1(n546), .B0(n544), .B1(n347), .Y(n352) );
  OAI22XL U726 ( .A0(n715), .A1(n546), .B0(n544), .B1(n346), .Y(n353) );
  OAI22XL U727 ( .A0(n713), .A1(n546), .B0(n544), .B1(n344), .Y(n355) );
  OAI22XL U728 ( .A0(n519), .A1(n546), .B0(n544), .B1(n342), .Y(n357) );
  OAI22XL U729 ( .A0(n710), .A1(n546), .B0(n544), .B1(n340), .Y(n359) );
  OAI22XL U730 ( .A0(n479), .A1(n546), .B0(n549), .B1(n338), .Y(n361) );
  OAI22XL U731 ( .A0(n545), .A1(n481), .B0(n544), .B1(n332), .Y(n368) );
  OAI22XL U732 ( .A0(n545), .A1(n472), .B0(n544), .B1(n330), .Y(n370) );
  OAI22XL U733 ( .A0(n545), .A1(n475), .B0(n544), .B1(n327), .Y(n373) );
  OAI32X1 U734 ( .A0(n654), .A1(N116), .A2(n653), .B0(n387), .B1(n309), .Y(
        N267) );
  OA21XL U735 ( .A0(n298), .A1(n474), .B0(n311), .Y(n309) );
  AOI2BB1X1 U736 ( .A0N(n298), .A1N(n480), .B0(N264), .Y(n311) );
  NAND3X1 U737 ( .A(n679), .B(n74), .C(n75), .Y(ns[2]) );
  OAI22XL U738 ( .A0(N116), .A1(n311), .B0(n474), .B1(n653), .Y(N266) );
  CLKINVX1 U739 ( .A(n619), .Y(n706) );
  AOI211X1 U740 ( .A0(N264), .A1(N115), .B0(n298), .C0(n312), .Y(N265) );
  NOR2X1 U741 ( .A(N115), .B(N264), .Y(n312) );
  CLKBUFX3 U742 ( .A(n314), .Y(n528) );
  NAND4X1 U743 ( .A(n387), .B(N264), .C(N116), .D(N115), .Y(n314) );
  NOR3X1 U744 ( .A(n621), .B(n388), .C(n619), .Y(n77) );
  NAND3X1 U745 ( .A(n566), .B(n521), .C(N111), .Y(n517) );
  NAND2X1 U746 ( .A(n532), .B(N113), .Y(n500) );
  NOR2X1 U747 ( .A(N112), .B(N111), .Y(n505) );
  NOR2X1 U748 ( .A(n522), .B(N113), .Y(n510) );
  NOR2X1 U749 ( .A(n521), .B(N113), .Y(n498) );
  AND2X1 U750 ( .A(n498), .B(N111), .Y(n511) );
  AOI222XL U751 ( .A0(\seq[2][0] ), .A1(n510), .B0(\seq[4][0] ), .B1(n514), 
        .C0(\seq[5][0] ), .C1(n511), .Y(n499) );
  OAI211X1 U752 ( .A0(n517), .A1(n716), .B0(n500), .C0(n499), .Y(N383) );
  NAND2X1 U753 ( .A(n533), .B(N113), .Y(n502) );
  AOI222XL U754 ( .A0(\seq[2][1] ), .A1(n510), .B0(\seq[4][1] ), .B1(n514), 
        .C0(\seq[5][1] ), .C1(n511), .Y(n501) );
  OAI211X1 U755 ( .A0(n517), .A1(n519), .B0(n502), .C0(n501), .Y(N384) );
  NAND2X1 U756 ( .A(n534), .B(N113), .Y(n504) );
  AOI222XL U757 ( .A0(\seq[2][2] ), .A1(n510), .B0(\seq[4][2] ), .B1(n514), 
        .C0(n511), .C1(\seq[5][2] ), .Y(n503) );
  OAI211X1 U758 ( .A0(n520), .A1(n517), .B0(n504), .C0(n503), .Y(N385) );
  NOR2X1 U759 ( .A(n566), .B(n522), .Y(n513) );
  NOR2X1 U760 ( .A(n566), .B(n505), .Y(n512) );
  AOI222XL U761 ( .A0(\seq[3][0] ), .A1(n514), .B0(\seq[5][0] ), .B1(n513), 
        .C0(\seq[6][0] ), .C1(n512), .Y(n506) );
  OAI211X1 U762 ( .A0(n517), .A1(n518), .B0(n507), .C0(n506), .Y(N380) );
  AOI222XL U763 ( .A0(\seq[3][1] ), .A1(n514), .B0(\seq[5][1] ), .B1(n513), 
        .C0(\seq[6][1] ), .C1(n512), .Y(n508) );
  OAI211X1 U764 ( .A0(n517), .A1(n713), .B0(n509), .C0(n508), .Y(N381) );
  AOI222XL U765 ( .A0(\seq[3][2] ), .A1(n514), .B0(\seq[5][2] ), .B1(n513), 
        .C0(\seq[6][2] ), .C1(n512), .Y(n515) );
  OAI211X1 U766 ( .A0(n517), .A1(n709), .B0(n516), .C0(n515), .Y(N382) );
  BUFX12 U767 ( .A(n718), .Y(W[2]) );
  NOR2X1 U768 ( .A(n521), .B(n567), .Y(n562) );
  NOR2X1 U769 ( .A(n567), .B(N112), .Y(n560) );
  NOR2X1 U770 ( .A(N111), .B(N112), .Y(n559) );
  AO22X1 U771 ( .A0(\seq[5][0] ), .A1(n560), .B0(\seq[4][0] ), .B1(n559), .Y(
        n550) );
  AOI221XL U772 ( .A0(\seq[6][0] ), .A1(n563), .B0(n532), .B1(n90), .C0(n550), 
        .Y(n553) );
  AO22X1 U773 ( .A0(\seq[1][0] ), .A1(n560), .B0(\seq[0][0] ), .B1(n559), .Y(
        n551) );
  AOI221XL U774 ( .A0(\seq[2][0] ), .A1(n563), .B0(\seq[3][0] ), .B1(n90), 
        .C0(n551), .Y(n552) );
  AO22X1 U775 ( .A0(\seq[5][1] ), .A1(n560), .B0(\seq[4][1] ), .B1(n559), .Y(
        n554) );
  AOI221XL U776 ( .A0(\seq[6][1] ), .A1(n563), .B0(n533), .B1(n562), .C0(n554), 
        .Y(n557) );
  AO22X1 U777 ( .A0(\seq[1][1] ), .A1(n560), .B0(\seq[0][1] ), .B1(n559), .Y(
        n555) );
  AOI221XL U778 ( .A0(\seq[2][1] ), .A1(n563), .B0(\seq[3][1] ), .B1(n562), 
        .C0(n555), .Y(n556) );
  AO22X1 U779 ( .A0(\seq[5][2] ), .A1(n560), .B0(\seq[4][2] ), .B1(n559), .Y(
        n558) );
  AOI221XL U780 ( .A0(\seq[6][2] ), .A1(n563), .B0(n534), .B1(n562), .C0(n558), 
        .Y(n565) );
  AO22X1 U781 ( .A0(\seq[1][2] ), .A1(n560), .B0(\seq[0][2] ), .B1(n559), .Y(
        n561) );
  AOI221XL U782 ( .A0(\seq[2][2] ), .A1(n563), .B0(\seq[3][2] ), .B1(n562), 
        .C0(n561), .Y(n564) );
  NOR2X1 U783 ( .A(J[1]), .B(n719), .Y(n580) );
  NOR2X1 U784 ( .A(n719), .B(N115), .Y(n578) );
  NOR2X1 U785 ( .A(N264), .B(N115), .Y(n577) );
  AO22X1 U786 ( .A0(\seq_1[5][0] ), .A1(n578), .B0(\seq_1[4][0] ), .B1(n577), 
        .Y(n568) );
  AOI221XL U787 ( .A0(\seq_1[6][0] ), .A1(n581), .B0(\seq_1[7][0] ), .B1(n580), 
        .C0(n568), .Y(n571) );
  AO22X1 U788 ( .A0(\seq_1[1][0] ), .A1(n578), .B0(\seq_1[0][0] ), .B1(n577), 
        .Y(n569) );
  AOI221XL U789 ( .A0(\seq_1[2][0] ), .A1(n581), .B0(\seq_1[3][0] ), .B1(n580), 
        .C0(n569), .Y(n570) );
  AO22X1 U790 ( .A0(\seq_1[5][1] ), .A1(n578), .B0(\seq_1[4][1] ), .B1(n577), 
        .Y(n572) );
  AOI221XL U791 ( .A0(\seq_1[6][1] ), .A1(n581), .B0(\seq_1[7][1] ), .B1(n580), 
        .C0(n572), .Y(n575) );
  AO22X1 U792 ( .A0(\seq_1[1][1] ), .A1(n578), .B0(\seq_1[0][1] ), .B1(n577), 
        .Y(n573) );
  AOI221XL U793 ( .A0(\seq_1[2][1] ), .A1(n581), .B0(\seq_1[3][1] ), .B1(n580), 
        .C0(n573), .Y(n574) );
  AO22X1 U794 ( .A0(\seq_1[5][2] ), .A1(n578), .B0(\seq_1[4][2] ), .B1(n577), 
        .Y(n576) );
  AOI221XL U795 ( .A0(\seq_1[6][2] ), .A1(n581), .B0(\seq_1[7][2] ), .B1(n580), 
        .C0(n576), .Y(n583) );
  AO22X1 U796 ( .A0(\seq_1[1][2] ), .A1(n578), .B0(\seq_1[0][2] ), .B1(n577), 
        .Y(n579) );
  AOI221XL U797 ( .A0(\seq_1[2][2] ), .A1(n581), .B0(\seq_1[3][2] ), .B1(n580), 
        .C0(n579), .Y(n582) );
  OAI22XL U798 ( .A0(n583), .A1(J[2]), .B0(N116), .B1(n582), .Y(n718) );
  NOR2X1 U799 ( .A(n602), .B(N117), .Y(n599) );
  NOR2X1 U800 ( .A(n602), .B(n393), .Y(n598) );
  NOR2X1 U801 ( .A(n393), .B(N118), .Y(n596) );
  NOR2X1 U802 ( .A(N117), .B(N118), .Y(n595) );
  AO22X1 U803 ( .A0(\seq[5][0] ), .A1(n596), .B0(\seq[4][0] ), .B1(n595), .Y(
        n586) );
  AOI221XL U804 ( .A0(\seq[6][0] ), .A1(n599), .B0(n532), .B1(n598), .C0(n586), 
        .Y(n589) );
  AO22X1 U805 ( .A0(\seq[1][0] ), .A1(n596), .B0(\seq[0][0] ), .B1(n595), .Y(
        n587) );
  AOI221XL U806 ( .A0(\seq[2][0] ), .A1(n599), .B0(\seq[3][0] ), .B1(n598), 
        .C0(n587), .Y(n588) );
  OAI22XL U807 ( .A0(n391), .A1(n589), .B0(N119), .B1(n588), .Y(N286) );
  AO22X1 U808 ( .A0(\seq[5][1] ), .A1(n596), .B0(\seq[4][1] ), .B1(n595), .Y(
        n590) );
  AOI221XL U809 ( .A0(\seq[6][1] ), .A1(n599), .B0(n533), .B1(n598), .C0(n590), 
        .Y(n593) );
  AO22X1 U810 ( .A0(\seq[1][1] ), .A1(n596), .B0(\seq[0][1] ), .B1(n595), .Y(
        n591) );
  AOI221XL U811 ( .A0(\seq[2][1] ), .A1(n599), .B0(\seq[3][1] ), .B1(n598), 
        .C0(n591), .Y(n592) );
  OAI22XL U812 ( .A0(n391), .A1(n593), .B0(N119), .B1(n592), .Y(N285) );
  AO22X1 U813 ( .A0(\seq[5][2] ), .A1(n596), .B0(\seq[4][2] ), .B1(n595), .Y(
        n594) );
  AOI221XL U814 ( .A0(\seq[6][2] ), .A1(n599), .B0(n534), .B1(n598), .C0(n594), 
        .Y(n601) );
  AO22X1 U815 ( .A0(\seq[1][2] ), .A1(n596), .B0(\seq[0][2] ), .B1(n595), .Y(
        n597) );
  AOI221XL U816 ( .A0(\seq[2][2] ), .A1(n599), .B0(\seq[3][2] ), .B1(n598), 
        .C0(n597), .Y(n600) );
  OAI22XL U817 ( .A0(n601), .A1(n391), .B0(N119), .B1(n600), .Y(N284) );
  NOR2X1 U818 ( .A(n621), .B(N120), .Y(n616) );
  NOR2X1 U819 ( .A(n621), .B(n619), .Y(n615) );
  NOR2X1 U820 ( .A(n619), .B(N121), .Y(n613) );
  NOR2X1 U821 ( .A(N120), .B(N121), .Y(n612) );
  AO22X1 U822 ( .A0(\seq[5][0] ), .A1(n613), .B0(\seq[4][0] ), .B1(n612), .Y(
        n603) );
  AOI221XL U823 ( .A0(\seq[6][0] ), .A1(n616), .B0(n532), .B1(n615), .C0(n603), 
        .Y(n606) );
  AO22X1 U824 ( .A0(\seq[1][0] ), .A1(n613), .B0(\seq[0][0] ), .B1(n612), .Y(
        n604) );
  AOI221XL U825 ( .A0(\seq[2][0] ), .A1(n616), .B0(\seq[3][0] ), .B1(n615), 
        .C0(n604), .Y(n605) );
  OAI22XL U826 ( .A0(n620), .A1(n606), .B0(N122), .B1(n605), .Y(N479) );
  AO22X1 U827 ( .A0(\seq[5][1] ), .A1(n613), .B0(\seq[4][1] ), .B1(n612), .Y(
        n607) );
  AOI221XL U828 ( .A0(\seq[6][1] ), .A1(n616), .B0(n533), .B1(n615), .C0(n607), 
        .Y(n610) );
  AO22X1 U829 ( .A0(\seq[1][1] ), .A1(n613), .B0(\seq[0][1] ), .B1(n612), .Y(
        n608) );
  AOI221XL U830 ( .A0(\seq[2][1] ), .A1(n616), .B0(\seq[3][1] ), .B1(n615), 
        .C0(n608), .Y(n609) );
  AO22X1 U831 ( .A0(\seq[5][2] ), .A1(n613), .B0(\seq[4][2] ), .B1(n612), .Y(
        n611) );
  AOI221XL U832 ( .A0(\seq[6][2] ), .A1(n616), .B0(n534), .B1(n615), .C0(n611), 
        .Y(n618) );
  AO22X1 U833 ( .A0(\seq[1][2] ), .A1(n613), .B0(\seq[0][2] ), .B1(n612), .Y(
        n614) );
  AOI221XL U834 ( .A0(\seq[2][2] ), .A1(n616), .B0(\seq[3][2] ), .B1(n615), 
        .C0(n614), .Y(n617) );
  OAI22XL U835 ( .A0(n618), .A1(n620), .B0(N122), .B1(n617), .Y(N477) );
  OAI22XL U836 ( .A0(N177), .A1(n622), .B0(n622), .B1(n325), .Y(n624) );
  NAND2X1 U837 ( .A(N183), .B(n319), .Y(n635) );
  NAND2X1 U838 ( .A(N182), .B(n320), .Y(n630) );
  NOR3BXL U839 ( .AN(n630), .B(n496), .C(n631), .Y(n623) );
  NAND3X1 U840 ( .A(n624), .B(n635), .C(n623), .Y(n642) );
  NAND2X1 U841 ( .A(N178), .B(n643), .Y(n637) );
  OAI211X1 U842 ( .A0(n626), .A1(n644), .B0(n625), .C0(n637), .Y(n627) );
  NAND2BX1 U843 ( .AN(n631), .B(n630), .Y(n632) );
endmodule

