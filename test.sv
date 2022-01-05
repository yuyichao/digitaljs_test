// Linear feedback shift register
module lfsr(
    output logic [7:0] out,
    input clk,
    input reset
);

  logic linear_feedback;

  wire tmp = out[7] ^ out[3];
  assign linear_feedback = !tmp;

  always_ff @(posedge clk or posedge reset)
    if (reset) begin
      out <= 8'b0 ;
    end else begin
      out <= {out[6],out[5],
              out[4],out[3],
              out[2],out[1],
              out[0], linear_feedback};
    end 

endmodule
