
/***************************************************
** class name  : counter_sequence
** description : counts up 
***************************************************/
class counter_sequence extends uvm_sequence#(counter_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_object_utils(counter_sequence)            
  //----------------------------------------------------------------------------

  counter_sequence_item txn;
  int count=20;
  //----------------------------------------------------------------------------
  function new(string name="counter_sequence");  
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  virtual task body();
    repeat(count) begin 
      txn=counter_sequence_item::type_id::create("txn");
      txn.down_count.constraint_mode(0); // disable down_count
      start_item(txn);
      txn.randomize();
      txn.rst=0;
      finish_item(txn);
    end
  endtask:body
  //----------------------------------------------------------------------------
endclass:counter_sequence

/***************************************************
** class name  : sequence_down_count
** description : counts down
***************************************************/
class sequence_down_count extends counter_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(sequence_down_count)      
  //----------------------------------------------------------------------------
  
  counter_sequence_item txn;
  int count=20;
  //----------------------------------------------------------------------------
  function new(string name="sequence_down_count");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    repeat(count) begin 
      txn=counter_sequence_item::type_id::create("txn");
      txn.up_count.constraint_mode(0); //disable up_count
      start_item(txn);
      txn.randomize();
      txn.rst=0;
      finish_item(txn);
    end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass

/***************************************************
** class name  : reset_sequence
** description : reset DUT
***************************************************/
class reset_sequence extends counter_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(reset_sequence)      
  //----------------------------------------------------------------------------
  
  counter_sequence_item txn;
  
  //----------------------------------------------------------------------------
  function new(string name="reset_sequence");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    txn=counter_sequence_item::type_id::create("txn");
    txn.up_count.constraint_mode(0);
    txn.down_count.constraint_mode(0);
    start_item(txn);
    txn.rst=1;
    txn.up_down=0;
    finish_item(txn);
  endtask:body
  //----------------------------------------------------------------------------
  
endclass