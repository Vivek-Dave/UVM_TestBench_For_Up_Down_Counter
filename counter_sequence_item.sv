

/*

If you are going to create the standard transaction methods by overriding the built-in do_methods() you must use the  `uvm_object_utils() macro.

If you are going to create the standard transaction methods by using field  macros, you must use the `uvm_object_utils_begin() / `uvm_object_utils_end  macros.

*/



class counter_sequence_item extends uvm_sequence_item;

  //------------ i/p || o/p field declaration-----------------
  //if up_down==1 -> up_count 
  //if up_down==0 -> down_count
  rand logic up_down;  //i/p
  logic rst;

  logic [7:0]out;        //o/p

  //---------------- register counter_sequence_item class with factory --------
  `uvm_object_utils_begin(counter_sequence_item) 
     `uvm_field_int( up_down ,UVM_ALL_ON)
     `uvm_field_int( rst     ,UVM_ALL_ON)
     `uvm_field_int( out     ,UVM_ALL_ON)
  `uvm_object_utils_end
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="counter_sequence_item");
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // constraints
  constraint up_count  {soft up_down==1;}
  constraint down_count{soft up_down==0;}
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // write DUT inputs here for printing
  function string input2string();
    return($sformatf("up_down=%0b  rst=%0b", up_down,rst ));
  endfunction
  
  // write DUT outputs here for printing
  function string output2string();
    return($sformatf("out=%3d",out));
  endfunction
    
  function string convert2string();
    return($sformatf({input2string(), "  ", output2string()}));
  endfunction
  //----------------------------------------------------------------------------

endclass:counter_sequence_item
