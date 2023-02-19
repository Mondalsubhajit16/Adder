package adder_pkg;

	// UVM Package Import
	import uvm_pkg::*;
	`include "uvm_macros.svh"

	// Include all agent & config files
	`include "../uvme/adder_agent/adder_transaction.sv"
	`include "../uvme/adder_agent/adder_agent_config.sv"
	`include "../uvme/adder_agent/adder_sequencer.sv"
	`include "../uvme/adder_agent/adder_driver.sv"
	`include "../uvme/adder_agent/adder_monitor.sv"
	`include "../uvme/adder_agent/adder_agent.sv"


	// Sequences
	`include "../uvme/sequences/adder_base_sequence.sv"
	`include "../uvme/sequences/adder_reset_sequence.sv"
	`include "../uvme/sequences/adder_sum_sequence.sv"
	`include "../uvme/sequences/adder_carry_sequence.sv"


	// Environment
 	`include "../uvme/env/adder_scoreboard.sv"
	`include "../uvme/env/adder_env.sv"
	

	// Test
	`include "../uvme/test/adder_base_test.sv"
	`include "../uvme/test/adder_reset_test.sv"
	`include "../uvme/test/adder_sum_test.sv"
 	`include "../uvme/test/adder_carry_test.sv"


endpackage
