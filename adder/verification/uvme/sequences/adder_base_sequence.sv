class adder_base_sequence extends uvm_sequence#(adder_transaction);             

	// UVM Factory registration
	`uvm_object_utils(adder_base_sequence)                            

	// Constructor: initializes asser_adder_base_sequence
	function new (string name = "adder_base_sequence");            
		super.new(name);
	endfunction
	// Body task:
	task body();                                                          
		`uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);
		`uvm_do(req);
	endtask
endclass
