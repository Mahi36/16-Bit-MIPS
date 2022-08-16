// Verilog code for instruction memory
 module instr_mem          // a synthesisable rom implementation  
 (  
      input     [15:0]     pc,  
      output wire     [15:0]          instruction  
 );  
      wire [3 : 0] rom_addr = pc[4 : 1];   
      reg [15:0] rom[0:15];  
      initial  
      begin  
				$readmemb("test1.hex", rom ); 
      end  
       assign instruction = rom[rom_addr]; 
 endmodule   