module enecoder (in,enable,out);
input[7:0]in;
input enable;
output [2:0] out;
wire [2:0] out;
assign out=(enable==1'b1)?
(in == 8'b0000_0001)?3'b000:
(in == 8'b0000_0010)?3'b001:
(in == 8'b0000_0100)?3'b010:
(in == 8'b0000_1000)?3'b011:
(in == 8'b0001_0000)?3'b100:
(in == 8'b0010_0000)?3'b101:
(in == 8'b0100_0000)?3'b110:
(in == 8'b1000_0000)?3'b111:3'bx:3'bz;
endmodule