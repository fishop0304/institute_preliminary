`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input   	clk;
input   	reset;
input   	gray_ready;
input   [7:0] 	 gray_data;
output reg [13:0] gray_addr;
output         	gray_req;
output reg [13:0] lbp_addr;
output reg	 lbp_valid;
output reg [7:0] lbp_data;
output reg	 finish;

reg [2:0] status,next_status;
reg [2:0] work;
reg [3:0] count;
reg [7:0] data;
wire boundary;

assign boundary = &lbp_addr[13:7] | &lbp_addr[6:0] | ~|lbp_addr[13:7] | ~|lbp_addr[6:0];
assign gray_req = 1'b1; 
//====================================================================
always @(posedge clk, posedge reset) begin
	status <= (reset)? 0: next_status;
end

always @(*) begin
	case (status)
		0: begin
			if(lbp_addr == 16255) next_status = 4;
			else if(boundary)  next_status = 1;
			else		   next_status = 2;
		end
		1:	 next_status = 0;
		2:begin
			if(count == 9) next_status = 3;
			else next_status = 2;
		end
		3: 	 next_status = 0;
		4: 	 next_status = 4;
		default: next_status = 0;
	endcase
end

always @(*) begin
	case (status)
		0: 	work = 3'b000;
		1: 	work = 3'b001;
		2: 	work = 3'b010;
		3: 	work = 3'b001;
		4: 	work = 3'b100;
		default:work = 3'b000; 
	endcase
end
//==================================================================== 
always @(posedge clk, posedge reset) begin
	if(reset)begin
		count <= 0;
	end
	else begin
		if(work[1]) count <= count + 1;
		else count <= 0;
	end
end

always @(posedge clk, posedge reset) begin
	if(reset) gray_addr <= 0;
	else begin
		case(count)
			0: gray_addr <= lbp_addr;
			1: gray_addr <= {lbp_addr[13:7] + 1'b1, lbp_addr[6:0] + 1'b1};
			2: gray_addr <= {lbp_addr[13:7] + 1'b1, lbp_addr[6:0] };
			3: gray_addr <= {lbp_addr[13:7] + 1'b1, lbp_addr[6:0] - 1'b1};
			4: gray_addr <= lbp_addr + 1'b1;
			5: gray_addr <= lbp_addr - 1'b1;
			6: gray_addr <= {lbp_addr[13:7] - 1'b1, lbp_addr[6:0] + 1'b1};
			7: gray_addr <= {lbp_addr[13:7] - 1'b1, lbp_addr[6:0] };
			8: gray_addr <= {lbp_addr[13:7] - 1'b1, lbp_addr[6:0] - 1'b1};
		endcase
	end
end
//====================================================================
always @(posedge clk, posedge reset) begin
	if(reset)begin
		lbp_addr <= 129;
	end
	else begin
		if(work[0]) lbp_addr <= lbp_addr + 1;
		else lbp_addr <= lbp_addr;
	end
end
//====================================================================
always @(posedge clk, posedge reset) begin
	if(reset)begin
		lbp_data <= 0;
		data <= 0;
	end
	else begin
		if(count == 0)data <= gray_data; 
		if(work[1])begin
			lbp_data <= {lbp_data[6:0], (data <= gray_data & count > 1)? 1'b1: 1'b0};	
		end
		else begin
			lbp_data <= 0;
		end
	end
end
//====================================================================
always @(posedge clk, posedge reset) begin
	if(reset)begin
		finish <= 0;
		lbp_valid <= 0;
	end
	else begin
		finish <= work[2];
		lbp_valid <= (count == 9)? 1: 0;
	end
end

endmodule