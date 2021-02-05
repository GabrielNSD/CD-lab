onerror {quit -f}
vlib work
vlog -work work PortaOr.vo
vlog -work work PortaOr.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.PortaOr_vlg_vec_tst
vcd file -direction PortaOr.msim.vcd
vcd add -internal PortaOr_vlg_vec_tst/*
vcd add -internal PortaOr_vlg_vec_tst/i1/*
add wave /*
run -all
