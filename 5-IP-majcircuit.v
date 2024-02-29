module majority_circuit(
    input [4:0] input_vector,
    output majority_output
);

assign majority_output = (input_vector[0] & input_vector[1] & input_vector[2]) |
                         (input_vector[0] & input_vector[1] & input_vector[3]) |
                         (input_vector[0] & input_vector[1] & input_vector[4]) |
                         (input_vector[0] & input_vector[2] & input_vector[3]) |
                         (input_vector[0] & input_vector[2] & input_vector[4]) |
                         (input_vector[0] & input_vector[3] & input_vector[4]) |
                         (input_vector[1] & input_vector[2] & input_vector[3]) |
                         (input_vector[1] & input_vector[2] & input_vector[4]) |
                         (input_vector[1] & input_vector[3] & input_vector[4]) |
                         (input_vector[2] & input_vector[3] & input_vector[4]);

endmodule
