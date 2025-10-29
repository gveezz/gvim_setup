`default_nettype none

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

// Module functionality
always_comb begin

end

always_ff @(posedge SClkIn or negedge AsyncRstIn) begin
    if (!AsyncRstIn) begin
        DataVldOut <= 0;
        DataOut <= 0;
    end else begin
        DataVldOut <= DataVldIn;
        DataOut <= DataOut;

        if (!SyncRstIn) begin
            DataVldOut <= 0;
            DataOut <= 0;
        end    
    end
end

endmodule 

