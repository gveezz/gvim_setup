`ifdef DEF_NET_NONE
    `default_nettype none
`endif 

// Headers include

module $COMPONENT_NAME #(
    // Configurable parameters
    parameter DATA_W = 8
) /* i_$COMPONENT_NAME */ (
    // System interface
    // -- inputs
    input wire SClkIn,
    input wire AsyncRstIn,
    input wire SyncRstIn,
    // Data interface
    // -- inputs
    input wire DataVldIn,
    input wire [DATA_W-1:0] DataIn,
    // -- outputs
    output reg DataVldOut,
    output reg [DATA_W-1:0] DataOut
);

// External functions and tasks includes

// Localparams

// Sequerntial logic

// Combinational logic

// Wires

// Wires assignments

// Modules instantiations

// Module functionality
always @(posedge SClkIn or negedge AsyncRstIn) begin
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

