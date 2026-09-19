// tb.v
// Starter testbench template -- YOU complete this file.

module tb;

  // TODO: declare the inputs and outputs
  localparam WIDTH = 8;
  localparam DEPTH = 4;

    reg  [$clog2(DEPTH)-1:0] sel;
    wire [WIDTH-1:0]         dout;
  // TODO: instantiate DUT here

  lut # (.WIDTH(8), .DEPTH(4)) DUT(
    .sel (sel),
    .dout (dout)
  );

  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
    // TODO: apply different input combinations
    integer i;
    sel =0;
    #5;
       for(i=0;i<DEPTH; i++)begin
        sel=i;
        #5;
       end 
    $finish;   
  end

  initial
    $monitor($time, " sel=%0d (bin:%b) | dout = %d (hex: 0x%0h)", sel, sel, dout, dout); // change as required

endmodule
