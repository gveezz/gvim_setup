// Headers include

module $COMPONENT_NAME #(
   
) (
   // System interface
   // -- inputs
   input SClk,
   input Reset_n,
   // Data interface
   // --inputs
   input DataInVal,
   input DataIn,
   // --outputs
   output DataOutVal,
   output DataOut
);

// External functions and tasks

// localparams

// Sequential regs
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
