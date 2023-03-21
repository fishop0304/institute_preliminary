module LCD_CTRL(clk, reset, cmd, cmd_valid, IROM_Q, IROM_rd, IROM_A, IRAM_valid, IRAM_D, IRAM_A, busy, done);
input clk;
input reset;
input [3:0] cmd;
input cmd_valid;
input [7:0] IROM_Q;

output reg IROM_rd;
output reg [5:0] IROM_A;
output reg IRAM_valid;
output reg [7:0] IRAM_D;
output reg [5:0] IRAM_A;
output reg busy;
output reg done;
//---------------------------------------------------------------------------
reg [7:0] data[63:0];
reg [7:0] count;
reg [7:0] seat;
reg delay;
wire [7:0] aver, min, max;
wire [7:0] position[3:0];
integer i;

parameter [4:0] Write                     = 4'h0,
                Shift_Up                  = 4'h1,
                Shift_Down                = 4'h2,
                Shift_Left                = 4'h3,
                Shift_Right               = 4'h4,
                Max                       = 4'h5,
                Min                       = 4'h6,
                Average                   = 4'h7,
                Counterclockwise_Rotation = 4'h8,
                Clockwise_Rotation        = 4'h9,
                Mirror_X                  = 4'ha,
                Mirror_Y                  = 4'hb;

// ---------------------------------- Module --------------------------------
Min_m min_1(.clk(clk), 
            .reset(reset),
          .data({data[seat], data[seat+1], data[seat+8], data[seat+9]}),
          .out(min));

Max_m max_1(.clk(clk),
        .reset(reset),
         .data({data[seat], data[seat+1], data[seat+8], data[seat+9]}),
         .out(max));

Aver_m aver1(.clk(clk),
        .reset(reset),  
         .data({data[seat], data[seat+1], data[seat+8], data[seat+9]}),
         .out(aver));

