onerror {quit -f}
vlib work
vlog -work work MaqCinema.vo
vlog -work work MaqCinema.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.MaqCinema_vlg_vec_tst
vcd file -direction MaqCinema.msim.vcd
vcd add -internal MaqCinema_vlg_vec_tst/*
vcd add -internal MaqCinema_vlg_vec_tst/i1/*
add wave /*
run -all
