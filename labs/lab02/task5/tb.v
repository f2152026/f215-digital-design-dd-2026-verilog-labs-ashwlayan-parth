module tb;

    reg [3:0] a;
    reg [3:0] b;
    reg       op;  
    wire [3:0] result;

    alu DUT (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );

    initial begin
        for(integer i=0; i<16;i++)begin
            for(integer j=0; j<16;j++)begin
                for(integer k=0; k<2;k++)begin
                    a=i;
                    b=j;
                    op=k;   
                    #5;  
                 $display("At time: %0t |A= %0d | B= %0d | result = %d operation is: %d", 
                 $time, a, b, result, op);     
                end    
            end
        end
        $finish;
    end
    

endmodule