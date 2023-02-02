`include"RippleCarryAdder.v"
`include"CarrySkipAdder.v"
module Adder_tb();
reg[31:0] in1,in2;
wire[31:0] sum;
wire cout;
integer s;
integer f;
CSKA UUT(in1, in2,sum,cout);
initial begin
s=0;
f=0;
#10
//$monitor("***Monitor: input %b and %b and Output %b cout %b",in1,in2,sum,cout);
$display("================================================ Test Case 1 Over flow negative============================================");
in1=32'b10000000000000000000000000000001;
in2=32'b10000000000000000000000000000001;
#10
if(sum[31]==1'b0&&cout==1'b1)begin
$display("TestCase#1: failed with input %b and %b and Output %b and overflow status %b",in1,in2,sum,1'b1);
f=f+1;
end
else begin
$display("TestCase#1:success with input %b and %b and Output %b",in1,in2,sum);
s=s+1;
end
 #10

$display("================================================ Test Case 2 Over flow posetive============================================");
 
in1=32'b0111111111111111_1111111111111111;
in2=32'b0111111111111111_1111111111111111;
#10
if(sum[31]==1'b1&&cout==1'b0)begin
$display("TestCase#2: failed with input %b and %b and Output %b and overflow status %b",in1,in2,sum,1'b1);
f=f+1;
end
else begin
$display("TestCase#2:success with input %b and %b and Output %b",in1,in2,sum);
s=s+1;
end
 #10

$display("================================================ Test Case 3 posetive & negative============================================");
in1=32'b0111_0000_1111_1111_1001_1111_1111_1100;
in2=32'b1111_0010_1111_1101_1001_1111_1111_1100;
#10
if(sum==32'b0110_0011_1111_1101_0011_1111_1111_1000)begin
$display("TestCase#3:success with input %b and %b and Output %b",in1,in2,sum);
s=s+1;
end
else begin
$display("TestCase#3: failed with input %b and %b and Output %b",in1,in2,sum);
f=f+1;
end
 #10

$display("================================================ Test Case 4 posetive & posetive============================================");
 
in1=32'b0000_1000_1111_0001_1001_1111_1111_1100;
in2=32'b0100_0010_1111_1101_1111_1111_1001_1100;
#10
if(sum[31]==1'b1&&cout==1'b0)begin
$display("TestCase#4: failed with input %b and %b and Output %b and overflow status %b",in1,in2,sum,1'b1);
f=f+1;
end
else if(sum==32'b0100_1011_1110_1111_1001_1111_1001_1000)begin
$display("TestCase#4:success with input %b and %b and Output %b",in1,in2,sum);
s=s+1;
end
 #10
$display("================================================ Test Case 5 negative & negative============================================");
 
in1=32'b1111_0000_1111_1111_1001_1111_1111_1111;
in2=32'b1111_0010_1111_1101_1001_1111_1111_1100;
#10
if(sum[31]==1'b0&&cout==1'b1)begin
$display("TestCase#5: failed with input %b and %b and Output %b and overflow status %b",in1,in2,sum,1'b1);
f=f+1;
end
else if(sum==32'b1110_0011_1111_1101_0011_1111_1111_1011)begin
$display("TestCase#5:success with input %b and %b and Output %b",in1,in2,sum);
s=s+1;
end
 #10
$display("================================================ Test Case 6 all zeros============================================");
 
in1=32'b0000_0000_0000_0000_0000_0000_0000_0000;
in2=32'b0000_0000_0000_0000_0000_0000_0000_0000;
#10
if(sum==32'b0000_0000_0000_0000_0000_0000_0000_0000)begin
$display("TestCase#6:success with input %b and %b and Output %b",in1,in2,sum);
s=s+1;
end
else begin
$display("TestCase#6: failed with input %b and %b and Output %b",in1,in2,sum);
f=f+1;
end
 #10
$display("================================================ Test Case 7 posetive & negative============================================");
 
in1=32'b0111_0000_1000_0000_1001_1111_1111_1100;
in2=32'b1100_0010_1111_1101_0000_1101_0000_1100;
#10
if(sum==32'b0011_0011_0111_1101_1010_1101_0000_1000)begin
$display("TestCase#7:success with input %b and %b and Output %b",in1,in2,sum);
s=s+1;
end
else begin
$display("TestCase#7: failed with input %b and %b and Output %b",in1,in2,sum);
f=f+1;
end
 #10
$display("================================================ Test Case 8 posetive & posetive============================================");
 
in1=32'b0101_0000_1100_0001_1011_1111_1111_1100;
in2=32'b0011_0010_1001_1101_1101_1111_1001_1100;
#10
if(sum[31]==1'b1&&cout==1'b0)begin
$display("TestCase#8: failed with input %b and %b and Output %b and overflow status %b",in1,in2,sum,1'b1);
f=f+1;
end
else if(sum==32'b1000_0011_0101_1111_1001_1111_1001_1000)begin
$display("TestCase#8:success with input %b and %b and Output %b",in1,in2,sum);
s=s+1;
end

 #10
$display("================================================ Test Case 9 negative & negative ============================================");
 
in1=32'b1001_0110_1111_1111_1001_0011_1111_1111;
in2=32'b1110_0010_0000_1101_1001_1111_0001_1100;
#10
if(sum[31]==1'b0&&cout==1'b1) begin
$display("TestCase#9: failed with input %b and %b and Output %b and overflow status %b",in1,in2,sum,1'b1);
f=f+1;
end
else if(sum==32'b0111_1001_0000_1101_0011_0011_0001_1011)begin
$display("TestCase#9:success with input %b and %b and Output %b",in1,in2,sum);
s=s+1;
end
#10
$display("the total number of success testcases %d and failure testcases %d",s,f);
#10 $finish;
end
endmodule
