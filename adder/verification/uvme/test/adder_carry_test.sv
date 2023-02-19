class adder_carry_test extends adder_base_test;

	// factory registrtion
	`uvm_component_utils(adder_carry_test)
	
	// adder_carry_sequence handle
	adder_carry_sequence seqh;

	// constructor:initialize
	function new(string name = "adder_carry_test" , uvm_component parent);
		super.new(name , parent);
	endfunction

	// Build phase:
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

	task run_phase(uvm_phase phase);

		seqh = adder_carry_sequence::type_id::create("seqh");
			

		phase.raise_objection(this);
		seqh.start(envh.agt.seqrh);
		phase.drop_objection(this);

		uvm_test_done.set_drain_time(this,10);

	endtask
		
endclass
