open_project ./project_ci_sim.xpr
set_property -name {xsim.simulate.log_all_signals} -value {true} -objects [get_filesets sim_1]
launch_simulation
