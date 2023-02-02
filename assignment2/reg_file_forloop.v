module Reg #(parameter N)(read_enable,write_enable,read_data,write_data,rst,clk,read_addr,write_addr,reg_addr);
input read_enable,write_enable,clk,rst;
input[2:0] read_addr,write_addr;
input[31:0] reg_addr;
input[N-1:0] write_data;
output reg[N-1:0] read_data;

reg [N-1:0] reg_data='b0;

always @(posedge clk, posedge rst) begin
 if(rst) begin
   reg_data=0;
 end
 else if((write_enable&&(reg_addr==write_addr))||(read_enable&&(reg_addr==read_addr)))begin
  if(write_enable&&!read_enable)begin
           reg_data=write_data;
  end
  else if(read_enable&&!write_enable)begin
          read_data=reg_data;
  end
  else if(read_enable&&write_enable)begin
     read_data='bz;
     //reg_data='bz;
  end
    else if(!read_enable&&!write_enable)begin
     read_data='bz;
    // reg_data='bz;
  end 
 end
 else begin
   read_data='bz;
  end
end
endmodule

module Reg_file_loop #(parameter N)(read_enable,write_enable, read_data,write_data, clk,rst, read_addr,write_addr);
input read_enable,write_enable,clk,rst;
input[2:0] read_addr,write_addr;
input[N-1:0] write_data;
output [N-1:0] read_data;

genvar i;
generate
 for(i=0;i<8;i=i+1)begin
  Reg #(N) regist(.read_enable(read_enable),
                              .write_enable(write_enable),
                              .read_data(read_data),
                              .write_data(write_data),
                              .rst(rst),
                              .clk(clk),
                              .read_addr(read_addr),
                              .write_addr(write_addr),
                              .reg_addr(i)
                               );
 end
endgenerate
endmodule
