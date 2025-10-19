`default_nettype none

// Headers include

module $COMPONENT_NAME #(
    // Configurable parameters
    parameter DATA_W = 8
) (
    // System interface
    // -- inputs
    input logic SClkIn,
    input logic SyncRstIn,
    // Data interface
    // --inputs
    input logic DataVldIn,
    input logic [DATA_W-1:0] DataIn,
    // --outputs
    output logic DataVldOut,
    output logic [DATA_W-1:0] DataOut
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

always_ff @(posedge SClkIn) begin
    if (!SyncRstIn) begin
        DataVldOut <= 0;
        DataOut <= 0;
    end else begin
        DataVldOut <= DataVldIn;
        DataOut <= DataIn;
    end
end

endmodule 

