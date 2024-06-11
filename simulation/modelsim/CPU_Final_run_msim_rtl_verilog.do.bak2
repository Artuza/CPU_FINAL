transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/artur/OneDrive/Desktop/CPU_Final {C:/Users/artur/OneDrive/Desktop/CPU_Final/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/artur/OneDrive/Desktop/CPU_Final {C:/Users/artur/OneDrive/Desktop/CPU_Final/RegisterFile.v}
vlog -vlog01compat -work work +incdir+C:/Users/artur/OneDrive/Desktop/CPU_Final {C:/Users/artur/OneDrive/Desktop/CPU_Final/CPU.v}
vlog -vlog01compat -work work +incdir+C:/Users/artur/OneDrive/Desktop/CPU_Final {C:/Users/artur/OneDrive/Desktop/CPU_Final/ProgramCounter.v}
vlog -vlog01compat -work work +incdir+C:/Users/artur/OneDrive/Desktop/CPU_Final {C:/Users/artur/OneDrive/Desktop/CPU_Final/ProgramMemory.v}
vlog -vlog01compat -work work +incdir+C:/Users/artur/OneDrive/Desktop/CPU_Final {C:/Users/artur/OneDrive/Desktop/CPU_Final/ControlUnit.v}
vlog -vlog01compat -work work +incdir+C:/Users/artur/OneDrive/Desktop/CPU_Final {C:/Users/artur/OneDrive/Desktop/CPU_Final/DataMemory.v}
vlog -vlog01compat -work work +incdir+C:/Users/artur/OneDrive/Desktop/CPU_Final {C:/Users/artur/OneDrive/Desktop/CPU_Final/Fibonacci_tb.v}

vlog -vlog01compat -work work +incdir+C:/Users/artur/OneDrive/Desktop/CPU_Final {C:/Users/artur/OneDrive/Desktop/CPU_Final/Prueba_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  Prueba_tb

add wave *
view structure
view signals
run -all
