/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : S-2021.06-SP2
// Date      : Tue Jan 25 00:56:27 2022
/////////////////////////////////////////////////////////////


module LCD_CTRL ( clk, reset, IROM_Q, cmd, cmd_valid, IROM_EN, IROM_A, IRB_RW, 
        IRB_D, IRB_A, busy, done );
  input [7:0] IROM_Q;
  input [2:0] cmd;
  output [5:0] IROM_A;
  output [7:0] IRB_D;
  output [5:0] IRB_A;
  input clk, reset, cmd_valid;
  output IROM_EN, IRB_RW, busy, done;
  wire   n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, N19,
         N20, N22, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35,
         N36, N37, N38, N40, N41, N47, N49, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N70, N71, N72, N73, N74, N75, N76,
         N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88, N89, N90,
         N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, n1, n2, n3, n4, n5, n6, n7, n8, n26, n27, n28, n30, n32, n34,
         n36, n38, n40, n42, n44, n46, n48, n50, n52, n54, n55, n56;
  wire   [2:0] state;
  wire   [2:0] next_state;
  wire   [5:2] \add_158_S2/carry ;
  wire   [5:2] \add_82/carry ;

  CLKINVX6 I_17 ( .A(IRB_RW), .Y(N82) );
  CLKINVX6 I_13 ( .A(N61), .Y(N62) );
  CLKINVX6 I_10 ( .A(N52), .Y(N53) );
  AND2X8 C24565 ( .A(IRB_A[5]), .B(IRB_A[4]), .Y(N101) );
  AND2X8 C24564 ( .A(N101), .B(IRB_A[3]), .Y(N102) );
  AND2X8 C24563 ( .A(N102), .B(IRB_A[2]), .Y(N103) );
  AND2X8 C24562 ( .A(N103), .B(IRB_A[1]), .Y(N104) );
  AND2X8 C24561 ( .A(N104), .B(IRB_A[0]), .Y(N47) );
  OR2X8 C24556 ( .A(cmd[2]), .B(cmd[1]), .Y(N99) );
  OR2X8 C24555 ( .A(N99), .B(cmd[0]), .Y(N100) );
  CLKINVX6 I_8 ( .A(N100), .Y(N41) );
  AND2X8 C24552 ( .A(IROM_A[5]), .B(IROM_A[4]), .Y(N95) );
  AND2X8 C24551 ( .A(N95), .B(IROM_A[3]), .Y(N96) );
  AND2X8 C24550 ( .A(N96), .B(IROM_A[2]), .Y(N97) );
  AND2X8 C24549 ( .A(N97), .B(IROM_A[1]), .Y(N98) );
  AND2X8 C24548 ( .A(N98), .B(IROM_A[0]), .Y(N40) );
  CLKINVX6 I_7 ( .A(N37), .Y(N38) );
  CLKINVX6 I_6 ( .A(N34), .Y(N35) );
  CLKINVX6 I_5 ( .A(N31), .Y(N32) );
  CLKINVX6 I_4 ( .A(N28), .Y(N29) );
  CLKINVX6 I_3 ( .A(N25), .Y(N26) );
  OR2X8 C118 ( .A(N19), .B(state[1]), .Y(N63) );
  OR2X8 C113 ( .A(N19), .B(state[1]), .Y(N60) );
  OR2X8 C109 ( .A(state[2]), .B(N20), .Y(N57) );
  OR2X8 C104 ( .A(state[2]), .B(N20), .Y(N54) );
  OR2X8 C100 ( .A(state[2]), .B(state[1]), .Y(N51) );
  AND2X8 C97 ( .A(N19), .B(N20), .Y(N49) );
  OR2X8 C43 ( .A(N19), .B(state[1]), .Y(N36) );
  OR2X8 C38 ( .A(N19), .B(state[1]), .Y(N33) );
  OR2X8 C34 ( .A(state[2]), .B(N20), .Y(N30) );
  OR2X8 C29 ( .A(state[2]), .B(N20), .Y(N27) );
  OR2X8 C25 ( .A(state[2]), .B(state[1]), .Y(N24) );
  AND2X8 C22 ( .A(N19), .B(N20), .Y(N22) );
  CLKINVX1 U4 ( .A(n2), .Y(next_state[2]) );
  AOI211X1 U5 ( .A0(N29), .A1(N41), .B0(N35), .C0(N38), .Y(n2) );
  OAI2BB1X1 U6 ( .A0N(n3), .A1N(N29), .B0(n4), .Y(next_state[1]) );
  NOR2X1 U7 ( .A(N32), .B(N26), .Y(n4) );
  NAND3BX1 U8 ( .AN(N38), .B(n5), .C(n6), .Y(next_state[0]) );
  AOI32X1 U9 ( .A0(N29), .A1(n3), .A2(cmd_valid), .B0(N47), .B1(N35), .Y(n6)
         );
  CLKINVX1 U10 ( .A(N41), .Y(n3) );
  NAND3X1 U11 ( .A(N22), .B(n7), .C(N40), .Y(n5) );
  AND2X1 U13 ( .A(N88), .B(N82), .Y(N94) );
  AND2X1 U14 ( .A(N87), .B(N82), .Y(N93) );
  AND2X1 U15 ( .A(N86), .B(N82), .Y(N92) );
  AND2X1 U16 ( .A(N85), .B(N82), .Y(N91) );
  AND2X1 U17 ( .A(N84), .B(N82), .Y(N90) );
  AND2X1 U18 ( .A(N83), .B(N82), .Y(N89) );
  AND2X1 U19 ( .A(N75), .B(n54), .Y(N81) );
  AND2X1 U20 ( .A(N74), .B(n54), .Y(N80) );
  AND2X1 U21 ( .A(N73), .B(n54), .Y(N79) );
  AND2X1 U22 ( .A(N72), .B(n54), .Y(N78) );
  AND2X1 U23 ( .A(N71), .B(n54), .Y(N77) );
  OR2X1 U29 ( .A(N51), .B(n7), .Y(N52) );
  OR2X1 U30 ( .A(N36), .B(n7), .Y(N37) );
  NAND2BX1 U31 ( .AN(N33), .B(n7), .Y(N34) );
  OR2X1 U32 ( .A(N30), .B(n7), .Y(N31) );
  NAND2BX1 U33 ( .AN(N27), .B(n7), .Y(N28) );
  OR2X1 U34 ( .A(N24), .B(n7), .Y(N25) );
  ADDHX4 \add_158_S2/U1_1_1  ( .A(IRB_A[1]), .B(IRB_A[0]), .CO(
        \add_158_S2/carry [2]), .S(N84) );
  ADDHX4 \add_158_S2/U1_1_2  ( .A(IRB_A[2]), .B(\add_158_S2/carry [2]), .CO(
        \add_158_S2/carry [3]), .S(N85) );
  ADDHX4 \add_158_S2/U1_1_3  ( .A(IRB_A[3]), .B(\add_158_S2/carry [3]), .CO(
        \add_158_S2/carry [4]), .S(N86) );
  ADDHX4 \add_158_S2/U1_1_4  ( .A(IRB_A[4]), .B(\add_158_S2/carry [4]), .CO(
        \add_158_S2/carry [5]), .S(N87) );
  ADDHX4 \add_82/U1_1_1  ( .A(IROM_A[1]), .B(IROM_A[0]), .CO(\add_82/carry [2]), .S(N71) );
  ADDHX4 \add_82/U1_1_2  ( .A(IROM_A[2]), .B(\add_82/carry [2]), .CO(
        \add_82/carry [3]), .S(N72) );
  ADDHX4 \add_82/U1_1_3  ( .A(IROM_A[3]), .B(\add_82/carry [3]), .CO(
        \add_82/carry [4]), .S(N73) );
  ADDHX4 \add_82/U1_1_4  ( .A(IROM_A[4]), .B(\add_82/carry [4]), .CO(
        \add_82/carry [5]), .S(N74) );
  DFFRX2 \state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(n1), .Q(state[2]), 
        .QN(N19) );
  DFFRX2 \state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n1), .Q(state[1]), 
        .QN(N20) );
  DFFRX2 \state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(n1), .QN(n7) );
  DFFRXL \IRB_A_reg[0]  ( .D(N89), .CK(clk), .RN(n1), .Q(n68) );
  DFFRXL \IROM_A_reg[0]  ( .D(n27), .CK(clk), .RN(n1), .Q(n62), .QN(N70) );
  DFFRX1 \IROM_A_reg[1]  ( .D(N77), .CK(clk), .RN(n1), .Q(n61) );
  DFFRX1 \IROM_A_reg[2]  ( .D(N78), .CK(clk), .RN(n1), .Q(n60) );
  DFFRX1 \IROM_A_reg[3]  ( .D(N79), .CK(clk), .RN(n1), .Q(n59) );
  DFFRX1 \IROM_A_reg[4]  ( .D(N80), .CK(clk), .RN(n1), .Q(n58) );
  DFFRX1 \IRB_A_reg[1]  ( .D(N90), .CK(clk), .RN(n1), .Q(n67) );
  DFFRX1 \IRB_A_reg[2]  ( .D(N91), .CK(clk), .RN(n1), .Q(n66) );
  DFFRX1 \IRB_A_reg[3]  ( .D(N92), .CK(clk), .RN(n1), .Q(n65) );
  DFFRX1 \IRB_A_reg[4]  ( .D(N93), .CK(clk), .RN(n1), .Q(n64) );
  DFFRX1 \IROM_A_reg[5]  ( .D(N81), .CK(clk), .RN(n1), .Q(n57) );
  DFFRX1 \IRB_A_reg[5]  ( .D(N94), .CK(clk), .RN(n1), .Q(n63) );
  INVX12 U39 ( .A(1'b1), .Y(IRB_D[7]) );
  INVX12 U40 ( .A(1'b1), .Y(IRB_D[6]) );
  INVX12 U41 ( .A(1'b1), .Y(IRB_D[5]) );
  INVX12 U42 ( .A(1'b1), .Y(IRB_D[4]) );
  INVX12 U43 ( .A(1'b1), .Y(IRB_D[3]) );
  INVX12 U44 ( .A(1'b1), .Y(IRB_D[2]) );
  INVX12 U45 ( .A(1'b1), .Y(IRB_D[1]) );
  INVX12 U46 ( .A(1'b1), .Y(IRB_D[0]) );
  CLKINVX1 U55 ( .A(N76), .Y(n26) );
  CLKINVX1 U56 ( .A(n26), .Y(n27) );
  AND2XL U57 ( .A(N70), .B(n54), .Y(N76) );
  CLKINVX1 U58 ( .A(n8), .Y(n56) );
  AOI211X1 U59 ( .A0(N49), .A1(n7), .B0(N59), .C0(N53), .Y(n8) );
  INVX12 U60 ( .A(n54), .Y(IROM_EN) );
  AND4X2 U61 ( .A(N58), .B(N55), .C(N61), .D(N64), .Y(n54) );
  INVXL U62 ( .A(n69), .Y(n28) );
  INVX12 U63 ( .A(n28), .Y(busy) );
  INVX16 U64 ( .A(N64), .Y(done) );
  OR2X1 U65 ( .A(N63), .B(n7), .Y(N64) );
  CLKINVX1 U66 ( .A(n63), .Y(n30) );
  INVX16 U67 ( .A(n30), .Y(IRB_A[5]) );
  CLKINVX1 U68 ( .A(n57), .Y(n32) );
  INVX16 U69 ( .A(n32), .Y(IROM_A[5]) );
  CLKINVX1 U70 ( .A(n64), .Y(n34) );
  INVX16 U71 ( .A(n34), .Y(IRB_A[4]) );
  CLKINVX1 U72 ( .A(n65), .Y(n36) );
  INVX16 U73 ( .A(n36), .Y(IRB_A[3]) );
  CLKINVX1 U74 ( .A(n66), .Y(n38) );
  INVX16 U75 ( .A(n38), .Y(IRB_A[2]) );
  CLKINVX1 U76 ( .A(n67), .Y(n40) );
  INVX16 U77 ( .A(n40), .Y(IRB_A[1]) );
  CLKINVX1 U78 ( .A(n58), .Y(n42) );
  INVX16 U79 ( .A(n42), .Y(IROM_A[4]) );
  CLKINVX1 U80 ( .A(n59), .Y(n44) );
  INVX16 U81 ( .A(n44), .Y(IROM_A[3]) );
  CLKINVX1 U82 ( .A(n60), .Y(n46) );
  INVX16 U83 ( .A(n46), .Y(IROM_A[2]) );
  CLKINVX1 U84 ( .A(n61), .Y(n48) );
  INVX16 U85 ( .A(n48), .Y(IROM_A[1]) );
  INVX3 U86 ( .A(reset), .Y(n1) );
  CLKINVX1 U87 ( .A(n62), .Y(n50) );
  INVX16 U88 ( .A(n50), .Y(IROM_A[0]) );
  CLKINVX1 U89 ( .A(n68), .Y(n52) );
  INVX16 U90 ( .A(n52), .Y(IRB_A[0]) );
  OR2X8 U91 ( .A(N62), .B(n56), .Y(n69) );
  INVX4 U92 ( .A(N58), .Y(N59) );
  OR2X2 U93 ( .A(N57), .B(n7), .Y(N58) );
  INVX4 U94 ( .A(N55), .Y(N56) );
  NAND2BXL U95 ( .AN(N54), .B(n7), .Y(N55) );
  NAND2BXL U96 ( .AN(N60), .B(n7), .Y(N61) );
  NOR3X2 U97 ( .A(N56), .B(n56), .C(done), .Y(n55) );
  CLKINVX20 U98 ( .A(n55), .Y(IRB_RW) );
  XOR2X1 U99 ( .A(\add_82/carry [5]), .B(IROM_A[5]), .Y(N75) );
  CLKINVX1 U100 ( .A(IRB_A[0]), .Y(N83) );
  XOR2X1 U101 ( .A(\add_158_S2/carry [5]), .B(IRB_A[5]), .Y(N88) );
endmodule

