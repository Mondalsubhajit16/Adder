
class adder_agent extends uvm_agent;
	
	// uvm factory registration
	`uvm_component_utils(adder_agent)

	// Handles for driver, monitor, sequencer, and adder_agent configuration
	adder_driver drvh;
	adder_sequencer seqrh;
	adder_monitor monh;
	adder_agent_config m_cfg;
	
  
	// Constructor: :Initializes the adder_agent
	function new(string name = "adder_agent", uvm_component parent );
    	super.new(name, parent);
	endfunction
  
	// Build_phase: Create adder_agent component based on configuration
  	function void build_phase(uvm_phase phase);
    	super.build_phase(phase);

		// retrieve configuration for adder_agent
		if(!uvm_config_db#(adder_agent_config)::get(this,"","Mondal_agt",m_cfg))  // set in the base test
			`uvm_fatal("adder_agent_config","cannot get the data from m_cfg");
    
		// Create monitor instance (always present whther adder_agent is passive or active)
		monh = adder_monitor::type_id::create("monh", this);
	
		// Create driver and sequencer only if adder_agent is ACTIVE		
    	if(m_cfg.is_active == UVM_ACTIVE) begin 
     		drvh = adder_driver::type_id::create("drvh", this);
      		seqrh = adder_sequencer::type_id::create("seqrh", this);
    	end
    
  	endfunction
  
	// Connect phase: establish connection between driver and sequencer
  	function void connect_phase(uvm_phase phase);
    	if(m_cfg.is_active == UVM_ACTIVE) begin 
      		drvh.seq_item_port.connect(seqrh.seq_item_export);
    	end
  	endfunction

endclass

