module sync_fifo(clk,rst,rd,wr,d_in,d_out,full,emp);
input clk,rst,rd,wr;
input [7:0] d_in;
output full,emp;
output reg [7:0] d_out;

reg [7:0] mem [15:0];
reg [3:0] wr_pr;
reg [3:0] r_pr;
reg [4:0] counter;

always@(posedge clk)
begin
    if(rst) 
	begin
	wr_pr<=0;
	r_pr<=0;
	counter<=0;
	end

    else
	begin

	if(wr&&!full)
	  begin
	  mem[wr_pr]<=d_in;
	  wr_pr<=wr_pr+1;
	  counter<=counter+1;
	  end
	else if(rd&&!emp)
	  begin
	  d_out<=mem[r_pr];
	  r_pr<=r_pr+1;
	  counter<=counter-1;
	  end

	end
end

assign full=(counter==16)?(1'b1):(1'b0);
assign emp=(counter==0)?(1'b1):(1'b0);

	
endmodule
