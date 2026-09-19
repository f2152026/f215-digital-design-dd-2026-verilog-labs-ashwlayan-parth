module tb;
    reg [1:0] A;
    reg [1:0] B;
    wire GT;
    wire EQ;
    wire LT;
    
    integer error_count = 0;
comp2 DUT(
    .A(A),
    .B(B),
    .GT(GT),
    .EQ(EQ),
    .LT(LT)
);

initial begin
    for(integer i=0;i<4;i++)begin
        for(integer j=0; j<4;j++)begin
            #5;
            A=i;
            B=j;
             if (GT !== (A > B) || LT !== (A < B) || EQ !== (A == B)) begin
                  $display("ERROR at time %0t | A=%d, B=%d | Expected: (GT=%b LT=%b EQ=%b) | Got: (GT=%b LT=%b EQ=%b)",
                       $time, A, B, (A > B), (A < B), (A == B), GT, LT, EQ);
                   error_count = error_count + 1;
            end            
        end
    end

 if(error_count == 0) begin
      $display("ALL TESTS PASSED");
    end else begin
      $display("TEST FAILED: %0d error(s) detected.", error_count);
    end

    $finish;

end

endmodule
