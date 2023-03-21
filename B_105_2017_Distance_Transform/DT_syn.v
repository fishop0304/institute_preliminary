/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : S-2021.06-SP2
// Date      : Fri Mar 18 14:25:06 2022
/////////////////////////////////////////////////////////////


module DT_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_inc_1_DW01_inc_2 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;
  wire   n1;
  wire   [8:2] carry;

  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(n1), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  AND2X2 U1 ( .A(A[2]), .B(carry[2]), .Y(n1) );
  XOR2X1 U2 ( .A(A[2]), .B(carry[2]), .Y(SUM[2]) );
  INVXL U3 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_inc_2_DW01_inc_3 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  XOR2X1 U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_inc_3_DW01_inc_4 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_inc_4_DW01_inc_5 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT ( clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, 
        res_addr, res_do, res_di );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, reset;
  output done, sti_rd, res_wr, res_rd;
  wire   N42, N43, N44, n437, n438, n439, n440, n441, n442, N76, N90, N91, N92,
         N93, N117, N118, N119, N272, N273, N274, N275, N276, N277, N278, N279,
         N311, N312, N313, N314, N315, N316, N317, N318, N319, N320, N322,
         N323, N324, N325, N326, N327, N328, N329, N338, N339, N340, N341,
         N342, N343, N344, N345, n49, n50, n51, n61, n63, n65, n66, n67, n102,
         n168, n169, n170, n171, n172, n173, n174, n209, n210, n211, n212,
         n213, n214, n215, n216, n221, n223, n224, n225, n226, n227, n228,
         n237, n238, n239, n240, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436;
  wire   [6:0] a1;
  wire   [6:0] a2;
  wire   [6:0] a3;
  wire   [6:0] a4;
  wire   [6:0] a5;
  wire   [6:0] a6;
  wire   [2:0] status;
  wire   [2:0] next_status;
  wire   [7:0] data;
  wire   [7:0] \sub_26/carry ;
  wire   [6:1] \add_25/carry ;

  DT_DW01_inc_0_DW01_inc_1 add_242 ( .A(res_di), .SUM({N329, N328, N327, N326, 
        N325, N324, N323, N322}) );
  DT_DW01_inc_1_DW01_inc_2 add_241 ( .A({1'b0, res_di}), .SUM({N319, N318, 
        N317, N316, N315, N314, N313, N312, N311}) );
  DT_DW01_inc_2_DW01_inc_3 add_219_S2 ( .A(data), .SUM({N279, N278, N277, N276, 
        N275, N274, N273, N272}) );
  DT_DW01_inc_3_DW01_inc_4 add_23 ( .A({n223, res_addr[5:0]}), .SUM(a3) );
  DT_DW01_inc_4_DW01_inc_5 add_21 ( .A({n437, sti_addr[8], n211, n210, 
        sti_addr[5:4], n438}), .SUM(a1) );
  EDFFX1 \x_reg[5]  ( .D(n431), .E(n102), .CK(clk), .Q(n440) );
  EDFFX1 \x_reg[4]  ( .D(n432), .E(n102), .CK(clk), .Q(n441), .QN(n215) );
  EDFFX1 \x_reg[2]  ( .D(n434), .E(n102), .CK(clk), .Q(n273), .QN(N44) );
  DFFRX2 \status_reg[0]  ( .D(next_status[0]), .CK(clk), .RN(reset), .Q(
        status[0]), .QN(n213) );
  EDFFX1 \x_reg[1]  ( .D(n435), .E(n102), .CK(clk), .Q(n272), .QN(N43) );
  EDFFX1 \x_reg[0]  ( .D(n436), .E(n102), .CK(clk), .Q(n274), .QN(N42) );
  DFFRX1 \status_reg[1]  ( .D(next_status[1]), .CK(clk), .RN(reset), .Q(
        status[1]), .QN(n209) );
  TLATX1 \next_status_reg[1]  ( .G(N90), .D(N92), .Q(next_status[1]) );
  TLATX1 \next_status_reg[0]  ( .G(N90), .D(N91), .Q(next_status[0]) );
  TLATX1 \next_status_reg[2]  ( .G(N90), .D(N93), .Q(next_status[2]) );
  EDFFX1 \x_reg[3]  ( .D(n433), .E(n102), .CK(clk), .Q(n442) );
  DFFRX1 \count_reg[0]  ( .D(N117), .CK(clk), .RN(reset), .Q(n365), .QN(n51)
         );
  DFFRX1 \count_reg[1]  ( .D(N118), .CK(clk), .RN(reset), .Q(n369), .QN(n50)
         );
  DFFRX1 \count_reg[2]  ( .D(N119), .CK(clk), .RN(reset), .Q(n389), .QN(n49)
         );
  CLKMX2X2 \x_reg[6]/U3  ( .A(n223), .B(n430), .S0(n102), .Y(n224) );
  DFFQX1 \x_reg[6]  ( .D(n224), .CK(clk), .Q(n439) );
  DFFSX1 \data_reg[7]  ( .D(N345), .CK(clk), .SN(reset), .Q(data[7]), .QN(n292) );
  DFFSX1 \data_reg[6]  ( .D(N344), .CK(clk), .SN(reset), .Q(data[6]), .QN(n61)
         );
  DFFSX1 \data_reg[4]  ( .D(N342), .CK(clk), .SN(reset), .Q(data[4]), .QN(n63)
         );
  DFFSX1 \data_reg[3]  ( .D(N341), .CK(clk), .SN(reset), .Q(data[3]), .QN(n290) );
  DFFSX1 \data_reg[2]  ( .D(N340), .CK(clk), .SN(reset), .Q(data[2]), .QN(n65)
         );
  DFFSX1 \data_reg[1]  ( .D(N339), .CK(clk), .SN(reset), .Q(data[1]), .QN(n66)
         );
  DFFSX1 \data_reg[0]  ( .D(N338), .CK(clk), .SN(reset), .Q(data[0]), .QN(n67)
         );
  DFFX1 \y_reg[0]  ( .D(n173), .CK(clk), .Q(n438), .QN(a2[0]) );
  DFFX1 \y_reg[6]  ( .D(n174), .CK(clk), .Q(n437), .QN(n212) );
  DFFX1 \y_reg[4]  ( .D(n169), .CK(clk), .Q(n211), .QN(n254) );
  DFFX1 \y_reg[3]  ( .D(n170), .CK(clk), .Q(n210), .QN(n216) );
  DFFX4 \y_reg[5]  ( .D(n168), .CK(clk), .Q(sti_addr[8]) );
  DFFX4 \y_reg[2]  ( .D(n171), .CK(clk), .Q(sti_addr[5]) );
  DFFX4 \y_reg[1]  ( .D(n172), .CK(clk), .Q(sti_addr[4]) );
  DFFSX2 \data_reg[5]  ( .D(N343), .CK(clk), .SN(reset), .Q(data[5]), .QN(n291) );
  DFFRX1 \status_reg[2]  ( .D(next_status[2]), .CK(clk), .RN(reset), .Q(
        status[2]), .QN(n214) );
  INVX3 U211 ( .A(1'b0), .Y(res_rd) );
  OAI222X1 U213 ( .A0(data[6]), .A1(n284), .B0(n296), .B1(n284), .C0(data[6]), 
        .C1(n296), .Y(n285) );
  NAND2X1 U214 ( .A(n225), .B(n297), .Y(N320) );
  CLKINVX1 U215 ( .A(n289), .Y(n297) );
  AOI31X1 U216 ( .A0(n361), .A1(n327), .A2(n336), .B0(n333), .Y(n363) );
  INVX3 U217 ( .A(n254), .Y(sti_addr[7]) );
  INVX3 U218 ( .A(a2[0]), .Y(sti_addr[3]) );
  INVX3 U219 ( .A(n212), .Y(sti_addr[9]) );
  OR2XL U220 ( .A(sti_addr[4]), .B(n438), .Y(n249) );
  OAI2BB1XL U221 ( .A0N(sti_addr[3]), .A1N(sti_addr[4]), .B0(n249), .Y(a2[1])
         );
  INVX3 U222 ( .A(n216), .Y(sti_addr[6]) );
  NAND4XL U223 ( .A(sti_addr[5]), .B(sti_addr[4]), .C(n377), .D(n378), .Y(n372) );
  NOR4XL U224 ( .A(sti_addr[9]), .B(sti_addr[8]), .C(sti_addr[7]), .D(
        sti_addr[6]), .Y(n384) );
  INVXL U225 ( .A(n439), .Y(n221) );
  CLKINVX2 U226 ( .A(n221), .Y(sti_addr[2]) );
  CLKINVX1 U227 ( .A(n221), .Y(n223) );
  OAI211X4 U228 ( .A0(n67), .A1(n301), .B0(n303), .C0(n304), .Y(res_do[0]) );
  OAI2BB2X2 U229 ( .B0(n292), .B1(n301), .A0N(N279), .A1N(n302), .Y(res_do[7])
         );
  OAI2BB2X2 U230 ( .B0(n61), .B1(n301), .A0N(N278), .A1N(n302), .Y(res_do[6])
         );
  OAI2BB2X2 U231 ( .B0(n291), .B1(n301), .A0N(N277), .A1N(n302), .Y(res_do[5])
         );
  OAI2BB2X2 U232 ( .B0(n63), .B1(n301), .A0N(N276), .A1N(n302), .Y(res_do[4])
         );
  OAI2BB2X2 U233 ( .B0(n290), .B1(n301), .A0N(N275), .A1N(n302), .Y(res_do[3])
         );
  OAI221XL U234 ( .A0(n368), .A1(n338), .B0(n301), .B1(n329), .C0(n304), .Y(
        n343) );
  NAND3X2 U235 ( .A(n51), .B(n369), .C(n49), .Y(n329) );
  NAND2X2 U236 ( .A(n298), .B(n299), .Y(sti_rd) );
  OAI2BB2X2 U237 ( .B0(n65), .B1(n301), .A0N(N274), .A1N(n302), .Y(res_do[2])
         );
  NAND2X2 U238 ( .A(n300), .B(n299), .Y(res_wr) );
  OAI211X4 U239 ( .A0(n330), .A1(n240), .B0(n331), .C0(n332), .Y(n308) );
  OAI2BB2X2 U240 ( .B0(n66), .B1(n301), .A0N(N273), .A1N(n302), .Y(res_do[1])
         );
  NOR2X2 U241 ( .A(n240), .B(n300), .Y(n302) );
  AOI21X2 U242 ( .A0(n411), .A1(n361), .B0(n367), .Y(n390) );
  INVX3 U243 ( .A(n370), .Y(done) );
  NAND2X2 U244 ( .A(n312), .B(n364), .Y(n102) );
  NOR2X2 U245 ( .A(n329), .B(n240), .Y(n312) );
  NAND3X2 U246 ( .A(status[1]), .B(n214), .C(status[0]), .Y(n323) );
  NOR2BX2 U247 ( .AN(n347), .B(n346), .Y(n341) );
  AOI211XL U248 ( .A0(n329), .A1(n358), .B0(n346), .C0(n359), .Y(n344) );
  OAI31X1 U249 ( .A0(n299), .A1(N76), .A2(n362), .B0(n363), .Y(n346) );
  OAI32X4 U250 ( .A0(n327), .A1(n328), .A2(n240), .B0(n301), .B1(n329), .Y(
        n309) );
  NAND2X2 U251 ( .A(n387), .B(n388), .Y(n327) );
  NOR2X2 U252 ( .A(n410), .B(n367), .Y(n395) );
  OA22X2 U253 ( .A0(N320), .A1(n301), .B0(n240), .B1(n411), .Y(n392) );
  OR3X2 U254 ( .A(n292), .B(N319), .C(N318), .Y(n225) );
  INVX1 U255 ( .A(n323), .Y(n310) );
  NOR2BX4 U256 ( .AN(N320), .B(n301), .Y(n394) );
  CLKINVX1 U257 ( .A(N315), .Y(n295) );
  AOI22XL U258 ( .A0(N42), .A1(n311), .B0(res_addr[0]), .B1(n312), .Y(n324) );
  AOI22XL U259 ( .A0(a4[2]), .A1(n311), .B0(a6[2]), .B1(n312), .Y(n319) );
  AOI22XL U260 ( .A0(a4[4]), .A1(n311), .B0(a6[4]), .B1(n312), .Y(n315) );
  AOI22XL U261 ( .A0(a4[5]), .A1(n311), .B0(a6[5]), .B1(n312), .Y(n313) );
  AOI22XL U262 ( .A0(a4[3]), .A1(n311), .B0(a6[3]), .B1(n312), .Y(n317) );
  AND2XL U263 ( .A(n366), .B(n329), .Y(n335) );
  NAND4XL U264 ( .A(n323), .B(n371), .C(n301), .D(n370), .Y(N93) );
  NAND3X1 U265 ( .A(n226), .B(n227), .C(n228), .Y(n284) );
  OR2X1 U266 ( .A(N316), .B(n283), .Y(n227) );
  OR2X1 U267 ( .A(n291), .B(n283), .Y(n228) );
  AOI22XL U268 ( .A0(a4[6]), .A1(n311), .B0(a6[6]), .B1(n312), .Y(n306) );
  NAND2XL U269 ( .A(N272), .B(n302), .Y(n303) );
  INVX1 U270 ( .A(n280), .Y(n294) );
  CLKBUFX3 U271 ( .A(n442), .Y(res_addr[3]) );
  CLKBUFX3 U272 ( .A(n272), .Y(res_addr[1]) );
  OR2XL U273 ( .A(N316), .B(n291), .Y(n226) );
  CLKINVX1 U274 ( .A(N317), .Y(n296) );
  CLKBUFX3 U275 ( .A(n305), .Y(n240) );
  NAND2X1 U276 ( .A(n374), .B(n214), .Y(n305) );
  OR2X1 U277 ( .A(res_addr[1]), .B(res_addr[0]), .Y(n255) );
  OAI2BB2X1 U278 ( .B0(res_addr[3]), .B1(n237), .A0N(n238), .A1N(res_addr[3]), 
        .Y(N76) );
  CLKINVX1 U279 ( .A(N312), .Y(n293) );
  NAND3X4 U280 ( .A(status[0]), .B(n209), .C(status[2]), .Y(n301) );
  CLKBUFX3 U281 ( .A(n273), .Y(res_addr[2]) );
  CLKBUFX3 U282 ( .A(n274), .Y(res_addr[0]) );
  CLKBUFX3 U283 ( .A(n441), .Y(res_addr[4]) );
  CLKBUFX3 U284 ( .A(n440), .Y(sti_addr[1]) );
  CLKBUFX3 U285 ( .A(n441), .Y(sti_addr[0]) );
  CLKBUFX3 U286 ( .A(n440), .Y(res_addr[5]) );
  CLKBUFX3 U287 ( .A(n437), .Y(res_addr[13]) );
  CLKBUFX3 U288 ( .A(sti_addr[8]), .Y(res_addr[12]) );
  CLKBUFX3 U289 ( .A(sti_addr[7]), .Y(res_addr[11]) );
  CLKBUFX3 U290 ( .A(sti_addr[6]), .Y(res_addr[10]) );
  CLKBUFX3 U291 ( .A(sti_addr[5]), .Y(res_addr[9]) );
  CLKBUFX3 U292 ( .A(sti_addr[4]), .Y(res_addr[8]) );
  CLKBUFX3 U293 ( .A(sti_addr[3]), .Y(res_addr[7]) );
  CLKBUFX3 U294 ( .A(n223), .Y(res_addr[6]) );
  OAI211X4 U295 ( .A0(n337), .A1(n301), .B0(n338), .C0(n304), .Y(n311) );
  NAND2BX1 U296 ( .AN(n299), .B(N76), .Y(n304) );
  OA22X1 U297 ( .A0(n271), .A1(n273), .B0(N44), .B1(n270), .Y(n237) );
  OAI22XL U298 ( .A0(n273), .A1(n263), .B0(N44), .B1(n262), .Y(n238) );
  AOI21XL U299 ( .A0(N322), .A1(n394), .B0(n395), .Y(n409) );
  OAI221X4 U300 ( .A0(n368), .A1(n338), .B0(n301), .B1(n329), .C0(n304), .Y(
        n239) );
  XOR2X1 U301 ( .A(n223), .B(\add_25/carry [6]), .Y(a5[6]) );
  AND2X1 U302 ( .A(\add_25/carry [5]), .B(res_addr[5]), .Y(\add_25/carry [6])
         );
  XOR2X1 U303 ( .A(sti_addr[1]), .B(\add_25/carry [5]), .Y(a5[5]) );
  AND2X1 U304 ( .A(\add_25/carry [4]), .B(sti_addr[0]), .Y(\add_25/carry [5])
         );
  XOR2X1 U305 ( .A(sti_addr[0]), .B(\add_25/carry [4]), .Y(a5[4]) );
  AND2X1 U306 ( .A(\add_25/carry [3]), .B(res_addr[3]), .Y(\add_25/carry [4])
         );
  XOR2X1 U307 ( .A(res_addr[3]), .B(\add_25/carry [3]), .Y(a5[3]) );
  AND2X1 U308 ( .A(res_addr[1]), .B(res_addr[2]), .Y(\add_25/carry [3]) );
  XOR2X1 U309 ( .A(res_addr[2]), .B(res_addr[1]), .Y(a5[2]) );
  XNOR2X1 U310 ( .A(n223), .B(\sub_26/carry [6]), .Y(a6[6]) );
  OR2X1 U311 ( .A(res_addr[5]), .B(\sub_26/carry [5]), .Y(\sub_26/carry [6])
         );
  XNOR2X1 U312 ( .A(\sub_26/carry [5]), .B(res_addr[5]), .Y(a6[5]) );
  OR2X1 U313 ( .A(sti_addr[0]), .B(\sub_26/carry [4]), .Y(\sub_26/carry [5])
         );
  XNOR2X1 U314 ( .A(\sub_26/carry [4]), .B(res_addr[4]), .Y(a6[4]) );
  OR2X1 U315 ( .A(res_addr[3]), .B(\sub_26/carry [3]), .Y(\sub_26/carry [4])
         );
  XNOR2X1 U316 ( .A(\sub_26/carry [3]), .B(res_addr[3]), .Y(a6[3]) );
  OR2X1 U317 ( .A(res_addr[2]), .B(res_addr[1]), .Y(\sub_26/carry [3]) );
  XNOR2X1 U318 ( .A(res_addr[1]), .B(res_addr[2]), .Y(a6[2]) );
  OR2X1 U319 ( .A(n249), .B(sti_addr[5]), .Y(n250) );
  OAI2BB1X1 U320 ( .A0N(n249), .A1N(sti_addr[5]), .B0(n250), .Y(a2[2]) );
  NOR2X1 U321 ( .A(n250), .B(n210), .Y(n251) );
  AO21X1 U322 ( .A0(n250), .A1(sti_addr[6]), .B0(n251), .Y(a2[3]) );
  NAND2X1 U323 ( .A(n251), .B(n254), .Y(n252) );
  OAI21XL U324 ( .A0(n251), .A1(n254), .B0(n252), .Y(a2[4]) );
  XNOR2X1 U325 ( .A(sti_addr[8]), .B(n252), .Y(a2[5]) );
  NOR2X1 U326 ( .A(sti_addr[8]), .B(n252), .Y(n253) );
  XOR2X1 U327 ( .A(n437), .B(n253), .Y(a2[6]) );
  OAI2BB1X1 U328 ( .A0N(res_addr[0]), .A1N(res_addr[1]), .B0(n255), .Y(a4[1])
         );
  OR2X1 U329 ( .A(n255), .B(res_addr[2]), .Y(n256) );
  OAI2BB1X1 U330 ( .A0N(n255), .A1N(res_addr[2]), .B0(n256), .Y(a4[2]) );
  NOR2X1 U331 ( .A(n256), .B(res_addr[3]), .Y(n257) );
  AO21X1 U332 ( .A0(n256), .A1(res_addr[3]), .B0(n257), .Y(a4[3]) );
  NAND2X1 U333 ( .A(n257), .B(n215), .Y(n258) );
  OAI21XL U334 ( .A0(n257), .A1(n215), .B0(n258), .Y(a4[4]) );
  XNOR2X1 U335 ( .A(res_addr[5]), .B(n258), .Y(a4[5]) );
  NOR2X1 U336 ( .A(sti_addr[1]), .B(n258), .Y(n259) );
  XOR2X1 U337 ( .A(n223), .B(n259), .Y(a4[6]) );
  NOR2X1 U338 ( .A(n272), .B(N42), .Y(n269) );
  NOR2X1 U339 ( .A(n272), .B(n274), .Y(n268) );
  NOR2X1 U340 ( .A(n274), .B(N43), .Y(n266) );
  NOR2X1 U341 ( .A(N42), .B(N43), .Y(n265) );
  AO22X1 U342 ( .A0(sti_di[5]), .A1(n266), .B0(sti_di[4]), .B1(n265), .Y(n260)
         );
  AOI221XL U343 ( .A0(sti_di[6]), .A1(n269), .B0(sti_di[7]), .B1(n268), .C0(
        n260), .Y(n263) );
  AO22X1 U344 ( .A0(sti_di[1]), .A1(n266), .B0(sti_di[0]), .B1(n265), .Y(n261)
         );
  AOI221XL U345 ( .A0(sti_di[2]), .A1(n269), .B0(sti_di[3]), .B1(n268), .C0(
        n261), .Y(n262) );
  AO22X1 U346 ( .A0(sti_di[13]), .A1(n266), .B0(sti_di[12]), .B1(n265), .Y(
        n264) );
  AOI221XL U347 ( .A0(sti_di[14]), .A1(n269), .B0(sti_di[15]), .B1(n268), .C0(
        n264), .Y(n271) );
  AO22X1 U348 ( .A0(sti_di[9]), .A1(n266), .B0(sti_di[8]), .B1(n265), .Y(n267)
         );
  AOI221XL U349 ( .A0(sti_di[10]), .A1(n269), .B0(sti_di[11]), .B1(n268), .C0(
        n267), .Y(n270) );
  NOR2BX1 U350 ( .AN(data[2]), .B(N313), .Y(n280) );
  AOI2BB1X1 U351 ( .A0N(n293), .A1N(data[1]), .B0(N311), .Y(n275) );
  AO22X1 U352 ( .A0(n275), .A1(data[0]), .B0(data[1]), .B1(n293), .Y(n279) );
  NOR2BX1 U353 ( .AN(N313), .B(data[2]), .Y(n276) );
  OAI22XL U354 ( .A0(n276), .A1(n290), .B0(N314), .B1(n276), .Y(n278) );
  OAI22XL U355 ( .A0(N314), .A1(n290), .B0(N314), .B1(n294), .Y(n277) );
  AOI221XL U356 ( .A0(data[3]), .A1(n280), .B0(n279), .B1(n278), .C0(n277), 
        .Y(n287) );
  NOR2X1 U357 ( .A(n295), .B(data[4]), .Y(n281) );
  OAI22XL U358 ( .A0(n281), .A1(n291), .B0(N316), .B1(n281), .Y(n282) );
  OAI21XL U359 ( .A0(data[6]), .A1(n296), .B0(n282), .Y(n286) );
  NAND2X1 U360 ( .A(data[4]), .B(n295), .Y(n283) );
  OA21XL U361 ( .A0(n287), .A1(n286), .B0(n285), .Y(n288) );
  AOI211X1 U362 ( .A0(n292), .A1(N318), .B0(N319), .C0(n288), .Y(n289) );
  NAND2X1 U363 ( .A(n306), .B(n307), .Y(n430) );
  AOI221XL U364 ( .A0(a3[6]), .A1(n308), .B0(a5[6]), .B1(n309), .C0(n310), .Y(
        n307) );
  NAND2X1 U365 ( .A(n313), .B(n314), .Y(n431) );
  AOI221XL U366 ( .A0(a3[5]), .A1(n308), .B0(a5[5]), .B1(n309), .C0(n310), .Y(
        n314) );
  NAND2X1 U367 ( .A(n315), .B(n316), .Y(n432) );
  AOI221XL U368 ( .A0(a3[4]), .A1(n308), .B0(a5[4]), .B1(n309), .C0(n310), .Y(
        n316) );
  NAND2X1 U369 ( .A(n317), .B(n318), .Y(n433) );
  AOI221XL U370 ( .A0(a3[3]), .A1(n308), .B0(a5[3]), .B1(n309), .C0(n310), .Y(
        n318) );
  NAND2X1 U371 ( .A(n319), .B(n320), .Y(n434) );
  AOI221XL U372 ( .A0(a3[2]), .A1(n308), .B0(a5[2]), .B1(n309), .C0(n310), .Y(
        n320) );
  NAND2X1 U373 ( .A(n321), .B(n322), .Y(n435) );
  AOI221XL U374 ( .A0(a3[1]), .A1(n308), .B0(N43), .B1(n309), .C0(n310), .Y(
        n322) );
  AOI22X1 U375 ( .A0(a4[1]), .A1(n311), .B0(N43), .B1(n312), .Y(n321) );
  NAND2X1 U376 ( .A(n324), .B(n325), .Y(n436) );
  AOI221XL U377 ( .A0(a3[0]), .A1(n308), .B0(res_addr[0]), .B1(n309), .C0(n326), .Y(n325) );
  CLKINVX1 U378 ( .A(n333), .Y(n331) );
  AOI21X1 U379 ( .A0(n334), .A1(n335), .B0(n336), .Y(n330) );
  CLKINVX1 U380 ( .A(n329), .Y(n337) );
  NAND3X1 U381 ( .A(n339), .B(n323), .C(n340), .Y(n174) );
  AOI22X1 U382 ( .A0(a1[6]), .A1(n341), .B0(n437), .B1(n342), .Y(n340) );
  NAND2X1 U383 ( .A(a2[6]), .B(n239), .Y(n339) );
  OAI22XL U384 ( .A0(n344), .A1(a2[0]), .B0(n345), .B1(n346), .Y(n173) );
  AOI221XL U385 ( .A0(a1[0]), .A1(n347), .B0(a2[0]), .B1(n343), .C0(n326), .Y(
        n345) );
  NAND3X1 U386 ( .A(n348), .B(n323), .C(n349), .Y(n172) );
  AOI22X1 U387 ( .A0(a1[1]), .A1(n341), .B0(sti_addr[4]), .B1(n342), .Y(n349)
         );
  NAND2X1 U388 ( .A(a2[1]), .B(n239), .Y(n348) );
  NAND3X1 U389 ( .A(n350), .B(n323), .C(n351), .Y(n171) );
  AOI22X1 U390 ( .A0(a1[2]), .A1(n341), .B0(sti_addr[5]), .B1(n342), .Y(n351)
         );
  NAND2X1 U391 ( .A(a2[2]), .B(n239), .Y(n350) );
  NAND3X1 U392 ( .A(n352), .B(n323), .C(n353), .Y(n170) );
  AOI22X1 U393 ( .A0(a1[3]), .A1(n341), .B0(sti_addr[6]), .B1(n342), .Y(n353)
         );
  NAND2X1 U394 ( .A(a2[3]), .B(n239), .Y(n352) );
  NAND3X1 U395 ( .A(n354), .B(n323), .C(n355), .Y(n169) );
  AOI22X1 U396 ( .A0(a1[4]), .A1(n341), .B0(sti_addr[7]), .B1(n342), .Y(n355)
         );
  NAND2X1 U397 ( .A(a2[4]), .B(n239), .Y(n354) );
  NAND3X1 U398 ( .A(n356), .B(n323), .C(n357), .Y(n168) );
  AOI22X1 U399 ( .A0(a1[5]), .A1(n341), .B0(sti_addr[8]), .B1(n342), .Y(n357)
         );
  CLKINVX1 U400 ( .A(n344), .Y(n342) );
  OAI2BB2XL U401 ( .B0(n338), .B1(n360), .A0N(n361), .A1N(n335), .Y(n359) );
  CLKINVX1 U402 ( .A(n301), .Y(n358) );
  NOR3X1 U403 ( .A(n328), .B(n364), .C(n240), .Y(n333) );
  OA21XL U404 ( .A0(n365), .A1(n366), .B0(n334), .Y(n328) );
  NOR2X1 U405 ( .A(n366), .B(n51), .Y(n336) );
  OAI21XL U406 ( .A0(n335), .A1(n240), .B0(n332), .Y(n347) );
  AOI2BB2X1 U407 ( .B0(n327), .B1(n367), .A0N(N76), .A1N(n299), .Y(n332) );
  NAND2X1 U408 ( .A(n49), .B(n50), .Y(n366) );
  NAND2X1 U409 ( .A(a2[5]), .B(n343), .Y(n356) );
  NAND2X1 U410 ( .A(n367), .B(n364), .Y(n338) );
  CLKINVX1 U411 ( .A(n360), .Y(n368) );
  CLKINVX1 U412 ( .A(n327), .Y(n364) );
  NAND4X1 U413 ( .A(n304), .B(n370), .C(n372), .D(n373), .Y(N92) );
  AOI32X1 U414 ( .A0(n327), .A1(n300), .A2(n374), .B0(n375), .B1(n367), .Y(
        n373) );
  CLKINVX1 U415 ( .A(n376), .Y(n375) );
  AND4X1 U416 ( .A(sti_addr[6]), .B(sti_addr[7]), .C(sti_addr[8]), .D(n362), 
        .Y(n378) );
  AND4X1 U417 ( .A(sti_addr[1]), .B(res_addr[4]), .C(n439), .D(n379), .Y(n362)
         );
  AND4X1 U418 ( .A(res_addr[0]), .B(res_addr[1]), .C(res_addr[2]), .D(
        res_addr[3]), .Y(n379) );
  NOR3BXL U419 ( .AN(sti_addr[9]), .B(a2[0]), .C(n299), .Y(n377) );
  NAND2X1 U420 ( .A(status[2]), .B(n374), .Y(n370) );
  NAND3X1 U421 ( .A(n209), .B(n214), .C(status[0]), .Y(n299) );
  OAI221XL U422 ( .A0(status[2]), .A1(n380), .B0(n381), .B1(n301), .C0(n382), 
        .Y(N91) );
  AOI31X1 U423 ( .A0(n376), .A1(n327), .A2(n367), .B0(n326), .Y(n382) );
  NOR3X1 U424 ( .A(status[1]), .B(status[2]), .C(status[0]), .Y(n326) );
  NAND4X1 U425 ( .A(n360), .B(a2[0]), .C(n383), .D(n384), .Y(n376) );
  NOR2X1 U426 ( .A(sti_addr[5]), .B(sti_addr[4]), .Y(n383) );
  NOR4BX1 U427 ( .AN(n385), .B(res_addr[1]), .C(res_addr[2]), .D(res_addr[0]), 
        .Y(n360) );
  NOR4X1 U428 ( .A(n439), .B(sti_addr[1]), .C(res_addr[4]), .D(res_addr[3]), 
        .Y(n385) );
  CLKINVX1 U429 ( .A(n300), .Y(n381) );
  AOI2BB2X1 U430 ( .B0(n386), .B1(n213), .A0N(N76), .A1N(status[1]), .Y(n380)
         );
  NAND2X1 U431 ( .A(n300), .B(n327), .Y(n386) );
  NOR4X1 U432 ( .A(res_di[7]), .B(res_di[6]), .C(res_di[5]), .D(res_di[4]), 
        .Y(n388) );
  NOR4X1 U433 ( .A(res_di[3]), .B(res_di[2]), .C(res_di[1]), .D(res_di[0]), 
        .Y(n387) );
  NAND3X1 U434 ( .A(n50), .B(n389), .C(n51), .Y(n300) );
  NAND3X1 U435 ( .A(status[0]), .B(status[1]), .C(status[2]), .Y(N90) );
  OAI221XL U436 ( .A0(n390), .A1(n391), .B0(n292), .B1(n392), .C0(n393), .Y(
        N345) );
  AOI21X1 U437 ( .A0(N329), .A1(n394), .B0(n395), .Y(n393) );
  CLKINVX1 U438 ( .A(res_di[7]), .Y(n391) );
  OAI221XL U439 ( .A0(n390), .A1(n396), .B0(n61), .B1(n392), .C0(n397), .Y(
        N344) );
  AOI21X1 U440 ( .A0(N328), .A1(n394), .B0(n395), .Y(n397) );
  CLKINVX1 U441 ( .A(res_di[6]), .Y(n396) );
  OAI221XL U442 ( .A0(n390), .A1(n398), .B0(n291), .B1(n392), .C0(n399), .Y(
        N343) );
  AOI21X1 U443 ( .A0(N327), .A1(n394), .B0(n395), .Y(n399) );
  CLKINVX1 U444 ( .A(res_di[5]), .Y(n398) );
  OAI221XL U445 ( .A0(n390), .A1(n400), .B0(n63), .B1(n392), .C0(n401), .Y(
        N342) );
  AOI21X1 U446 ( .A0(N326), .A1(n394), .B0(n395), .Y(n401) );
  CLKINVX1 U447 ( .A(res_di[4]), .Y(n400) );
  OAI221XL U448 ( .A0(n390), .A1(n402), .B0(n290), .B1(n392), .C0(n403), .Y(
        N341) );
  AOI21X1 U449 ( .A0(N325), .A1(n394), .B0(n395), .Y(n403) );
  OAI221XL U450 ( .A0(n390), .A1(n404), .B0(n65), .B1(n392), .C0(n405), .Y(
        N340) );
  AOI21X1 U451 ( .A0(N324), .A1(n394), .B0(n395), .Y(n405) );
  CLKINVX1 U452 ( .A(res_di[2]), .Y(n404) );
  OAI221XL U453 ( .A0(n390), .A1(n406), .B0(n66), .B1(n392), .C0(n407), .Y(
        N339) );
  AOI21X1 U454 ( .A0(N323), .A1(n394), .B0(n395), .Y(n407) );
  CLKINVX1 U455 ( .A(res_di[1]), .Y(n406) );
  OAI221XL U456 ( .A0(n390), .A1(n408), .B0(n67), .B1(n392), .C0(n409), .Y(
        N338) );
  CLKINVX1 U457 ( .A(res_di[0]), .Y(n408) );
  CLKINVX1 U458 ( .A(n371), .Y(n367) );
  NAND3X1 U459 ( .A(n213), .B(n209), .C(status[2]), .Y(n371) );
  CLKINVX1 U460 ( .A(n240), .Y(n361) );
  OAI22XL U461 ( .A0(n412), .A1(n413), .B0(res_di[7]), .B1(n292), .Y(n411) );
  AND2X1 U462 ( .A(n292), .B(res_di[7]), .Y(n413) );
  AOI32X1 U463 ( .A0(n414), .A1(n415), .A2(n416), .B0(n417), .B1(n418), .Y(
        n412) );
  OAI21XL U464 ( .A0(n419), .A1(n61), .B0(res_di[6]), .Y(n418) );
  NAND2X1 U465 ( .A(n419), .B(n61), .Y(n417) );
  CLKINVX1 U466 ( .A(n420), .Y(n419) );
  OAI32X1 U467 ( .A0(n421), .A1(res_di[4]), .A2(n63), .B0(res_di[5]), .B1(n291), .Y(n420) );
  CLKINVX1 U468 ( .A(n415), .Y(n421) );
  AOI22X1 U469 ( .A0(res_di[6]), .A1(n61), .B0(res_di[4]), .B1(n63), .Y(n416)
         );
  NAND2X1 U470 ( .A(res_di[5]), .B(n291), .Y(n415) );
  OAI221XL U471 ( .A0(n422), .A1(n423), .B0(n290), .B1(n424), .C0(n425), .Y(
        n414) );
  OAI21XL U472 ( .A0(n426), .A1(data[3]), .B0(n402), .Y(n425) );
  CLKINVX1 U473 ( .A(n426), .Y(n424) );
  NOR2X1 U474 ( .A(res_di[2]), .B(n65), .Y(n426) );
  OAI2BB2XL U475 ( .B0(data[3]), .B1(n402), .A0N(n65), .A1N(res_di[2]), .Y(
        n423) );
  CLKINVX1 U476 ( .A(res_di[3]), .Y(n402) );
  ACHCINX2 U477 ( .CIN(data[0]), .A(res_di[1]), .B(n66), .CO(n422) );
  OAI2BB2XL U478 ( .B0(n298), .B1(n334), .A0N(n427), .A1N(n389), .Y(N119) );
  OAI21XL U479 ( .A0(n298), .A1(n369), .B0(n428), .Y(n427) );
  NAND3X1 U480 ( .A(n369), .B(n365), .C(n49), .Y(n334) );
  CLKINVX1 U481 ( .A(n410), .Y(n298) );
  MXI2X1 U482 ( .A(n428), .B(n429), .S0(n50), .Y(N118) );
  NAND2X1 U483 ( .A(n410), .B(n365), .Y(n429) );
  CLKINVX1 U484 ( .A(n428), .Y(N117) );
  NAND2X1 U485 ( .A(n51), .B(n410), .Y(n428) );
  NAND2X1 U486 ( .A(n301), .B(n240), .Y(n410) );
  NOR2X1 U487 ( .A(n209), .B(status[0]), .Y(n374) );
endmodule

