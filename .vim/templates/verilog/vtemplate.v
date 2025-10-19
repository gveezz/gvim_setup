`default_nettype none

// Headers include

module $COMPONENT_NAME #(
    // Configurable parameters
    parameter DATA_W = 8
) (
    // System interface
    // -- inputs
    input SClkIn,
    input SyncRstIn,
    // Data interface
    // --inputs
    input DataVldIn,
    input [DATA_W-1:0] DataIn,
    // --outputs
    output reg DataVldOut,
    output reg [DATA_W-1:0] DataOut
);

// External functions and tasks

// localparams

// combinational regs

// internal regs

// Wires

// Wires assignments

// Module functionality
always @(posedge SClkIn) begin
    if (!SyncRstIn) begin
        DataVldOut <= 0;
        DataOut <= 0;
    end else begin
        DataVldOut <= DataVldIn;
        DataOut <= DataOut;
    end
end

endmodule 

