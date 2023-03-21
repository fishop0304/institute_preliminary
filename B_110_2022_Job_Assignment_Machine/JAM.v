module JAM (
input CLK,
input RST,
output [2:0] W,
output [2:0] J,
input [6:0] Cost,
output reg [3:0] MatchCount,
output reg [9:0] MinCost,
output Valid );

localparam IDLE		= 0;
localparam AGM		= 1;
localparam WORK_1	= 2;
localparam WORK_2	= 3;
localparam WORK_3	= 4;
localparam WORK_4	= 5;
localparam WORK_5	= 6;

integer i;
reg [2:0] cs, ns;
reg [2:0] x, y;
reg [3:0] h;
reg [2:0] seq[0:7];
reg [2:0] seq_1[0:7];
reg [6:0] check;
reg [2:0] count, count_, data;
reg [9:0] tmp;


wire flag = (seq[x - 1] < seq[x]);

assign Valid = (cs == AGM) & &check;
assign W = seq_1[(7 - h[2:0])];
assign J = h[2:0];
//===============================================
always @(posedge CLK, posedge RST) begin
	cs <= (RST)? IDLE: ns;
end

always @(*) begin
	case(cs)
		IDLE:	ns = AGM;
		AGM:	begin
			if(flag & x == 7)
				ns = WORK_1;
			else if(flag)
				ns = WORK_2;
			else	
				ns = AGM;
		end
		WORK_1:	ns = WORK_5;
		WORK_2:	ns = (&count)? WORK_3: WORK_2;
		WORK_3:	ns = WORK_4;
		WORK_4:	ns = WORK_5;
		WORK_5:	ns = (h == 8)? AGM: WORK_5;
		default:ns = IDLE;
	endcase
end
//===============================================
always @(posedge CLK, posedge RST) begin
	if(RST)begin
		MatchCount <= 0;
		MinCost <= 10'd1023;
		tmp <= 0;
	end
	else begin
		if(h > 0)
			tmp <= tmp + Cost;
		else
			tmp <= 0;
		
		if(tmp + Cost == MinCost  & h == 8)begin
			MatchCount <= MatchCount + 1;
		end
		else if(tmp + Cost < MinCost & h == 8)begin
			MinCost <= tmp + Cost;
			MatchCount <= 1;
		end

	end
end
//===============================================
always @(posedge CLK, posedge RST) begin
	if(RST)begin
		x <= 3'd7;
		y <= 3'd7;
	end
	else begin
		if(cs == AGM)begin
			if(x == 0) x <= 3'd7;
			else  x <= x - 1'b1;
		end
		else if(cs == WORK_1 | cs == WORK_4) x <= 7;
	end
end
//===============================================
always @(posedge CLK, posedge RST)begin
	if(RST)begin
		h <= 0;
	end
	else begin
		if(h == 9)begin
			h <= 0;
		end
		else h <= h + 1;
	end
end
//===============================================
always @(posedge CLK, posedge RST)begin
	if(RST)begin
		for(i = 0; i < 8; i = i + 1)
			seq_1[i] <= i;
	end
	else begin
		if(cs == AGM)begin
			seq_1[0] <= seq[0];
			seq_1[1] <= seq[1];
			seq_1[2] <= seq[2];
			seq_1[3] <= seq[3];
			seq_1[4] <= seq[4];
			seq_1[5] <= seq[5];
			seq_1[6] <= seq[6];
			seq_1[7] <= seq[7];
		end
	end
end
//===============================================
always @(posedge CLK, posedge RST)begin
	if(RST)begin
		for(i = 0; i < 8; i = i + 1)
			seq[i] <= i;
	end
	else begin
		case(cs)
			WORK_1:begin
				seq[x] <= seq[7];
				seq[7] <= seq[x];
			end
			WORK_3:begin
				seq[x] <= seq[count_];
				seq[count_] <= seq[x];
			end
			WORK_4:begin
				case(x)
					0:begin
						seq[1] <= seq[7];
						seq[2] <= seq[6];
						seq[3] <= seq[5];
						seq[5] <= seq[3];
						seq[6] <= seq[2];
						seq[7] <= seq[1];
					end
					1:begin
						seq[2] <= seq[7];
						seq[3] <= seq[6];
						seq[4] <= seq[5];
						seq[5] <= seq[4];
						seq[6] <= seq[3];
						seq[7] <= seq[2];
					end
					2:begin
						seq[3] <= seq[7];
						seq[4] <= seq[6];
						seq[6] <= seq[4];
						seq[7] <= seq[3];
					end
					3:begin
						seq[4] <= seq[7];
						seq[5] <= seq[6];
						seq[6] <= seq[5];
						seq[7] <= seq[4];
					end
					4:begin
						seq[5] <= seq[7];
						seq[7] <= seq[5];
					end
					5:begin
						seq[6] <= seq[7];
						seq[7] <= seq[6];
					end
					default:begin
						seq[6] <= seq[7];
						seq[7] <= seq[6];
					end
				endcase
			end
		endcase
	end
end
//===============================================

always @(*)begin
	check[0] = ((seq[6] - seq[7]) == 1);
	check[1] = ((seq[5] - seq[6]) == 1);
	check[2] = ((seq[4] - seq[5]) == 1);
	check[3] = ((seq[3] - seq[4]) == 1);
	check[4] = ((seq[2] - seq[3]) == 1);
	check[5] = ((seq[1] - seq[2]) == 1);
	check[6] = ((seq[0] - seq[1]) == 1);
end

//===============================================
always @(posedge CLK, posedge RST)begin
	if(RST)begin
		count <= 0;
	end
	else begin
		case(cs)
			AGM: count <= x;
			WORK_2: count <= count + 1;
		endcase
	end
end
//===============================================
always @(posedge CLK, posedge RST)begin
	if(RST)begin
		data <= 7;
		count_ <= 0;
	end
	else begin
		case(cs)
			AGM:begin
				data <= seq[x];
				count_ <= x;
			end
			WORK_2:begin
				if(seq[count] < data & seq[count] >= seq[x])begin
					data <= seq[count];
					count_ <= count;
				end
			end
		endcase
	end
end






//===============================================
always @(posedge CLK, posedge RST)begin
	if(RST)begin

	end
	else begin

	end
end

endmodule