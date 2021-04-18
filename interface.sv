interface intf(input bit clk);
  logic rst;
  logic up_down;
  logic [7:0] out;


  // -------------- assertions -------------------------------------
	property check_up_counter;
      disable iff (rst||up_down==0)
      @(posedge clk) out|->(out==$past(out,1)+1);
    endproperty
  
    property check_down_counter;
      disable iff (rst||up_down==1)
    	@(posedge clk) out|->(out==$past(out,1)-1);
    endproperty
      
  // --------------------------------------------------------------
  
  	ASSERT_UP_COUNTER:assert property(check_up_counter) 
      $display($time,"\t\t\t\t\t\t\t [Interface]--------- UP_COUNTER ASSERTION PASS --------");
  	else 
  		$display($time,"\t\t\t\t\t\t\t [Interface]----------- UP_COUNTER ASSERTION FAILS -----"); 
  
    
    ASSERT_DOWN_COUNTER:assert property(check_down_counter) 
      $display($time,"\t\t\t\t\t\t\t [Interface]--------- DOWN_COUNTER ASSERTION PASS --------");
    else 
   		$display($time,"\t\t\t\t\t\t\t [Interface]----------- DOWN_COUNTER ASSERTION FAILS -----"); 
  
endinterface
