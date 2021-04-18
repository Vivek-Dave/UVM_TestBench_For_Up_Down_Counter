
`ifndef TB_PKG
`define TB_PKG
`include "uvm_macros.svh"
package tb_pkg;
 import uvm_pkg::*;
 `include "counter_sequence_item.sv"        // transaction class
 `include "counter_sequence.sv"             // sequence class
 `include "counter_sequencer.sv"            // sequencer class
 `include "counter_driver.sv"               // driver class
 `include "counter_monitor.sv"
 `include "counter_agent.sv"                // agent class  
 
 `include "counter_env.sv"                  // environment class

 `include "counter_test.sv"                         // test1

endpackage
`endif 


