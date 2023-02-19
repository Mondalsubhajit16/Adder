class adder_carry_sequence extends adder_base_sequence;

	// Factory registration
	`uvm_object_utils(adder_carry_sequence)

	
	// Constructor: initialize 
	function new(string name = "adder_carry_sequence");
		super.new(name);
	endfunction
	
	// Body task method
	task body;
		req = adder_transaction::type_id::create("req");
		start_item(req);
		assert(req.randomize with {resetn == 1'b1;ip1>2;ip2>2;});
		finish_item(req); 
	
	endtask

endclass
