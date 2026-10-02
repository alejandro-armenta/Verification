# ==========================================
# Launch Vivado Simulator in BATCH mode
# ==========================================
puts "Launching Vivado Simulator in batch mode..."

# -R runs the simulation automatically to completion (equivalent to 'run all')
# -testplusarg passes the UVM test name down to your environment
if {[catch { exec xsim $SNAPSHOT_NAME -R -sv_seed $dynamic_seed -testplusarg UVM_TESTNAME=$UVM_TEST } sim_out]} {
    puts $sim_out
    error "ERROR: Simulation failed or exited with an error."
} else {
    puts $sim_out
    puts "Simulation completed successfully."
}
