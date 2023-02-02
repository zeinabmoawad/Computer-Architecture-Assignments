`include"reg_file_forloop.v"
`include"reg_file_memory.v"
module Reg_file_memo_tb();
localparam N=8;
reg read_enable,write_enable,clk,rst;
reg[2:0] read_addr,write_addr;
reg[N-1:0] write_data;
wire[N-1:0] read_data;
localparam PERIOD=8;
Reg_file_memo #(N) UUT(.read_enable(read_enable),
.write_enable(write_enable),
.read_data(read_data),
.write_data(write_data),
.clk(clk),.rst(rst), 
.read_addr(read_addr),
.write_addr(write_addr)
);
always 
#(PERIOD/2) clk=~clk;
integer i;
integer j;
initial begin
$monitor(" MEMORY: \t time= %g  \t rest= %b  \t read_enable= %b  \t write_enable= %b  \t read_data= %b  \t write_data= %b  \t read_addr= %b  \t write_addr= %b ",
          $time, rst, read_enable, write_enable, read_data, write_data, read_addr, write_addr);
clk =1'b0; 
rst =1'b1; 
read_enable =1'b0;
write_enable =1'b0;
write_data =0;
read_addr =0;
write_addr =0;
i=0;
j=2**N;
#(3*PERIOD) rst =1'b0; 
#(3*PERIOD) read_enable =1'b1;
#(1*PERIOD)read_addr =0;
#(1*PERIOD)read_addr =1;
#(1*PERIOD)read_addr =2;
#(1*PERIOD)read_addr =3;
#(1*PERIOD)read_addr =4;
#(1*PERIOD)read_addr =5;
#(1*PERIOD)read_addr =6;
#(1*PERIOD)read_addr =7;
#(3*PERIOD) read_enable =1'b0;

#(3*PERIOD) write_enable =1'b1;
for(i=0;i<8;i=i+1)begin
#(1*PERIOD)write_addr =i;
           write_data =j-i;
end
#(3*PERIOD) write_enable =1'b0;
#(3*PERIOD) read_enable =1'b1;
#(1*PERIOD)read_addr =0;
#(1*PERIOD)read_addr =1;
#(1*PERIOD)read_addr =2;
#(1*PERIOD)read_addr =3;
#(1*PERIOD)read_addr =4;
#(1*PERIOD)read_addr =5;
#(1*PERIOD)read_addr =6;
#(1*PERIOD)read_addr =7;
#(5*PERIOD)$finish;
end
endmodule

module Reg_file_forloop_tb();
localparam N=8;
reg read_enable,write_enable,clk,rst;
reg[2:0] read_addr,write_addr;
reg[N-1:0] write_data;
wire[N-1:0] read_data;
localparam PERIOD=8;
Reg_file_loop #(N) UUT(.read_enable(read_enable),
.write_enable(write_enable),
.read_data(read_data),
.write_data(write_data),
.clk(clk),.rst(rst), 
.read_addr(read_addr),
.write_addr(write_addr)
);
always 
#(PERIOD/2) clk=~clk;
integer i;
integer j;
initial begin
$monitor("For Loop: \t time= %g  \t rest= %b  \t read_enable= %b  \t write_enable= %b  \t read_data= %b  \t write_data= %b  \t read_addr= %b  \t write_addr= %b ",
          $time, rst, read_enable, write_enable, read_data, write_data, read_addr, write_addr);
clk =1'b0; 
rst =1'b1; 
read_enable =1'b0;
write_enable =1'b0;
write_data =0;
read_addr =0;
write_addr =0;
i=0;
j=2**N;
#(3*PERIOD) rst =1'b0; 
#(3*PERIOD) read_enable =1'b1;
read_addr =0;
#(1*PERIOD)read_addr =1;
#(1*PERIOD)read_addr =2;
#(1*PERIOD)read_addr =3;
#(1*PERIOD)read_addr =4;
#(1*PERIOD)read_addr =5;
#(1*PERIOD)read_addr =6;
#(1*PERIOD)read_addr =7;
#(3*PERIOD) read_enable =1'b0;

#(3*PERIOD) write_enable =1'b1;
for(i=0;i<8;i=i+1)begin
#(1*PERIOD)write_addr =i;
           write_data =j-i;
end
#(3*PERIOD) write_enable =1'b0;
#(3*PERIOD) read_enable =1'b1;
read_addr =0;
#(1*PERIOD)read_addr =1;
#(1*PERIOD)read_addr =2;
#(1*PERIOD)read_addr =3;
#(1*PERIOD)read_addr =4;
#(1*PERIOD)read_addr =5;
#(1*PERIOD)read_addr =6;
#(1*PERIOD)read_addr =7;
#(1*PERIOD)read_addr =7;
#(5*PERIOD)$finish;
end
endmodule

module tb_loop();
localparam N=16;
reg readEnable,writeEnable,clk,rst;
reg [2:0] readAddr,writeAddr;
reg [N-1:0] writeData;
wire [N-1:0] readData;

Reg_file_loop #(N) UUT(.read_enable(readEnable),
.write_enable(writeEnable),
.read_data(readData),
.write_data(writeData),
.clk(clk),.rst(rst), 
.read_addr(readAddr),
.write_addr(writeAddr)
);
initial begin
$monitor ("cases=%b \n",readData);
end
initial begin
readEnable = 1'b0;
writeEnable = 1'b0;
clk = 1'b1;
rst = 1'b1;
readAddr = 3'b0;
writeAddr = 3'b0;
#100;
rst = 1'b0;
readEnable = 1'b1;
#20;
writeEnable = 1'b1;
readEnable = 1'b0;
writeData = 16'b0011110100110101;
#20
writeEnable = 1'b0;
readEnable = 1'b1;
#20
rst = 1'b1;
#20
rst = 1'b0;
#20
writeEnable = 1'b1;
#20
readEnable = 1'b0;
writeAddr = 3'b011;
writeData = 16'b0000000011111111;
#20
readAddr = 3'b011;
writeAddr = 3'b000;
writeEnable = 1'b0;
readEnable = 1'b1;
#20
readAddr = 3'b0;
end
always begin
clk = ~clk;
#10;
end
endmodule