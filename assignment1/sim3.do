vlog encoder8x3.v
vsim enecoder
add wave -position insertpoint  \
sim:/enecoder/enable \
sim:/enecoder/in \
sim:/enecoder/out
force -freeze sim:/enecoder/enable 0 0
force -freeze sim:/enecoder/in 00000000 0
run
force -freeze sim:/enecoder/in 00000001 0
run
force -freeze sim:/enecoder/enable 1 0
force -freeze sim:/enecoder/in 00000000 0
run
for { set a 0}  {$a < 256} {incr a} {
force -freeze sim:/enecoder/in 8'd$a 0
run
}