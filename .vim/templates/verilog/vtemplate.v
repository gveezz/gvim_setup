// $COMPONENT_NAME
// Headers include

module $COMPONENT_NAME #(
   // Configurable parameters
   parameter DATA_W = 8
) (
   // System interface
   // -- inputs
   input SClk,
   input Reset_n,
   // Data interface
   // --inputs
   input DataInVal,
   input [DATA_W-1:0] DataIn,
   // --outputs
   output DataOutVal,
   output [DATA_W-1:0] DataOut
);

// External functions and tasks

// localparams

// output regs
reg DataOutVal; 
reg DataOut;    

// combinational regs

// Wires

// Wires assignments

// Module functionality
always @(posedge SClk or negedge Reset_n) begin
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
