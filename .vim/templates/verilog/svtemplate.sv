// Headers include

module $COMPONENT_NAME
(
   // System interface
   // -- inputs
   input logic SClk,
   input logic Reset_n,
   input logic SyncRst,
   // Data interface
   // --inputs
   input logic DataInVal,
   input logic DataIn,
   // --outputs
   output logic DataOutVal,
   output logic DataOut
);

// External functions and tasks
// Miscellaneous parameter task and functions

// Configurable parameters

// Internal parameters (localparams)

// Module I/O

// Internal parameters (localparams)

// Registered outputs

// Virtually registered output (combinational regs)

// Internal registers

// Internal virtual registers (combinational regs)

// Internal wires

// Wires assignments

// Modules instantiations

// Module functionality

always_comb begin

end

always_ff @(posedge SClk or negedge Reset_n) begin
   if (!Reset_n) begin
      DataOutVal <= 0;
      DataOut    <= 0;
   end else begin
      if (SyncRst) begin
         DataOutVal <= 0;
         DataOut    <= 0;
      end
   end
end

endmodule 
// end of $COMPONENT_NAME
