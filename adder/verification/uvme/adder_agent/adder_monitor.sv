
class adder_monitor extends uvm_monitor;

	// uvm factory registration
	`uvm_component_utils(adder_monitor)

	// Virtual interface handle
	virtual adder_if.adder_modport vif;

	// Configuration handle
	adder_agent_config m_cfg;

	// adder transaction handle
	adder_transaction  mon_item;


	// Analysis port for sending transactions to scoreboard
	uvm_analysis_port#(adder_transaction)adder_port;
	
	// Constructor: initializes the monitor
	function new(string name = "adder_monitor", uvm_component parent);
    	super.new(name, parent);
		adder_port = new("adder_port",this);
  	endfunction

  	// Build_phase: retrive the configuration and initializes build phase
  	function void build_phase(uvm_phase phase);
    	super.build_phase(phase);
		mon_item = adder_transaction::type_id::create("mon_item");

    	if(!uvm_config_db#(adder_agent_config)::get(this, "", "Mondal_agt",m_cfg))          // set in base test
      		`uvm_fatal(get_type_name(), "cannot get data from m_cfg");
 	 endfunction

	// connect phase: assigns virtual interface from configuration
	function void connect_phase(uvm_phase phase);
		vif = m_cfg.vif;
	endfunction

	// Run phase : main execution loop for driving transactions
	task run_phase(uvm_phase phase);
//		forever 
			collect_data();

	endtask

	// collect_data task: captures data from the DUT and send it to scoreboard
	task collect_data();
		#1;
		mon_item = adder_transaction::type_id::create("mon_item");
		mon_item.ip1 = vif.ip1;
		mon_item.ip2 = vif.ip2; 
		mon_item.out = vif.out;
		mon_item.resetn = vif.resetn;
		`uvm_info("ADDER_MONITOR",$sformatf("printing from Monitor \n %s", mon_item.sprint()),UVM_LOW)
		adder_port.write(mon_item);	
	endtask

endclass

	
