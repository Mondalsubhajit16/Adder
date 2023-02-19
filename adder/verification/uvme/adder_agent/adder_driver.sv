
class adder_driver extends uvm_driver#(adder_transaction);

	// uvm factory registration
	`uvm_component_utils(adder_driver)

	// Virtual interface handle
	virtual adder_if.adder_modport vif;

	// Configuration handle
	adder_agent_config m_cfg;
     // TRANSACTION HANDLE 
     adder_transaction req;
	
	// Constructor: initializes the driver
	function new(string name = "adder_driver", uvm_component parent);
    	super.new(name, parent);
  	endfunction

  	// Build_phase: retrive the configuration and initializes build phase
  	function void build_phase(uvm_phase phase);
    	super.build_phase(phase);
    	if(!uvm_config_db#(adder_agent_config)::get(this, "", "Mondal_agt",m_cfg))                 // set in base test
      		`uvm_fatal(get_type_name(), "cannot get data from m_cfg");
 	 endfunction

	// connect phase: assigns virtual interface from configuration
	function void connect_phase(uvm_phase phase);
		vif = m_cfg.vif;
	endfunction

	// Run phase : main execution loop for driving transactions
	task run_phase(uvm_phase phase);
		 
		req = adder_transaction ::type_id::create("req",this); 

		forever begin
			seq_item_port.get_next_item(req);	// Get the next transaction from the sequencer
			`uvm_info (get_type_name(),"driving start with get next item", UVM_LOW)

			send2dut(req);	// Drive transaction to DUT

			seq_item_port.item_done();	// Notify completion
			`uvm_info (get_type_name(),"driving end with item done", UVM_LOW)

		end
	endtask

	// send2dut task: send the transaction to the DUT
	task send2dut(adder_transaction xtn);
		`uvm_info(get_type_name(),"inside the driver body",UVM_LOW)
		vif.resetn <= xtn.resetn;
		vif.ip1 <= xtn.ip1;
		vif.ip2 <= xtn.ip2;
		`uvm_info("ADDER_DRIVER",$sformatf("printing from Driver \n %s", xtn.sprint()),UVM_LOW)
		//xtn.print;
	endtask
	
endclass

	
