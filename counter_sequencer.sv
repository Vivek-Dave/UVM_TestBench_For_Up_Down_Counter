

class counter_sequencer extends uvm_sequencer#(counter_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_component_utils(counter_sequencer)  
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="counter_sequencer",uvm_component parent);  
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
endclass:counter_sequencer

