/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : S-2021.06-SP2
// Date      : Sun Mar 13 23:05:37 2022
/////////////////////////////////////////////////////////////


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n441, n442, n438, n439, n440,
         n443, n444, n445, n446, \next_status[2] , \work[2] , N75, N76, N77,
         N78, N253, N254, N255, N256, N257, N258, N259, N260, N261, N262, N263,
         N264, N265, N266, N270, N271, N272, N273, N274, N275, N276, N277,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, \add_x_9/A[13] , \add_x_9/A[11] , \add_x_9/A[10] ,
         \add_x_9/A[9] , \add_x_9/A[8] , \add_x_9/A[7] , \add_x_9/A[6] ,
         \add_x_9/A[4] , \add_x_9/A[1] , \add_x_9/A[0] , n144, n147, n148,
         n149, n150, n151, n152, n153, n158, n160, n162, n164, n166, n169,
         n171, n173, n175, n177, n179, n181, n183, n185, n187, n189, n191,
         n193, n195, n197, n199, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420;
  wire   [2:0] status;
  wire   [3:0] count;
  wire   [7:0] data;
  assign lbp_addr[13] = \add_x_9/A[13] ;
  assign lbp_addr[11] = \add_x_9/A[11] ;
  assign lbp_addr[10] = \add_x_9/A[10] ;
  assign lbp_addr[9] = \add_x_9/A[9] ;
  assign lbp_addr[8] = \add_x_9/A[8] ;
  assign lbp_addr[7] = \add_x_9/A[7] ;
  assign lbp_addr[4] = \add_x_9/A[4] ;
  assign lbp_addr[1] = \add_x_9/A[1] ;
  assign lbp_addr[0] = \add_x_9/A[0] ;

  DFFRX1 \status_reg[0]  ( .D(n141), .CK(clk), .RN(n350), .Q(status[0]) );
  DFFRX1 \status_reg[1]  ( .D(n142), .CK(clk), .RN(n350), .Q(status[1]) );
  DFFRX1 \status_reg[2]  ( .D(\next_status[2] ), .CK(clk), .RN(n350), .Q(
        status[2]), .QN(n400) );
  DFFRX1 \count_reg[0]  ( .D(N75), .CK(clk), .RN(n350), .Q(count[0]), .QN(n403) );
  DFFRX1 \count_reg[1]  ( .D(N76), .CK(clk), .RN(n350), .Q(count[1]), .QN(n412) );
  DFFRX1 \count_reg[2]  ( .D(N77), .CK(clk), .RN(n350), .Q(count[2]), .QN(n420) );
  DFFRX1 \count_reg[3]  ( .D(N78), .CK(clk), .RN(n350), .Q(count[3]), .QN(n413) );
  DFFRX1 \data_reg[7]  ( .D(n126), .CK(clk), .RN(n350), .Q(data[7]) );
  DFFRX1 \data_reg[6]  ( .D(n125), .CK(clk), .RN(n350), .Q(data[6]) );
  DFFRX1 \data_reg[5]  ( .D(n124), .CK(clk), .RN(n350), .Q(data[5]), .QN(n418)
         );
  DFFRX1 \data_reg[4]  ( .D(n123), .CK(clk), .RN(n350), .Q(data[4]) );
  DFFRX1 \data_reg[3]  ( .D(n122), .CK(clk), .RN(n350), .Q(data[3]), .QN(n415)
         );
  DFFRX1 \data_reg[2]  ( .D(n121), .CK(clk), .RN(n350), .Q(data[2]), .QN(n203)
         );
  DFFRX1 \data_reg[1]  ( .D(n120), .CK(clk), .RN(n350), .Q(data[1]), .QN(n205)
         );
  DFFRX1 \data_reg[0]  ( .D(n119), .CK(clk), .RN(n350), .Q(data[0]) );
  DFFSX1 \lbp_addr_reg[0]  ( .D(N253), .CK(clk), .SN(n350), .Q(n442), .QN(n406) );
  DFFRX1 \lbp_addr_reg[13]  ( .D(N266), .CK(clk), .RN(n350), .QN(n419) );
  DFFRX1 \lbp_addr_reg[11]  ( .D(N264), .CK(clk), .RN(n350), .Q(n409), .QN(
        n417) );
  DFFRX1 \lbp_addr_reg[10]  ( .D(N263), .CK(clk), .RN(n350), .QN(n416) );
  DFFRX1 \lbp_addr_reg[8]  ( .D(N261), .CK(clk), .RN(n350), .Q(n410), .QN(n414) );
  DFFRX1 \lbp_addr_reg[4]  ( .D(N257), .CK(clk), .RN(n350), .Q(n408), .QN(n411) );
  DFFRX1 \lbp_data_reg[7]  ( .D(N277), .CK(clk), .RN(n350), .QN(n153) );
  DFFRX1 finish_reg ( .D(\work[2] ), .CK(clk), .RN(n350), .QN(n169) );
  DFFRX1 lbp_valid_reg ( .D(n143), .CK(clk), .RN(n350), .QN(n171) );
  DFFRX1 \lbp_data_reg[1]  ( .D(N271), .CK(clk), .RN(n350), .QN(n152) );
  DFFRX1 \lbp_data_reg[2]  ( .D(N272), .CK(clk), .RN(n350), .Q(n445), .QN(n173) );
  DFFRX1 \lbp_data_reg[3]  ( .D(N273), .CK(clk), .RN(n350), .QN(n150) );
  DFFRX1 \lbp_data_reg[4]  ( .D(N274), .CK(clk), .RN(n350), .Q(n444), .QN(n175) );
  DFFRX1 \lbp_data_reg[5]  ( .D(N275), .CK(clk), .RN(n350), .QN(n151) );
  DFFRX1 \lbp_data_reg[6]  ( .D(N276), .CK(clk), .RN(n350), .Q(n443), .QN(n177) );
  DFFRX1 \gray_addr_reg[4]  ( .D(n138), .CK(clk), .RN(n350), .Q(n430), .QN(
        n197) );
  DFFRX1 \gray_addr_reg[0]  ( .D(n134), .CK(clk), .RN(n350), .Q(n434), .QN(
        n199) );
  DFFRX1 \gray_addr_reg[11]  ( .D(n131), .CK(clk), .RN(n350), .Q(n423), .QN(
        n179) );
  DFFRX1 \gray_addr_reg[8]  ( .D(n128), .CK(clk), .RN(n350), .Q(n426), .QN(
        n189) );
  DFFRX1 \gray_addr_reg[6]  ( .D(n140), .CK(clk), .RN(n350), .Q(n428), .QN(
        n185) );
  DFFRX1 \gray_addr_reg[2]  ( .D(n136), .CK(clk), .RN(n350), .Q(n432), .QN(
        n191) );
  DFFRX1 \gray_addr_reg[9]  ( .D(n129), .CK(clk), .RN(n350), .Q(n425), .QN(
        n181) );
  DFFRX1 \gray_addr_reg[10]  ( .D(n130), .CK(clk), .RN(n350), .Q(n424), .QN(
        n193) );
  DFFRX1 \gray_addr_reg[13]  ( .D(n133), .CK(clk), .RN(n350), .Q(n421), .QN(
        n195) );
  DFFRX1 \gray_addr_reg[12]  ( .D(n132), .CK(clk), .RN(n350), .Q(n422), .QN(
        n183) );
  DFFRX1 \gray_addr_reg[3]  ( .D(n137), .CK(clk), .RN(n350), .Q(n431), .QN(
        n187) );
  DFFRX1 \lbp_addr_reg[9]  ( .D(N262), .CK(clk), .RN(n350), .Q(n436), .QN(n407) );
  DFFRX2 \lbp_addr_reg[12]  ( .D(N265), .CK(clk), .RN(n350), .Q(n435), .QN(
        n404) );
  DFFSX1 \lbp_addr_reg[7]  ( .D(N260), .CK(clk), .SN(n350), .Q(n437), .QN(n405) );
  DFFRX2 \lbp_addr_reg[5]  ( .D(N258), .CK(clk), .RN(n350), .Q(n438), .QN(n402) );
  DFFRX1 \lbp_addr_reg[1]  ( .D(N254), .CK(clk), .RN(n350), .Q(n441), .QN(n401) );
  DFFRX1 \lbp_addr_reg[3]  ( .D(N256), .CK(clk), .RN(n350), .Q(n439), .QN(n399) );
  DFFRX1 \gray_addr_reg[7]  ( .D(n127), .CK(clk), .RN(n350), .Q(n427), .QN(
        n166) );
  DFFRX1 \gray_addr_reg[5]  ( .D(n139), .CK(clk), .RN(n350), .Q(n429), .QN(
        n164) );
  DFFRX1 \gray_addr_reg[1]  ( .D(n135), .CK(clk), .RN(n350), .Q(n433), .QN(
        n162) );
  DFFRX1 \lbp_data_reg[0]  ( .D(N270), .CK(clk), .RN(n350), .Q(n446), .QN(n160) );
  DFFRX1 \lbp_addr_reg[2]  ( .D(N255), .CK(clk), .RN(n350), .Q(n440), .QN(n149) );
  DFFRHQX1 \lbp_addr_reg[6]  ( .D(N259), .CK(clk), .RN(n350), .Q(
        \add_x_9/A[6] ) );
  ACHCINX2 U175 ( .CIN(n290), .A(gray_data[2]), .B(n203), .CO(n291) );
  INVXL U176 ( .A(gray_data[4]), .Y(n292) );
  INVXL U177 ( .A(n318), .Y(n389) );
  AOI211XL U178 ( .A0(\add_x_9/A[13] ), .A1(n281), .B0(n280), .C0(n279), .Y(
        n282) );
  NAND2X2 U179 ( .A(n289), .B(n288), .Y(n290) );
  INVX1 U180 ( .A(n212), .Y(n144) );
  AND2X1 U181 ( .A(n349), .B(n346), .Y(n142) );
  INVX2 U182 ( .A(n222), .Y(n396) );
  NOR2BX2 U183 ( .AN(n340), .B(n403), .Y(n212) );
  NOR2X4 U184 ( .A(n207), .B(n413), .Y(n208) );
  NAND2X2 U185 ( .A(n299), .B(n357), .Y(n222) );
  NOR2X4 U186 ( .A(n211), .B(n221), .Y(n206) );
  NAND2BX2 U187 ( .AN(n286), .B(n285), .Y(n289) );
  INVX1 U188 ( .A(n221), .Y(n357) );
  INVX1 U189 ( .A(n299), .Y(n224) );
  INVX1 U190 ( .A(\add_x_9/A[6] ), .Y(n158) );
  NAND2X1 U191 ( .A(count[2]), .B(n413), .Y(n211) );
  INVX12 U192 ( .A(reset), .Y(n350) );
  INVX1 U193 ( .A(gray_data[6]), .Y(n397) );
  INVX12 U194 ( .A(1'b0), .Y(gray_req) );
  INVXL U196 ( .A(gray_data[0]), .Y(n285) );
  OAI2BB1XL U197 ( .A0N(n374), .A1N(n330), .B0(n343), .Y(n334) );
  NAND2X1 U198 ( .A(n412), .B(n403), .Y(n221) );
  NOR2X1 U199 ( .A(count[3]), .B(count[2]), .Y(n299) );
  XOR2X1 U200 ( .A(n435), .B(n276), .Y(n204) );
  OAI2BB2XL U201 ( .B0(n144), .B1(n278), .A0N(n208), .A1N(n421), .Y(n279) );
  OAI2BB2XL U202 ( .B0(n144), .B1(n147), .A0N(n208), .A1N(n424), .Y(n263) );
  INVXL U203 ( .A(n226), .Y(n227) );
  INVXL U204 ( .A(n359), .Y(n209) );
  INVXL U205 ( .A(n206), .Y(n210) );
  XNOR2X1 U206 ( .A(lbp_addr[6]), .B(n308), .Y(n310) );
  NAND2BX1 U207 ( .AN(n438), .B(n375), .Y(n308) );
  INVXL U208 ( .A(n243), .Y(n244) );
  NOR2XL U209 ( .A(n211), .B(count[1]), .Y(n340) );
  NOR2XL U210 ( .A(count[2]), .B(n221), .Y(n207) );
  INVX16 U211 ( .A(n158), .Y(lbp_addr[6]) );
  NAND3XL U212 ( .A(n395), .B(n394), .C(n393), .Y(n127) );
  OAI2BB2XL U213 ( .B0(n210), .B1(n209), .A0N(n208), .A1N(n432), .Y(n218) );
  NAND2XL U214 ( .A(n257), .B(n256), .Y(n128) );
  NOR2BX1 U215 ( .AN(lbp_data[5]), .B(n284), .Y(N276) );
  NOR2BX1 U216 ( .AN(n444), .B(n284), .Y(N275) );
  NOR2BX1 U217 ( .AN(lbp_data[3]), .B(n284), .Y(N274) );
  NOR2BX1 U218 ( .AN(n445), .B(n284), .Y(N273) );
  NOR2BX1 U219 ( .AN(lbp_data[1]), .B(n284), .Y(N272) );
  NOR2BX1 U220 ( .AN(n446), .B(n284), .Y(N271) );
  NOR2BX1 U221 ( .AN(n443), .B(n284), .Y(N277) );
  NAND2BX1 U222 ( .AN(n284), .B(n143), .Y(n347) );
  XOR2X1 U223 ( .A(\add_x_9/A[10] ), .B(n262), .Y(n147) );
  XOR2X1 U224 ( .A(\add_x_9/A[8] ), .B(n252), .Y(n148) );
  OAI22X1 U225 ( .A0(count[0]), .A1(n299), .B0(n403), .B1(n301), .Y(n343) );
  CLKINVX1 U226 ( .A(n214), .Y(n384) );
  CLKINVX1 U227 ( .A(n368), .Y(n366) );
  NAND2BX1 U228 ( .AN(\add_x_9/A[7] ), .B(n389), .Y(n252) );
  NOR4X1 U229 ( .A(\add_x_9/A[7] ), .B(\add_x_9/A[8] ), .C(\add_x_9/A[9] ), 
        .D(\add_x_9/A[10] ), .Y(n234) );
  BUFX16 U230 ( .A(n437), .Y(\add_x_9/A[7] ) );
  INVX12 U231 ( .A(n153), .Y(lbp_data[7]) );
  NOR3X1 U232 ( .A(n440), .B(\add_x_9/A[1] ), .C(\add_x_9/A[0] ), .Y(n320) );
  BUFX16 U233 ( .A(n441), .Y(\add_x_9/A[1] ) );
  INVX12 U234 ( .A(n151), .Y(lbp_data[5]) );
  INVX12 U235 ( .A(n150), .Y(lbp_data[3]) );
  INVX12 U236 ( .A(n152), .Y(lbp_data[1]) );
  NAND2BX1 U237 ( .AN(\add_x_9/A[9] ), .B(n235), .Y(n262) );
  BUFX16 U238 ( .A(n436), .Y(\add_x_9/A[9] ) );
  NOR2X2 U239 ( .A(\add_x_9/A[4] ), .B(n330), .Y(n375) );
  XNOR2X1 U240 ( .A(\add_x_9/A[4] ), .B(n330), .Y(n332) );
  INVX16 U241 ( .A(n411), .Y(\add_x_9/A[4] ) );
  NAND2BX1 U242 ( .AN(\add_x_9/A[11] ), .B(n242), .Y(n276) );
  INVX16 U243 ( .A(n417), .Y(\add_x_9/A[11] ) );
  NOR2X1 U244 ( .A(\add_x_9/A[8] ), .B(n252), .Y(n235) );
  INVX16 U245 ( .A(n414), .Y(\add_x_9/A[8] ) );
  INVX16 U246 ( .A(n419), .Y(\add_x_9/A[13] ) );
  BUFX16 U247 ( .A(n442), .Y(\add_x_9/A[0] ) );
  NOR2X1 U248 ( .A(\add_x_9/A[11] ), .B(n267), .Y(n268) );
  CLKINVX1 U249 ( .A(n329), .Y(n374) );
  AOI2BB1X2 U250 ( .A0N(n224), .A1N(n358), .B0(n220), .Y(n329) );
  NOR2X2 U251 ( .A(n301), .B(n220), .Y(n283) );
  BUFX16 U252 ( .A(n440), .Y(lbp_addr[2]) );
  INVX12 U253 ( .A(n160), .Y(lbp_data[0]) );
  INVX12 U254 ( .A(n162), .Y(gray_addr[1]) );
  INVX12 U255 ( .A(n164), .Y(gray_addr[5]) );
  AOI22XL U256 ( .A0(n206), .A1(n369), .B0(n208), .B1(n429), .Y(n377) );
  INVX12 U257 ( .A(n166), .Y(gray_addr[7]) );
  AOI22XL U258 ( .A0(n212), .A1(n390), .B0(n208), .B1(n427), .Y(n394) );
  INVX12 U259 ( .A(n399), .Y(lbp_addr[3]) );
  NAND2BX1 U260 ( .AN(n439), .B(n320), .Y(n330) );
  INVX12 U261 ( .A(n169), .Y(finish) );
  INVX12 U262 ( .A(n171), .Y(lbp_valid) );
  NOR4X1 U263 ( .A(count[1]), .B(count[2]), .C(n413), .D(n403), .Y(n143) );
  NOR2X2 U264 ( .A(n357), .B(n224), .Y(n392) );
  NOR2X1 U265 ( .A(\add_x_9/A[10] ), .B(n262), .Y(n242) );
  INVX16 U266 ( .A(n416), .Y(\add_x_9/A[10] ) );
  INVX12 U267 ( .A(n173), .Y(lbp_data[2]) );
  INVX12 U268 ( .A(n175), .Y(lbp_data[4]) );
  INVX12 U269 ( .A(n177), .Y(lbp_data[6]) );
  INVX12 U270 ( .A(n179), .Y(gray_addr[11]) );
  NAND2XL U271 ( .A(n249), .B(n248), .Y(n131) );
  INVX12 U272 ( .A(n181), .Y(gray_addr[9]) );
  OAI21XL U273 ( .A0(n258), .A1(n407), .B0(n230), .Y(n129) );
  INVX12 U274 ( .A(n183), .Y(gray_addr[12]) );
  OAI211XL U275 ( .A0(n269), .A1(n404), .B0(n238), .C0(n237), .Y(n132) );
  INVX12 U276 ( .A(n185), .Y(gray_addr[6]) );
  INVX12 U277 ( .A(n187), .Y(gray_addr[3]) );
  INVX12 U278 ( .A(n189), .Y(gray_addr[8]) );
  OAI2BB2XL U279 ( .B0(n144), .B1(n148), .A0N(n208), .A1N(n426), .Y(n253) );
  INVX12 U280 ( .A(n191), .Y(gray_addr[2]) );
  OAI21XL U281 ( .A0(n319), .A1(n149), .B0(n219), .Y(n136) );
  INVX12 U282 ( .A(n193), .Y(gray_addr[10]) );
  OAI21XL U283 ( .A0(n283), .A1(n267), .B0(n266), .Y(n130) );
  INVX12 U284 ( .A(n195), .Y(gray_addr[13]) );
  OAI21XL U285 ( .A0(n283), .A1(n305), .B0(n282), .Y(n133) );
  INVX12 U286 ( .A(n197), .Y(gray_addr[4]) );
  NAND2XL U287 ( .A(n208), .B(n430), .Y(n336) );
  INVX12 U288 ( .A(n199), .Y(gray_addr[0]) );
  NAND2XL U289 ( .A(n208), .B(n434), .Y(n341) );
  INVX12 U290 ( .A(n402), .Y(lbp_addr[5]) );
  INVX12 U291 ( .A(n404), .Y(lbp_addr[12]) );
  ADDHXL U292 ( .A(n435), .B(n272), .CO(n273), .S(n233) );
  NAND2BX1 U293 ( .AN(n205), .B(n287), .Y(n288) );
  INVXL U294 ( .A(n277), .Y(n278) );
  OAI2BB2XL U295 ( .B0(n144), .B1(n204), .A0N(n208), .A1N(n422), .Y(n236) );
  OAI2BB2XL U296 ( .B0(n144), .B1(n227), .A0N(n208), .A1N(n425), .Y(n228) );
  AOI211XL U297 ( .A0(n208), .A1(n433), .B0(n382), .C0(n381), .Y(n387) );
  NAND2XL U298 ( .A(n387), .B(n386), .Y(n135) );
  NAND2X1 U299 ( .A(count[1]), .B(count[0]), .Y(n358) );
  NOR3X1 U300 ( .A(count[2]), .B(n413), .C(n221), .Y(n220) );
  NOR2X1 U301 ( .A(n412), .B(n211), .Y(n301) );
  OAI21XL U302 ( .A0(n329), .A1(n406), .B0(n343), .Y(n385) );
  AOI21XL U303 ( .A0(\add_x_9/A[1] ), .A1(n374), .B0(n385), .Y(n319) );
  NOR3XL U304 ( .A(n329), .B(\add_x_9/A[0] ), .C(\add_x_9/A[1] ), .Y(n382) );
  NOR2XL U305 ( .A(\add_x_9/A[1] ), .B(\add_x_9/A[0] ), .Y(n213) );
  AOI2BB2X1 U306 ( .B0(lbp_addr[2]), .B1(n213), .A0N(lbp_addr[2]), .A1N(n213), 
        .Y(n216) );
  OAI221XL U307 ( .A0(count[0]), .A1(n301), .B0(n299), .B1(n301), .C0(n358), 
        .Y(n214) );
  AO22X1 U308 ( .A0(n212), .A1(n216), .B0(n384), .B1(n215), .Y(n217) );
  AOI211XL U309 ( .A0(n382), .A1(n149), .B0(n218), .C0(n217), .Y(n219) );
  CLKINVX1 U310 ( .A(n283), .Y(n391) );
  OAI21XL U311 ( .A0(n283), .A1(n405), .B0(n222), .Y(n255) );
  AOI21XL U312 ( .A0(\add_x_9/A[8] ), .A1(n391), .B0(n255), .Y(n258) );
  NOR3XL U313 ( .A(n283), .B(\add_x_9/A[7] ), .C(\add_x_9/A[8] ), .Y(n254) );
  ADDHXL U314 ( .A(lbp_addr[2]), .B(n223), .CO(n321), .S(n359) );
  AO22X1 U315 ( .A0(n206), .A1(n364), .B0(n392), .B1(n225), .Y(n229) );
  NAND3BX1 U316 ( .AN(lbp_addr[6]), .B(n375), .C(n402), .Y(n318) );
  AOI2BB2X1 U317 ( .B0(\add_x_9/A[9] ), .B1(n235), .A0N(\add_x_9/A[9] ), .A1N(
        n235), .Y(n226) );
  AOI211XL U318 ( .A0(n254), .A1(n407), .B0(n229), .C0(n228), .Y(n230) );
  OAI21XL U319 ( .A0(n283), .A1(n234), .B0(n222), .Y(n247) );
  AOI21XL U320 ( .A0(\add_x_9/A[11] ), .A1(n391), .B0(n247), .Y(n269) );
  ADDHXL U321 ( .A(\add_x_9/A[9] ), .B(n231), .CO(n259), .S(n364) );
  ADDHXL U322 ( .A(\add_x_9/A[9] ), .B(n232), .CO(n260), .S(n225) );
  AOI22XL U323 ( .A0(n206), .A1(n367), .B0(n392), .B1(n233), .Y(n238) );
  INVXL U324 ( .A(n234), .Y(n267) );
  AOI31XL U325 ( .A0(n268), .A1(n391), .A2(n404), .B0(n236), .Y(n237) );
  ADDHXL U326 ( .A(\add_x_9/A[11] ), .B(n239), .CO(n270), .S(n365) );
  ADDHXL U327 ( .A(\add_x_9/A[11] ), .B(n240), .CO(n272), .S(n241) );
  AO22X1 U328 ( .A0(n206), .A1(n365), .B0(n392), .B1(n241), .Y(n246) );
  AOI2BB2X1 U329 ( .B0(\add_x_9/A[11] ), .B1(n242), .A0N(\add_x_9/A[11] ), 
        .A1N(n242), .Y(n243) );
  OAI2BB2XL U330 ( .B0(n144), .B1(n244), .A0N(n208), .A1N(n423), .Y(n245) );
  AOI211XL U331 ( .A0(\add_x_9/A[11] ), .A1(n247), .B0(n246), .C0(n245), .Y(
        n249) );
  NAND2XL U332 ( .A(n268), .B(n391), .Y(n248) );
  ADDHXL U333 ( .A(\add_x_9/A[8] ), .B(n250), .CO(n231), .S(n352) );
  ADDHXL U334 ( .A(\add_x_9/A[8] ), .B(\add_x_9/A[7] ), .CO(n232), .S(n251) );
  AOI22XL U335 ( .A0(n206), .A1(n352), .B0(n392), .B1(n251), .Y(n257) );
  AOI211XL U336 ( .A0(\add_x_9/A[8] ), .A1(n255), .B0(n254), .C0(n253), .Y(
        n256) );
  OAI21XL U337 ( .A0(n283), .A1(n407), .B0(n258), .Y(n265) );
  ADDHXL U338 ( .A(\add_x_9/A[10] ), .B(n259), .CO(n239), .S(n353) );
  ADDHXL U339 ( .A(\add_x_9/A[10] ), .B(n260), .CO(n240), .S(n261) );
  AO22X1 U340 ( .A0(n206), .A1(n353), .B0(n392), .B1(n261), .Y(n264) );
  AOI211XL U341 ( .A0(\add_x_9/A[10] ), .A1(n265), .B0(n264), .C0(n263), .Y(
        n266) );
  NAND3BX1 U342 ( .AN(\add_x_9/A[13] ), .B(n268), .C(n404), .Y(n305) );
  OAI21XL U343 ( .A0(n283), .A1(n404), .B0(n269), .Y(n281) );
  ADDHXL U344 ( .A(n435), .B(n270), .CO(n271), .S(n367) );
  AOI2BB2X1 U345 ( .B0(n271), .B1(\add_x_9/A[13] ), .A0N(n271), .A1N(
        \add_x_9/A[13] ), .Y(n354) );
  AOI2BB2X1 U346 ( .B0(n273), .B1(\add_x_9/A[13] ), .A0N(n273), .A1N(
        \add_x_9/A[13] ), .Y(n274) );
  AO22X1 U347 ( .A0(n206), .A1(n354), .B0(n392), .B1(n274), .Y(n280) );
  OAI21XL U348 ( .A0(n435), .A1(n276), .B0(\add_x_9/A[13] ), .Y(n275) );
  OAI31XL U349 ( .A0(n435), .A1(\add_x_9/A[13] ), .A2(n276), .B0(n275), .Y(
        n277) );
  NOR2X1 U350 ( .A(status[0]), .B(status[2]), .Y(n346) );
  NAND2X2 U351 ( .A(status[1]), .B(n346), .Y(n284) );
  INVXL U352 ( .A(gray_data[1]), .Y(n287) );
  OAI21XL U353 ( .A0(data[1]), .A1(n287), .B0(data[0]), .Y(n286) );
  AOI222XL U354 ( .A0(gray_data[3]), .A1(n291), .B0(gray_data[3]), .B1(n415), 
        .C0(n291), .C1(n415), .Y(n293) );
  AOI222XL U355 ( .A0(data[4]), .A1(n293), .B0(data[4]), .B1(n292), .C0(n293), 
        .C1(n292), .Y(n294) );
  ACHCONX2 U356 ( .A(n418), .B(gray_data[5]), .CI(n294), .CON(n295) );
  AOI222XL U357 ( .A0(data[6]), .A1(n295), .B0(data[6]), .B1(n397), .C0(n295), 
        .C1(n397), .Y(n297) );
  OAI2BB1X1 U358 ( .A0N(n297), .A1N(gray_data[7]), .B0(data[7]), .Y(n296) );
  OAI21XL U359 ( .A0(n297), .A1(gray_data[7]), .B0(n296), .Y(n298) );
  AOI211X1 U360 ( .A0(n299), .A1(n412), .B0(n284), .C0(n298), .Y(N270) );
  NOR2XL U361 ( .A(count[0]), .B(n284), .Y(N75) );
  NOR2XL U362 ( .A(n420), .B(n358), .Y(n300) );
  AOI211XL U363 ( .A0(n420), .A1(n358), .B0(n300), .C0(n284), .Y(N77) );
  AOI2BB2X1 U364 ( .B0(count[0]), .B1(n301), .A0N(n413), .A1N(n300), .Y(n302)
         );
  NOR2XL U365 ( .A(n302), .B(n284), .Y(N78) );
  NOR4XL U366 ( .A(n406), .B(n401), .C(n149), .D(n399), .Y(n303) );
  NAND4XL U367 ( .A(\add_x_9/A[4] ), .B(n438), .C(lbp_addr[6]), .D(n303), .Y(
        n345) );
  AND4X1 U368 ( .A(\add_x_9/A[8] ), .B(\add_x_9/A[9] ), .C(n435), .D(
        \add_x_9/A[13] ), .Y(n304) );
  NAND3XL U369 ( .A(\add_x_9/A[10] ), .B(\add_x_9/A[11] ), .C(n304), .Y(n344)
         );
  OAI211XL U370 ( .A0(n405), .A1(n344), .B0(n318), .C0(n305), .Y(n306) );
  INVXL U371 ( .A(n306), .Y(n307) );
  AO21X1 U372 ( .A0(n345), .A1(n307), .B0(status[1]), .Y(n349) );
  AOI21XL U373 ( .A0(\add_x_9/A[4] ), .A1(n374), .B0(n334), .Y(n378) );
  OAI21XL U374 ( .A0(n329), .A1(n402), .B0(n378), .Y(n316) );
  ADDHXL U375 ( .A(lbp_addr[6]), .B(n309), .CO(n363), .S(n351) );
  AO22X1 U376 ( .A0(n212), .A1(n310), .B0(n206), .B1(n351), .Y(n315) );
  ADDHXL U377 ( .A(lbp_addr[2]), .B(n311), .CO(n323), .S(n215) );
  AOI2BB2X1 U378 ( .B0(n312), .B1(lbp_addr[6]), .A0N(n312), .A1N(lbp_addr[6]), 
        .Y(n313) );
  AO22X1 U379 ( .A0(n208), .A1(n428), .B0(n384), .B1(n313), .Y(n314) );
  AOI211XL U380 ( .A0(lbp_addr[6]), .A1(n316), .B0(n315), .C0(n314), .Y(n317)
         );
  OAI21XL U381 ( .A0(n329), .A1(n318), .B0(n317), .Y(n140) );
  OAI21XL U382 ( .A0(n329), .A1(n149), .B0(n319), .Y(n327) );
  AOI2BB2X1 U383 ( .B0(n439), .B1(n320), .A0N(n439), .A1N(n320), .Y(n322) );
  ADDHXL U384 ( .A(n439), .B(n321), .CO(n331), .S(n360) );
  AO22X1 U385 ( .A0(n212), .A1(n322), .B0(n206), .B1(n360), .Y(n326) );
  ADDHXL U386 ( .A(n439), .B(n323), .CO(n333), .S(n324) );
  AO22X1 U387 ( .A0(n208), .A1(n431), .B0(n384), .B1(n324), .Y(n325) );
  AOI211XL U388 ( .A0(n439), .A1(n327), .B0(n326), .C0(n325), .Y(n328) );
  OAI21XL U389 ( .A0(n329), .A1(n330), .B0(n328), .Y(n137) );
  ADDHXL U390 ( .A(\add_x_9/A[4] ), .B(n331), .CO(n362), .S(n361) );
  AOI22XL U391 ( .A0(n212), .A1(n332), .B0(n206), .B1(n361), .Y(n339) );
  ADDHXL U392 ( .A(\add_x_9/A[4] ), .B(n333), .CO(n370), .S(n335) );
  AOI22XL U393 ( .A0(n335), .A1(n384), .B0(\add_x_9/A[4] ), .B1(n334), .Y(n338) );
  NAND2XL U394 ( .A(n375), .B(n374), .Y(n337) );
  NAND4XL U395 ( .A(n339), .B(n338), .C(n337), .D(n336), .Y(n138) );
  OAI31XL U396 ( .A0(n340), .A1(n384), .A2(n374), .B0(n406), .Y(n342) );
  OAI211XL U397 ( .A0(n343), .A1(n406), .B0(n342), .C0(n341), .Y(n134) );
  NOR3XL U398 ( .A(\add_x_9/A[7] ), .B(n345), .C(n344), .Y(n355) );
  INVXL U399 ( .A(n346), .Y(n348) );
  OAI31XL U400 ( .A0(n355), .A1(n349), .A2(n348), .B0(n347), .Y(n141) );
  NAND2X4 U401 ( .A(status[0]), .B(n400), .Y(n368) );
  OAI22XL U402 ( .A0(\add_x_9/A[0] ), .A1(n368), .B0(n406), .B1(n366), .Y(N253) );
  OA22X1 U403 ( .A0(n366), .A1(lbp_addr[6]), .B0(n368), .B1(n351), .Y(N259) );
  OA22X1 U404 ( .A0(n366), .A1(n410), .B0(n368), .B1(n352), .Y(N261) );
  OA22X1 U405 ( .A0(n366), .A1(\add_x_9/A[10] ), .B0(n368), .B1(n353), .Y(N263) );
  OA22X1 U406 ( .A0(n366), .A1(\add_x_9/A[13] ), .B0(n368), .B1(n354), .Y(N266) );
  NOR3XL U407 ( .A(status[1]), .B(status[0]), .C(n400), .Y(\work[2] ) );
  INVXL U408 ( .A(n355), .Y(n356) );
  AOI211XL U409 ( .A0(n400), .A1(n356), .B0(status[0]), .C0(status[1]), .Y(
        \next_status[2] ) );
  NOR3BX1 U410 ( .AN(n358), .B(n357), .C(n284), .Y(N76) );
  ADDHXL U411 ( .A(\add_x_9/A[1] ), .B(\add_x_9/A[0] ), .CO(n223), .S(n379) );
  AOI2BB2X1 U412 ( .B0(n368), .B1(n401), .A0N(n368), .A1N(n379), .Y(N254) );
  AOI2BB2X1 U413 ( .B0(n368), .B1(n149), .A0N(n368), .A1N(n359), .Y(N255) );
  AOI2BB2X1 U414 ( .B0(n368), .B1(n399), .A0N(n368), .A1N(n360), .Y(N256) );
  AO22X1 U415 ( .A0(n366), .A1(n361), .B0(n368), .B1(n408), .Y(N257) );
  ADDHXL U416 ( .A(n438), .B(n362), .CO(n309), .S(n369) );
  AOI2BB2X1 U417 ( .B0(n368), .B1(n402), .A0N(n368), .A1N(n369), .Y(N258) );
  ADDHXL U418 ( .A(\add_x_9/A[7] ), .B(n363), .CO(n250), .S(n388) );
  AOI2BB2X1 U419 ( .B0(n368), .B1(n405), .A0N(n368), .A1N(n388), .Y(N260) );
  AOI2BB2X1 U420 ( .B0(n368), .B1(n407), .A0N(n368), .A1N(n364), .Y(N262) );
  AO22X1 U421 ( .A0(n366), .A1(n365), .B0(n368), .B1(n409), .Y(N264) );
  AOI2BB2X1 U422 ( .B0(n368), .B1(n404), .A0N(n368), .A1N(n367), .Y(N265) );
  AOI2BB2X1 U423 ( .B0(n438), .B1(n375), .A0N(n438), .A1N(n375), .Y(n372) );
  ADDHXL U424 ( .A(n438), .B(n370), .CO(n312), .S(n371) );
  AO22X1 U425 ( .A0(n212), .A1(n372), .B0(n384), .B1(n371), .Y(n373) );
  AOI31XL U426 ( .A0(n375), .A1(n374), .A2(n402), .B0(n373), .Y(n376) );
  OAI211XL U427 ( .A0(n378), .A1(n402), .B0(n377), .C0(n376), .Y(n139) );
  AOI2BB2X1 U428 ( .B0(\add_x_9/A[1] ), .B1(n406), .A0N(\add_x_9/A[1] ), .A1N(
        n406), .Y(n380) );
  AO22X1 U429 ( .A0(n212), .A1(n380), .B0(n206), .B1(n379), .Y(n381) );
  ADDHXL U430 ( .A(\add_x_9/A[1] ), .B(\add_x_9/A[0] ), .CO(n311), .S(n383) );
  AOI22XL U431 ( .A0(\add_x_9/A[1] ), .A1(n385), .B0(n384), .B1(n383), .Y(n386) );
  AOI2BB2X1 U432 ( .B0(n206), .B1(n388), .A0N(n222), .A1N(n405), .Y(n395) );
  AOI2BB2X1 U433 ( .B0(\add_x_9/A[7] ), .B1(n389), .A0N(\add_x_9/A[7] ), .A1N(
        n389), .Y(n390) );
  OAI21XL U434 ( .A0(n392), .A1(n391), .B0(n405), .Y(n393) );
  AO22X1 U435 ( .A0(n396), .A1(gray_data[7]), .B0(n222), .B1(data[7]), .Y(n126) );
  AOI2BB2X1 U436 ( .B0(n396), .B1(n397), .A0N(n396), .A1N(data[6]), .Y(n125)
         );
  AO22X1 U437 ( .A0(n222), .A1(data[5]), .B0(n396), .B1(gray_data[5]), .Y(n124) );
  AO22X1 U438 ( .A0(n396), .A1(gray_data[4]), .B0(n222), .B1(data[4]), .Y(n123) );
  AO22X1 U439 ( .A0(n222), .A1(data[3]), .B0(n396), .B1(gray_data[3]), .Y(n122) );
  AO22X1 U440 ( .A0(n396), .A1(gray_data[2]), .B0(n222), .B1(data[2]), .Y(n121) );
  AO22X1 U441 ( .A0(n396), .A1(gray_data[1]), .B0(n222), .B1(data[1]), .Y(n120) );
  AO22X1 U442 ( .A0(n396), .A1(gray_data[0]), .B0(n222), .B1(data[0]), .Y(n119) );
endmodule

