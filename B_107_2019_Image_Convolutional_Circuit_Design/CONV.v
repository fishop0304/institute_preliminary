`timescale 1ns/10ps
module  CONV(
input		clk,
input		reset,
output		busy,	
input		ready,	
		
output	reg [11:0] iaddr,
input	[19:0]	idata,	

output	reg	cwr,
output	reg [11:0] caddr_wr,
output	reg [19:0] cdata_wr,

output	reg	crd,
output	reg [11:0] caddr_rd,
input	[19:0] 	cdata_rd,

output	reg [2:0] 	csel  
);
reg [4:0] status, next_status;
reg [3:0] work;
reg [3:0] count;
reg [19:0] kernal;
reg [32:0] kernal_data;
reg [19:0] k_data;

wire [19:0] bias = (status == 1)? 20'h01310: 20'hF7295;
wire [32:0] sum_kernal = $signed(kernal_data) + $signed({bias, 13'b0});
wire [11:0] num = {caddr_wr[11:5] << 2, 4'h0} + caddr_wr[4:0] << 1;
assign busy = work[3];
//=========================================================== status
always @(posedge clk, posedge reset) begin
	if(reset) status <= 5'h0;
	else status <= next_status;
end

always @(*) begin
	case(status)
		0:begin
			if(ready) next_status = 1;
			else next_status = 0;
		end
		1:begin //================================ kernal0 convolutional
			if(count == 11) next_status = 2;
			else next_status = 1;
		end
		2:begin //================================ kernal1 convolutional
			if((&caddr_wr) && (count == 11))
				next_status = 3;
			else if(count == 11) 
				next_status = 1;
			else 
				next_status = 2;
		end
		3:begin //================================ kernal0 max 
			if(count == 5) next_status = 4;
			else next_status = 3;
		end
		4:begin //================================ kernal1 max 
			if((caddr_wr == 20'd4031) && (count == 5))
				next_status = 5;
			else if(count == 5) 
				next_status = 3;
			else 
				next_status = 4;
		end
		5:	next_status = 6;
		6:begin
			if(count) next_status = 7;
			else	  next_status = 6;
		end
		7:begin
			if(&caddr_wr[10:0] && count)
				next_status = 8;
			else if(count)
				next_status = 6;
			else 
				next_status = 7;
		end
		8:	next_status = 8;
		default:next_status = 0;
	endcase
end

always @(*) begin
	case(status)
		1:	work = 4'b1001;
		2:	work = 4'b1001;
		3:	work = 4'b1010;
		4:	work = 4'b1010;
		5:	work = 4'b1000;
		6:	work = 4'b1100;
		7:	work = 4'b1100;
		8:	work = 4'b0000;
		default:work = 4'b0000;
	endcase
end
//=========================================================== count
always @(posedge clk) begin
	case(work[2:0])
		3'b001: begin
			if(count == 11) count <= 4'h0;
			else count <= count + 1'h1;
		end
		3'b010: begin
			if(count == 5) count <= 4'h0;
			else count <= count + 1'h1;
		end
		3'b100: begin
			if(count) count <= 4'h0;
			else count <= count + 1'h1;
		end
		default: count <= 4'h0;
	endcase
end
//=========================================================== caddr_wr
always @(posedge clk) begin
	case(status)
		1, 3:			caddr_wr <= caddr_wr;
		2:begin
			if(count == 11) caddr_wr <= caddr_wr + 1'b1;
		end
		4:begin
			if(count == 5)	caddr_wr <= caddr_wr + 1'b1;
		end
		6, 7:begin	
			if(count)	caddr_wr <= caddr_wr + 1'b1;
		end
		default:		caddr_wr <= 12'h0;
	endcase
end
//=========================================================== iaddr
always @(*) begin
	if(work[0]) begin
		case (count)
			0:	iaddr = caddr_wr - 12'd65; 
			1:	iaddr = caddr_wr - 12'd64; 
			2:	iaddr = caddr_wr - 12'd63; 
			3:	iaddr = caddr_wr - 12'd1; 
			4:	iaddr = caddr_wr; 
			5:	iaddr = caddr_wr + 12'd1; 
			6:	iaddr = caddr_wr + 12'd63; 
			7:	iaddr = caddr_wr + 12'd64; 
			8:	iaddr = caddr_wr + 12'd65; 
			default:iaddr = caddr_wr ;  
		endcase
	end
	else iaddr = 12'd0;
end
//=========================================================== caddr_rd
always @(*) begin
	if(work[1]) begin
		case (count)
			1:	caddr_rd = num + 12'd1; 
			2:	caddr_rd = num + 12'd64; 
			3:	caddr_rd = num + 12'd65; 
			default:caddr_rd = num;  
		endcase
	end
	else if(work[2]) caddr_rd = caddr_wr >> 1;
	else		 caddr_rd = 12'd0;
end
//=========================================================== kernal
always @(posedge clk) begin
	if(work[0])begin
		case(count)
			0:begin
				if(!caddr_wr[11:6] || !caddr_wr[5:0]) 
					kernal <= 20'h0;
				else	      
					kernal <= idata;
			end
			1:begin
				if(!caddr_wr[11:6]) 
					kernal <= 20'h0;
				else	      
					kernal <= idata;
			end
			2:begin
				if(!caddr_wr[11:6] | !(~caddr_wr[5:0])) 
					kernal <= 20'h0;
				else	     
					kernal <= idata;
			end
			3:begin
				if(!caddr_wr[5:0]) 
					kernal <= 20'h0;
				else	      
					kernal <= idata;
			end
			4:kernal <= idata;
			5:begin
				if(!(~caddr_wr[5:0])) 
					kernal <= 20'h0;
				else	      
					kernal <= idata;
			end
			6:begin
				if(!(~caddr_wr[11:6]) | !caddr_wr[5:0]) 
					kernal <= 20'h0;
				else	      
					kernal <= idata;
			end
			7:begin
				if(!(~caddr_wr[11:6])) 
					kernal <= 20'h0;
				else	      
					kernal <= idata;
			end
			8:begin
				if(!(~caddr_wr[11:6]) | !(~caddr_wr[5:0])) 
					kernal <= 20'h0;
				else	      
					kernal <= idata;
			end
		endcase
	end
	else if(work[1])begin
		if(!count) kernal <= cdata_rd;
		else begin
			if(kernal < cdata_rd) kernal <= cdata_rd;
			else kernal <= kernal;
		end
	end
	else kernal <= 20'd0;
end
//=========================================================== kernal_0 & kernal_1 operation
always @(*)begin
	case(count)
		1: k_data = (status == 1)? 20'h0A89E: 20'hFDB55;
		2: k_data = (status == 1)? 20'h092D5: 20'h02992;
		3: k_data = (status == 1)? 20'h06D43: 20'hFC994;
		4: k_data = (status == 1)? 20'h01004: 20'h050FD;
		5: k_data = (status == 1)? 20'hF8F71: 20'h02F20;
		6: k_data = (status == 1)? 20'hF6E54: 20'h0202D;
		7: k_data = (status == 1)? 20'hFA6D7: 20'h03BD7;
		8: k_data = (status == 1)? 20'hFC834: 20'hFD369;
		9: k_data = (status == 1)? 20'hFAC19: 20'h05E68;
		default: k_data = 20'h0;
	endcase
end

always @(posedge clk) begin
	if(!count) kernal_data <= 32'd0;
	else	   kernal_data <= $signed(kernal_data) + (($signed(k_data) * $signed(kernal)) >>> 3);
end
//=========================================================== csel
always @(*)begin
	case(status)
		1: csel = 3'b001;
		2: csel = 3'b010; 
		3: begin
			if(count == 5)	csel = 3'b011; 
			else		csel = 3'b001;
		end
		4: begin
			if(count == 5)	csel = 3'b100; 
			else		csel = 3'b010;
		end
		6:begin
			if(count)	csel = 3'b101;
			else		csel = 3'b011;
		end
		7:begin
			if(count)	csel = 3'b101;
			else		csel = 3'b100;
		end
		default :csel = 3'b000;
	endcase	
end
//=========================================================== crd cwr
always @(posedge clk) begin
	case(work[2:0])
		3'b001: begin
			if(count == 10)	cwr <= 1;
			else 		cwr <= 0;
		end
		3'b010: begin
			if(count == 4)begin
				cwr <= 1;
				crd <= 0;
			end
			else begin
				cwr <= 0;
				crd <= 1;
			end
		end
		3'b100: begin
			if(!count)begin
				cwr <= 1;
				crd <= 0;
			end
			else begin
				cwr <= 0;
				crd <= 1;
			end
		end
		default: begin
			cwr <= 0;
			crd <= 1;
		end
	endcase
end
//=========================================================== cdata_wr
always @(posedge clk) begin
	case(work[2:0])
		3'b001: cdata_wr <= sum_kernal[32]? 20'd0: sum_kernal[32:13] + sum_kernal[12];
		3'b010: cdata_wr <= kernal;
		3'b100: cdata_wr <= cdata_rd;
		default:cdata_wr <= 20'd0;
	endcase
end
endmodule