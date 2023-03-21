module SET ( clk , rst, en, central, radius, mode, busy, valid, candidate );

input clk, rst;
input en;
input [23:0] central;
input [11:0] radius;
input [1:0] mode;
output reg busy;
output reg valid;
output reg [7:0] candidate;



reg [23:0] local;
reg [11:0] r;
reg [7:0] p;//x:p[7:4] y:p[3:0]
reg [1:0] m;
reg [7:0] count;
reg A,B,C;
wire [3:0]bb;
assign bb[0]=A;
assign bb[1]=A & B;
assign bb[2]=A ^ B;
assign bb[3]=!(A ^ B ^ C) & ( A | B | C );
reg [2:0]step;
wire ck_bool;
reg [11:0]dt;
always@(posedge clk)begin
	if(rst)begin
		//BUSY_p<=1'b0;
		valid<=1'b0;
		candidate<=8'd0;
		count<=8'd0;
		p<=8'h00;
		step<=3'd0;
		busy<=1'b0;
	end else begin
		if(!busy && en)begin
			busy<=1'b1;
			m<=mode;
			local<=central;
			r<=radius;
			dt<={central[23:20],central[19:16],radius[11:8]};
		end else if(busy) begin
			case(step)
			3'b000:begin
				A<=ck_bool;
				dt<={local[15:12],local[11:8],r[7:4]};
				step<=3'b001;
			end
			3'b001:begin
				B<=ck_bool;
				dt<={local[7:4],local[3:0],r[3:0]};
				step<=3'b010;
			end
			3'b010:begin
				C<=ck_bool;
				step<=3'b011;
			end
			3'b011:begin
				if(bb[m]) count<=count+8'd1;
				if(p==8'h77)begin
					step<=3'b100;
				end else begin
					{p[6:4],p[2:0]}<={p[6:4],p[2:0]}+6'd1;
					dt<={local[23:20],local[19:16],r[11:8]};
					step<=3'b000;
				end
			end
			3'b100:begin
				candidate<=count;
				valid<=1'b1;
				step<=3'b101;
			end
			default:begin
				valid<=1'b0;
				//BUSY_p<=~BUSY_p;
				busy<=1'b0;
				count<=8'd0;
				p<=8'h00;
				step<=3'd0;
			end
			endcase
		end
	end
end
check U1(dt[11:8],dt[7:4],dt[3:0],p[7:4]+4'd1,p[3:0]+4'd1,ck_bool);
/*
check U1(local[23:20],local[19:16],r[11:8],p[7:4]+4'd1,p[3:0]+4'd1,A);
check U2(local[15:12],local[11:8],r[7:4],p[7:4]+4'd1,p[3:0]+4'd1,B);
check U3(local[7:4],local[3:0],r[3:0],p[7:4]+4'd1,p[3:0]+4'd1,C);
*/
endmodule

module check(r_x,r_y,r_l,x,y,bool);
	input [3:0] r_x,r_y,r_l,x,y;
	output bool;
	wire [7:0] x_l,y_l;
	assign x_l=r_x-x;
	assign y_l=r_y-y;
	wire [7:0] x_l2,y_l2,r_l2;
	assign x_l2=x_l*x_l;
	assign y_l2=y_l*y_l;
	assign r_l2=r_l*r_l;
	assign bool=(x_l2+y_l2)<=r_l2;
endmodule
