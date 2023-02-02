vlog encoder8x3.v
vsim enecoder
add wave *

force -freeze sim:/enecoder/enable 0 0
force -freeze sim:/enecoder/in 00000000 0
run
force -freeze sim:/enecoder/in 00000001 0
run
force -freeze sim:/enecoder/enable 1 0
force -freeze sim:/enecoder/in 00000000 0
run
force -freeze sim:/enecoder/in 00000001 0
run
force -freeze sim:/enecoder/in 00000010 0
run
force -freeze sim:/enecoder/in 00000100 0
run
force -freeze sim:/enecoder/in 00001000 0
run
force -freeze sim:/enecoder/in 00010000 0
run
force -freeze sim:/enecoder/in 00100000 0
run
force -freeze sim:/enecoder/in 01000000 0
run
force -freeze sim:/enecoder/in 10000000 0
run