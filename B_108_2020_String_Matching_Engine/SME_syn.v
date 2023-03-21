/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : S-2021.06-SP2
// Date      : Tue Feb 15 23:44:11 2022
/////////////////////////////////////////////////////////////


module SME ( clk, reset, chardata, isstring, ispattern, valid, match, 
        match_index );
  input [7:0] chardata;
  output [4:0] match_index;
  input clk, reset, isstring, ispattern;
  output valid, match;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, \Pattern[7][7] , \Pattern[7][6] , \Pattern[7][5] ,
         \Pattern[7][4] , \Pattern[7][3] , \Pattern[7][2] , \Pattern[7][1] ,
         \Pattern[7][0] , \Pattern[6][7] , \Pattern[6][6] , \Pattern[6][5] ,
         \Pattern[6][4] , \Pattern[6][3] , \Pattern[6][2] , \Pattern[6][1] ,
         \Pattern[6][0] , \Pattern[5][7] , \Pattern[5][6] , \Pattern[5][5] ,
         \Pattern[5][4] , \Pattern[5][3] , \Pattern[5][2] , \Pattern[5][1] ,
         \Pattern[5][0] , \Pattern[4][7] , \Pattern[4][6] , \Pattern[4][5] ,
         \Pattern[4][4] , \Pattern[4][3] , \Pattern[4][2] , \Pattern[4][1] ,
         \Pattern[4][0] , \Pattern[3][7] , \Pattern[3][6] , \Pattern[3][5] ,
         \Pattern[3][4] , \Pattern[3][3] , \Pattern[3][2] , \Pattern[3][1] ,
         \Pattern[3][0] , \Pattern[2][7] , \Pattern[2][6] , \Pattern[2][5] ,
         \Pattern[2][4] , \Pattern[2][3] , \Pattern[2][2] , \Pattern[2][1] ,
         \Pattern[2][0] , \Pattern[1][7] , \Pattern[1][6] , \Pattern[1][5] ,
         \Pattern[1][4] , \Pattern[1][3] , \Pattern[1][2] , \Pattern[1][1] ,
         \Pattern[1][0] , \Pattern[0][7] , \Pattern[0][6] , \Pattern[0][5] ,
         \Pattern[0][4] , \Pattern[0][3] , \Pattern[0][2] , \Pattern[0][1] ,
         \Pattern[0][0] , \String[31][7] , \String[31][6] , \String[31][5] ,
         \String[31][4] , \String[31][3] , \String[31][2] , \String[31][1] ,
         \String[31][0] , \String[30][7] , \String[30][6] , \String[30][5] ,
         \String[30][4] , \String[30][3] , \String[30][2] , \String[30][1] ,
         \String[30][0] , \String[29][7] , \String[29][6] , \String[29][5] ,
         \String[29][4] , \String[29][3] , \String[29][2] , \String[29][1] ,
         \String[29][0] , \String[28][7] , \String[28][6] , \String[28][5] ,
         \String[28][4] , \String[28][3] , \String[28][2] , \String[28][1] ,
         \String[28][0] , \String[27][7] , \String[27][6] , \String[27][5] ,
         \String[27][4] , \String[27][3] , \String[27][2] , \String[27][1] ,
         \String[27][0] , \String[26][7] , \String[26][6] , \String[26][5] ,
         \String[26][4] , \String[26][3] , \String[26][2] , \String[26][1] ,
         \String[26][0] , \String[25][7] , \String[25][6] , \String[25][5] ,
         \String[25][4] , \String[25][3] , \String[25][2] , \String[25][1] ,
         \String[25][0] , \String[24][7] , \String[24][6] , \String[24][5] ,
         \String[24][4] , \String[24][3] , \String[24][2] , \String[24][1] ,
         \String[24][0] , \String[23][7] , \String[23][6] , \String[23][5] ,
         \String[23][4] , \String[23][3] , \String[23][2] , \String[23][1] ,
         \String[23][0] , \String[22][7] , \String[22][6] , \String[22][5] ,
         \String[22][4] , \String[22][3] , \String[22][2] , \String[22][1] ,
         \String[22][0] , \String[21][7] , \String[21][6] , \String[21][5] ,
         \String[21][4] , \String[21][3] , \String[21][2] , \String[21][1] ,
         \String[21][0] , \String[20][7] , \String[20][6] , \String[20][5] ,
         \String[20][4] , \String[20][3] , \String[20][2] , \String[20][1] ,
         \String[20][0] , \String[19][7] , \String[19][6] , \String[19][5] ,
         \String[19][4] , \String[19][3] , \String[19][2] , \String[19][1] ,
         \String[19][0] , \String[18][7] , \String[18][6] , \String[18][5] ,
         \String[18][4] , \String[18][3] , \String[18][2] , \String[18][1] ,
         \String[18][0] , \String[17][7] , \String[17][6] , \String[17][5] ,
         \String[17][4] , \String[17][3] , \String[17][2] , \String[17][1] ,
         \String[17][0] , \String[16][7] , \String[16][6] , \String[16][5] ,
         \String[16][4] , \String[16][3] , \String[16][2] , \String[16][1] ,
         \String[16][0] , \String[15][7] , \String[15][6] , \String[15][5] ,
         \String[15][4] , \String[15][3] , \String[15][2] , \String[15][1] ,
         \String[15][0] , \String[14][7] , \String[14][6] , \String[14][5] ,
         \String[14][4] , \String[14][3] , \String[14][2] , \String[14][1] ,
         \String[14][0] , \String[13][7] , \String[13][6] , \String[13][5] ,
         \String[13][4] , \String[13][3] , \String[13][2] , \String[13][1] ,
         \String[13][0] , \String[12][7] , \String[12][6] , \String[12][5] ,
         \String[12][4] , \String[12][3] , \String[12][2] , \String[12][1] ,
         \String[12][0] , \String[11][7] , \String[11][6] , \String[11][5] ,
         \String[11][4] , \String[11][3] , \String[11][2] , \String[11][1] ,
         \String[11][0] , \String[10][7] , \String[10][6] , \String[10][5] ,
         \String[10][4] , \String[10][3] , \String[10][2] , \String[10][1] ,
         \String[10][0] , \String[9][7] , \String[9][6] , \String[9][5] ,
         \String[9][4] , \String[9][3] , \String[9][2] , \String[9][1] ,
         \String[9][0] , \String[8][7] , \String[8][6] , \String[8][5] ,
         \String[8][4] , \String[8][3] , \String[8][2] , \String[8][1] ,
         \String[8][0] , \String[7][7] , \String[7][6] , \String[7][5] ,
         \String[7][4] , \String[7][3] , \String[7][2] , \String[7][1] ,
         \String[7][0] , \String[6][7] , \String[6][6] , \String[6][5] ,
         \String[6][4] , \String[6][3] , \String[6][2] , \String[6][1] ,
         \String[6][0] , \String[5][7] , \String[5][6] , \String[5][5] ,
         \String[5][4] , \String[5][3] , \String[5][2] , \String[5][1] ,
         \String[5][0] , \String[4][7] , \String[4][6] , \String[4][5] ,
         \String[4][4] , \String[4][3] , \String[4][2] , \String[4][1] ,
         \String[4][0] , \String[3][7] , \String[3][6] , \String[3][5] ,
         \String[3][4] , \String[3][3] , \String[3][2] , \String[3][1] ,
         \String[3][0] , \String[2][7] , \String[2][6] , \String[2][5] ,
         \String[2][4] , \String[2][3] , \String[2][2] , \String[2][1] ,
         \String[2][0] , \String[1][7] , \String[1][6] , \String[1][5] ,
         \String[1][4] , \String[1][3] , \String[1][2] , \String[1][1] ,
         \String[1][0] , \String[0][7] , \String[0][6] , \String[0][5] ,
         \String[0][4] , \String[0][3] , \String[0][2] , \String[0][1] ,
         \String[0][0] , N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99,
         N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N119, N120, N121,
         N122, N123, N124, N125, N126, N127, N128, N129, N130, N131, N132,
         N133, N134, N135, N136, N137, N138, N139, N140, N141, N142, N143,
         N144, N145, N146, N147, N148, N149, N150, N151, N152, N153, N154,
         N155, N156, N157, N158, N159, N160, N161, N162, N163, N164, N165,
         N166, N167, N168, N169, N170, N171, N172, N173, N174, N175, N176,
         N177, N178, N179, N180, N181, N182, N183, N184, N185, N186, N187,
         N188, N189, N190, N191, N192, N193, N194, N195, N196, N197, N198,
         N199, N200, N201, N202, N203, N204, N205, N206, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N259, N260, N261, N262, N263, N264,
         N265, N266, N267, N268, N269, N270, N271, N272, N273, N274, N275,
         N276, N277, N278, N279, N280, N281, N282, N283, N284, N285, N286,
         N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, flag,
         N341, N342, N343, N344, N345, N346, N347, N348, N349, N350, N351,
         N352, N353, N354, N355, N356, N357, N358, N359, N360, N361, N362,
         N363, N364, N365, N366, N367, N368, N369, N370, N371, N372, N373,
         N374, N375, N376, N377, N378, N379, N380, N381, N382, N383, N384,
         N385, N386, N387, N388, N389, N390, N391, N392, N393, N394, N395,
         N396, N397, N398, N399, N400, N401, N402, N403, N404, N405, N406,
         N407, N408, N409, N410, N411, N412, N413, N414, N415, N416, N417,
         N418, N419, N420, N421, N422, N423, N424, N425, N426, N427, N428,
         N429, N430, N431, N432, N433, N434, N435, N436, N437, N438, N439,
         N440, N441, N442, N443, N444, N445, N446, N447, N448, N449, N450,
         N451, N452, N453, N454, N455, N456, N457, N458, N459, N460, N461,
         N462, N463, N464, N465, N466, N467, N468, N469, N470, N471, N472,
         N473, N474, N475, N476, N477, N478, N479, N480, N481, N482, N483,
         N484, N485, N486, N487, N488, N489, N490, N491, N492, N493, N494,
         N495, N496, N497, N498, N499, N500, N501, N502, N503, N504, N505,
         N506, N507, N508, N509, N510, N511, N512, N513, N514, N515, N516,
         N517, N518, N519, N520, N521, N522, N523, N524, N525, N526, N527,
         N528, N529, N530, N531, N532, N533, N534, N535, N536, N537, N538,
         N539, N540, N541, N542, N543, N544, N545, N546, N547, N548, N549,
         N550, N551, N552, N553, N554, N555, N556;
  wire   [5:0] count_s;
  wire   [3:0] count_p;
  wire   [4:0] symbol;
  wire   [5:0] num_s;
  wire   [2:0] state;
  wire   [2:0] next_state;
  wire   [3:0] num_p;
  wire   [4:0] work;
  wire   [1:0] symbol_flag;
  wire   [3:0] reg_p;

  EQ_UNS_OP eq_23_3 ( .A(count_s), .B(num_s), .Z(N62) );
  EQ_UNS_OP eq_26 ( .A({N64, N65, N66, N67, N68, N69, N70, N71}), .B({N72, N73, 
        N74, N75, N76, N77, N78, N79}), .Z(N80) );
  \**SEQGEN**  \state_reg[2]  ( .clear(reset), .preset(1'b0), .next_state(
        next_state[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        state[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \state_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(
        next_state[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        state[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \state_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(
        next_state[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        state[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  GTECH_AND2 C58 ( .A(N81), .B(N82), .Z(N84) );
  GTECH_AND2 C59 ( .A(N84), .B(N83), .Z(N85) );
  GTECH_OR2 C61 ( .A(state[2]), .B(state[1]), .Z(N86) );
  GTECH_OR2 C62 ( .A(N86), .B(N83), .Z(N87) );
  GTECH_OR2 C65 ( .A(state[2]), .B(N82), .Z(N89) );
  GTECH_OR2 C66 ( .A(N89), .B(state[0]), .Z(N90) );
  GTECH_OR2 C70 ( .A(state[2]), .B(N82), .Z(N92) );
  GTECH_OR2 C71 ( .A(N92), .B(N83), .Z(N93) );
  GTECH_OR2 C74 ( .A(N81), .B(state[1]), .Z(N95) );
  GTECH_OR2 C75 ( .A(N95), .B(state[0]), .Z(N96) );
  GTECH_OR2 C79 ( .A(N81), .B(state[1]), .Z(N98) );
  GTECH_OR2 C80 ( .A(N98), .B(N83), .Z(N99) );
  GTECH_AND2 C82 ( .A(state[2]), .B(state[1]), .Z(N101) );
  EQ_UNS_OP eq_48 ( .A(count_p), .B(num_p), .Z(N102) );
  EQ_UNS_OP eq_48_2 ( .A(count_s), .B(num_s), .Z(N103) );
  GTECH_AND2 C131 ( .A(N81), .B(N82), .Z(N106) );
  GTECH_AND2 C132 ( .A(N106), .B(N83), .Z(N107) );
  GTECH_OR2 C134 ( .A(state[2]), .B(state[1]), .Z(N108) );
  GTECH_OR2 C135 ( .A(N108), .B(N83), .Z(N109) );
  GTECH_OR2 C138 ( .A(state[2]), .B(N82), .Z(N111) );
  GTECH_OR2 C139 ( .A(N111), .B(state[0]), .Z(N112) );
  GTECH_OR2 C143 ( .A(state[2]), .B(N82), .Z(N114) );
  GTECH_OR2 C144 ( .A(N114), .B(N83), .Z(N115) );
  GTECH_OR2 C147 ( .A(N81), .B(state[1]), .Z(N117) );
  GTECH_OR2 C148 ( .A(N117), .B(state[0]), .Z(N118) );
  GTECH_OR2 C152 ( .A(N81), .B(state[1]), .Z(N120) );
  GTECH_OR2 C153 ( .A(N120), .B(N83), .Z(N121) );
  GTECH_AND2 C155 ( .A(state[2]), .B(state[1]), .Z(N123) );
  \**SEQGEN**  \symbol_flag_reg[1]  ( .clear(reset), .preset(1'b0), 
        .next_state(N124), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(symbol_flag[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N128) );
  \**SEQGEN**  \symbol_flag_reg[0]  ( .clear(reset), .preset(1'b0), 
        .next_state(N124), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(symbol_flag[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N127) );
  \**SEQGEN**  \reg_p_reg[3]  ( .clear(reset), .preset(1'b0), .next_state(N141), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(reg_p[3]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N137)
         );
  \**SEQGEN**  \reg_p_reg[2]  ( .clear(reset), .preset(1'b0), .next_state(N140), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(reg_p[2]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N137)
         );
  \**SEQGEN**  \reg_p_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(N139), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(reg_p[1]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N137)
         );
  \**SEQGEN**  \reg_p_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(N138), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(reg_p[0]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N137)
         );
  \**SEQGEN**  \num_p_reg[3]  ( .clear(reset), .preset(1'b0), .next_state(N155), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(num_p[3]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        ispattern) );
  \**SEQGEN**  \num_p_reg[2]  ( .clear(reset), .preset(1'b0), .next_state(N154), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(num_p[2]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        ispattern) );
  \**SEQGEN**  \num_p_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(N153), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(num_p[1]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        ispattern) );
  \**SEQGEN**  \num_p_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(N152), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(num_p[0]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        ispattern) );
  \**SEQGEN**  \num_s_reg[5]  ( .clear(reset), .preset(1'b0), .next_state(N150), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(num_s[5]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        isstring) );
  \**SEQGEN**  \num_s_reg[4]  ( .clear(reset), .preset(1'b0), .next_state(N149), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(num_s[4]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        isstring) );
  \**SEQGEN**  \num_s_reg[3]  ( .clear(reset), .preset(1'b0), .next_state(N148), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(num_s[3]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        isstring) );
  \**SEQGEN**  \num_s_reg[2]  ( .clear(reset), .preset(1'b0), .next_state(N147), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(num_s[2]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        isstring) );
  \**SEQGEN**  \num_s_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(N146), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(num_s[1]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        isstring) );
  \**SEQGEN**  \num_s_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(N145), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(num_s[0]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(
        isstring) );
  \**SEQGEN**  \count_p_reg[3]  ( .clear(reset), .preset(1'b0), .next_state(
        N244), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(count_p[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_p_reg[2]  ( .clear(reset), .preset(1'b0), .next_state(
        N243), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(count_p[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_p_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(
        N242), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(count_p[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_p_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(
        N241), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(count_p[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_s_reg[5]  ( .clear(reset), .preset(1'b0), .next_state(
        N185), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(count_s[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_s_reg[4]  ( .clear(reset), .preset(1'b0), .next_state(
        N184), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(count_s[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_s_reg[3]  ( .clear(reset), .preset(1'b0), .next_state(
        N183), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(count_s[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_s_reg[2]  ( .clear(reset), .preset(1'b0), .next_state(
        N182), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(count_s[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_s_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(
        N181), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(count_s[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_s_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(
        N180), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(count_s[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  GTECH_OR2 C421 ( .A(N144), .B(ispattern), .Z(N254) );
  GTECH_OR2 C424 ( .A(isstring), .B(N151), .Z(N256) );
  \**SEQGEN**  \String_reg[31][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[31][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N331) );
  \**SEQGEN**  \String_reg[31][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[31][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N331) );
  \**SEQGEN**  \String_reg[31][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[31][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N331) );
  \**SEQGEN**  \String_reg[31][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[31][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N331) );
  \**SEQGEN**  \String_reg[31][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[31][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N331) );
  \**SEQGEN**  \String_reg[31][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[31][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N331) );
  \**SEQGEN**  \String_reg[31][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[31][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N331) );
  \**SEQGEN**  \String_reg[31][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[31][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N331) );
  \**SEQGEN**  \String_reg[30][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[30][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N330) );
  \**SEQGEN**  \String_reg[30][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[30][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N330) );
  \**SEQGEN**  \String_reg[30][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[30][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N330) );
  \**SEQGEN**  \String_reg[30][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[30][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N330) );
  \**SEQGEN**  \String_reg[30][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[30][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N330) );
  \**SEQGEN**  \String_reg[30][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[30][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N330) );
  \**SEQGEN**  \String_reg[30][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[30][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N330) );
  \**SEQGEN**  \String_reg[30][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[30][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N330) );
  \**SEQGEN**  \String_reg[29][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[29][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N329) );
  \**SEQGEN**  \String_reg[29][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[29][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N329) );
  \**SEQGEN**  \String_reg[29][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[29][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N329) );
  \**SEQGEN**  \String_reg[29][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[29][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N329) );
  \**SEQGEN**  \String_reg[29][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[29][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N329) );
  \**SEQGEN**  \String_reg[29][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[29][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N329) );
  \**SEQGEN**  \String_reg[29][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[29][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N329) );
  \**SEQGEN**  \String_reg[29][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[29][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N329) );
  \**SEQGEN**  \String_reg[28][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[28][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N328) );
  \**SEQGEN**  \String_reg[28][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[28][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N328) );
  \**SEQGEN**  \String_reg[28][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[28][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N328) );
  \**SEQGEN**  \String_reg[28][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[28][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N328) );
  \**SEQGEN**  \String_reg[28][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[28][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N328) );
  \**SEQGEN**  \String_reg[28][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[28][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N328) );
  \**SEQGEN**  \String_reg[28][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[28][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N328) );
  \**SEQGEN**  \String_reg[28][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[28][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N328) );
  \**SEQGEN**  \String_reg[27][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[27][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N327) );
  \**SEQGEN**  \String_reg[27][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[27][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N327) );
  \**SEQGEN**  \String_reg[27][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[27][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N327) );
  \**SEQGEN**  \String_reg[27][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[27][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N327) );
  \**SEQGEN**  \String_reg[27][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[27][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N327) );
  \**SEQGEN**  \String_reg[27][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[27][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N327) );
  \**SEQGEN**  \String_reg[27][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[27][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N327) );
  \**SEQGEN**  \String_reg[27][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[27][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N327) );
  \**SEQGEN**  \String_reg[26][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[26][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N326) );
  \**SEQGEN**  \String_reg[26][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[26][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N326) );
  \**SEQGEN**  \String_reg[26][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[26][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N326) );
  \**SEQGEN**  \String_reg[26][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[26][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N326) );
  \**SEQGEN**  \String_reg[26][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[26][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N326) );
  \**SEQGEN**  \String_reg[26][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[26][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N326) );
  \**SEQGEN**  \String_reg[26][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[26][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N326) );
  \**SEQGEN**  \String_reg[26][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[26][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N326) );
  \**SEQGEN**  \String_reg[25][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[25][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N325) );
  \**SEQGEN**  \String_reg[25][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[25][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N325) );
  \**SEQGEN**  \String_reg[25][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[25][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N325) );
  \**SEQGEN**  \String_reg[25][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[25][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N325) );
  \**SEQGEN**  \String_reg[25][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[25][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N325) );
  \**SEQGEN**  \String_reg[25][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[25][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N325) );
  \**SEQGEN**  \String_reg[25][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[25][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N325) );
  \**SEQGEN**  \String_reg[25][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[25][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N325) );
  \**SEQGEN**  \String_reg[24][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[24][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N324) );
  \**SEQGEN**  \String_reg[24][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[24][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N324) );
  \**SEQGEN**  \String_reg[24][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[24][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N324) );
  \**SEQGEN**  \String_reg[24][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[24][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N324) );
  \**SEQGEN**  \String_reg[24][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[24][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N324) );
  \**SEQGEN**  \String_reg[24][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[24][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N324) );
  \**SEQGEN**  \String_reg[24][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[24][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N324) );
  \**SEQGEN**  \String_reg[24][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[24][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N324) );
  \**SEQGEN**  \String_reg[23][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[23][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N323) );
  \**SEQGEN**  \String_reg[23][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[23][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N323) );
  \**SEQGEN**  \String_reg[23][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[23][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N323) );
  \**SEQGEN**  \String_reg[23][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[23][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N323) );
  \**SEQGEN**  \String_reg[23][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[23][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N323) );
  \**SEQGEN**  \String_reg[23][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[23][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N323) );
  \**SEQGEN**  \String_reg[23][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[23][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N323) );
  \**SEQGEN**  \String_reg[23][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[23][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N323) );
  \**SEQGEN**  \String_reg[22][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[22][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N322) );
  \**SEQGEN**  \String_reg[22][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[22][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N322) );
  \**SEQGEN**  \String_reg[22][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[22][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N322) );
  \**SEQGEN**  \String_reg[22][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[22][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N322) );
  \**SEQGEN**  \String_reg[22][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[22][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N322) );
  \**SEQGEN**  \String_reg[22][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[22][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N322) );
  \**SEQGEN**  \String_reg[22][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[22][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N322) );
  \**SEQGEN**  \String_reg[22][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[22][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N322) );
  \**SEQGEN**  \String_reg[21][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[21][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N321) );
  \**SEQGEN**  \String_reg[21][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[21][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N321) );
  \**SEQGEN**  \String_reg[21][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[21][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N321) );
  \**SEQGEN**  \String_reg[21][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[21][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N321) );
  \**SEQGEN**  \String_reg[21][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[21][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N321) );
  \**SEQGEN**  \String_reg[21][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[21][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N321) );
  \**SEQGEN**  \String_reg[21][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[21][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N321) );
  \**SEQGEN**  \String_reg[21][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[21][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N321) );
  \**SEQGEN**  \String_reg[20][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[20][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N320) );
  \**SEQGEN**  \String_reg[20][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[20][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N320) );
  \**SEQGEN**  \String_reg[20][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[20][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N320) );
  \**SEQGEN**  \String_reg[20][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[20][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N320) );
  \**SEQGEN**  \String_reg[20][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[20][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N320) );
  \**SEQGEN**  \String_reg[20][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[20][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N320) );
  \**SEQGEN**  \String_reg[20][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[20][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N320) );
  \**SEQGEN**  \String_reg[20][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[20][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N320) );
  \**SEQGEN**  \String_reg[19][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[19][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N319) );
  \**SEQGEN**  \String_reg[19][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[19][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N319) );
  \**SEQGEN**  \String_reg[19][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[19][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N319) );
  \**SEQGEN**  \String_reg[19][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[19][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N319) );
  \**SEQGEN**  \String_reg[19][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[19][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N319) );
  \**SEQGEN**  \String_reg[19][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[19][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N319) );
  \**SEQGEN**  \String_reg[19][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[19][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N319) );
  \**SEQGEN**  \String_reg[19][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[19][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N319) );
  \**SEQGEN**  \String_reg[18][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[18][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N318) );
  \**SEQGEN**  \String_reg[18][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[18][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N318) );
  \**SEQGEN**  \String_reg[18][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[18][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N318) );
  \**SEQGEN**  \String_reg[18][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[18][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N318) );
  \**SEQGEN**  \String_reg[18][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[18][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N318) );
  \**SEQGEN**  \String_reg[18][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[18][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N318) );
  \**SEQGEN**  \String_reg[18][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[18][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N318) );
  \**SEQGEN**  \String_reg[18][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[18][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N318) );
  \**SEQGEN**  \String_reg[17][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[17][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N317) );
  \**SEQGEN**  \String_reg[17][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[17][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N317) );
  \**SEQGEN**  \String_reg[17][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[17][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N317) );
  \**SEQGEN**  \String_reg[17][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[17][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N317) );
  \**SEQGEN**  \String_reg[17][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[17][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N317) );
  \**SEQGEN**  \String_reg[17][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[17][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N317) );
  \**SEQGEN**  \String_reg[17][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[17][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N317) );
  \**SEQGEN**  \String_reg[17][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[17][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N317) );
  \**SEQGEN**  \String_reg[16][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[16][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N316) );
  \**SEQGEN**  \String_reg[16][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[16][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N316) );
  \**SEQGEN**  \String_reg[16][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[16][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N316) );
  \**SEQGEN**  \String_reg[16][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[16][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N316) );
  \**SEQGEN**  \String_reg[16][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[16][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N316) );
  \**SEQGEN**  \String_reg[16][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[16][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N316) );
  \**SEQGEN**  \String_reg[16][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[16][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N316) );
  \**SEQGEN**  \String_reg[16][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[16][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N316) );
  \**SEQGEN**  \String_reg[15][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[15][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N315) );
  \**SEQGEN**  \String_reg[15][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[15][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N315) );
  \**SEQGEN**  \String_reg[15][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[15][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N315) );
  \**SEQGEN**  \String_reg[15][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[15][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N315) );
  \**SEQGEN**  \String_reg[15][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[15][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N315) );
  \**SEQGEN**  \String_reg[15][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[15][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N315) );
  \**SEQGEN**  \String_reg[15][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[15][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N315) );
  \**SEQGEN**  \String_reg[15][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[15][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N315) );
  \**SEQGEN**  \String_reg[14][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[14][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N314) );
  \**SEQGEN**  \String_reg[14][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[14][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N314) );
  \**SEQGEN**  \String_reg[14][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[14][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N314) );
  \**SEQGEN**  \String_reg[14][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[14][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N314) );
  \**SEQGEN**  \String_reg[14][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[14][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N314) );
  \**SEQGEN**  \String_reg[14][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[14][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N314) );
  \**SEQGEN**  \String_reg[14][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[14][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N314) );
  \**SEQGEN**  \String_reg[14][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[14][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N314) );
  \**SEQGEN**  \String_reg[13][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[13][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N313) );
  \**SEQGEN**  \String_reg[13][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[13][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N313) );
  \**SEQGEN**  \String_reg[13][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[13][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N313) );
  \**SEQGEN**  \String_reg[13][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[13][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N313) );
  \**SEQGEN**  \String_reg[13][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[13][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N313) );
  \**SEQGEN**  \String_reg[13][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[13][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N313) );
  \**SEQGEN**  \String_reg[13][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[13][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N313) );
  \**SEQGEN**  \String_reg[13][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[13][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N313) );
  \**SEQGEN**  \String_reg[12][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[12][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N312) );
  \**SEQGEN**  \String_reg[12][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[12][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N312) );
  \**SEQGEN**  \String_reg[12][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[12][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N312) );
  \**SEQGEN**  \String_reg[12][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[12][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N312) );
  \**SEQGEN**  \String_reg[12][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[12][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N312) );
  \**SEQGEN**  \String_reg[12][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[12][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N312) );
  \**SEQGEN**  \String_reg[12][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[12][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N312) );
  \**SEQGEN**  \String_reg[12][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[12][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N312) );
  \**SEQGEN**  \String_reg[11][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[11][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N311) );
  \**SEQGEN**  \String_reg[11][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[11][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N311) );
  \**SEQGEN**  \String_reg[11][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[11][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N311) );
  \**SEQGEN**  \String_reg[11][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[11][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N311) );
  \**SEQGEN**  \String_reg[11][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[11][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N311) );
  \**SEQGEN**  \String_reg[11][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[11][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N311) );
  \**SEQGEN**  \String_reg[11][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[11][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N311) );
  \**SEQGEN**  \String_reg[11][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[11][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N311) );
  \**SEQGEN**  \String_reg[10][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[10][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N310) );
  \**SEQGEN**  \String_reg[10][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[10][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N310) );
  \**SEQGEN**  \String_reg[10][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[10][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N310) );
  \**SEQGEN**  \String_reg[10][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[10][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N310) );
  \**SEQGEN**  \String_reg[10][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[10][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N310) );
  \**SEQGEN**  \String_reg[10][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[10][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N310) );
  \**SEQGEN**  \String_reg[10][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[10][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N310) );
  \**SEQGEN**  \String_reg[10][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\String[10][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N310) );
  \**SEQGEN**  \String_reg[9][7]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[9][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N309) );
  \**SEQGEN**  \String_reg[9][6]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[9][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N309) );
  \**SEQGEN**  \String_reg[9][5]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[9][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N309) );
  \**SEQGEN**  \String_reg[9][4]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[9][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N309) );
  \**SEQGEN**  \String_reg[9][3]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[9][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N309) );
  \**SEQGEN**  \String_reg[9][2]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[9][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N309) );
  \**SEQGEN**  \String_reg[9][1]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[9][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N309) );
  \**SEQGEN**  \String_reg[9][0]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[9][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N309) );
  \**SEQGEN**  \String_reg[8][7]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[8][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N308) );
  \**SEQGEN**  \String_reg[8][6]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[8][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N308) );
  \**SEQGEN**  \String_reg[8][5]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[8][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N308) );
  \**SEQGEN**  \String_reg[8][4]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[8][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N308) );
  \**SEQGEN**  \String_reg[8][3]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[8][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N308) );
  \**SEQGEN**  \String_reg[8][2]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[8][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N308) );
  \**SEQGEN**  \String_reg[8][1]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[8][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N308) );
  \**SEQGEN**  \String_reg[8][0]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[8][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N308) );
  \**SEQGEN**  \String_reg[7][7]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[7][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N307) );
  \**SEQGEN**  \String_reg[7][6]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[7][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N307) );
  \**SEQGEN**  \String_reg[7][5]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[7][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N307) );
  \**SEQGEN**  \String_reg[7][4]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[7][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N307) );
  \**SEQGEN**  \String_reg[7][3]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[7][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N307) );
  \**SEQGEN**  \String_reg[7][2]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[7][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N307) );
  \**SEQGEN**  \String_reg[7][1]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[7][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N307) );
  \**SEQGEN**  \String_reg[7][0]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[7][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N307) );
  \**SEQGEN**  \String_reg[6][7]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[6][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N306) );
  \**SEQGEN**  \String_reg[6][6]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[6][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N306) );
  \**SEQGEN**  \String_reg[6][5]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[6][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N306) );
  \**SEQGEN**  \String_reg[6][4]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[6][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N306) );
  \**SEQGEN**  \String_reg[6][3]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[6][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N306) );
  \**SEQGEN**  \String_reg[6][2]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[6][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N306) );
  \**SEQGEN**  \String_reg[6][1]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[6][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N306) );
  \**SEQGEN**  \String_reg[6][0]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[6][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N306) );
  \**SEQGEN**  \String_reg[5][7]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[5][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N305) );
  \**SEQGEN**  \String_reg[5][6]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[5][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N305) );
  \**SEQGEN**  \String_reg[5][5]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[5][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N305) );
  \**SEQGEN**  \String_reg[5][4]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[5][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N305) );
  \**SEQGEN**  \String_reg[5][3]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[5][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N305) );
  \**SEQGEN**  \String_reg[5][2]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[5][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N305) );
  \**SEQGEN**  \String_reg[5][1]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[5][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N305) );
  \**SEQGEN**  \String_reg[5][0]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[5][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N305) );
  \**SEQGEN**  \String_reg[4][7]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[4][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N304) );
  \**SEQGEN**  \String_reg[4][6]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[4][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N304) );
  \**SEQGEN**  \String_reg[4][5]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[4][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N304) );
  \**SEQGEN**  \String_reg[4][4]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[4][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N304) );
  \**SEQGEN**  \String_reg[4][3]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[4][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N304) );
  \**SEQGEN**  \String_reg[4][2]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[4][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N304) );
  \**SEQGEN**  \String_reg[4][1]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[4][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N304) );
  \**SEQGEN**  \String_reg[4][0]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[4][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N304) );
  \**SEQGEN**  \String_reg[3][7]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[3][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N303) );
  \**SEQGEN**  \String_reg[3][6]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[3][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N303) );
  \**SEQGEN**  \String_reg[3][5]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[3][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N303) );
  \**SEQGEN**  \String_reg[3][4]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[3][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N303) );
  \**SEQGEN**  \String_reg[3][3]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[3][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N303) );
  \**SEQGEN**  \String_reg[3][2]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[3][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N303) );
  \**SEQGEN**  \String_reg[3][1]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[3][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N303) );
  \**SEQGEN**  \String_reg[3][0]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[3][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N303) );
  \**SEQGEN**  \String_reg[2][7]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[2][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N302) );
  \**SEQGEN**  \String_reg[2][6]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[2][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N302) );
  \**SEQGEN**  \String_reg[2][5]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[2][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N302) );
  \**SEQGEN**  \String_reg[2][4]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[2][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N302) );
  \**SEQGEN**  \String_reg[2][3]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[2][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N302) );
  \**SEQGEN**  \String_reg[2][2]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[2][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N302) );
  \**SEQGEN**  \String_reg[2][1]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[2][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N302) );
  \**SEQGEN**  \String_reg[2][0]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[2][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N302) );
  \**SEQGEN**  \String_reg[1][7]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[1][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N301) );
  \**SEQGEN**  \String_reg[1][6]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[1][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N301) );
  \**SEQGEN**  \String_reg[1][5]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[1][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N301) );
  \**SEQGEN**  \String_reg[1][4]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[1][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N301) );
  \**SEQGEN**  \String_reg[1][3]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[1][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N301) );
  \**SEQGEN**  \String_reg[1][2]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[1][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N301) );
  \**SEQGEN**  \String_reg[1][1]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[1][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N301) );
  \**SEQGEN**  \String_reg[1][0]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[1][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N301) );
  \**SEQGEN**  \String_reg[0][7]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[0][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N300) );
  \**SEQGEN**  \String_reg[0][6]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[0][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N300) );
  \**SEQGEN**  \String_reg[0][5]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[0][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N300) );
  \**SEQGEN**  \String_reg[0][4]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[0][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N300) );
  \**SEQGEN**  \String_reg[0][3]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[0][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N300) );
  \**SEQGEN**  \String_reg[0][2]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[0][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N300) );
  \**SEQGEN**  \String_reg[0][1]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[0][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N300) );
  \**SEQGEN**  \String_reg[0][0]  ( .clear(reset), .preset(1'b0), .next_state(
        chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        \String[0][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N300) );
  \**SEQGEN**  \Pattern_reg[7][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[7][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N339) );
  \**SEQGEN**  \Pattern_reg[7][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[7][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N339) );
  \**SEQGEN**  \Pattern_reg[7][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[7][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N339) );
  \**SEQGEN**  \Pattern_reg[7][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[7][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N339) );
  \**SEQGEN**  \Pattern_reg[7][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[7][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N339) );
  \**SEQGEN**  \Pattern_reg[7][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[7][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N339) );
  \**SEQGEN**  \Pattern_reg[7][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[7][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N339) );
  \**SEQGEN**  \Pattern_reg[7][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[7][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N339) );
  \**SEQGEN**  \Pattern_reg[6][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[6][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N338) );
  \**SEQGEN**  \Pattern_reg[6][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[6][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N338) );
  \**SEQGEN**  \Pattern_reg[6][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[6][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N338) );
  \**SEQGEN**  \Pattern_reg[6][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[6][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N338) );
  \**SEQGEN**  \Pattern_reg[6][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[6][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N338) );
  \**SEQGEN**  \Pattern_reg[6][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[6][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N338) );
  \**SEQGEN**  \Pattern_reg[6][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[6][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N338) );
  \**SEQGEN**  \Pattern_reg[6][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[6][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N338) );
  \**SEQGEN**  \Pattern_reg[5][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[5][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N337) );
  \**SEQGEN**  \Pattern_reg[5][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[5][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N337) );
  \**SEQGEN**  \Pattern_reg[5][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[5][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N337) );
  \**SEQGEN**  \Pattern_reg[5][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[5][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N337) );
  \**SEQGEN**  \Pattern_reg[5][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[5][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N337) );
  \**SEQGEN**  \Pattern_reg[5][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[5][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N337) );
  \**SEQGEN**  \Pattern_reg[5][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[5][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N337) );
  \**SEQGEN**  \Pattern_reg[5][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[5][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N337) );
  \**SEQGEN**  \Pattern_reg[4][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[4][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N336) );
  \**SEQGEN**  \Pattern_reg[4][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[4][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N336) );
  \**SEQGEN**  \Pattern_reg[4][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[4][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N336) );
  \**SEQGEN**  \Pattern_reg[4][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[4][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N336) );
  \**SEQGEN**  \Pattern_reg[4][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[4][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N336) );
  \**SEQGEN**  \Pattern_reg[4][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[4][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N336) );
  \**SEQGEN**  \Pattern_reg[4][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[4][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N336) );
  \**SEQGEN**  \Pattern_reg[4][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[4][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N336) );
  \**SEQGEN**  \Pattern_reg[3][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[3][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N335) );
  \**SEQGEN**  \Pattern_reg[3][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[3][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N335) );
  \**SEQGEN**  \Pattern_reg[3][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[3][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N335) );
  \**SEQGEN**  \Pattern_reg[3][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[3][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N335) );
  \**SEQGEN**  \Pattern_reg[3][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[3][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N335) );
  \**SEQGEN**  \Pattern_reg[3][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[3][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N335) );
  \**SEQGEN**  \Pattern_reg[3][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[3][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N335) );
  \**SEQGEN**  \Pattern_reg[3][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[3][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N335) );
  \**SEQGEN**  \Pattern_reg[2][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[2][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N334) );
  \**SEQGEN**  \Pattern_reg[2][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[2][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N334) );
  \**SEQGEN**  \Pattern_reg[2][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[2][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N334) );
  \**SEQGEN**  \Pattern_reg[2][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[2][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N334) );
  \**SEQGEN**  \Pattern_reg[2][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[2][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N334) );
  \**SEQGEN**  \Pattern_reg[2][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[2][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N334) );
  \**SEQGEN**  \Pattern_reg[2][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[2][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N334) );
  \**SEQGEN**  \Pattern_reg[2][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[2][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N334) );
  \**SEQGEN**  \Pattern_reg[1][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[1][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N333) );
  \**SEQGEN**  \Pattern_reg[1][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[1][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N333) );
  \**SEQGEN**  \Pattern_reg[1][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[1][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N333) );
  \**SEQGEN**  \Pattern_reg[1][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[1][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N333) );
  \**SEQGEN**  \Pattern_reg[1][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[1][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N333) );
  \**SEQGEN**  \Pattern_reg[1][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[1][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N333) );
  \**SEQGEN**  \Pattern_reg[1][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[1][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N333) );
  \**SEQGEN**  \Pattern_reg[1][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[1][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N333) );
  \**SEQGEN**  \Pattern_reg[0][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[7]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[0][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N332) );
  \**SEQGEN**  \Pattern_reg[0][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[6]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[0][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N332) );
  \**SEQGEN**  \Pattern_reg[0][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[5]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[0][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N332) );
  \**SEQGEN**  \Pattern_reg[0][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[4]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[0][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N332) );
  \**SEQGEN**  \Pattern_reg[0][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[0][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N332) );
  \**SEQGEN**  \Pattern_reg[0][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[0][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N332) );
  \**SEQGEN**  \Pattern_reg[0][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[0][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N332) );
  \**SEQGEN**  \Pattern_reg[0][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(chardata[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(\Pattern[0][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N332) );
  GT_UNS_OP gt_171 ( .A(count_p), .B(1'b0), .Z(N342) );
  GT_UNS_OP gt_166 ( .A(num_p), .B(1'b1), .Z(N347) );
  EQ_UNS_OP eq_174_S2 ( .A(count_p), .B(num_p), .Z(N358) );
  \**SEQGEN**  \match_index_reg[4]  ( .clear(reset), .preset(1'b0), 
        .next_state(N355), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(match_index[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N356) );
  \**SEQGEN**  \match_index_reg[3]  ( .clear(reset), .preset(1'b0), 
        .next_state(N354), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(match_index[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N356) );
  \**SEQGEN**  \match_index_reg[2]  ( .clear(reset), .preset(1'b0), 
        .next_state(N353), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(match_index[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N356) );
  \**SEQGEN**  \match_index_reg[1]  ( .clear(reset), .preset(1'b0), 
        .next_state(N352), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(match_index[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N356) );
  \**SEQGEN**  \match_index_reg[0]  ( .clear(reset), .preset(1'b0), 
        .next_state(N351), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(match_index[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N356) );
  \**SEQGEN**  flag_reg ( .clear(reset), .preset(1'b0), .next_state(N357), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(flag), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  valid_reg ( .clear(reset), .preset(1'b0), .next_state(work[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(valid), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  match_reg ( .clear(reset), .preset(1'b0), .next_state(N359), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(match), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(work[2]) );
  GTECH_NOT I_0 ( .A(chardata[5]), .Z(N362) );
  GTECH_NOT I_1 ( .A(chardata[3]), .Z(N363) );
  GTECH_NOT I_2 ( .A(chardata[1]), .Z(N364) );
  GTECH_OR2 C1831 ( .A(chardata[6]), .B(chardata[7]), .Z(N365) );
  GTECH_OR2 C1832 ( .A(N362), .B(N365), .Z(N366) );
  GTECH_OR2 C1833 ( .A(chardata[4]), .B(N366), .Z(N367) );
  GTECH_OR2 C1834 ( .A(N363), .B(N367), .Z(N368) );
  GTECH_OR2 C1835 ( .A(chardata[2]), .B(N368), .Z(N369) );
  GTECH_OR2 C1836 ( .A(N364), .B(N369), .Z(N370) );
  GTECH_OR2 C1837 ( .A(chardata[0]), .B(N370), .Z(N371) );
  GTECH_NOT I_3 ( .A(N371), .Z(N372) );
  GTECH_NOT I_4 ( .A(\Pattern[0][5] ), .Z(N373) );
  GTECH_NOT I_5 ( .A(\Pattern[0][3] ), .Z(N374) );
  GTECH_NOT I_6 ( .A(\Pattern[0][2] ), .Z(N375) );
  GTECH_NOT I_7 ( .A(\Pattern[0][1] ), .Z(N376) );
  GTECH_OR2 C1843 ( .A(\Pattern[0][6] ), .B(\Pattern[0][7] ), .Z(N377) );
  GTECH_OR2 C1844 ( .A(N373), .B(N377), .Z(N378) );
  GTECH_OR2 C1845 ( .A(\Pattern[0][4] ), .B(N378), .Z(N379) );
  GTECH_OR2 C1846 ( .A(N374), .B(N379), .Z(N380) );
  GTECH_OR2 C1847 ( .A(N375), .B(N380), .Z(N381) );
  GTECH_OR2 C1848 ( .A(N376), .B(N381), .Z(N382) );
  GTECH_OR2 C1849 ( .A(\Pattern[0][0] ), .B(N382), .Z(N383) );
  GTECH_NOT I_8 ( .A(N383), .Z(N384) );
  GTECH_NOT I_9 ( .A(N207), .Z(N385) );
  GTECH_NOT I_10 ( .A(N209), .Z(N386) );
  GTECH_NOT I_11 ( .A(N211), .Z(N387) );
  GTECH_OR2 C1854 ( .A(N206), .B(N205), .Z(N388) );
  GTECH_OR2 C1855 ( .A(N385), .B(N388), .Z(N389) );
  GTECH_OR2 C1856 ( .A(N208), .B(N389), .Z(N390) );
  GTECH_OR2 C1857 ( .A(N386), .B(N390), .Z(N391) );
  GTECH_OR2 C1858 ( .A(N210), .B(N391), .Z(N392) );
  GTECH_OR2 C1859 ( .A(N387), .B(N392), .Z(N393) );
  GTECH_OR2 C1860 ( .A(N212), .B(N393), .Z(N394) );
  GTECH_NOT I_12 ( .A(N394), .Z(N395) );
  GTECH_NOT I_13 ( .A(N225), .Z(N396) );
  GTECH_NOT I_14 ( .A(N227), .Z(N397) );
  GTECH_NOT I_15 ( .A(N228), .Z(N398) );
  GTECH_NOT I_16 ( .A(N229), .Z(N399) );
  GTECH_OR2 C1866 ( .A(N224), .B(N223), .Z(N400) );
  GTECH_OR2 C1867 ( .A(N396), .B(N400), .Z(N401) );
  GTECH_OR2 C1868 ( .A(N226), .B(N401), .Z(N402) );
  GTECH_OR2 C1869 ( .A(N397), .B(N402), .Z(N403) );
  GTECH_OR2 C1870 ( .A(N398), .B(N403), .Z(N404) );
  GTECH_OR2 C1871 ( .A(N399), .B(N404), .Z(N405) );
  GTECH_OR2 C1872 ( .A(N230), .B(N405), .Z(N406) );
  GTECH_NOT I_17 ( .A(N406), .Z(N407) );
  GTECH_NOT I_18 ( .A(N66), .Z(N408) );
  GTECH_NOT I_19 ( .A(N68), .Z(N409) );
  GTECH_NOT I_20 ( .A(N70), .Z(N410) );
  GTECH_OR2 C1877 ( .A(N65), .B(N64), .Z(N411) );
  GTECH_OR2 C1878 ( .A(N408), .B(N411), .Z(N412) );
  GTECH_OR2 C1879 ( .A(N67), .B(N412), .Z(N413) );
  GTECH_OR2 C1880 ( .A(N409), .B(N413), .Z(N414) );
  GTECH_OR2 C1881 ( .A(N69), .B(N414), .Z(N415) );
  GTECH_OR2 C1882 ( .A(N410), .B(N415), .Z(N416) );
  GTECH_OR2 C1883 ( .A(N71), .B(N416), .Z(N417) );
  GTECH_NOT I_21 ( .A(N417), .Z(N418) );
  GTECH_NOT I_22 ( .A(N69), .Z(N419) );
  GTECH_OR2 C1889 ( .A(N65), .B(N64), .Z(N420) );
  GTECH_OR2 C1890 ( .A(N408), .B(N420), .Z(N421) );
  GTECH_OR2 C1891 ( .A(N67), .B(N421), .Z(N422) );
  GTECH_OR2 C1892 ( .A(N409), .B(N422), .Z(N423) );
  GTECH_OR2 C1893 ( .A(N419), .B(N423), .Z(N424) );
  GTECH_OR2 C1894 ( .A(N410), .B(N424), .Z(N425) );
  GTECH_OR2 C1895 ( .A(N71), .B(N425), .Z(N426) );
  GTECH_NOT I_23 ( .A(N426), .Z(N427) );
  GTECH_OR2 C1899 ( .A(N65), .B(N64), .Z(N428) );
  GTECH_OR2 C1900 ( .A(N408), .B(N428), .Z(N429) );
  GTECH_OR2 C1901 ( .A(N67), .B(N429), .Z(N430) );
  GTECH_OR2 C1902 ( .A(N68), .B(N430), .Z(N431) );
  GTECH_OR2 C1903 ( .A(N419), .B(N431), .Z(N432) );
  GTECH_OR2 C1904 ( .A(N70), .B(N432), .Z(N433) );
  GTECH_OR2 C1905 ( .A(N71), .B(N433), .Z(N434) );
  GTECH_NOT I_24 ( .A(N434), .Z(N435) );
  GTECH_NOT I_25 ( .A(N74), .Z(N436) );
  GTECH_OR2 C1908 ( .A(N73), .B(N72), .Z(N437) );
  GTECH_OR2 C1909 ( .A(N436), .B(N437), .Z(N438) );
  GTECH_OR2 C1910 ( .A(N75), .B(N438), .Z(N439) );
  GTECH_OR2 C1911 ( .A(N76), .B(N439), .Z(N440) );
  GTECH_OR2 C1912 ( .A(N77), .B(N440), .Z(N441) );
  GTECH_OR2 C1913 ( .A(N78), .B(N441), .Z(N442) );
  GTECH_OR2 C1914 ( .A(N79), .B(N442), .Z(N443) );
  GTECH_NOT I_26 ( .A(N443), .Z(N444) );
  GTECH_NOT I_27 ( .A(N65), .Z(N445) );
  GTECH_NOT I_28 ( .A(N67), .Z(N446) );
  GTECH_OR2 C1921 ( .A(N445), .B(N64), .Z(N447) );
  GTECH_OR2 C1922 ( .A(N66), .B(N447), .Z(N448) );
  GTECH_OR2 C1923 ( .A(N446), .B(N448), .Z(N449) );
  GTECH_OR2 C1924 ( .A(N409), .B(N449), .Z(N450) );
  GTECH_OR2 C1925 ( .A(N419), .B(N450), .Z(N451) );
  GTECH_OR2 C1926 ( .A(N410), .B(N451), .Z(N452) );
  GTECH_OR2 C1927 ( .A(N71), .B(N452), .Z(N453) );
  GTECH_NOT I_29 ( .A(N453), .Z(N454) );
  GTECH_OR2 C1930 ( .A(N73), .B(N72), .Z(N455) );
  GTECH_OR2 C1931 ( .A(N436), .B(N455), .Z(N456) );
  GTECH_OR2 C1932 ( .A(N75), .B(N456), .Z(N457) );
  GTECH_OR2 C1933 ( .A(N76), .B(N457), .Z(N458) );
  GTECH_OR2 C1934 ( .A(N77), .B(N458), .Z(N459) );
  GTECH_OR2 C1935 ( .A(N78), .B(N459), .Z(N460) );
  GTECH_OR2 C1936 ( .A(N79), .B(N460), .Z(N461) );
  GTECH_NOT I_30 ( .A(N461), .Z(N462) );
  ADD_UNS_OP add_107_S2 ( .A(count_s), .B(1'b1), .Z({N150, N149, N148, N147, 
        N146, N145}) );
  ADD_UNS_OP add_108_S2 ( .A(count_p), .B(1'b1), .Z({N155, N154, N153, N152})
         );
  ADD_UNS_OP add_118_S2 ( .A(count_s), .B(1'b1), .Z({N164, N163, N162, N161, 
        N160, N159}) );
  ADD_UNS_OP add_125_S2 ( .A(count_p), .B(1'b1), .Z({N191, N190, N189, N188})
         );
  ADD_UNS_OP add_96_S2 ( .A(count_p), .B(1'b1), .Z({N136, N135, N134, N133})
         );
  ADD_UNS_OP add_128 ( .A(count_p), .B(1'b1), .Z({N200, N199, N198, N197}) );
  ADD_UNS_OP add_121 ( .A(count_s), .B(1'b1), .Z({N173, N172, N171, N170, N169, 
        N168}) );
  SUB_UNS_OP sub_131 ( .A(count_p[2:0]), .B(1'b1), .Z({N204, N203, N202}) );
  SUB_UNS_OP sub_166_S2_aco ( .A(count_s[4:0]), .B(N348), .Z({N355, N354, N353, 
        N352, N351}) );
  SUB_UNS_OP sub_135 ( .A(count_p[2:0]), .B(1'b1), .Z({N222, N221, N220}) );
  GTECH_AND2 C1939 ( .A(count_s[3]), .B(count_s[4]), .Z(N463) );
  GTECH_AND2 C1940 ( .A(N0), .B(count_s[4]), .Z(N464) );
  GTECH_NOT I_31 ( .A(count_s[3]), .Z(N0) );
  GTECH_AND2 C1941 ( .A(count_s[3]), .B(N1), .Z(N465) );
  GTECH_NOT I_32 ( .A(count_s[4]), .Z(N1) );
  GTECH_AND2 C1942 ( .A(N2), .B(N3), .Z(N466) );
  GTECH_NOT I_33 ( .A(count_s[3]), .Z(N2) );
  GTECH_NOT I_34 ( .A(count_s[4]), .Z(N3) );
  GTECH_NOT I_35 ( .A(count_s[2]), .Z(N467) );
  GTECH_AND2 C1944 ( .A(count_s[0]), .B(count_s[1]), .Z(N468) );
  GTECH_AND2 C1945 ( .A(N4), .B(count_s[1]), .Z(N469) );
  GTECH_NOT I_36 ( .A(count_s[0]), .Z(N4) );
  GTECH_AND2 C1946 ( .A(count_s[0]), .B(N5), .Z(N470) );
  GTECH_NOT I_37 ( .A(count_s[1]), .Z(N5) );
  GTECH_AND2 C1947 ( .A(N6), .B(N7), .Z(N471) );
  GTECH_NOT I_38 ( .A(count_s[0]), .Z(N6) );
  GTECH_NOT I_39 ( .A(count_s[1]), .Z(N7) );
  GTECH_AND2 C1948 ( .A(count_s[2]), .B(N468), .Z(N472) );
  GTECH_AND2 C1949 ( .A(count_s[2]), .B(N469), .Z(N473) );
  GTECH_AND2 C1950 ( .A(count_s[2]), .B(N470), .Z(N474) );
  GTECH_AND2 C1951 ( .A(count_s[2]), .B(N471), .Z(N475) );
  GTECH_AND2 C1952 ( .A(N467), .B(N468), .Z(N476) );
  GTECH_AND2 C1953 ( .A(N467), .B(N469), .Z(N477) );
  GTECH_AND2 C1954 ( .A(N467), .B(N470), .Z(N478) );
  GTECH_AND2 C1955 ( .A(N467), .B(N471), .Z(N479) );
  GTECH_AND2 C1956 ( .A(N463), .B(N472), .Z(N480) );
  GTECH_AND2 C1957 ( .A(N463), .B(N473), .Z(N481) );
  GTECH_AND2 C1958 ( .A(N463), .B(N474), .Z(N482) );
  GTECH_AND2 C1959 ( .A(N463), .B(N475), .Z(N483) );
  GTECH_AND2 C1960 ( .A(N463), .B(N476), .Z(N484) );
  GTECH_AND2 C1961 ( .A(N463), .B(N477), .Z(N485) );
  GTECH_AND2 C1962 ( .A(N463), .B(N478), .Z(N486) );
  GTECH_AND2 C1963 ( .A(N463), .B(N479), .Z(N487) );
  GTECH_AND2 C1964 ( .A(N464), .B(N472), .Z(N488) );
  GTECH_AND2 C1965 ( .A(N464), .B(N473), .Z(N489) );
  GTECH_AND2 C1966 ( .A(N464), .B(N474), .Z(N490) );
  GTECH_AND2 C1967 ( .A(N464), .B(N475), .Z(N491) );
  GTECH_AND2 C1968 ( .A(N464), .B(N476), .Z(N492) );
  GTECH_AND2 C1969 ( .A(N464), .B(N477), .Z(N493) );
  GTECH_AND2 C1970 ( .A(N464), .B(N478), .Z(N494) );
  GTECH_AND2 C1971 ( .A(N464), .B(N479), .Z(N495) );
  GTECH_AND2 C1972 ( .A(N465), .B(N472), .Z(N496) );
  GTECH_AND2 C1973 ( .A(N465), .B(N473), .Z(N497) );
  GTECH_AND2 C1974 ( .A(N465), .B(N474), .Z(N498) );
  GTECH_AND2 C1975 ( .A(N465), .B(N475), .Z(N499) );
  GTECH_AND2 C1976 ( .A(N465), .B(N476), .Z(N500) );
  GTECH_AND2 C1977 ( .A(N465), .B(N477), .Z(N501) );
  GTECH_AND2 C1978 ( .A(N465), .B(N478), .Z(N502) );
  GTECH_AND2 C1979 ( .A(N465), .B(N479), .Z(N503) );
  GTECH_AND2 C1980 ( .A(N466), .B(N472), .Z(N504) );
  GTECH_AND2 C1981 ( .A(N466), .B(N473), .Z(N505) );
  GTECH_AND2 C1982 ( .A(N466), .B(N474), .Z(N506) );
  GTECH_AND2 C1983 ( .A(N466), .B(N475), .Z(N507) );
  GTECH_AND2 C1984 ( .A(N466), .B(N476), .Z(N508) );
  GTECH_AND2 C1985 ( .A(N466), .B(N477), .Z(N509) );
  GTECH_AND2 C1986 ( .A(N466), .B(N478), .Z(N510) );
  GTECH_AND2 C1987 ( .A(N466), .B(N479), .Z(N511) );
  GTECH_NOT I_40 ( .A(count_s[5]), .Z(N512) );
  GTECH_AND2 C1992 ( .A(N511), .B(N512), .Z(N258) );
  GTECH_AND2 C1993 ( .A(N510), .B(N512), .Z(N259) );
  GTECH_AND2 C1994 ( .A(N509), .B(N512), .Z(N260) );
  GTECH_AND2 C1995 ( .A(N508), .B(N512), .Z(N261) );
  GTECH_AND2 C1996 ( .A(N507), .B(N512), .Z(N262) );
  GTECH_AND2 C1997 ( .A(N506), .B(N512), .Z(N263) );
  GTECH_AND2 C1998 ( .A(N505), .B(N512), .Z(N264) );
  GTECH_AND2 C1999 ( .A(N504), .B(N512), .Z(N265) );
  GTECH_AND2 C2000 ( .A(N503), .B(N512), .Z(N266) );
  GTECH_AND2 C2001 ( .A(N502), .B(N512), .Z(N267) );
  GTECH_AND2 C2002 ( .A(N501), .B(N512), .Z(N268) );
  GTECH_AND2 C2003 ( .A(N500), .B(N512), .Z(N269) );
  GTECH_AND2 C2004 ( .A(N499), .B(N512), .Z(N270) );
  GTECH_AND2 C2005 ( .A(N498), .B(N512), .Z(N271) );
  GTECH_AND2 C2006 ( .A(N497), .B(N512), .Z(N272) );
  GTECH_AND2 C2007 ( .A(N496), .B(N512), .Z(N273) );
  GTECH_AND2 C2008 ( .A(N495), .B(N512), .Z(N274) );
  GTECH_AND2 C2009 ( .A(N494), .B(N512), .Z(N275) );
  GTECH_AND2 C2010 ( .A(N493), .B(N512), .Z(N276) );
  GTECH_AND2 C2011 ( .A(N492), .B(N512), .Z(N277) );
  GTECH_AND2 C2012 ( .A(N491), .B(N512), .Z(N278) );
  GTECH_AND2 C2013 ( .A(N490), .B(N512), .Z(N279) );
  GTECH_AND2 C2014 ( .A(N489), .B(N512), .Z(N280) );
  GTECH_AND2 C2015 ( .A(N488), .B(N512), .Z(N281) );
  GTECH_AND2 C2016 ( .A(N487), .B(N512), .Z(N282) );
  GTECH_AND2 C2017 ( .A(N486), .B(N512), .Z(N283) );
  GTECH_AND2 C2018 ( .A(N485), .B(N512), .Z(N284) );
  GTECH_AND2 C2019 ( .A(N484), .B(N512), .Z(N285) );
  GTECH_AND2 C2020 ( .A(N483), .B(N512), .Z(N286) );
  GTECH_AND2 C2021 ( .A(N482), .B(N512), .Z(N287) );
  GTECH_AND2 C2022 ( .A(N481), .B(N512), .Z(N288) );
  GTECH_AND2 C2023 ( .A(N480), .B(N512), .Z(N289) );
  GTECH_AND2 C2024 ( .A(count_p[0]), .B(count_p[1]), .Z(N513) );
  GTECH_AND2 C2025 ( .A(N513), .B(count_p[2]), .Z(N514) );
  GTECH_AND2 C2026 ( .A(N8), .B(count_p[1]), .Z(N515) );
  GTECH_NOT I_41 ( .A(count_p[0]), .Z(N8) );
  GTECH_AND2 C2027 ( .A(N515), .B(count_p[2]), .Z(N516) );
  GTECH_AND2 C2028 ( .A(count_p[0]), .B(N9), .Z(N517) );
  GTECH_NOT I_42 ( .A(count_p[1]), .Z(N9) );
  GTECH_AND2 C2029 ( .A(N517), .B(count_p[2]), .Z(N518) );
  GTECH_AND2 C2030 ( .A(N10), .B(N11), .Z(N519) );
  GTECH_NOT I_43 ( .A(count_p[0]), .Z(N10) );
  GTECH_NOT I_44 ( .A(count_p[1]), .Z(N11) );
  GTECH_AND2 C2031 ( .A(N519), .B(count_p[2]), .Z(N520) );
  GTECH_AND2 C2032 ( .A(count_p[0]), .B(count_p[1]), .Z(N521) );
  GTECH_AND2 C2033 ( .A(N521), .B(N12), .Z(N522) );
  GTECH_NOT I_45 ( .A(count_p[2]), .Z(N12) );
  GTECH_AND2 C2034 ( .A(N13), .B(count_p[1]), .Z(N523) );
  GTECH_NOT I_46 ( .A(count_p[0]), .Z(N13) );
  GTECH_AND2 C2035 ( .A(N523), .B(N14), .Z(N524) );
  GTECH_NOT I_47 ( .A(count_p[2]), .Z(N14) );
  GTECH_AND2 C2036 ( .A(count_p[0]), .B(N15), .Z(N525) );
  GTECH_NOT I_48 ( .A(count_p[1]), .Z(N15) );
  GTECH_AND2 C2037 ( .A(N525), .B(N16), .Z(N526) );
  GTECH_NOT I_49 ( .A(count_p[2]), .Z(N16) );
  GTECH_AND2 C2038 ( .A(N17), .B(N18), .Z(N527) );
  GTECH_NOT I_50 ( .A(count_p[0]), .Z(N17) );
  GTECH_NOT I_51 ( .A(count_p[1]), .Z(N18) );
  GTECH_AND2 C2039 ( .A(N527), .B(N19), .Z(N528) );
  GTECH_NOT I_52 ( .A(count_p[2]), .Z(N19) );
  GTECH_NOT I_53 ( .A(count_p[3]), .Z(N529) );
  GTECH_AND2 C2044 ( .A(N528), .B(N529), .Z(N290) );
  GTECH_AND2 C2045 ( .A(N526), .B(N529), .Z(N291) );
  GTECH_AND2 C2046 ( .A(N524), .B(N529), .Z(N292) );
  GTECH_AND2 C2047 ( .A(N522), .B(N529), .Z(N293) );
  GTECH_AND2 C2048 ( .A(N520), .B(N529), .Z(N294) );
  GTECH_AND2 C2049 ( .A(N518), .B(N529), .Z(N295) );
  GTECH_AND2 C2050 ( .A(N516), .B(N529), .Z(N296) );
  GTECH_AND2 C2051 ( .A(N514), .B(N529), .Z(N297) );
  GTECH_NOT I_54 ( .A(N104), .Z(N105) );
  SELECT_OP C2053 ( .DATA1({1'b0, 1'b0, N144}), .DATA2({1'b0, N151, ispattern}), .DATA3({1'b0, 1'b1, 1'b1}), .DATA4({N104, N105, N105}), .DATA5({1'b1, 1'b0, 
        1'b1}), .DATA6({1'b0, 1'b0, N144}), .DATA7({1'b0, 1'b0, 1'b0}), 
        .CONTROL1(N20), .CONTROL2(N21), .CONTROL3(N22), .CONTROL4(N23), 
        .CONTROL5(N24), .CONTROL6(N25), .CONTROL7(N26), .Z(next_state) );
  GTECH_BUF B_0 ( .A(N85), .Z(N20) );
  GTECH_BUF B_1 ( .A(N88), .Z(N21) );
  GTECH_BUF B_2 ( .A(N91), .Z(N22) );
  GTECH_BUF B_3 ( .A(N94), .Z(N23) );
  GTECH_BUF B_4 ( .A(N97), .Z(N24) );
  GTECH_BUF B_5 ( .A(N100), .Z(N25) );
  GTECH_BUF B_6 ( .A(N101), .Z(N26) );
  SELECT_OP C2054 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({1'b0, 1'b0, 1'b0, 
        1'b1}), .DATA3({1'b0, 1'b0, 1'b1, 1'b1}), .DATA4({1'b1, 1'b1, 1'b1, 
        1'b1}), .DATA5({1'b0, 1'b0, 1'b0, 1'b0}), .DATA6({1'b0, 1'b0, 1'b0, 
        1'b0}), .DATA7({1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N27), .CONTROL2(
        N28), .CONTROL3(N29), .CONTROL4(N30), .CONTROL5(N31), .CONTROL6(N32), 
        .CONTROL7(N33), .Z(work[3:0]) );
  GTECH_BUF B_7 ( .A(N107), .Z(N27) );
  GTECH_BUF B_8 ( .A(N110), .Z(N28) );
  GTECH_BUF B_9 ( .A(N113), .Z(N29) );
  GTECH_BUF B_10 ( .A(N116), .Z(N30) );
  GTECH_BUF B_11 ( .A(N119), .Z(N31) );
  GTECH_BUF B_12 ( .A(N122), .Z(N32) );
  GTECH_BUF B_13 ( .A(N123), .Z(N33) );
  SELECT_OP C2055 ( .DATA1(1'b1), .DATA2(1'b0), .CONTROL1(N31), .CONTROL2(N34), 
        .Z(work[4]) );
  GTECH_BUF B_14 ( .A(N118), .Z(N34) );
  SELECT_OP C2056 ( .DATA1({N126, N372}), .DATA2({1'b1, 1'b1}), .CONTROL1(N35), 
        .CONTROL2(N125), .Z({N128, N127}) );
  GTECH_BUF B_15 ( .A(N124), .Z(N35) );
  SELECT_OP C2057 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N36), 
        .CONTROL2(N37), .CONTROL3(N132), .Z(N137) );
  GTECH_BUF B_16 ( .A(N129), .Z(N36) );
  GTECH_BUF B_17 ( .A(N130), .Z(N37) );
  SELECT_OP C2058 ( .DATA1({N136, N135, N134, N133}), .DATA2({1'b0, 1'b0, 1'b0, 
        1'b0}), .CONTROL1(N36), .CONTROL2(N37), .Z({N141, N140, N139, N138})
         );
  SELECT_OP C2059 ( .DATA1(count_s), .DATA2({N173, N172, N171, N170, N169, 
        N168}), .CONTROL1(N38), .CONTROL2(N167), .Z({N179, N178, N177, N176, 
        N175, N174}) );
  GTECH_BUF B_18 ( .A(N166), .Z(N38) );
  SELECT_OP C2060 ( .DATA1({N164, N163, N162, N161, N160, N159}), .DATA2({N179, 
        N178, N177, N176, N175, N174}), .DATA3({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0}), .CONTROL1(N39), .CONTROL2(N246), .CONTROL3(N158), .Z({N185, 
        N184, N183, N182, N181, N180}) );
  GTECH_BUF B_19 ( .A(isstring), .Z(N39) );
  SELECT_OP C2061 ( .DATA1(count_p), .DATA2(reg_p), .CONTROL1(N40), .CONTROL2(
        N214), .Z({N218, N217, N216, N215}) );
  GTECH_BUF B_20 ( .A(N213), .Z(N40) );
  SELECT_OP C2062 ( .DATA1(count_p), .DATA2({1'b0, 1'b0, 1'b0, 1'b1}), 
        .CONTROL1(N41), .CONTROL2(N232), .Z({N236, N235, N234, N233}) );
  GTECH_BUF B_21 ( .A(N231), .Z(N41) );
  SELECT_OP C2063 ( .DATA1({N200, N199, N198, N197}), .DATA2({N218, N217, N216, 
        N215}), .DATA3({N236, N235, N234, N233}), .DATA4({1'b0, 1'b0, 1'b0, 
        1'b0}), .CONTROL1(N42), .CONTROL2(N250), .CONTROL3(N253), .CONTROL4(
        N196), .Z({N240, N239, N238, N237}) );
  GTECH_BUF B_22 ( .A(N193), .Z(N42) );
  SELECT_OP C2064 ( .DATA1({N191, N190, N189, N188}), .DATA2({N240, N239, N238, 
        N237}), .DATA3({1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N43), .CONTROL2(
        N248), .CONTROL3(N187), .Z({N244, N243, N242, N241}) );
  GTECH_BUF B_23 ( .A(ispattern), .Z(N43) );
  SELECT_OP C2065 ( .DATA1({N289, N288, N287, N286, N285, N284, N283, N282, 
        N281, N280, N279, N278, N277, N276, N275, N274, N273, N272, N271, N270, 
        N269, N268, N267, N266, N265, N264, N263, N262, N261, N260, N259, N258}), .DATA2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA3({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N44), .CONTROL2(
        N45), .CONTROL3(N299), .Z({N331, N330, N329, N328, N327, N326, N325, 
        N324, N323, N322, N321, N320, N319, N318, N317, N316, N315, N314, N313, 
        N312, N311, N310, N309, N308, N307, N306, N305, N304, N303, N302, N301, 
        N300}) );
  GTECH_BUF B_24 ( .A(N255), .Z(N44) );
  GTECH_BUF B_25 ( .A(N257), .Z(N45) );
  SELECT_OP C2066 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .DATA2({N297, N296, N295, N294, N293, N292, N291, N290}), .DATA3({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N44), .CONTROL2(
        N45), .CONTROL3(N299), .Z({N339, N338, N337, N336, N335, N334, N333, 
        N332}) );
  SELECT_OP C2068 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(1'b0), .CONTROL1(N46), 
        .CONTROL2(N361), .CONTROL3(N345), .Z(N356) );
  GTECH_BUF B_26 ( .A(N341), .Z(N46) );
  SELECT_OP C2069 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N46), 
        .CONTROL2(N361), .CONTROL3(N345), .Z(N357) );
  MUX_OP C2070 ( .D0({\Pattern[0][0] , \Pattern[0][1] , \Pattern[0][2] , 
        \Pattern[0][3] , \Pattern[0][4] , \Pattern[0][5] , \Pattern[0][6] , 
        \Pattern[0][7] }), .D1({\Pattern[1][0] , \Pattern[1][1] , 
        \Pattern[1][2] , \Pattern[1][3] , \Pattern[1][4] , \Pattern[1][5] , 
        \Pattern[1][6] , \Pattern[1][7] }), .D2({\Pattern[2][0] , 
        \Pattern[2][1] , \Pattern[2][2] , \Pattern[2][3] , \Pattern[2][4] , 
        \Pattern[2][5] , \Pattern[2][6] , \Pattern[2][7] }), .D3({
        \Pattern[3][0] , \Pattern[3][1] , \Pattern[3][2] , \Pattern[3][3] , 
        \Pattern[3][4] , \Pattern[3][5] , \Pattern[3][6] , \Pattern[3][7] }), 
        .D4({\Pattern[4][0] , \Pattern[4][1] , \Pattern[4][2] , 
        \Pattern[4][3] , \Pattern[4][4] , \Pattern[4][5] , \Pattern[4][6] , 
        \Pattern[4][7] }), .D5({\Pattern[5][0] , \Pattern[5][1] , 
        \Pattern[5][2] , \Pattern[5][3] , \Pattern[5][4] , \Pattern[5][5] , 
        \Pattern[5][6] , \Pattern[5][7] }), .D6({\Pattern[6][0] , 
        \Pattern[6][1] , \Pattern[6][2] , \Pattern[6][3] , \Pattern[6][4] , 
        \Pattern[6][5] , \Pattern[6][6] , \Pattern[6][7] }), .D7({
        \Pattern[7][0] , \Pattern[7][1] , \Pattern[7][2] , \Pattern[7][3] , 
        \Pattern[7][4] , \Pattern[7][5] , \Pattern[7][6] , \Pattern[7][7] }), 
        .S0(N47), .S1(N48), .S2(N49), .Z({N71, N70, N69, N68, N67, N66, N65, 
        N64}) );
  GTECH_BUF B_27 ( .A(count_p[0]), .Z(N47) );
  GTECH_BUF B_28 ( .A(count_p[1]), .Z(N48) );
  GTECH_BUF B_29 ( .A(count_p[2]), .Z(N49) );
  MUX_OP C2071 ( .D0({\String[0][0] , \String[0][1] , \String[0][2] , 
        \String[0][3] , \String[0][4] , \String[0][5] , \String[0][6] , 
        \String[0][7] }), .D1({\String[1][0] , \String[1][1] , \String[1][2] , 
        \String[1][3] , \String[1][4] , \String[1][5] , \String[1][6] , 
        \String[1][7] }), .D2({\String[2][0] , \String[2][1] , \String[2][2] , 
        \String[2][3] , \String[2][4] , \String[2][5] , \String[2][6] , 
        \String[2][7] }), .D3({\String[3][0] , \String[3][1] , \String[3][2] , 
        \String[3][3] , \String[3][4] , \String[3][5] , \String[3][6] , 
        \String[3][7] }), .D4({\String[4][0] , \String[4][1] , \String[4][2] , 
        \String[4][3] , \String[4][4] , \String[4][5] , \String[4][6] , 
        \String[4][7] }), .D5({\String[5][0] , \String[5][1] , \String[5][2] , 
        \String[5][3] , \String[5][4] , \String[5][5] , \String[5][6] , 
        \String[5][7] }), .D6({\String[6][0] , \String[6][1] , \String[6][2] , 
        \String[6][3] , \String[6][4] , \String[6][5] , \String[6][6] , 
        \String[6][7] }), .D7({\String[7][0] , \String[7][1] , \String[7][2] , 
        \String[7][3] , \String[7][4] , \String[7][5] , \String[7][6] , 
        \String[7][7] }), .D8({\String[8][0] , \String[8][1] , \String[8][2] , 
        \String[8][3] , \String[8][4] , \String[8][5] , \String[8][6] , 
        \String[8][7] }), .D9({\String[9][0] , \String[9][1] , \String[9][2] , 
        \String[9][3] , \String[9][4] , \String[9][5] , \String[9][6] , 
        \String[9][7] }), .D10({\String[10][0] , \String[10][1] , 
        \String[10][2] , \String[10][3] , \String[10][4] , \String[10][5] , 
        \String[10][6] , \String[10][7] }), .D11({\String[11][0] , 
        \String[11][1] , \String[11][2] , \String[11][3] , \String[11][4] , 
        \String[11][5] , \String[11][6] , \String[11][7] }), .D12({
        \String[12][0] , \String[12][1] , \String[12][2] , \String[12][3] , 
        \String[12][4] , \String[12][5] , \String[12][6] , \String[12][7] }), 
        .D13({\String[13][0] , \String[13][1] , \String[13][2] , 
        \String[13][3] , \String[13][4] , \String[13][5] , \String[13][6] , 
        \String[13][7] }), .D14({\String[14][0] , \String[14][1] , 
        \String[14][2] , \String[14][3] , \String[14][4] , \String[14][5] , 
        \String[14][6] , \String[14][7] }), .D15({\String[15][0] , 
        \String[15][1] , \String[15][2] , \String[15][3] , \String[15][4] , 
        \String[15][5] , \String[15][6] , \String[15][7] }), .D16({
        \String[16][0] , \String[16][1] , \String[16][2] , \String[16][3] , 
        \String[16][4] , \String[16][5] , \String[16][6] , \String[16][7] }), 
        .D17({\String[17][0] , \String[17][1] , \String[17][2] , 
        \String[17][3] , \String[17][4] , \String[17][5] , \String[17][6] , 
        \String[17][7] }), .D18({\String[18][0] , \String[18][1] , 
        \String[18][2] , \String[18][3] , \String[18][4] , \String[18][5] , 
        \String[18][6] , \String[18][7] }), .D19({\String[19][0] , 
        \String[19][1] , \String[19][2] , \String[19][3] , \String[19][4] , 
        \String[19][5] , \String[19][6] , \String[19][7] }), .D20({
        \String[20][0] , \String[20][1] , \String[20][2] , \String[20][3] , 
        \String[20][4] , \String[20][5] , \String[20][6] , \String[20][7] }), 
        .D21({\String[21][0] , \String[21][1] , \String[21][2] , 
        \String[21][3] , \String[21][4] , \String[21][5] , \String[21][6] , 
        \String[21][7] }), .D22({\String[22][0] , \String[22][1] , 
        \String[22][2] , \String[22][3] , \String[22][4] , \String[22][5] , 
        \String[22][6] , \String[22][7] }), .D23({\String[23][0] , 
        \String[23][1] , \String[23][2] , \String[23][3] , \String[23][4] , 
        \String[23][5] , \String[23][6] , \String[23][7] }), .D24({
        \String[24][0] , \String[24][1] , \String[24][2] , \String[24][3] , 
        \String[24][4] , \String[24][5] , \String[24][6] , \String[24][7] }), 
        .D25({\String[25][0] , \String[25][1] , \String[25][2] , 
        \String[25][3] , \String[25][4] , \String[25][5] , \String[25][6] , 
        \String[25][7] }), .D26({\String[26][0] , \String[26][1] , 
        \String[26][2] , \String[26][3] , \String[26][4] , \String[26][5] , 
        \String[26][6] , \String[26][7] }), .D27({\String[27][0] , 
        \String[27][1] , \String[27][2] , \String[27][3] , \String[27][4] , 
        \String[27][5] , \String[27][6] , \String[27][7] }), .D28({
        \String[28][0] , \String[28][1] , \String[28][2] , \String[28][3] , 
        \String[28][4] , \String[28][5] , \String[28][6] , \String[28][7] }), 
        .D29({\String[29][0] , \String[29][1] , \String[29][2] , 
        \String[29][3] , \String[29][4] , \String[29][5] , \String[29][6] , 
        \String[29][7] }), .D30({\String[30][0] , \String[30][1] , 
        \String[30][2] , \String[30][3] , \String[30][4] , \String[30][5] , 
        \String[30][6] , \String[30][7] }), .D31({\String[31][0] , 
        \String[31][1] , \String[31][2] , \String[31][3] , \String[31][4] , 
        \String[31][5] , \String[31][6] , \String[31][7] }), .S0(N50), .S1(N51), .S2(N52), .S3(N53), .S4(N54), .Z({N79, N78, N77, N76, N75, N74, N73, N72})
         );
  GTECH_BUF B_30 ( .A(count_s[0]), .Z(N50) );
  GTECH_BUF B_31 ( .A(count_s[1]), .Z(N51) );
  GTECH_BUF B_32 ( .A(count_s[2]), .Z(N52) );
  GTECH_BUF B_33 ( .A(count_s[3]), .Z(N53) );
  GTECH_BUF B_34 ( .A(count_s[4]), .Z(N54) );
  MUX_OP C2072 ( .D0({\Pattern[0][0] , \Pattern[0][1] , \Pattern[0][2] , 
        \Pattern[0][3] , \Pattern[0][4] , \Pattern[0][5] , \Pattern[0][6] , 
        \Pattern[0][7] }), .D1({\Pattern[1][0] , \Pattern[1][1] , 
        \Pattern[1][2] , \Pattern[1][3] , \Pattern[1][4] , \Pattern[1][5] , 
        \Pattern[1][6] , \Pattern[1][7] }), .D2({\Pattern[2][0] , 
        \Pattern[2][1] , \Pattern[2][2] , \Pattern[2][3] , \Pattern[2][4] , 
        \Pattern[2][5] , \Pattern[2][6] , \Pattern[2][7] }), .D3({
        \Pattern[3][0] , \Pattern[3][1] , \Pattern[3][2] , \Pattern[3][3] , 
        \Pattern[3][4] , \Pattern[3][5] , \Pattern[3][6] , \Pattern[3][7] }), 
        .D4({\Pattern[4][0] , \Pattern[4][1] , \Pattern[4][2] , 
        \Pattern[4][3] , \Pattern[4][4] , \Pattern[4][5] , \Pattern[4][6] , 
        \Pattern[4][7] }), .D5({\Pattern[5][0] , \Pattern[5][1] , 
        \Pattern[5][2] , \Pattern[5][3] , \Pattern[5][4] , \Pattern[5][5] , 
        \Pattern[5][6] , \Pattern[5][7] }), .D6({\Pattern[6][0] , 
        \Pattern[6][1] , \Pattern[6][2] , \Pattern[6][3] , \Pattern[6][4] , 
        \Pattern[6][5] , \Pattern[6][6] , \Pattern[6][7] }), .D7({
        \Pattern[7][0] , \Pattern[7][1] , \Pattern[7][2] , \Pattern[7][3] , 
        \Pattern[7][4] , \Pattern[7][5] , \Pattern[7][6] , \Pattern[7][7] }), 
        .S0(N55), .S1(N56), .S2(N57), .Z({N212, N211, N210, N209, N208, N207, 
        N206, N205}) );
  GTECH_BUF B_35 ( .A(N202), .Z(N55) );
  GTECH_BUF B_36 ( .A(N203), .Z(N56) );
  GTECH_BUF B_37 ( .A(N204), .Z(N57) );
  MUX_OP C2073 ( .D0({\Pattern[0][0] , \Pattern[0][1] , \Pattern[0][2] , 
        \Pattern[0][3] , \Pattern[0][4] , \Pattern[0][5] , \Pattern[0][6] , 
        \Pattern[0][7] }), .D1({\Pattern[1][0] , \Pattern[1][1] , 
        \Pattern[1][2] , \Pattern[1][3] , \Pattern[1][4] , \Pattern[1][5] , 
        \Pattern[1][6] , \Pattern[1][7] }), .D2({\Pattern[2][0] , 
        \Pattern[2][1] , \Pattern[2][2] , \Pattern[2][3] , \Pattern[2][4] , 
        \Pattern[2][5] , \Pattern[2][6] , \Pattern[2][7] }), .D3({
        \Pattern[3][0] , \Pattern[3][1] , \Pattern[3][2] , \Pattern[3][3] , 
        \Pattern[3][4] , \Pattern[3][5] , \Pattern[3][6] , \Pattern[3][7] }), 
        .D4({\Pattern[4][0] , \Pattern[4][1] , \Pattern[4][2] , 
        \Pattern[4][3] , \Pattern[4][4] , \Pattern[4][5] , \Pattern[4][6] , 
        \Pattern[4][7] }), .D5({\Pattern[5][0] , \Pattern[5][1] , 
        \Pattern[5][2] , \Pattern[5][3] , \Pattern[5][4] , \Pattern[5][5] , 
        \Pattern[5][6] , \Pattern[5][7] }), .D6({\Pattern[6][0] , 
        \Pattern[6][1] , \Pattern[6][2] , \Pattern[6][3] , \Pattern[6][4] , 
        \Pattern[6][5] , \Pattern[6][6] , \Pattern[6][7] }), .D7({
        \Pattern[7][0] , \Pattern[7][1] , \Pattern[7][2] , \Pattern[7][3] , 
        \Pattern[7][4] , \Pattern[7][5] , \Pattern[7][6] , \Pattern[7][7] }), 
        .S0(N58), .S1(N59), .S2(N60), .Z({N230, N229, N228, N227, N226, N225, 
        N224, N223}) );
  GTECH_BUF B_38 ( .A(N220), .Z(N58) );
  GTECH_BUF B_39 ( .A(N221), .Z(N59) );
  GTECH_BUF B_40 ( .A(N222), .Z(N60) );
  GTECH_AND2 C2077 ( .A(N454), .B(N536), .Z(N61) );
  GTECH_OR2 C2078 ( .A(N462), .B(N535), .Z(N536) );
  GTECH_NOT I_55 ( .A(N534), .Z(N535) );
  GTECH_OR2 C2080 ( .A(N533), .B(count_s[0]), .Z(N534) );
  GTECH_OR2 C2081 ( .A(N532), .B(count_s[1]), .Z(N533) );
  GTECH_OR2 C2082 ( .A(N531), .B(count_s[2]), .Z(N532) );
  GTECH_OR2 C2083 ( .A(N530), .B(count_s[3]), .Z(N531) );
  GTECH_OR2 C2084 ( .A(count_s[5]), .B(count_s[4]), .Z(N530) );
  GTECH_BUF B_41 ( .A(N61), .Z(symbol[0]) );
  GTECH_AND2 C2086 ( .A(N435), .B(N537), .Z(N63) );
  GTECH_OR2 C2087 ( .A(N444), .B(N62), .Z(N537) );
  GTECH_BUF B_42 ( .A(N63), .Z(symbol[1]) );
  GTECH_BUF B_43 ( .A(N427), .Z(symbol[2]) );
  GTECH_BUF B_44 ( .A(N418), .Z(symbol[3]) );
  GTECH_BUF B_45 ( .A(N80), .Z(symbol[4]) );
  GTECH_NOT I_56 ( .A(state[2]), .Z(N81) );
  GTECH_NOT I_57 ( .A(state[1]), .Z(N82) );
  GTECH_NOT I_58 ( .A(state[0]), .Z(N83) );
  GTECH_NOT I_59 ( .A(N87), .Z(N88) );
  GTECH_NOT I_60 ( .A(N90), .Z(N91) );
  GTECH_NOT I_61 ( .A(N93), .Z(N94) );
  GTECH_NOT I_62 ( .A(N96), .Z(N97) );
  GTECH_NOT I_63 ( .A(N99), .Z(N100) );
  GTECH_BUF B_46 ( .A(N94) );
  GTECH_OR2 C2117 ( .A(N102), .B(N103), .Z(N104) );
  GTECH_NOT I_64 ( .A(N109), .Z(N110) );
  GTECH_NOT I_65 ( .A(N112), .Z(N113) );
  GTECH_NOT I_66 ( .A(N115), .Z(N116) );
  GTECH_NOT I_67 ( .A(N118), .Z(N119) );
  GTECH_NOT I_68 ( .A(N121), .Z(N122) );
  GTECH_OR2 C2141 ( .A(work[0]), .B(ispattern), .Z(N124) );
  GTECH_NOT I_69 ( .A(N124), .Z(N125) );
  GTECH_AND2 C2145 ( .A(work[1]), .B(N384), .Z(N126) );
  GTECH_AND2 C2147 ( .A(work[3]), .B(symbol[3]), .Z(N129) );
  GTECH_NOT I_70 ( .A(work[3]), .Z(N130) );
  GTECH_OR2 C2151 ( .A(N130), .B(N129), .Z(N131) );
  GTECH_NOT I_71 ( .A(N131), .Z(N132) );
  GTECH_AND2 C2153 ( .A(N143), .B(N129) );
  GTECH_NOT I_72 ( .A(reset), .Z(N142) );
  GTECH_BUF B_47 ( .A(N142), .Z(N143) );
  GTECH_NOT I_73 ( .A(isstring), .Z(N144) );
  GTECH_AND2 C2159 ( .A(N143), .B(isstring) );
  GTECH_NOT I_74 ( .A(ispattern), .Z(N151) );
  GTECH_AND2 C2162 ( .A(N143), .B(ispattern) );
  GTECH_NOT I_75 ( .A(N540), .Z(N156) );
  GTECH_OR2 C2164 ( .A(N539), .B(count_p[0]), .Z(N540) );
  GTECH_OR2 C2165 ( .A(N538), .B(count_p[1]), .Z(N539) );
  GTECH_OR2 C2166 ( .A(count_p[3]), .B(count_p[2]), .Z(N538) );
  GTECH_OR2 C2168 ( .A(work[3]), .B(isstring), .Z(N157) );
  GTECH_NOT I_76 ( .A(N157), .Z(N158) );
  GTECH_AND2 C2170 ( .A(N143), .B(N246), .Z(N165) );
  GTECH_OR2 C2171 ( .A(N547), .B(symbol[3]), .Z(N166) );
  GTECH_AND2 C2172 ( .A(symbol[0]), .B(N546), .Z(N547) );
  GTECH_NOT I_77 ( .A(N545), .Z(N546) );
  GTECH_OR2 C2174 ( .A(N544), .B(count_s[0]), .Z(N545) );
  GTECH_OR2 C2175 ( .A(N543), .B(count_s[1]), .Z(N544) );
  GTECH_OR2 C2176 ( .A(N542), .B(count_s[2]), .Z(N543) );
  GTECH_OR2 C2177 ( .A(N541), .B(count_s[3]), .Z(N542) );
  GTECH_OR2 C2178 ( .A(count_s[5]), .B(count_s[4]), .Z(N541) );
  GTECH_NOT I_78 ( .A(N166), .Z(N167) );
  GTECH_AND2 C2181 ( .A(N165), .B(N167) );
  GTECH_OR2 C2183 ( .A(work[3]), .B(ispattern), .Z(N186) );
  GTECH_NOT I_79 ( .A(N186), .Z(N187) );
  GTECH_AND2 C2185 ( .A(N143), .B(N248), .Z(N192) );
  GTECH_OR2 C2186 ( .A(N550), .B(symbol[0]), .Z(N193) );
  GTECH_OR2 C2187 ( .A(N549), .B(symbol[1]), .Z(N550) );
  GTECH_OR2 C2188 ( .A(N548), .B(symbol[2]), .Z(N549) );
  GTECH_OR2 C2189 ( .A(symbol[4]), .B(symbol[3]), .Z(N548) );
  GTECH_OR2 C2193 ( .A(symbol_flag[0]), .B(N193), .Z(N194) );
  GTECH_OR2 C2194 ( .A(symbol_flag[1]), .B(N194), .Z(N195) );
  GTECH_NOT I_80 ( .A(N195), .Z(N196) );
  GTECH_AND2 C2196 ( .A(N192), .B(N193) );
  GTECH_AND2 C2197 ( .A(N192), .B(N250), .Z(N201) );
  GTECH_OR2 C2198 ( .A(N395), .B(N156), .Z(N213) );
  GTECH_NOT I_81 ( .A(N213), .Z(N214) );
  GTECH_AND2 C2201 ( .A(N192), .B(N253), .Z(N219) );
  GTECH_OR2 C2202 ( .A(N407), .B(N156), .Z(N231) );
  GTECH_NOT I_82 ( .A(N231), .Z(N232) );
  GTECH_NOT I_83 ( .A(isstring), .Z(N245) );
  GTECH_AND2 C2206 ( .A(work[3]), .B(N245), .Z(N246) );
  GTECH_NOT I_84 ( .A(ispattern), .Z(N247) );
  GTECH_AND2 C2208 ( .A(work[3]), .B(N247), .Z(N248) );
  GTECH_NOT I_85 ( .A(N193), .Z(N249) );
  GTECH_AND2 C2210 ( .A(symbol_flag[0]), .B(N249), .Z(N250) );
  GTECH_AND2 C2211 ( .A(N201), .B(N249) );
  GTECH_NOT I_86 ( .A(symbol_flag[0]), .Z(N251) );
  GTECH_AND2 C2213 ( .A(N249), .B(N251), .Z(N252) );
  GTECH_AND2 C2214 ( .A(symbol_flag[1]), .B(N252), .Z(N253) );
  GTECH_AND2 C2215 ( .A(N219), .B(N252) );
  GTECH_NOT I_87 ( .A(N254), .Z(N255) );
  GTECH_NOT I_88 ( .A(N256), .Z(N257) );
  GTECH_OR2 C2220 ( .A(N257), .B(N255), .Z(N298) );
  GTECH_NOT I_89 ( .A(N298), .Z(N299) );
  GTECH_OR2 C2222 ( .A(N552), .B(symbol[1]), .Z(N340) );
  GTECH_OR2 C2223 ( .A(N551), .B(symbol[2]), .Z(N552) );
  GTECH_OR2 C2224 ( .A(symbol[4]), .B(symbol[3]), .Z(N551) );
  GTECH_AND2 C2225 ( .A(N553), .B(N554), .Z(N341) );
  GTECH_AND2 C2226 ( .A(work[3]), .B(N340), .Z(N553) );
  GTECH_NOT I_90 ( .A(flag), .Z(N554) );
  GTECH_AND2 C2228 ( .A(N556), .B(N342), .Z(N343) );
  GTECH_AND2 C2229 ( .A(N555), .B(work[3]), .Z(N556) );
  GTECH_OR2 C2230 ( .A(N340), .B(symbol_flag[0]), .Z(N555) );
  GTECH_OR2 C2233 ( .A(N343), .B(N341), .Z(N344) );
  GTECH_NOT I_91 ( .A(N344), .Z(N345) );
  GTECH_AND2 C2235 ( .A(N143), .B(N341), .Z(N346) );
  GTECH_AND2 C2236 ( .A(symbol_flag[1]), .B(N347), .Z(N348) );
  GTECH_NOT I_92 ( .A(N348), .Z(N349) );
  GTECH_AND2 C2239 ( .A(N346), .B(N348), .Z(N350) );
  GTECH_AND2 C2241 ( .A(N143), .B(work[2]) );
  GTECH_OR2 C2242 ( .A(N358), .B(symbol[1]), .Z(N359) );
  GTECH_NOT I_93 ( .A(N341), .Z(N360) );
  GTECH_AND2 C2245 ( .A(N343), .B(N360), .Z(N361) );
  GTECH_OR2 C2247 ( .A(N350), .B(N349) );
endmodule

