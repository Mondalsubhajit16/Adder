class adder_sequencer extends uvm_sequencer#(adder_transaction);  

	// UVM factory registration         
	`uvm_component_utils(adder_sequencer)                          
  
  	// Constructor: intializes the sequencer
	function new(string name = "adder_sequencer", uvm_component parent);    
		super.new(name, parent);
	endfunction
  
endclass

