
class counter_env extends uvm_env;

   //---------------------------------------------------------------------------
   `uvm_component_utils(counter_env)
   //---------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="counter_env",uvm_component parent);
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------

  //-------------------- class handles -----------------------------------------
  counter_agent    agent_h;
  //----------------------------------------------------------------------------

  //---------------------- build phase -----------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent_h    = counter_agent::type_id::create("agent_h",this);
  endfunction
  //----------------------------------------------------------------------------

  //-------------------------- connect phase -----------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction
  //----------------------------------------------------------------------------
endclass:counter_env

