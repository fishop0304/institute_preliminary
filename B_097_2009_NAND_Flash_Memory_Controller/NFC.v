`timescale 1ns/100ps
module NFC(clk, rst, cmd, done, M_RW, M_A, M_D, F_IO, F_CLE, F_ALE, F_REN, F_WEN, F_RB);

input clk;
input rst;
input [32:0] cmd;
output reg done;
output M_RW;
output [6:0] M_A;
inout  [7:0] M_D;
inout  [7:0] F_IO;
output F_CLE;
output F_ALE;
output reg F_REN;
output reg F_WEN;
input  F_RB;
//===============================
localparam INIT	  	  = 0;
localparam RST_F	  = 1;
localparam BEGINING	  = 2;
localparam ITF_or_FTI	  = 3;
localparam CHECK 	  = 4;
localparam CHECK_DIRTY 	  = 5;
//===============================
localparam WIRTE_F_RorL   = 6;
localparam BEGIN_IST	  = 7;
localparam WIRTE_F_ADDR	  = 8;
localparam WIRTE_F_DATA   = 9;
localparam END_IST	  = 10;
localparam CHECK_F	  = 11;
//===============================
localparam WIRTE_I_RorL   = 12;
localparam WIRTE_I_ADDR   = 13;
localparam WIRTE_I_DATA   = 14;
localparam CHECK_I_RB 	  = 15;
localparam CHECK_I_DATA   = 16;
//===============================
localparam E_BEGIN_IST	  = 17;
localparam E_END_IST	  = 23;
localparam READ_F_RorL	  = 18;
localparam READ_F_ADDR	  = 19;
localparam READ_F_DATA	  = 20;
localparam CHECK_F_RB 	  = 21;
localparam CHECK_ALL	  = 22;
localparam ERASE_ADDR	  = 24;
//===============================
localparam E_WIRTE_F_RorL = 25;
localparam E_F_BEGIN_IST  = 26;	
localparam E_WIRTE_F_ADDR = 27;
localparam E_WIRTE_F_DATA = 28;
localparam E_F_END_IST 	  = 29;
localparam E_CHECK  	  = 30;
localparam CHECK_RB  	  = 31;


integer i;
reg data, data_1, clk_div;
reg [4:0]  status, next_status;
reg [7:0]  y, x;
reg [3:0]  M_Y;
reg [2:0]  M_X;
reg [7:0]  I_data, F_data;
reg [5:0]  work;
reg [1:0]  count;
reg [3:0]  cn;
reg [10:0] count_addr;
reg [7:0]  block_memory [0:2047];
reg [127:0] dirty_bit;

wire [3:0] M_Y_add = M_Y + 1'b1;
wire [2:0] M_X_add = M_X + 1'b1;
wire [6:0] test = cmd[30:24];
wire flag = dirty_bit[test];
wire [12:0] cmd_cn = cmd[26:14] + count_addr;
wire [17:0] cmd_addr = (dirty_bit[test] & !cmd[32])? {cmd[31:24], 10'd0} + count_addr: (cmd[31:14] + count_addr);
wire equal = ((count_addr + 1) == cmd[6:0]);
wire [8:0] aa = cmd_addr[8:0];

assign F_CLE = work[3];
assign F_ALE = work[2];
// assign F_REN = (work[1])? 1'b1: clk;
// assign F_WEN = (work[0])? ~clk: 1'b1;
assign F_IO = (work[4])? F_data: 8'hz;

assign M_D = (status == WIRTE_F_DATA | status == E_WIRTE_F_DATA)? 8'hz: I_data;
assign M_A = {M_Y, M_X};
assign M_RW = work[5];
//==================================================== status
always @(posedge clk, posedge rst) begin
    status <= (rst)? INIT: next_status;
end

always @(*)begin
	case(status)
		INIT:			next_status = RST_F;
		RST_F:			next_status = BEGINING;
		BEGINING:		next_status = (F_RB)? ITF_or_FTI: BEGINING;
		ITF_or_FTI:		next_status = (cmd[32])? WIRTE_I_RorL: CHECK_DIRTY;
		CHECK_DIRTY:	next_status = (dirty_bit[test])? READ_F_RorL: WIRTE_F_RorL;

		WIRTE_F_RorL:	next_status = BEGIN_IST;
		BEGIN_IST: 		next_status = WIRTE_F_ADDR;
		WIRTE_F_ADDR:	next_status = (count == 2)? WIRTE_F_DATA: WIRTE_F_ADDR;
		WIRTE_F_DATA:	next_status = (equal | (&cmd_addr[8:0]))? END_IST: WIRTE_F_DATA; 
		END_IST:		next_status = (data)? CHECK_F: CHECK;
		CHECK_F:		next_status = (F_RB)? WIRTE_F_RorL: CHECK_F;

		READ_F_RorL:	next_status = READ_F_ADDR;
		READ_F_ADDR:	next_status = (count == 2)? CHECK_F_RB: READ_F_ADDR;
		CHECK_F_RB:		next_status = (F_RB)? READ_F_DATA: CHECK_F_RB;
		READ_F_DATA:	next_status = (&cmd_addr[8:0])? CHECK_ALL: READ_F_DATA;
		CHECK_ALL:		next_status = (cn == 3)? E_BEGIN_IST: READ_F_RorL;

		E_BEGIN_IST:	next_status = ERASE_ADDR;
		ERASE_ADDR:		next_status = (count)? E_END_IST: ERASE_ADDR;
		E_END_IST:		next_status = CHECK_RB;
		CHECK_RB:		next_status = (F_RB)? E_WIRTE_F_RorL: CHECK_RB;

		E_WIRTE_F_RorL:	next_status = E_F_BEGIN_IST;
		E_F_BEGIN_IST:	next_status = E_WIRTE_F_ADDR;
		E_WIRTE_F_ADDR:	next_status = (count == 2)? E_WIRTE_F_DATA: E_WIRTE_F_ADDR;
		E_WIRTE_F_DATA:	next_status = (&cmd_addr[8:0])? E_F_END_IST: E_WIRTE_F_DATA;
		E_F_END_IST:	next_status = (cn == 3)? CHECK: E_CHECK;
		E_CHECK:		next_status = (F_RB)? E_WIRTE_F_RorL: E_CHECK;
		

		WIRTE_I_RorL:	next_status = WIRTE_I_ADDR;
		WIRTE_I_ADDR:	next_status = (count == 2)? CHECK_I_RB: WIRTE_I_ADDR;
		CHECK_I_RB:		next_status = (F_RB)? WIRTE_I_DATA: CHECK_I_RB;
		WIRTE_I_DATA:	next_status = (equal | (&cmd_addr[7:0]))? CHECK_I_DATA: WIRTE_I_DATA;
		CHECK_I_DATA:	next_status = (data)? WIRTE_I_RorL: CHECK;

		CHECK:			next_status = (F_RB)? BEGINING: CHECK;
		default: 		next_status = INIT;
	endcase 
end

always @(*) begin//===== {F_CLE, F_ALE, FF_REN, F_WEN}
	case(status)
		INIT:			work = 6'b10_0010;
		RST_F:			work = 6'b11_1011;
		BEGINING:		work = 6'b10_0010;
		ITF_or_FTI:		work = 6'b10_0010;
		CHECK_DIRTY:	work = 6'b10_0010;

		WIRTE_F_RorL:	work = 6'b11_1011;
		BEGIN_IST: 		work = 6'b11_1011;
		WIRTE_F_ADDR:	work = 6'b11_0111;
		WIRTE_F_DATA:	work = 6'b11_0011;
		END_IST:		work = 6'b11_1011;		
		CHECK_F:		work = 6'b10_0010;
		//====================================
		READ_F_RorL:	work = 6'b11_1011;
		READ_F_ADDR:	work = 6'b11_0111;
		CHECK_F_RB:		work = 6'b10_0010;
		READ_F_DATA:	work = 6'b10_0000;
		CHECK_ALL:		work = 6'b10_0010;

		E_BEGIN_IST:	work = 6'b11_1011; 
		ERASE_ADDR:		work = 6'b11_0111;
		E_END_IST:		work = 6'b11_1011;
		CHECK_RB:		work = 6'b10_0010;

		E_WIRTE_F_RorL:	work = 6'b11_1011;
		E_F_BEGIN_IST:	work = 6'b11_1011;
		E_WIRTE_F_ADDR:	work = 6'b11_0111;
		E_WIRTE_F_DATA:	work = 6'b11_0011;
		E_F_END_IST:	work = 6'b11_1011;
		E_CHECK:		work = 6'b10_0010;
		//====================================
		WIRTE_I_RorL:	work = 6'b11_1011;
		WIRTE_I_ADDR:	work = 6'b11_0111;
		CHECK_I_RB:		work = 6'b10_0010;
		WIRTE_I_DATA:	work = 6'b00_0000;
		CHECK_I_DATA:	work = 6'b10_0010;

		CHECK:			work = 6'b10_0010;
		default:		work = 6'b00_0000;
	endcase
end
//====================================================
always @(posedge clk, posedge rst) begin
	if(rst)	cn <= 6'd0;
	else begin
		case(status)
			CHECK:		cn <= 6'd0;
			CHECK_ALL:	cn <= cn + 1'd1;
			CHECK_RB:	cn <= 6'd0;
			E_F_END_IST:	cn <= cn + 1'd1;
			// default:	cn <= 6'b0;
		endcase
	end
end

always @(posedge clk, posedge rst) begin
	if(rst)	count <= 6'h0;
	else begin
		case(status)
			WIRTE_F_ADDR:	begin
				if(count == 2)	count <= 6'd0;
				else		count <= count + 1'd1;
			end
			WIRTE_I_ADDR:	begin
				if(count == 2)	count <= 6'd0;
				else		count <= count + 1'd1;
			end
			READ_F_ADDR:	begin
				if(count == 2)	count <= 6'd0;
				else		count <= count + 1'd1;
			end
			ERASE_ADDR:	begin
				if(count == 1)	count <= 6'd0;
				else		count <= count + 1'd1;
			end
			E_WIRTE_F_ADDR:	begin
				if(count == 2)	count <= 6'd0;
				else		count <= count + 1'd1;
			end
			default:	count <= 6'd0;
		endcase
	end
end

always @(posedge clk, posedge rst) begin
	if(rst) count_addr <= 6'h0;
	else begin
		case(status)
			BEGINING, E_BEGIN_IST:	count_addr <= 6'h0;
			WIRTE_F_DATA:	count_addr <= count_addr + 1'b1;
			WIRTE_I_DATA:	count_addr <= count_addr + 1'b1;
			READ_F_DATA:	count_addr <= count_addr + 1'b1;
			E_WIRTE_F_DATA:	count_addr <= count_addr + 1'b1;
		endcase
	end	
end
//====================================================
always @(negedge clk, posedge rst) begin
	if(rst)begin
		M_Y <= 0;
		M_X <= 0;
	end
	else begin
		case(status)
			WIRTE_F_ADDR:	{M_Y, M_X} <= (data)? {M_Y, M_X}: cmd[13:7];
			WIRTE_F_DATA:begin
				if(&M_X){M_Y, M_X} <= {M_Y_add, M_X_add};
				else	{M_Y, M_X} <= {M_Y, M_X_add};
			end
			WIRTE_I_ADDR:	{M_Y, M_X} <= (data)? {M_Y, M_X}: cmd[13:7] - 1'b1;
			WIRTE_I_DATA:begin
				if(&M_X){M_Y, M_X} <= {M_Y_add, M_X_add};
				else	{M_Y, M_X} <= {M_Y, M_X_add};
			end
			E_WIRTE_F_ADDR:	{M_Y, M_X} <= cmd[13:7];
			E_WIRTE_F_DATA:begin
				if(&M_X){M_Y, M_X} <= {M_Y_add, M_X_add};
				else	{M_Y, M_X} <= {M_Y, M_X_add};
			end
		endcase
	end
end
//====================================================
always @(*) begin
	F_REN = (work[1])& clk;
	F_WEN = (work[0])& ~clk;
end
//====================================================
always @(negedge clk, posedge rst) begin
	if(rst)begin
	   done <= 1'b0; 
	end
	else begin
		done <= (status == BEGINING)? 1'b1: 1'b0;
	end
end
//====================================================
always @(*) begin
	case(status)
		RST_F:		F_data = 8'hFF;
		WIRTE_F_RorL, WIRTE_I_RorL, READ_F_RorL, E_WIRTE_F_RorL:	
				F_data = (cmd_addr[8])? 8'h1: 8'h0;
		BEGIN_IST, E_F_BEGIN_IST:	F_data = 8'h80;
		WIRTE_F_ADDR, WIRTE_I_ADDR, READ_F_ADDR, E_WIRTE_F_ADDR:begin
			case(count)
				0: F_data = {cmd_addr[7:0]};
				1: F_data = {cmd_addr[16:9]};
				2: F_data = {7'b0, cmd_addr[17]};
				default: F_data = 8'b0;
			endcase
		end
		WIRTE_F_DATA:	F_data = M_D;
		END_IST, E_F_END_IST:	F_data = 8'h10;

		E_BEGIN_IST:	F_data = 8'h60;
		E_END_IST:	F_data = 8'hd0;
		ERASE_ADDR:	begin
			if(!count)
				F_data = cmd_addr[16:9];
			else
				F_data = {7'd0, cmd_addr[17]};
		end
		E_WIRTE_F_DATA: F_data = block_memory[cmd_addr[10:0]];

		default:	F_data = 8'h0;	
	endcase
end
//====================================================
always @(*) begin
	if(status == WIRTE_I_DATA)
		I_data = F_IO;
	else
		I_data = 8'h0;
end
//====================================================
always @(posedge clk, posedge rst) begin
	if(rst)begin
		data <= 0;
		data_1 <= 0;
	end
	else begin
		if(&cmd_addr[7:0]) data <= 1'b1;
		else begin
			if((status == WIRTE_F_ADDR | status == WIRTE_I_ADDR) & count == 2) 
				data <= 1'b0;
			if(status == E_WIRTE_F_DATA & (count_addr + 1) == cmd[6:0])
				data_1 <= 1;
		end
	end
end
//====================================================
always @(posedge clk, posedge rst) begin
	if(rst)begin
		dirty_bit <= 128'd0;
	end
	else begin
		if(status == CHECK) dirty_bit[test] <= 1'd1;
	end
end
//====================================================
always @(posedge clk, posedge rst) begin
	if(rst)begin
		for(i = 0; i < 2048; i = i + 1)
			block_memory[i] <= 8'd0;
	end
	else begin
		if(status == READ_F_DATA)
			block_memory[cmd_addr[12:0]] <= F_IO;
		else if(status == E_WIRTE_F_DATA & !data_1)begin
			block_memory[cmd_cn] <= M_D;
		end

	end
end

endmodule