set_param messaging.defaultLimit 0  

# set dynamic_seed [expr {int(rand() * 1000000)}]

set dynamic_seed 54321

puts "Selected random simulation seed: $dynamic_seed"

# 2. Assign the dynamic seed to the file-set property (for GUI/Vivado runs)
set_property -name {xsim.simulate.xsim.more_options} -value "-sv_seed $dynamic_seed" -objects [get_filesets sim_1]

set TESTBENCH_TOP "ale_lib.top" 

set SNAPSHOT_NAME "snapshot"

set OUTPUT_DIR "./build"  

set UVM_TEST [if {[info exists ::env(UVM_TESTNAME)]} {set ::env(UVM_TESTNAME)} {format "my_first_uvm_test"}]

cd $OUTPUT_DIR

puts "Launching Vivado Simulator in batch mode..."

if {[catch { exec xsim $SNAPSHOT_NAME -gui -sv_seed $dynamic_seed -testplusarg UVM_TESTNAME=$UVM_TEST } sim_out]} {
    puts $sim_out
    error "ERROR: Simulation failed or exited with an error."
} else {
    puts $sim_out
    puts "Simulation completed successfully."
}
