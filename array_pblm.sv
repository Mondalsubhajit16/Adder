class trr;
	rand int a[5];
	rand int b[5];
	rand int c[5];
	rand int d[10];
	// array a and b range
	constraint c1 {foreach (a[i])
				a[i] inside {[10:100]};

				foreach (b[i])
				b[i] inside {[10:100]};
				}

	// all a and b element are unique 
	constraint a_c{ unique{a};
				     unique{b};
				foreach (a[i])foreach (b[j]) a[i] != b[j];}

	// sorting the d array post randomization
    function void post_randomize();
        // Sort d
		d = {a,b};
        d.sort();
		c[0]= d[9];
		c[4]= d[0];
		// smallest odd number 
		for(int i=1;i<9;i++)begin 
			if(d[i]%2 != 0) begin 
			c[3]=d[i];
			break;
			end
		end
		// largest even number 
		for(int j=8;j>0;j--)begin 
			if(d[j]%2 == 0) begin
			c[2]=d[j];
			break;
			end
		end

	// Prime number logic
		foreach(d[i])
			if(prime(d[i]))
				c[1] = d[i];	

	endfunction

function bit prime(input int n);
  
    if(n < 2) return 0;

	for(int i=2; i<=n/2; i++)begin
		if(n%i==0)
			return 0;
	end

	return 1;

endfunction	
endclass




module tb;
	trr tr = new();
  initial begin   

    if (tr.randomize()) begin  
      $display("Randomization successful");
	
      foreach (tr.c[i])
        $display("c[%0d] = %0d,		  a[%0d]:%0d, 		 b[%0d]:%0d", i, tr.c[i],i,tr.a[i],i,tr.b[i]);
    end
    else
      $display("Randomization failed");
  end

endmodule 
