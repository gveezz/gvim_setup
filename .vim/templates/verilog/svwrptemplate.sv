`ifdef DEF_NET_NONE
    `default_nettype none
`endif 

// Headers include

module $COMPONENT_NAME #(
    // Configurable parameters
    parameter DATA_W = 8
) (
    // System interface
    // -- inputs
    input logic SClkIn,
    input logic AsyncRstIn,
    input logic SyncRstIn,
    // Data interface
    // --inputs
    input logic DataVldIn,
    input logic [DATA_W-1:0] DataIn,
    // --outputs
    output logic DataVldOut,
    output logic [DATA_W-1:0] DataOut
);

// External functions and tasks includes

// Internal parameters (localparams)

// Registered outputs

// Combinational regs

// Internal registers

// Internal wires

// Wires assignments

// Modules instantiations

endmodule 

