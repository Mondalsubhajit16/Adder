class adder_env extends uvm_env;

	// UVM Factory registration
 	 `uvm_component_utils(adder_env)

	// Handles for agent and scoreboard
   	adder_agent agt;
  	adder_scoreboard sb;

	// Constructor: Initializes the environment
  	function new(string name = "adder_env", uvm_component parent);
		super.new(name, parent);
   	endfunction
  
	// Build phase: creates and configures testbench components
	function void build_phase(uvm_phase phase);
 		super.build_phase(phase);
   		agt = adder_agent::type_id::create("agt", this);
   	    sb = adder_scoreboard::type_id::create("sb", this);
  	endfunction
  
	// Connect phase: Established connection between components
 	function void connect_phase(uvm_phase phase);
     	agt.monh.adder_port.connect(sb.item_collect_export);
 	 endfunction 
endclass
