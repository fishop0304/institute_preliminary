module SME(clk,reset,chardata,isstring,ispattern,valid,match,match_index);
input clk;
input reset;
input [7:0] chardata;
input isstring;
input ispattern;
output reg match;
output reg [4:0] match_index;
output reg valid;

reg [2:0] state, next_state;
reg [4:0] work;
reg [7:0] String[31:0];
reg [7:0] Pattern[7:0];
reg [5:0] count_s, num_s;
reg [3:0] count_p, num_p, reg_p;
reg [1:0] symbol_flag;
reg flag;
wire [4:0] symbol;
integer i, j;

assign symbol[0] = (Pattern[count_p] == 8'h5E & (String[count_s] == 8'h20 | !count_s))? 1: 0;
assign symbol[1] = (Pattern[count_p] == 8'h24 & (String[count_s] == 8'h20 | count_s == num_s))? 1: 0;
assign symbol[2] = (Pattern[count_p] == 8'h2E)? 1: 0;
assign symbol[3] = (Pattern[count_p] == 8'h2A)? 1: 0;
assign symbol[4] = (Pattern[count_p] == String[count_s])? 1: 0;
//======================================================== state
always @(posedge clk, posedge reset) begin
	state <= (reset)? 0: next_state;
end

always @(*) begin
	case(state)
		0:begin
			if(isstring)
				next_state = 0; 
			else
				next_state = 1; 
		end
		1:begin
			if(ispattern)
				next_state = 1; 
			else
				next_state = 2; 
		end
		2:	next_state = 3;
		3:begin
			if((count_p == num_p) | (count_s == num_s))
				next_state = 4;
			else
				next_state = 3;
		end
		4:	next_state = 5;
		5:begin 
			if(isstring)
				next_state = 0; 
			else
				next_state = 1; 
		end
		default: next_state = 0;
	endcase
end

always @(*) begin //{valid, work, wait, pattern_count, string_count}
	case(state)
		0:	 work = 5'b00000;
		1:	 work = 5'b00001;
		2:	 work = 5'b00011;
		3:	 work = 5'b01111;
		4:	 work = 5'b10000;
		5:	 work = 5'b00000;
		default: work = 5'b00000;
	endcase
end
//======================================================== symbol
always @(posedge clk, posedge reset)begin
	if(reset)begin
		symbol_flag <= 0;
	end 
	else begin
		if(work[0] | ispattern)begin
			if(chardata == 8'h2A) symbol_flag[0] <= 1;
			if(work[1] & Pattern[0] == 8'h2E) symbol_flag[1] <= 1;
		end
		else begin
			symbol_flag <= 0;
		end
	end
end
//======================================================== reg
always @(posedge clk, posedge reset)begin
	if(reset)begin
		reg_p <= 0;
	end
	else begin
		if(work[3] & symbol[3]) reg_p <= count_p + 1;
		else if(!work[3])reg_p <= 0;
	end
end
//======================================================== count
always @(posedge clk, posedge reset)begin
	if(reset)begin
		num_s <= 0;
		num_p <= 0;
	end
	else begin
		if(isstring) num_s <= count_s + 1;
		if(ispattern) num_p <= count_p + 1;
	end
end

always @(posedge clk, posedge reset)begin
	if(reset)begin
		count_s <= 0;
		count_p <= 0;
	end 
	else begin
		if(isstring) count_s <= count_s + 1;
		else if(work[3]) begin
			if((symbol[0]  & !count_s) | symbol[3]) count_s <= count_s;
			else count_s <= count_s + 1;
		end
		else count_s <= 0;

		if(ispattern) count_p <= count_p + 1;
		else if(work[3])begin
			if(|symbol) begin
				count_p <= count_p + 1;
			end
			else if(symbol_flag[0])begin
				if(Pattern[count_p - 1] == 8'h2A | !count_p) count_p <= count_p;
				else count_p <= reg_p;
			end
			else if(symbol_flag[1])begin
				if(Pattern[count_p - 1] == 8'h2E | !count_p) count_p <= count_p;
				else count_p <= 1;
			end
			else count_p <= 0;
		end 
		else count_p <= 0;
	end
end
//======================================================== data
always @(posedge clk, posedge reset) begin
	if(reset)begin
		for(i = 0;i < 32;i = i + 1) String[i] <= 0;
		for(j = 0;j < 8;j = j + 1) Pattern[j] <= 0;
	end
	else begin
		case({isstring,ispattern})
			2'b10: String[count_s] <= chardata;
			2'b01: Pattern[count_p] <= chardata;
		endcase
	end
end
//======================================================== match
always @(posedge clk, posedge reset) begin
	if(reset) begin
		match_index <= 0;
		match <= 0;
		flag <= 0;
		valid <= 0;
	end
	else begin
		if(work[3] & |symbol[4:1] & !flag )begin
			if(symbol_flag[1] & num_p > 1) match_index <= count_s - 1; 
			else match_index <= count_s;
			flag <= 1;
		end
		else begin
			flag <= ((|symbol[4:1] | symbol_flag[0]) & work[3] & (count_p > 0))? 1: 0;	
		end

		if(work[2]) match <= (count_p == num_p | symbol[1])? 1:0;
		valid <= work[4];
	end
end

endmodule