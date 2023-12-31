onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib sys_bd_design_opt

do {wave.do}

view wave
view structure
view signals

do {sys_bd_design.udo}

run -all

quit -force
