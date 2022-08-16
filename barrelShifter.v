 // Verilog code for barrelShifter to have sll and srl
 module barrelShifter
    (
        input [15:0]data,     
        input [2:0] lr,
        input [2:0] shiftAmt,
        output wire [15:0]f
    );
    
    //signal declarations
     wire [15:0] r0,r1;
     wire [15:0] L0,L1;
     wire [15:0] x0,x1;
     
      //shift right logical - Add 0 in MSB
      
      assign r0 = shiftAmt[0] ? {1'b0 , data[15:1]} : data;     //Stage 0, rotate by 0 or 1
      
      assign r1 = shiftAmt[1] ? {2'b00, r0[15:2]} : r0;          //Stage 1, rotate by 0 or 2
      
      assign x0= shiftAmt[2] ? {4'b0000, r1[15:4]} : r1;          //Stage 2, rotate by 0 or 4       
            
      //shift left logical - Add 0 in LSB
      
       assign L0 = shiftAmt[0] ? {data[14:0], 1'b0} : data;     //Stage 0, rotate by 0 or 1
      
      assign L1 = shiftAmt[1] ? {L0[13:0], 2'b00} : L0;          //Stage 1, rotate by 0 or 2
      
      assign x1 = shiftAmt[2] ? {L1[11:0], 4'b0000} : L1;          //Stage 2, rotate by 0 or 4                
     
     mux_2to1 M0(.a(x0),.b(x1),.s(lr),.f(f));                           //instantiate 2 to 1 MUX            
  
endmodule