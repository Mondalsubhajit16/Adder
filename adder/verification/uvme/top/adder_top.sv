
module adder_top;

	import adder_pkg::*;
	import uvm_pkg::*;

	// create bit clk and after forever #5 clk = ~clk;
	
	// Interface initialization
	adder_if ad_if();
    
	// RTL initialization
	adder DUT(.resetn(ad_if.resetn),.A(ad_if.ip1),.B(ad_if.ip2),.out(ad_if.out));
	
  	// UVM Test initialization
	initial begin
		// set interface in config_db
		uvm_config_db#(virtual adder_if)::set(null,"*","Subhajit_if",ad_if);
		run_test("adder_reset_test");
	end

	// Waveform genereation
	initial begin
		$shm_open("wave.shm");
		$shm_probe("ACTMF");
	end

endmodule

