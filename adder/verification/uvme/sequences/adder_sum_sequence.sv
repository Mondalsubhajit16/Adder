class adder_sum_sequence extends adder_base_sequence;

	// Factory registration
	`uvm_object_utils(adder_sum_sequence)

	int scenario;

	// Constructor: initialize 
	function new(string name = "adder_sum_sequence");
		super.new(name);
	endfunction
	
	// Body task method
	task body;
		req = adder_transaction::type_id::create("req");
			
		start_item(req);
		`uvm_info (get_type_name(),"start item ", UVM_LOW)

		assert(req.randomize with {resetn == 1'b0;});
		`uvm_info (get_type_name(),"random sequence send", UVM_LOW)

		assert(req.randomize with {resetn == 1'b1;});
		`uvm_info (get_type_name(),"random sequence send", UVM_LOW)

		finish_item(req); 
		`uvm_info (get_type_name(),"finish item", UVM_LOW)


	endtask
endclass

