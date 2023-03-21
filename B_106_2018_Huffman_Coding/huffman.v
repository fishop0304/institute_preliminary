module huffman(clk, reset, gray_valid, CNT_valid, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6, gray_data, M1, M2, M3, M4, M5, M6,
    code_valid, HC1, HC2, HC3, HC4, HC5, HC6);

input clk;
input reset;
input gray_valid;
input [7:0] gray_data;
output reg CNT_valid;
output reg [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
output reg code_valid;
output reg [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
output reg [7:0] M1, M2, M3, M4, M5, M6;

reg [2:0] Status,Next_Status;
reg [6:0] Signal,Out_Signal;
reg [7:0] id[10:0];
reg [7:0] wait_id,wait_LR,wait_M;
reg [3:0] L[4:0];
reg [3:0] R[4:0];
reg [7:0] LR_data[10:6];
reg [7:0] M_data[10:6];
reg [9:0] flag;
reg [7:0] data_a,data_b;
reg [3:0] min_id1,min_id2;
reg [3:0] Next_count1,count_1;
reg [3:0] Next_count2,count_2;
reg [3:0] i,x,y;
reg DE;
//===================================================
always@(posedge clk,posedge reset)begin
	if(reset)begin
		Status <= 0;
	end
	else begin
		Status <= Next_Status;
	end
end
always@(gray_valid,flag,count_1,count_2)begin
	case(Status)
		0:begin
			if(gray_valid)
				Next_Status = 1;
			else
				Next_Status = 0;
		end
		1:begin
			if(gray_valid)
				Next_Status = 1;
			else
				Next_Status = 2;
		end
		2:begin
			if(flag == 10'h3ff)
				Next_Status = 3;
			else
				Next_Status = 2;
		end
		3:begin
			Next_Status = 4;
		end
		4:begin
			if(!count_1 && !count_2)
				Next_Status = 5;
			else
				Next_Status = 4;
		end
		5:begin
			Next_Status = 5;
		end
	endcase
end
//=================================================== OUT for calculation ,Signal for catch value
always@(posedge clk,posedge reset)begin
	if(reset)begin
		Out_Signal <= 7'h40;
	end
	else begin
		Out_Signal <= Signal;
	end
end
always@(Next_Status)begin
	case(Next_Status)
		0: 		 Signal = 7'b100_0000;//
		1: 		 Signal = 7'b010_0000;//
		2: 		 Signal = 7'b001_0000;
		3: 		 Signal = 7'b000_1000;
		4:  	 Signal = 7'b000_0100;
		5: 		 Signal = 7'b000_0010;
		default: Signal = 7'b000_0001;
	endcase
end
//=================================================== all status
always@(posedge clk,posedge reset)begin
	if(reset)begin
		CNT_valid <= 0;
		DE <= 0;
	end
	else begin
		CNT_valid <= (Out_Signal[4] && !DE)? 1: 0;
		DE <= DE | Out_Signal[4];
		code_valid <= Out_Signal[1];
	end
end
//=================================================== P
always@(posedge clk,posedge reset)begin
	if(reset)begin
		CNT1 <= 0;
		CNT2 <= 0;  
		CNT3 <= 0;
		CNT4 <= 0;
		CNT5 <= 0; 
		CNT6 <= 0;
	end
	else begin
		if(gray_valid)begin
			case(gray_data)
				1: CNT1 <= CNT1 + 1;
				2: CNT2 <= CNT2 + 1;
				3: CNT3 <= CNT3 + 1;
				4: CNT4 <= CNT4 + 1;
				5: CNT5 <= CNT5 + 1;
				default: CNT6 <= CNT6 + 1;
			endcase
		end
	end
end
//=================================================== count_1,count_2
always@(Out_Signal,count_1)begin
	if(Out_Signal[4])
		Next_count1 = count_1 + 1;
	else if(Out_Signal[2])
		Next_count1 = count_1 - 1;
	else
		Next_count1 = count_1;
end
always@(Out_Signal,count_2)begin
	if(Out_Signal[4])
		Next_count2 = count_2 + 1;
	else if(Out_Signal[2])
		Next_count2 = count_2 - 1;
	else
		Next_count2 = count_2;
end
always@(posedge clk,posedge reset)begin
	if(reset)begin
		count_1 <= 0;
		count_2 <= 6;
	end
	else begin
		if(Out_Signal[4])begin
			if(count_1 == count_2)begin
				count_1 <= 0;
				count_2 <= Next_count2;
			end
			else begin
				count_1 <= Next_count1;
			end
		end
		else if(Out_Signal[3])begin
			count_1 <= 9;
			count_2 <= 4;
		end
		else if(Out_Signal[2])begin
			if(!count_1[0])begin
				count_2 <= Next_count2;
			end
			count_1 <= Next_count1;
		end
	end
end
//=================================================== flag
always@(posedge clk,posedge reset)begin
	if(reset)begin
		flag <= 0;
	end
	else begin
		if(Out_Signal[4])begin
			if(count_1 == count_2)begin
				flag[min_id1] <= 1;
				flag[min_id2] <= 1;
			end
		end
	end
end
//=================================================== 
always@(*)begin
	if(reset) wait_id = 0;
	else begin
		case(count_1)
			0:wait_id = CNT1;
			1:wait_id = CNT2;
			2:wait_id = CNT3;
			3:wait_id = CNT4;
			4:wait_id = CNT5;
			5:wait_id = CNT6;
			default : wait_id = id[count_1];
		endcase
	end
end
//=================================================== id
always@(posedge clk,posedge reset)begin
	if(reset)begin
		for(i = 0;i < 11;i = i + 1)begin
			id[i] <= 0;
		end
		data_a <= 8'd255;
		data_b <= 8'd255;
		min_id1 <= 0;
		min_id2 <= 0;
	end
	else begin
		if(Out_Signal[4])begin
			if(count_1 == count_2)begin
				id[count_1] <= data_a + data_b;
				data_a <= 8'd255;
				data_b <= 8'd255;
			end
			else if((count_1 < count_2) && (!flag[count_1]))begin
				id[count_1] <= wait_id;
				if(data_a >= wait_id)begin
					data_a <= wait_id;
					data_b <= data_a;
					min_id1 <= count_1;
					min_id2 <= min_id1;
				end
				else if(data_b >= wait_id)begin
					data_b <= wait_id;
					min_id2 <= count_1;
				end
			end
		end
	end
end
//=================================================== L min = 1
always@(posedge clk,posedge reset)begin
	if(reset)begin
		for(x = 0;x < 5;x = x + 1)begin
			L[x] <= 0;
		end
	end
	else begin
		if(Out_Signal[4])begin
			if(count_1 == count_2)begin
				L[count_2 - 6] <= min_id1;
			end
		end
	end
end
//=================================================== R max = 0
always@(posedge clk,posedge reset)begin
	if(reset)begin
		for(x = 0;x < 5;x = x + 1)begin
			R[x] <= 0;
		end
	end
	else begin
		if(Out_Signal[4])begin
			if(count_1 == count_2)begin
				R[count_2 - 6] <= min_id2;
			end
		end
	end
end
//=================================================== HC1
always@(*)begin
	if(reset)begin
		wait_LR = 0;
	end
	else begin
		if(Out_Signal[2])
			wait_LR = LR_data[count_2 + 6];
	end
end
always@(posedge clk,posedge reset)begin
	if(reset)begin
		for(y = 6;y < 11;y = y + 1)begin
			LR_data[y] <= 0;
		end
		HC1 <= 0;
		HC2 <= 0;
		HC3 <= 0;
		HC4 <= 0;
		HC5 <= 0;
		HC6 <= 0;
	end
	else begin
		if(Out_Signal[2])begin
			if(count_1[0])begin
				case (R[count_2])
					0:HC1 <= wait_LR << 1;
					1:HC2 <= wait_LR << 1;
					2:HC3 <= wait_LR << 1;
					3:HC4 <= wait_LR << 1;
					4:HC5 <= wait_LR << 1;
					5:HC6 <= wait_LR << 1;
					default: LR_data[R[count_2]] <= wait_LR << 1;
				endcase
			end
			else begin
				case (L[count_2])
					0:HC1 <= (wait_LR << 1) + 1;
					1:HC2 <= (wait_LR << 1) + 1;
					2:HC3 <= (wait_LR << 1) + 1;
					3:HC4 <= (wait_LR << 1) + 1;
					4:HC5 <= (wait_LR << 1) + 1;
					5:HC6 <= (wait_LR << 1) + 1;
					default: LR_data[L[count_2]] <= (wait_LR << 1) + 1;
				endcase
			end
		end
	end
end
//=================================================== M1
always@(*)begin
	if(reset)begin
		wait_M = 0;
	end
	else begin
		if(Out_Signal[2])
			wait_M = M_data[count_2 + 6];
	end
end
always@(posedge clk,posedge reset)begin
	if(reset)begin
		for(y = 6;y < 11;y = y + 1)begin
			M_data[y] <= 0;
		end
		M1 <= 0;
		M2 <= 0;
		M3 <= 0;
		M4 <= 0;
		M5 <= 0;
		M6 <= 0;
	end
	else begin
		if(Out_Signal[2])begin
			if(count_1[0])begin
				case (R[count_2])
					0:M1 <= (wait_M << 1) + 1;
					1:M2 <= (wait_M << 1) + 1;
					2:M3 <= (wait_M << 1) + 1;
					3:M4 <= (wait_M << 1) + 1;
					4:M5 <= (wait_M << 1) + 1;
					5:M6 <= (wait_M << 1) + 1;
					default: M_data[R[count_2]] <= (wait_M << 1) + 1;
				endcase
			end
			else begin
				case (L[count_2])
					0:M1 <= (wait_M << 1) + 1;
					1:M2 <= (wait_M << 1) + 1;
					2:M3 <= (wait_M << 1) + 1;
					3:M4 <= (wait_M << 1) + 1;
					4:M5 <= (wait_M << 1) + 1;
					5:M6 <= (wait_M << 1) + 1;
					default: M_data[L[count_2]] <= (wait_M << 1) + 1;
				endcase
			end
		end
	end
end

endmodule 