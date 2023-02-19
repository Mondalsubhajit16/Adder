class adder_scoreboard extends uvm_scoreboard;

	// uvm factory registration
	`uvm_component_utils(adder_scoreboard)

	// analysis imp from monitor	
	uvm_analysis_imp #(adder_transaction, adder_scoreboard) item_collect_export;

	logic[1:0] a,b;
	logic[2:0] out;
	

	// Constructor: initializes the scoreboard
	function new(string name = "adder_scoreboard", uvm_component parent);
		super.new(name, parent);
		item_collect_export = new("item_collect_export", this);
	endfunction
  
	// Build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

	// Write method: processing incoming transaction
	function void write(adder_transaction trans);
  		if (!trans.resetn) begin
    		$display("RESET ASSERTED");
  		end
  		else begin
    		a = trans.ip1;
    		b = trans.ip2;
    		out = a+b;
    		$display("------------------------------------------------------------------"); 
    		if (trans.out == out)
      			`uvm_info(get_type_name(), $sformatf("Matched: ip1 = %0d, ip2 = %0d, out = %0d", trans.ip1, trans.ip2, trans.out), UVM_LOW)
    		else
      			`uvm_error(get_name(), $sformatf("Mismatched: ip1 = %0d, ip2 = %0d, out = %0d", trans.ip1, trans.ip2, trans.out));
      		$display("------------------------------------------------------------------");
  		end
	endfunction
endclass