// Cmd_end cmd_end1(.IRAM_valid(IRAM_valid), .cmd(cmd), .done(done));
// --------------------------------------------------------------------------
always@(posedge clk, posedge reset)begin
    if(reset) begin
        count   <= 0;
        IROM_rd <= 1;
        busy    <= 1;
        seat    <=27; 
        /////////////////////////////
        for(i=0;i<64;i=i+1)
            data[i]<=8'd0;
        delay <=0;
        done <=0;
        IRAM_A<=0;
        IRAM_D<=0;
        IRAM_valid<=0;
        IROM_A<=0;
    end 
    else if(IROM_rd)begin // read data
        if(count < 65)begin
            if(delay)begin
                data[count-1] <= IROM_Q;
                delay <= 0;
            
            end else begin
                count <= count + 1;
                IROM_A <= count;
                delay <= 1;

            end
        end else begin
            IROM_rd <= 0;
            // count <= 0;
            busy <= 0;
            // delay <= 0;
            
        end
    end 
    else if(cmd_valid) begin 
        busy  <= 1;
        count <= 0;
    end 
    else if(busy) begin
        case(cmd)
            Write:begin // write
                if(count == 64)begin
                    IRAM_valid <= 0;
                    busy <= 0;
                    done <= 1;
                end else begin
                    // busy <= 1;
                    IRAM_valid<=1;
                    IRAM_A <= count;
                    IRAM_D <= data[count];
                    count <= count + 1;
                end
            end
            Shift_Up:begin // move up
                if(seat > 7) seat <= seat - 8;
                busy  <= 0;
                // count <= 0;
            end
            Shift_Down:begin // move Down
                if(seat < 48) seat <= seat +8;
                busy <= 0;
                // count <= 0;
            end
            Shift_Left:begin //move left
                if(seat[2:0] != 0) seat <= seat - 1;
                busy <= 0;
                // count <= 0;
            end
            Shift_Right:begin //move right
                if(seat[2:0]!= 6) seat <= seat + 1;   
                busy <= 0;  
                // count <= 0;
            end
            Max:begin //find max
                if(count==2)begin
                    data[seat]<=max;
                    data[seat+1]<=max;
                    data[seat+8]<=max;
                    data[seat+9]<=max;
                    busy <= 0;
                end else begin
                    busy <= 1;
                    count <= count + 1;
                end
            end
            Min:begin //find min
                if(count==2)begin
                    data[seat]<=min;
                    data[seat+1]<=min;
                    data[seat+8]<=min;
                    data[seat+9]<=min;
                    busy <= 0;
                end else begin
                    busy <= 1;
                    count <= count + 1;
                end
            end
            Average:begin // aver
                if(count==2)begin
                    data[seat]<=aver;
                    data[seat+1]<=aver;
                    data[seat+8]<=aver;
                    data[seat+9]<=aver;
                    busy <= 0;
                    // count <= 0;
                end else begin
                    busy <= 1;
                    count <= count + 1;
                end
            end
            Counterclockwise_Rotation:begin
                data[seat    ] <= data[seat + 1];
                data[seat + 1] <= data[seat + 9];
                data[seat + 8] <= data[seat    ];
                data[seat + 9] <= data[seat + 8];
                busy <= 0;
                // count <= 0;
            end
            Clockwise_Rotation:begin
                data[seat    ] <= data[seat + 8];
                data[seat + 1] <= data[seat    ];
                data[seat + 8] <= data[seat + 9];
                data[seat + 9] <= data[seat + 1];
                busy <= 0;
                // count <= 0;
            end
            Mirror_X:begin
                data[seat    ] <= data[seat + 8];
                data[seat + 1] <= data[seat + 9];
                data[seat + 8] <= data[seat    ];
                data[seat + 9] <= data[seat + 1];
                busy <= 0;
                // count <=0;
            end
            Mirror_Y: begin //11
                data[seat    ] <= data[seat + 1];
                data[seat + 1] <= data[seat    ];
                data[seat + 8] <= data[seat + 9];
                data[seat + 9] <= data[seat + 8];
                busy <= 0;
                // count <= 0;
            end
        endcase
    end else begin
        count <= 0;
    end
end
endmodule


module Aver_m(clk, reset, data, out);
    input             clk,reset;
    input      [31:0] data;
    output reg [ 7:0] out;

    reg         [9:0] save[1:0];

    always@(posedge clk)begin
         if(reset)begin
            out<=0;
            save[0]<=0;
            save[1]<=0;
        end else begin
            save[0] <= data[ 7: 0] + data[15: 8];
            save[1] <= data[23:16] + data[31:24];
            out     <= ((save[0]   + save[1]) >> 2);
        end
    end
endmodule

module Max_m(clk, reset, data, out);
    input             clk, reset;
    input      [31:0] data;
    output reg [ 7:0] out;

    reg        [ 7:0] save[1:0];
    always@(posedge clk)begin
        if(reset)begin
            out<=0;
            save[0]<=0;
            save[1]<=0;
        end else begin
            save[0] <= data[ 7: 0] > data[15: 8] ? data[ 7: 0] : data[15: 8];
            save[1] <= data[23:16] > data[31:24] ? data[23:16] : data[31:24];
            out     <= save[0]     > save[1]     ? save[0]     : save[1];
        end
    end
endmodule

module Min_m(clk, reset, data, out);
    input             clk,reset;
    input      [31: 0] data;
    output reg [7 : 0] out;

    reg        [7 : 0] save[1:0];
    always@(posedge clk)begin
        if(reset)begin
            out<=0;
            save[0]<=0;
            save[1]<=0;
        end else begin

            save[0] <= data[ 7: 0] < data[15: 8] ? data[ 7: 0] : data[15: 8];
            save[1] <= data[23:16] < data[31:24] ? data[23:16] : data[31:24];
            out     <= save[0]     < save[1]     ? save[0]     : save[1];
        end
    end
endmodule
