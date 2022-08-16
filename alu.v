 // Verilog code for ALU
module alu(       
      input          [15:0]     a,          //src1  
      input          [15:0]     b,          //src2  
      input          [2:0]     alu_control,     //function sel  
      output     reg     [15:0]     result,          //result       
      output zero  
   );  
   
   wire [15:0] data ;
   wire [2:0] lr ;
   wire [2:0] shiftAmt ;
   wire [15:0] f ;
   assign data = a ;
   assign shiftAmt = b[2:0] ;
   assign lr = alu_control ;
   
   barrelShifter barrel (.data(data),.lr(lr) ,.shiftAmt(shiftAmt),.f(f));
   
 always @(*)  
 begin   
      case(alu_control)  
      3'b000: result = a + b; // add  
      3'b001: result = a - b; // sub  
      3'b010: result = a & b; // and  
      3'b011: result = a | b; // or  
      3'b100: begin if (a<b) result = 16'd1;  
                     else result = 16'd0;  
                     end  
	  3'b101: result = a[7:0] * b[7:0];
	  3'b110: result = f;
	  3'b111: result = f;
      default:result = a + b; // add  
      endcase  
 end  
 assign zero = (result==16'd0) ? 1'b1: 1'b0;  
 endmodule