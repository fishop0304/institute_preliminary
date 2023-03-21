module STI_DAC(clk ,reset, load, pi_data, pi_length, pi_fill, pi_msb, pi_low, pi_end,
	       so_data, so_valid,
	       oem_finish, oem_dataout, oem_addr,
	       odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr);

input		clk, reset;
input		load, pi_msb, pi_low, pi_end; 
input	[15:0]	pi_data;
input	[1:0]	pi_length;
input		pi_fill;
output		so_valid, oem_finish;
output reg	so_data;
output reg	odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr;
output reg [4:0]oem_addr;
output reg [7:0]oem_dataout;

reg sel;
reg [2:0] status,next_status;
reg [4:0] count;
reg [2:0] memory_sel;
reg [4:0] label;
reg [31:0] data;
integer i;
wire o_wr = (oem_addr[2])? (&count[2:0]) & sel: (&count[2:0]) & !sel;
wire e_wr = (oem_addr[2])? (&count[2:0]) & !sel: (&count[2:0]) & sel;
wire ch = sel & (&count[2:0]);
wire [4:0]num = label - count;

assign so_valid = (status == 3);
assign oem_finish = (status == 5);
//==============================================================================
always @(posedge clk,posedge reset) begin
	if(reset) status <= 0;
	else	  status <= next_status;
end

always @(*) begin
	case(status)
		0:begin
			if(load)next_status = 1;
            else if(memory_sel <= 3) next_status = 3;
            else next_status = 5;
		end
		1:       next_status = 2;
        2:       next_status = 3;
        3:begin
            if(label == count)
				next_status = 4;
			else
				next_status = 3;
        end
        4:       next_status = 0;
        5:       next_status = 5;
		default: next_status = 0;
	endcase
end
//==============================================================================
always @(negedge clk) begin
    {odd1_wr,  odd2_wr,  odd3_wr,  odd4_wr } <= {o_wr, 1'b0, 1'b0, 1'b0} >> memory_sel;
    {even1_wr, even2_wr, even3_wr, even4_wr} <= {e_wr, 1'b0, 1'b0, 1'b0} >> memory_sel;
end
//============================================================================== data
always @(posedge clk, posedge reset) begin
    if(reset) data <= 32'h0;
    else begin
    case(status)
        1:begin
            case(pi_length)
                2'b00:  data <= {24'b0, (pi_low)? pi_data[15:8]: pi_data[7:0]};
                2'b01:  data <= {16'b0, pi_data};
                2'b10:  data <= (!pi_fill)? {16'b0, pi_data}: {8'b0, pi_data, 8'b0};
                2'b11:  data <= (!pi_fill)? {16'b0, pi_data}: {pi_data, 16'b0};
                default:data <= 32'b0;
            endcase
        end
        2:begin
            if(!pi_msb)begin
                case(label)
                    5'd7:begin
                        for(i = 0; i < 8; i = i + 1)
                            data[i] <= data[7 - i];
                    end
                    5'd15:begin
                        for(i = 0; i < 16; i = i + 1)
                            data[i] <= data[15 - i];
                    end
                    5'd23:begin
                        for(i = 0; i < 24; i = i + 1)
                            data[i] <= data[23 - i];
                    end
                    5'd31:begin
                        for(i = 0; i < 32; i = i + 1)
                            data[i] <= data[31 - i];
                    end
                endcase
            end
        end
        3:begin
            data <= data;
        end 
        default: data <= 32'h0; 
    endcase
    end
end
//============================================================================== label
always @(posedge clk, posedge reset) begin
    if(reset) label <= 5'd0;
    else begin
        case(pi_length)
            0:	     label <= 5'd7;
            1:	     label <= 5'd15;
            2:	     label <= 5'd23;
            3:	     label <= 5'd31;
            default: label <= 5'd0;
        endcase
    end
end
//============================================================================== count
always @(posedge clk) begin
    if(status == 3) count <= count + 1'h1;
	else 		    count <= 5'h0;
end
//============================================================================== so_data
always @(*)begin
	if(status == 3) so_data = data[num];
	else            so_data = 1'b0;
end
//============================================================================== sel
always @(posedge clk, posedge reset) begin
	if(reset) sel <= 0;
	else begin
		if(&count[2:0]) sel <= ~sel;
	end
end
//============================================================================== oem_addr
always @(posedge clk, posedge reset) begin
	if(reset) oem_addr <= 0;
	else begin
		if(ch) oem_addr <= oem_addr + 1;
	end
end
//============================================================================== memory_sel
always @(posedge clk, posedge reset) begin
	if(reset) memory_sel <= 3'h0;
	else begin
		if(&oem_addr & ch) memory_sel <= memory_sel + 1'h1;
	end
end
//============================================================================== oem_dataout
always @(*) begin
	if(status == 3) oem_dataout = data >> num;
	else            oem_dataout = 8'h0;
end

endmodule
