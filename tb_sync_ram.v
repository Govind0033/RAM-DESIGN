//=================================================
// Testbench for Synchronous RAM
//=================================================
`timescale 1ns/1ps

module tb_sync_ram;

    reg clk;
    reg we;
    reg [3:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    // Instantiate RAM
    sync_ram uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        $display("Time\tWE\tAddr\tDin\tDout");
        $monitor("%0dns\t%b\t%h\t%h\t%h", $time, we, addr, din, dout);

        // Dumping waveform
        $dumpfile("ram.vcd");
        $dumpvars(0, tb_sync_ram);

        // Init
        clk = 0;
        we  = 0;
        addr = 0;
        din = 0;

        // Write data into RAM
        #10 we = 1; addr = 4'h0; din = 8'hA5;  // Write A5 at address 0
        #10 addr = 4'h1; din = 8'h3C;          // Write 3C at address 1
        #10 addr = 4'h2; din = 8'h7E;          // Write 7E at address 2
        #10 we = 0;                            // Switch to read mode

        // Read data from RAM
        #10 addr = 4'h0;  // Read address 0
        #10 addr = 4'h1;  // Read address 1
        #10 addr = 4'h2;  // Read address 2

        #10 $finish;
    end
endmodule
