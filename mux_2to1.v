// Verilog code for selection of either sll or srl
module mux_2to1
    (
        input wire [15:0]a,b,
        input [2:0] s,
        output reg [15:0]f
    );
    
    always @ (*)
    begin
            case(s)
            
			3'b110: f = b; // sll
			3'b111: f = a; // srl
            
            default: f = a;
            endcase
     end
endmodule