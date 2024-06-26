module sync_fifo_tb();

reg clk,rst,rd,wr;
reg [7:0] d_in;
wire full,emp;
wire [7:0] d_out;

sync_fifo sff(.clk(clk),.rst(rst),.rd(rd),.wr(wr),.d_in(d_in),.d_out(d_out),.full(full),.emp(emp));

initial 
begin
clk=1'b0;
rst=1'b1;
rd=1'b0;
wr=1'b0;
end

always #10 clk=~clk;

initial 
begin
#20 rst=1'b0;
#10 wr=1'b1;
#10 d_in=8'd12;
#20 d_in=8'd198;
#20 d_in=8'd101;
#20 d_in=8'd78;
#20 wr=1'b0; 
#10 rd=1'b1;
end

initial #300 $finish;

endmodule

