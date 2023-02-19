class adder_base_test extends uvm_test; 
	
	// UVM factory registration
	`uvm_component_utils(adder_base_test)
	
	// handles for the enviroment and agent config
	adder_env envh;
	adder_agent_config agt_cfg;
	
	
	// constructor: initialize this test component
	function new(string name = "adder_base_test",uvm_component parent);
		super.new(name, parent);
	endfunction
	
	// Build phase: create enviroment and congigure it
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		// Create Environment instance
		envh = adder_env::type_id::create("envh",this);
		
		// create agent configuration objet
		agt_cfg = adder_agent_config::type_id::create("agt_cfg");
		
		// fetch the config for agent virtual interface
		if(!uvm_config_db#(virtual adder_if)::get(this,"","Subhajit_if",agt_cfg.vif))
			`uvm_fatal("test_vif","cannot get config data")

		// set agent as active
		agt_cfg.is_active = UVM_ACTIVE;

		// set the agent config to agent component
		uvm_config_db#(adder_agent_config)::set(this,"envh.agt*","Mondal_agt",agt_cfg);

	endfunction

	// End of elaboration phase: prints UVM Test Topology
	function void end_of_elaboration_phase(uvm_phase phase);
		// Print the testbench topology
		uvm_top.print_topology();
	endfunction

endclass
