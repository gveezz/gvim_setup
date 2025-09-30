`default_nettype none

// Headers include

module $COMPONENT_NAME #(
    // Configurable parameters
    parameter DATA_W = 8
) (
    // System interface
    // -- inputs
    input SClk,
    input SyncRst,
    // Data interface
    // --inputs
    input DataInVal,
    input [DATA_W-1:0] DataIn,
    // --outputs
    output reg DataOutVal,
    output reg [DATA_W-1:0] DataOut
);

// External functions and tasks

// localparams

// combinational regs

// internal regs

// Wires

// Wires assignments

// Module functionality
always @(posedge SClk) begin
    if (!SyncRst) begin
        DataOutVal <= 0;
        DataOut    <= 0;
    end else begin
        DataOutVal <= DataInVal;
        DataOut    <= DataOut;
    end
end

endmodule 

