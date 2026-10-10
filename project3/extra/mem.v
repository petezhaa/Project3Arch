/**
* This is the main memory that will hold the instructions and data for the processor.
* It is a simple memory module that can be read from and written to.
* The memory is initialized with the contents of a file specified by the user.
* The memory is organized as an array of 32-bit words, and can be accessed using a 32-bit address.
* The memory supports both read and write operations, and can be accessed using a simple interface.
*/

module memory (
    input wire clk, rst
    input wire [31:0] addr,
    input wire [31:0] wdata,
    input wire write_en,
    output reg [31:0] rdata
);
    // Memory array
    reg [31:0] mem_array [0:1023]; // 1024 words of 32 bits each

    // Read operation
    always @(*) begin
        rdata = mem_array[addr[11:2]]; // Use bits [11:2] of the address to index the memory one of the 1024 entires
    end

    // Write operation
    always @(posedge clk) begin
        if (write_en) begin
            mem_array[addr[11:2]] <= wdata; //  Use bits [11:2] of the address to index the memory one of the 1024 entires
        end
    // Initialize memory from file
    initial begin
        $readmemh("memory_init.hex", mem_array); // Load memory contents from a hex file
    end

endmodule