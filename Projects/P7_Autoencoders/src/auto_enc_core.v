module auto_enc_core (
  input clk,                      
  input [3:0] input_vec,
  output reg [3:0] output_vec
);

  // Intermediate signals
  reg [7:0] hidden [1:0];    // 2 hidden nodes (8-bit for accumulation)
  reg [7:0] output_temp [3:0];  // Temporary output accumulation

  // Hardcoded weights (simplified integers)
  // Encoder: 4x2 matrix (input -> hidden)
  wire [7:0] w_enc [3:0][1:0];
  assign w_enc[0][0] = 8'd5; assign w_enc[0][1] = 8'd3;
  assign w_enc[1][0] = 8'd3; assign w_enc[1][1] = 8'd2;
  assign w_enc[2][0] = 8'd4; assign w_enc[2][1] = 8'd5;
  assign w_enc[3][0] = 8'd3; assign w_enc[3][1] = 8'd4;

  // Decoder: 2x4 matrix (hidden -> output)
  wire [7:0] w_dec [1:0][3:0];
  assign w_dec[0][0] = 8'd2; assign w_dec[0][1] = 8'd3; assign w_dec[0][2] = 8'd5; assign w_dec[0][3] = 8'd2;
  assign w_dec[1][0] = 8'd3; assign w_dec[1][1] = 8'd3; assign w_dec[1][2] = 8'd6; assign w_dec[1][3] = 8'd0;

  integer i, j;

  // Encoder computation
  always @(posedge clk) begin
    // Reset hidden layer
    hidden[0] = 8'd0;
    hidden[1] = 8'd0;

    // Matrix multiplication: input_vec * w_enc
    for (i = 0; i < 4; i = i + 1) begin
      if (input_vec) begin
        hidden[0] = hidden[0] + w_enc[i][0];
        hidden[1] = hidden[1] + w_enc[i][1];
      end
    end

    // Threshold to binarize hidden layer (e.g., > 2)
    hidden[0] = (hidden[0] > 8'd5) ? 8'd1 : 8'd0;
    hidden[1] = (hidden[1] > 8'd5) ? 8'd1 : 8'd0;
  end

  // Decoder computation
  always @(posedge clk) begin
    // Reset output layer
    for (i = 0; i < 4; i = i + 1) begin
      output_temp[i] = 8'd0;
    end

    // Matrix multiplication: hidden * w_dec
    for (i = 0 ; i < 2; i = i + 1) begin
      if (hidden[i]) begin
        for (j = 0; j < 4; j = j + 1) begin
          output_temp[j] = output_temp[j] + w_dec[i][j];
        end
      end
    end

    // Threshold output to binary (e.g., > 2)
    for (i = 0; i < 4; i = i + 1)
      output_vec[i] = (output_temp[i] > 8'd5) ? 1'b1 : 1'b0;
  end

endmodule