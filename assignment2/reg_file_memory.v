module Reg_file_memo #(parameter N)(read_enable,write_enable, read_data,write_data, clk,rst, 
read_addr,write_addr);
input read_enable,write_enable,clk,rst;
input[2:0] read_addr,write_addr;
input[N-1:0] write_data;
output reg[N-1:0] read_data;
reg [N-1:0] reg_file [0:7];
integer i;
always @(posedge clk,posedge rst) begin
 if(rst) begin
  for(i=0;i<8;i=i+1)begin
      reg_file[i]=0;  
  end
 end
 else begin
  if(write_enable&&!read_enable)begin
    reg_file[write_addr]=write_data;
  end
  else if(read_enable&&!write_enable)begin
    read_data=reg_file[read_addr];
  end
  else if(read_enable&&write_enable)begin
     read_data='bz;
  end
  else if(!read_enable&&!write_enable)begin
    read_data='bz;
  end
 end
end
endmodule
