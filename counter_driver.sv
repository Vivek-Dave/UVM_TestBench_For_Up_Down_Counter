
class counter_driver extends uvm_driver #(counter_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_component_utils(counter_driver)
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="counter_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  //---------------------------------------------------------------------------- 

  //--------------------------  virtual interface handel -----------------------  
  virtual interface intf vif;
  //----------------------------------------------------------------------------
  
  //-------------------------  get interface handel from top -------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif))) begin
      `uvm_fatal("driver","unable to get interface");
    end
  endfunction
  //----------------------------------------------------------------------------
  
  //---------------------------- run task --------------------------------------
  task run_phase(uvm_phase phase);
    counter_sequence_item txn;
    forever begin
      seq_item_port.get_next_item(txn);
      @(posedge vif.clk);
      vif.rst    = txn.rst;
      vif.up_down= txn.up_down;
      `uvm_info("DRIVER",txn.input2string(),UVM_HIGH)
      seq_item_port.item_done();    
    end
  endtask
  //----------------------------------------------------------------------------
  
endclass:counter_driver

