class adder_reset_sequence extends adder_base_sequence;

	// Factory registration
	`uvm_object_utils(adder_reset_sequence)

	int scenario;

	// Constructor: initialize 
	function new(string name = "adder_reset_sequence");
		super.new(name);
	endfunction
	
	// Body task method
	task body;
		req = adder_transaction::type_id::create("req");
	
		if(scenario==1)begin	
			start_item(req);
			assert(req.randomize with {resetn == 1'b0;});
			finish_item(req); 
		end

		if(scenario==2)begin	
			start_item(req);
			assert(req.randomize with {resetn == 1'b1;});
			finish_item(req); 
		end

	endtask
endclass

