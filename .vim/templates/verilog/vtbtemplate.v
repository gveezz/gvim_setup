`timescale 1ns/1ps
// Headers include

module $COMPONENT_NAME # (
    // Configurable parameters
) (

);

// External functions and tasks
// Miscellaneous parameter task and functions

// Localparams

// Sequerntial logic

// Combinational logic

// Wires

// Wires assignments

// Modules instantiations

// Testbench functionality

initial begin
    $dumpfile ("$COMPONENT_NAME.vcd");
    $dumpvars (0, $COMPONENT_NAME);
    #0 ;

    #1000 $finish();
end

endmodule 

