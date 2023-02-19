class adder_transaction extends uvm_sequence_item;

	// Input signals (Randomized)
	rand bit [1:0]ip1; 
	rand bit [1:0]ip2;
	rand bit resetn;

	// Ouput signal (not randomized)
	bit [2:0]out;
  
	// uvm new function 
	function new(string name = "adder_transaction");
		super.new(name);
	endfunction
  
	// UVM factory registration & singal registration
	`uvm_object_utils_begin(adder_transaction)
		`uvm_field_int(ip1,UVM_ALL_ON)
		`uvm_field_int(ip2,UVM_ALL_ON)
		`uvm_field_int(out,UVM_ALL_ON)
		`uvm_field_int(resetn,UVM_ALL_ON)
	`uvm_object_utils_end

endclass
    
