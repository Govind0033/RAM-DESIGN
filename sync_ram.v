//=================================================
// Module: Synchronous RAM
// Description:
//  - Simple RAM with synchronous read & write
//  - Data is read and written on clock's rising edge
//=================================================
module sync_ram #(
    parameter DATA_WIDTH = 8,    // Data width (in bits)
    parameter ADDR_WIDTH = 4     // Address width (in bits) -> 2^ADDR_WIDTH locations
)(
    input clk,                   // Clock
    input we,                    // Write enable (1 = write, 0 = read)
    input [ADDR_WIDTH-1:0] addr, // Address input
    input [DATA_WIDTH-1:0] din,  // Data input (for write)
    output reg [DATA_WIDTH-1:0] dout // Data output (for read)
);

    // RAM storage
    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

    // Synchronous read & write
    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= din;    // Write operation
        end
        dout <= mem[addr];       // Read operation (returns latest value)
    end

endmodule
