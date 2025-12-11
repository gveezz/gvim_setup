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
    input wire SClkIn,
    input wire AsyncRstIn,
    input wire SyncRstIn,
    // Data interface
    // --inputs
    input wire DataVldIn,
    input wire [DATA_W-1:0] DataIn,
    // --outputs
    output wire DataVldOut,
    output wire [DATA_W-1:0] DataOut
);

// External functions and tasks includes

// Localparams

// Registered outputs

// Combinational regs

// Internal registers

// Internal wires

// Wires assignments

// Modules instantiations

endmodule 


