module  FAS (data_valid, data, clk, rst, fir_d, fir_valid, fft_valid, done, freq,
 fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7, fft_d8,
 fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15, fft_d0);
input clk, rst;
input data_valid;
input [15:0] data; 

output reg fir_valid, fft_valid;
output [15:0] fir_d;
output [31:0] fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7, fft_d8;
output [31:0] fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15, fft_d0;
output reg done;
output [3:0] freq;
`include "./dat/FIR_coefficient.dat"
localparam S0 = 3'b000;
localparam S1 = 3'b001;
localparam S2 = 3'b010;
localparam S3 = 3'b011;
localparam S4 = 3'b100;
localparam S5 = 3'b101;
//======================================================== fft_image
localparam signed [31:0] W0_i = 32'h00000000;
localparam signed [31:0] W1_i = 32'hFFFF9E09;
localparam signed [31:0] W2_i = 32'hFFFF4AFC;
localparam signed [31:0] W3_i = 32'hFFFF137D;
localparam signed [31:0] W4_i = 32'hFFFF0000;
localparam signed [31:0] W5_i = 32'hFFFF137D;
localparam signed [31:0] W6_i = 32'hFFFF4AFC;
localparam signed [31:0] W7_i = 32'hFFFF9E09;
//======================================================== fft_real
localparam signed [31:0] W0_r = 32'h00010000;
localparam signed [31:0] W1_r = 32'h0000EC83;
localparam signed [31:0] W2_r = 32'h0000B504;
localparam signed [31:0] W3_r = 32'h000061F7;
localparam signed [31:0] W4_r = 32'h00000000;
localparam signed [31:0] W5_r = 32'hFFFF9E09;
localparam signed [31:0] W6_r = 32'hFFFF4AFC;
localparam signed [31:0] W7_r = 32'hFFFF137D;

reg [2:0] state,next_state;
reg [4:0] work_flag;
reg [5:0] count,count_1;
reg signed [24:0] fir_all;
reg signed [15:0] fir_data[31:0];
reg signed [18:0] fft_data[15:0];
reg signed [37:0] fft_data1_image[15:0];
reg signed [37:0] fft_data1_real [15:0];
integer i,j;

reg signed [37:0] yr1_i[7:0];
reg signed [37:0] yr1_r[7:0];
reg signed [37:0] yr2_i[7:0];
reg signed [37:0] yr2_r[7:0];
reg signed [31:0] w1r[7:0];
reg signed [31:0] w1i[7:0];
wire signed [37:0] or1_i[7:0];
wire signed [37:0] or1_r[7:0];
wire signed [37:0] or2_i[7:0];
wire signed [37:0] or2_r[7:0];

FFT a00 (.FFT_R1(yr1_r[0]), .FFT_I1(yr1_i[0]), .FFT_R2(yr2_r[0]), .FFT_I2(yr2_i[0]), .wr(w1r[0]), .wi(w1i[0]), .FFT_out_R1(or1_r[0]), .FFT_out_I1(or1_i[0]), .FFT_out_R2(or2_r[0]), .FFT_out_I2(or2_i[0]));
FFT a01 (.FFT_R1(yr1_r[1]), .FFT_I1(yr1_i[1]), .FFT_R2(yr2_r[1]), .FFT_I2(yr2_i[1]), .wr(w1r[1]), .wi(w1i[1]), .FFT_out_R1(or1_r[1]), .FFT_out_I1(or1_i[1]), .FFT_out_R2(or2_r[1]), .FFT_out_I2(or2_i[1]));
FFT a02 (.FFT_R1(yr1_r[2]), .FFT_I1(yr1_i[2]), .FFT_R2(yr2_r[2]), .FFT_I2(yr2_i[2]), .wr(w1r[2]), .wi(w1i[2]), .FFT_out_R1(or1_r[2]), .FFT_out_I1(or1_i[2]), .FFT_out_R2(or2_r[2]), .FFT_out_I2(or2_i[2]));
FFT a03 (.FFT_R1(yr1_r[3]), .FFT_I1(yr1_i[3]), .FFT_R2(yr2_r[3]), .FFT_I2(yr2_i[3]), .wr(w1r[3]), .wi(w1i[3]), .FFT_out_R1(or1_r[3]), .FFT_out_I1(or1_i[3]), .FFT_out_R2(or2_r[3]), .FFT_out_I2(or2_i[3]));
FFT a04 (.FFT_R1(yr1_r[4]), .FFT_I1(yr1_i[4]), .FFT_R2(yr2_r[4]), .FFT_I2(yr2_i[4]), .wr(w1r[4]), .wi(w1i[4]), .FFT_out_R1(or1_r[4]), .FFT_out_I1(or1_i[4]), .FFT_out_R2(or2_r[4]), .FFT_out_I2(or2_i[4]));
FFT a05 (.FFT_R1(yr1_r[5]), .FFT_I1(yr1_i[5]), .FFT_R2(yr2_r[5]), .FFT_I2(yr2_i[5]), .wr(w1r[5]), .wi(w1i[5]), .FFT_out_R1(or1_r[5]), .FFT_out_I1(or1_i[5]), .FFT_out_R2(or2_r[5]), .FFT_out_I2(or2_i[5]));
FFT a06 (.FFT_R1(yr1_r[6]), .FFT_I1(yr1_i[6]), .FFT_R2(yr2_r[6]), .FFT_I2(yr2_i[6]), .wr(w1r[6]), .wi(w1i[6]), .FFT_out_R1(or1_r[6]), .FFT_out_I1(or1_i[6]), .FFT_out_R2(or2_r[6]), .FFT_out_I2(or2_i[6]));
FFT a07 (.FFT_R1(yr1_r[7]), .FFT_I1(yr1_i[7]), .FFT_R2(yr2_r[7]), .FFT_I2(yr2_i[7]), .wr(w1r[7]), .wi(w1i[7]), .FFT_out_R1(or1_r[7]), .FFT_out_I1(or1_i[7]), .FFT_out_R2(or2_r[7]), .FFT_out_I2(or2_i[7]));

wire signed [8:0] fir_all_1 = fir_all[24:16] + 1;
assign fir_d = (fir_all >= 0)? {7'h0, fir_all[24:16]}: (fir_all_1)? {7'h7f, fir_all_1}: {7'h0, fir_all_1};

assign fft_d0  = {fft_data1_real[ 0][23:8],fft_data1_image[ 0][23:8]};
assign fft_d8  = {fft_data1_real[ 1][23:8],fft_data1_image[ 1][23:8]};
assign fft_d4  = {fft_data1_real[ 2][23:8],fft_data1_image[ 2][23:8]};
assign fft_d12 = {fft_data1_real[ 3][23:8],fft_data1_image[ 3][23:8]};
assign fft_d2  = {fft_data1_real[ 4][23:8],fft_data1_image[ 4][23:8]};
assign fft_d10 = {fft_data1_real[ 5][23:8],fft_data1_image[ 5][23:8]};
assign fft_d6  = {fft_data1_real[ 6][23:8],fft_data1_image[ 6][23:8]};
assign fft_d14 = {fft_data1_real[ 7][23:8],fft_data1_image[ 7][23:8]};
assign fft_d1  = {fft_data1_real[ 8][23:8],fft_data1_image[ 8][23:8]};
assign fft_d9  = {fft_data1_real[ 9][23:8],fft_data1_image[ 9][23:8]};
assign fft_d5  = {fft_data1_real[10][23:8],fft_data1_image[10][23:8]};
assign fft_d13 = {fft_data1_real[11][23:8],fft_data1_image[11][23:8]};
assign fft_d3  = {fft_data1_real[12][23:8],fft_data1_image[12][23:8]};
assign fft_d11 = {fft_data1_real[13][23:8],fft_data1_image[13][23:8]};
assign fft_d7  = {fft_data1_real[14][23:8],fft_data1_image[14][23:8]};
assign fft_d15 = {fft_data1_real[15][23:8],fft_data1_image[15][23:8]};

reg [3:0] flag[3:0];
reg signed [31:0] max_in[3:0];
wire [3:0] flag_end;
wire [31:0] max_end;
reg [3:0] wait_flag[3:0];
reg signed [31:0]wait_data[3:0];

MAX a0(.flag_1(flag[0]), .flag_2(flag[1]), .flag_3(flag[2]), .flag_4(flag[3]), .data_1(max_in[0]), .data_2(max_in[1]), .data_3(max_in[2]), .data_4(max_in[3]), .flag_out(flag_end), .max(max_end));

assign freq = flag_end;

always @(posedge clk, posedge rst) begin
	if(rst) state <= S0;
	else	state <= next_state;
end
always @(*) begin
	case(state)
		S0:begin
			if(count == 32)	next_state = S1;
			else		next_state = S0;
		end
		S1:begin
			if(&count[3:0]) next_state = S2;
			else		next_state = S1;
		end
		S2:begin
			if(count_1 == 3)next_state = S3;
			else		next_state = S2;
		end
		S3:begin
			next_state = S4;
		end
		S4:begin
			if(count_1 == 8)next_state = S5;
			else 		next_state = S4;
		end
		S5: next_state = S2;
		default:begin
			next_state = S0;
		end	
	endcase
end
always @(*) begin
	case (state)
		S0:	 work_flag = 5'b0_0001;
		S1:	 work_flag = 5'b0_0011;
		S2:	 work_flag = 5'b0_0111;
		S3:	 work_flag = 5'b0_1111;
		S4:	 work_flag = 5'b0_0111;
		S5:	 work_flag = 5'b1_0111;
		default: work_flag = 5'b0_0000;
	endcase
end

always @(posedge clk, posedge rst) begin
	if(rst)begin
		fir_valid <= 0;
		fft_valid <= 0;
		done <= 0;
	end
	else begin
		fir_valid <= work_flag[1];
		fft_valid <= work_flag[3];
		done <= work_flag[4];
	end
end

always @(posedge clk) begin
	if(work_flag[0])begin
		for(i = 0;i < 31;i = i + 1)begin
			fir_data[i + 1] <= fir_data[i];
		end
		fir_data[0] <= data;

		fir_all <= ((fir_data[31] + fir_data[ 0]) * FIR_C00) + 
			   ((fir_data[30] + fir_data[ 1]) * FIR_C01) + 
			   ((fir_data[29] + fir_data[ 2]) * FIR_C02) + 
			   ((fir_data[28] + fir_data[ 3]) * FIR_C03) + 
			   ((fir_data[27] + fir_data[ 4]) * FIR_C04) + 
			   ((fir_data[26] + fir_data[ 5]) * FIR_C05) + 
			   ((fir_data[25] + fir_data[ 6]) * FIR_C06) + 
			   ((fir_data[24] + fir_data[ 7]) * FIR_C07) + 
			   ((fir_data[23] + fir_data[ 8]) * FIR_C08) + 
			   ((fir_data[22] + fir_data[ 9]) * FIR_C09) + 
			   ((fir_data[21] + fir_data[10]) * FIR_C10) + 
			   ((fir_data[20] + fir_data[11]) * FIR_C11) + 
			   ((fir_data[19] + fir_data[12]) * FIR_C12) + 
			   ((fir_data[18] + fir_data[13]) * FIR_C13) + 
			   ((fir_data[17] + fir_data[14]) * FIR_C14) + 
			   ((fir_data[16] + fir_data[15]) * FIR_C15) ; 
	end
end

always @(posedge clk, posedge rst) begin
	if(rst)begin
		count <= 0;
	end
	else begin
		if(work_flag[0])begin
			if(&count)	count <= 0;
			else 		count <= count + 1;
		end
	end
end

always @(posedge clk, posedge rst) begin
	if(rst)begin
		count_1 <= 0;
	end
	else begin
		if(fir_valid)begin
			if(&count_1[3:0])count_1 <= 0;
			else		 count_1 <= count_1 + 1;
		end
	end
end

always @(posedge clk) begin
	if(fir_valid)begin
		for(j = 15;j > 0;j = j - 1)begin
			fft_data[j - 1] <= fft_data[j];
		end
		fft_data[15] <= {fir_d[10:0],8'b0};
	end
end

always @(*) begin
	case (count_1)
		0:begin
			yr1_r[ 0] = fft_data[ 0];   yr1_i[ 0] = 0;   yr2_r[ 0] = fft_data[ 8];   yr2_i[ 0] = 0;   w1r[0] = W0_r;   w1i[0] = W0_i;
			yr1_r[ 1] = fft_data[ 1];   yr1_i[ 1] = 0;   yr2_r[ 1] = fft_data[ 9];   yr2_i[ 1] = 0;   w1r[1] = W1_r;   w1i[1] = W1_i;
			yr1_r[ 2] = fft_data[ 2];   yr1_i[ 2] = 0;   yr2_r[ 2] = fft_data[10];   yr2_i[ 2] = 0;   w1r[2] = W2_r;   w1i[2] = W2_i;
			yr1_r[ 3] = fft_data[ 3];   yr1_i[ 3] = 0;   yr2_r[ 3] = fft_data[11];   yr2_i[ 3] = 0;   w1r[3] = W3_r;   w1i[3] = W3_i;
			yr1_r[ 4] = fft_data[ 4];   yr1_i[ 4] = 0;   yr2_r[ 4] = fft_data[12];   yr2_i[ 4] = 0;   w1r[4] = W4_r;   w1i[4] = W4_i;
			yr1_r[ 5] = fft_data[ 5];   yr1_i[ 5] = 0;   yr2_r[ 5] = fft_data[13];   yr2_i[ 5] = 0;   w1r[5] = W5_r;   w1i[5] = W5_i;
			yr1_r[ 6] = fft_data[ 6];   yr1_i[ 6] = 0;   yr2_r[ 6] = fft_data[14];   yr2_i[ 6] = 0;   w1r[6] = W6_r;   w1i[6] = W6_i;
			yr1_r[ 7] = fft_data[ 7];   yr1_i[ 7] = 0;   yr2_r[ 7] = fft_data[15];   yr2_i[ 7] = 0;   w1r[7] = W7_r;   w1i[7] = W7_i;
		end 
		1:begin
			yr1_r[ 0] = fft_data1_real[ 0];   yr1_i[ 0] = fft_data1_image[ 0];   yr2_r[ 0] = fft_data1_real[ 4];   yr2_i[ 0] = fft_data1_image[ 4];   w1r[0] = W0_r;   w1i[0] = W0_i;  
			yr1_r[ 1] = fft_data1_real[ 1];   yr1_i[ 1] = fft_data1_image[ 1];   yr2_r[ 1] = fft_data1_real[ 5];   yr2_i[ 1] = fft_data1_image[ 5];   w1r[1] = W2_r;   w1i[1] = W2_i;
			yr1_r[ 2] = fft_data1_real[ 2];   yr1_i[ 2] = fft_data1_image[ 2];   yr2_r[ 2] = fft_data1_real[ 6];   yr2_i[ 2] = fft_data1_image[ 6];   w1r[2] = W4_r;   w1i[2] = W4_i;
			yr1_r[ 3] = fft_data1_real[ 3];   yr1_i[ 3] = fft_data1_image[ 3];   yr2_r[ 3] = fft_data1_real[ 7];   yr2_i[ 3] = fft_data1_image[ 7];   w1r[3] = W6_r;   w1i[3] = W6_i;
			yr1_r[ 4] = fft_data1_real[ 8];   yr1_i[ 4] = fft_data1_image[ 8];   yr2_r[ 4] = fft_data1_real[12];   yr2_i[ 4] = fft_data1_image[12];   w1r[4] = W0_r;   w1i[4] = W0_i;
			yr1_r[ 5] = fft_data1_real[ 9];   yr1_i[ 5] = fft_data1_image[ 9];   yr2_r[ 5] = fft_data1_real[13];   yr2_i[ 5] = fft_data1_image[13];   w1r[5] = W2_r;   w1i[5] = W2_i;
			yr1_r[ 6] = fft_data1_real[10];   yr1_i[ 6] = fft_data1_image[10];   yr2_r[ 6] = fft_data1_real[14];   yr2_i[ 6] = fft_data1_image[14];   w1r[6] = W4_r;   w1i[6] = W4_i;
			yr1_r[ 7] = fft_data1_real[11];   yr1_i[ 7] = fft_data1_image[11];   yr2_r[ 7] = fft_data1_real[15];   yr2_i[ 7] = fft_data1_image[15];   w1r[7] = W6_r;   w1i[7] = W6_i;
		end 
		2:begin
			yr1_r[ 0] = fft_data1_real[ 0];   yr1_i[ 0] = fft_data1_image[ 0];   yr2_r[ 0] = fft_data1_real[ 2];   yr2_i[ 0] = fft_data1_image[ 2];   w1r[0] = W0_r;   w1i[0] = W0_i;
			yr1_r[ 1] = fft_data1_real[ 1];   yr1_i[ 1] = fft_data1_image[ 1];   yr2_r[ 1] = fft_data1_real[ 3];   yr2_i[ 1] = fft_data1_image[ 3];   w1r[1] = W4_r;   w1i[1] = W4_i;
			yr1_r[ 2] = fft_data1_real[ 4];   yr1_i[ 2] = fft_data1_image[ 4];   yr2_r[ 2] = fft_data1_real[ 6];   yr2_i[ 2] = fft_data1_image[ 6];   w1r[2] = W0_r;   w1i[2] = W0_i;
			yr1_r[ 3] = fft_data1_real[ 5];   yr1_i[ 3] = fft_data1_image[ 5];   yr2_r[ 3] = fft_data1_real[ 7];   yr2_i[ 3] = fft_data1_image[ 7];   w1r[3] = W4_r;   w1i[3] = W4_i;
			yr1_r[ 4] = fft_data1_real[ 8];   yr1_i[ 4] = fft_data1_image[ 8];   yr2_r[ 4] = fft_data1_real[10];   yr2_i[ 4] = fft_data1_image[10];   w1r[4] = W0_r;   w1i[4] = W0_i;
			yr1_r[ 5] = fft_data1_real[ 9];   yr1_i[ 5] = fft_data1_image[ 9];   yr2_r[ 5] = fft_data1_real[11];   yr2_i[ 5] = fft_data1_image[11];   w1r[5] = W4_r;   w1i[5] = W4_i;
			yr1_r[ 6] = fft_data1_real[12];   yr1_i[ 6] = fft_data1_image[12];   yr2_r[ 6] = fft_data1_real[14];   yr2_i[ 6] = fft_data1_image[14];   w1r[6] = W0_r;   w1i[6] = W0_i;
			yr1_r[ 7] = fft_data1_real[13];   yr1_i[ 7] = fft_data1_image[13];   yr2_r[ 7] = fft_data1_real[15];   yr2_i[ 7] = fft_data1_image[15];   w1r[7] = W4_r;   w1i[7] = W4_i;
		end 
		default:begin
			yr1_r[ 0] = fft_data1_real[ 0];   yr1_i[ 0] = fft_data1_image[ 0];   yr2_r[ 0] = fft_data1_real[ 1];   yr2_i[ 0] = fft_data1_image[ 1];   w1r[0] = W0_r;   w1i[0] = W0_i;
			yr1_r[ 1] = fft_data1_real[ 2];   yr1_i[ 1] = fft_data1_image[ 2];   yr2_r[ 1] = fft_data1_real[ 3];   yr2_i[ 1] = fft_data1_image[ 3];   w1r[1] = W0_r;   w1i[1] = W0_i;
			yr1_r[ 2] = fft_data1_real[ 4];   yr1_i[ 2] = fft_data1_image[ 4];   yr2_r[ 2] = fft_data1_real[ 5];   yr2_i[ 2] = fft_data1_image[ 5];   w1r[2] = W0_r;   w1i[2] = W0_i;
			yr1_r[ 3] = fft_data1_real[ 6];   yr1_i[ 3] = fft_data1_image[ 6];   yr2_r[ 3] = fft_data1_real[ 7];   yr2_i[ 3] = fft_data1_image[ 7];   w1r[3] = W0_r;   w1i[3] = W0_i;
			yr1_r[ 4] = fft_data1_real[ 8];   yr1_i[ 4] = fft_data1_image[ 8];   yr2_r[ 4] = fft_data1_real[ 9];   yr2_i[ 4] = fft_data1_image[ 9];   w1r[4] = W0_r;   w1i[4] = W0_i;
			yr1_r[ 5] = fft_data1_real[10];   yr1_i[ 5] = fft_data1_image[10];   yr2_r[ 5] = fft_data1_real[11];   yr2_i[ 5] = fft_data1_image[11];   w1r[5] = W0_r;   w1i[5] = W0_i;
			yr1_r[ 6] = fft_data1_real[12];   yr1_i[ 6] = fft_data1_image[12];   yr2_r[ 6] = fft_data1_real[13];   yr2_i[ 6] = fft_data1_image[13];   w1r[6] = W0_r;   w1i[6] = W0_i;
			yr1_r[ 7] = fft_data1_real[14];   yr1_i[ 7] = fft_data1_image[14];   yr2_r[ 7] = fft_data1_real[15];   yr2_i[ 7] = fft_data1_image[15];   w1r[7] = W0_r;   w1i[7] = W0_i;
		end  
	endcase
end

always @(posedge clk) begin
	case (count_1)
		0:begin
			fft_data1_real [ 0] <= or1_r[0];   fft_data1_image[ 0] <= 0;   fft_data1_real [ 8] <= or2_r[0];   fft_data1_image[ 8] <= or2_i[0];
			fft_data1_real [ 1] <= or1_r[1];   fft_data1_image[ 1] <= 0;   fft_data1_real [ 9] <= or2_r[1];   fft_data1_image[ 9] <= or2_i[1];
			fft_data1_real [ 2] <= or1_r[2];   fft_data1_image[ 2] <= 0;   fft_data1_real [10] <= or2_r[2];   fft_data1_image[10] <= or2_i[2];
			fft_data1_real [ 3] <= or1_r[3];   fft_data1_image[ 3] <= 0;   fft_data1_real [11] <= or2_r[3];   fft_data1_image[11] <= or2_i[3];
			fft_data1_real [ 4] <= or1_r[4];   fft_data1_image[ 4] <= 0;   fft_data1_real [12] <= or2_r[4];   fft_data1_image[12] <= or2_i[4];
			fft_data1_real [ 5] <= or1_r[5];   fft_data1_image[ 5] <= 0;   fft_data1_real [13] <= or2_r[5];   fft_data1_image[13] <= or2_i[5];
			fft_data1_real [ 6] <= or1_r[6];   fft_data1_image[ 6] <= 0;   fft_data1_real [14] <= or2_r[6];   fft_data1_image[14] <= or2_i[6];
			fft_data1_real [ 7] <= or1_r[7];   fft_data1_image[ 7] <= 0;   fft_data1_real [15] <= or2_r[7];   fft_data1_image[15] <= or2_i[7];
		end
		1:begin
			fft_data1_real [ 0] <= or1_r[0];   fft_data1_image[ 0] <= or1_i[0];   fft_data1_real [ 4] <= or2_r[0];   fft_data1_image[ 4] <= or2_i[0];
			fft_data1_real [ 1] <= or1_r[1];   fft_data1_image[ 1] <= or1_i[1];   fft_data1_real [ 5] <= or2_r[1];   fft_data1_image[ 5] <= or2_i[1];
			fft_data1_real [ 2] <= or1_r[2];   fft_data1_image[ 2] <= or1_i[2];   fft_data1_real [ 6] <= or2_r[2];   fft_data1_image[ 6] <= or2_i[2];
			fft_data1_real [ 3] <= or1_r[3];   fft_data1_image[ 3] <= or1_i[3];   fft_data1_real [ 7] <= or2_r[3];   fft_data1_image[ 7] <= or2_i[3];
			fft_data1_real [ 8] <= or1_r[4];   fft_data1_image[ 8] <= or1_i[4];   fft_data1_real [12] <= or2_r[4];   fft_data1_image[12] <= or2_i[4];
			fft_data1_real [ 9] <= or1_r[5];   fft_data1_image[ 9] <= or1_i[5];   fft_data1_real [13] <= or2_r[5];   fft_data1_image[13] <= or2_i[5];
			fft_data1_real [10] <= or1_r[6];   fft_data1_image[10] <= or1_i[6];   fft_data1_real [14] <= or2_r[6];   fft_data1_image[14] <= or2_i[6];
			fft_data1_real [11] <= or1_r[7];   fft_data1_image[11] <= or1_i[7];   fft_data1_real [15] <= or2_r[7];   fft_data1_image[15] <= or2_i[7];
		end
		2:begin
			fft_data1_real [ 0] <= or1_r[0];   fft_data1_image[ 0] <= or1_i[0];   fft_data1_real [ 2] <= or2_r[0];   fft_data1_image[ 2] <= or2_i[0];
			fft_data1_real [ 1] <= or1_r[1];   fft_data1_image[ 1] <= or1_i[1];   fft_data1_real [ 3] <= or2_r[1];   fft_data1_image[ 3] <= or2_i[1];
			fft_data1_real [ 4] <= or1_r[2];   fft_data1_image[ 4] <= or1_i[2];   fft_data1_real [ 6] <= or2_r[2];   fft_data1_image[ 6] <= or2_i[2];
			fft_data1_real [ 5] <= or1_r[3];   fft_data1_image[ 5] <= or1_i[3];   fft_data1_real [ 7] <= or2_r[3];   fft_data1_image[ 7] <= or2_i[3];
			fft_data1_real [ 8] <= or1_r[4];   fft_data1_image[ 8] <= or1_i[4];   fft_data1_real [10] <= or2_r[4];   fft_data1_image[10] <= or2_i[4];
			fft_data1_real [ 9] <= or1_r[5];   fft_data1_image[ 9] <= or1_i[5];   fft_data1_real [11] <= or2_r[5];   fft_data1_image[11] <= or2_i[5];
			fft_data1_real [12] <= or1_r[6];   fft_data1_image[12] <= or1_i[6];   fft_data1_real [14] <= or2_r[6];   fft_data1_image[14] <= or2_i[6];
			fft_data1_real [13] <= or1_r[7];   fft_data1_image[13] <= or1_i[7];   fft_data1_real [15] <= or2_r[7];   fft_data1_image[15] <= or2_i[7];
		end 
		3:begin
			fft_data1_real [ 0] <= or1_r[0];   fft_data1_image[ 0] <= or1_i[0];   fft_data1_real [ 1] <= or2_r[0];   fft_data1_image[ 1] <= or2_i[0];
			fft_data1_real [ 2] <= or1_r[1];   fft_data1_image[ 2] <= or1_i[1];   fft_data1_real [ 3] <= or2_r[1];   fft_data1_image[ 3] <= or2_i[1];
			fft_data1_real [ 4] <= or1_r[2];   fft_data1_image[ 4] <= or1_i[2];   fft_data1_real [ 5] <= or2_r[2];   fft_data1_image[ 5] <= or2_i[2];
			fft_data1_real [ 6] <= or1_r[3];   fft_data1_image[ 6] <= or1_i[3];   fft_data1_real [ 7] <= or2_r[3];   fft_data1_image[ 7] <= or2_i[3];
			fft_data1_real [ 8] <= or1_r[4];   fft_data1_image[ 8] <= or1_i[4];   fft_data1_real [ 9] <= or2_r[4];   fft_data1_image[ 9] <= or2_i[4];
			fft_data1_real [10] <= or1_r[5];   fft_data1_image[10] <= or1_i[5];   fft_data1_real [11] <= or2_r[5];   fft_data1_image[11] <= or2_i[5];
			fft_data1_real [12] <= or1_r[6];   fft_data1_image[12] <= or1_i[6];   fft_data1_real [13] <= or2_r[6];   fft_data1_image[13] <= or2_i[6];
			fft_data1_real [14] <= or1_r[7];   fft_data1_image[14] <= or1_i[7];   fft_data1_real [15] <= or2_r[7];   fft_data1_image[15] <= or2_i[7];
		end
	endcase
end

always @(*) begin
	case (count_1)
		4:begin
			flag[0] = 0 ;   max_in[0] = {fft_data1_real[ 0][23:8],fft_data1_image[ 0][23:8]};
			flag[1] = 8 ;   max_in[1] = {fft_data1_real[ 1][23:8],fft_data1_image[ 1][23:8]};
			flag[2] = 4 ;   max_in[2] = {fft_data1_real[ 2][23:8],fft_data1_image[ 2][23:8]};
			flag[3] = 12;   max_in[3] = {fft_data1_real[ 3][23:8],fft_data1_image[ 3][23:8]};
		end 
		5:begin
			flag[0] = 2 ;   max_in[0] = {fft_data1_real[ 4][23:8],fft_data1_image[ 4][23:8]};
			flag[1] = 10;   max_in[1] = {fft_data1_real[ 5][23:8],fft_data1_image[ 5][23:8]};
			flag[2] = 6 ;   max_in[2] = {fft_data1_real[ 6][23:8],fft_data1_image[ 6][23:8]};
			flag[3] = 14;   max_in[3] = {fft_data1_real[ 7][23:8],fft_data1_image[ 7][23:8]};
		end 
		6:begin
			flag[0] = 1 ;   max_in[0] = {fft_data1_real[ 8][23:8],fft_data1_image[ 8][23:8]};
			flag[1] = 9 ;   max_in[1] = {fft_data1_real[ 9][23:8],fft_data1_image[ 9][23:8]};
			flag[2] = 5 ;   max_in[2] = {fft_data1_real[10][23:8],fft_data1_image[10][23:8]};
			flag[3] = 13;   max_in[3] = {fft_data1_real[11][23:8],fft_data1_image[11][23:8]};
		end 
		7:begin
			flag[0] = 3 ;   max_in[0] = {fft_data1_real[12][23:8],fft_data1_image[12][23:8]};
			flag[1] = 11;   max_in[1] = {fft_data1_real[13][23:8],fft_data1_image[13][23:8]};
			flag[2] = 7 ;   max_in[2] = {fft_data1_real[14][23:8],fft_data1_image[14][23:8]};
			flag[3] = 15;   max_in[3] = {fft_data1_real[15][23:8],fft_data1_image[15][23:8]};
		end 
		default:begin
			flag[0] = wait_flag[0];   max_in[0] = wait_data[0];
			flag[1] = wait_flag[1];   max_in[1] = wait_data[1];
			flag[2] = wait_flag[2];   max_in[2] = wait_data[2];
			flag[3] = wait_flag[3];   max_in[3] = wait_data[3];
		end 
		
	endcase
end

always @(posedge clk) begin
	case(count_1)
		4:begin
			wait_flag[0] <= flag_end;   wait_data[0] <= max_end;
		end
		5:begin
			wait_flag[1] <= flag_end;   wait_data[1] <= max_end;
		end
		6:begin
			wait_flag[2] <= flag_end;   wait_data[2] <= max_end;
		end
		7:begin
			wait_flag[3] <= flag_end;   wait_data[3] <= max_end;
		end
	endcase
end

endmodule

module FFT (
input signed [37:0] FFT_R1,
input signed [37:0] FFT_I1,
input signed [37:0] FFT_R2,
input signed [37:0] FFT_I2,
input signed [31:0] wr, 
input signed [31:0] wi, 
output signed [37:0] FFT_out_R1,
output signed [37:0] FFT_out_I1,
output signed [37:0] FFT_out_R2,
output signed [37:0] FFT_out_I2
);

wire signed [37:0] r_work;
wire signed [37:0] i_work;

assign r_work = ((FFT_R1 - FFT_R2) * wr) + ((FFT_I2 - FFT_I1) * wi);
assign i_work = ((FFT_R1 - FFT_R2) * wi) + ((FFT_I1 - FFT_I2) * wr);

assign FFT_out_R1 = FFT_R1 + FFT_R2;
assign FFT_out_R2 = {(r_work[37]? 16'hffff: 16'b0),r_work[37:16]};
assign FFT_out_I1 = FFT_I1 + FFT_I2;
assign FFT_out_I2 = {(i_work[37]? 16'hffff: 16'b0),i_work[37:16]};

endmodule

module MAX (
input [3:0] flag_1,	
input [3:0] flag_2,	
input [3:0] flag_3,	
input [3:0] flag_4,	
input signed [31:0] data_1,
input signed [31:0] data_2,
input signed [31:0] data_3,
input signed [31:0] data_4,
output reg [3:0] flag_out,
output reg signed [31:0] max
);

wire signed [23:0] data_1_big = $signed(data_1[31:16]) * $signed(data_1[31:16]) + $signed(data_1[15:0]) * $signed(data_1[15:0]);
wire signed [23:0] data_2_big = $signed(data_2[31:16]) * $signed(data_2[31:16]) + $signed(data_2[15:0]) * $signed(data_2[15:0]);
wire signed [23:0] data_3_big = $signed(data_3[31:16]) * $signed(data_3[31:16]) + $signed(data_3[15:0]) * $signed(data_3[15:0]);
wire signed [23:0] data_4_big = $signed(data_4[31:16]) * $signed(data_4[31:16]) + $signed(data_4[15:0]) * $signed(data_4[15:0]);

always @(*) begin
	if((data_1_big[23:12] > data_2_big[23:12]) & (data_1_big[23:12] > data_3_big[23:12]) & (data_1_big[23:12] > data_4_big[23:12]))begin
		flag_out = flag_1;
		max = data_1;
	end
	else if((data_2_big[23:12] > data_1_big[23:12]) & (data_2_big[23:12] > data_3_big[23:12]) & (data_2_big[23:12] > data_4_big[23:12]))begin
		flag_out = flag_2;
		max = data_2;
	end
	else if((data_3_big[23:12] > data_1_big[23:12]) & (data_3_big[23:12] > data_2_big[23:12]) & (data_3_big[23:12] > data_4_big[23:12]))begin
		flag_out = flag_3;
		max = data_3;
	end
	else begin 
		flag_out = flag_4;
		max = data_4;
	end
end

endmodule