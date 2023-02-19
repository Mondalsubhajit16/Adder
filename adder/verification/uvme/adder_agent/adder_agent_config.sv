class adder_agent_config extends uvm_object;

	// uvm factory registration
	`uvm_object_utils(adder_agent_config)
	
	// declare the virtual interface handle for adder_if as "vif"
	virtual adder_if vif;

	// define whether the agent is active or passive
	uvm_active_passive_enum is_active;

	// constructor: initialize the agent config object
	function new(string name = "adder_agent_config");
		super.new(name);
	endfunction 

endclass
