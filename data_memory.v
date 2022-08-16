// Submodule: Data memory in Verilog 
 module data_memory  
 (  
      input                         clk,  
      // address input, shared by read and write port  
      input     [15:0]               mem_access_addr,  
      // write port  
      input     [15:0]               mem_write_data,  
      input                         mem_write_en,  
      input mem_read,  
      // read port  
      output     [15:0]               mem_read_data  
 );  
      //integer i;  
      reg [15:0] ram [0:15];  
      //wire [7 : 0] ram_addr = mem_access_addr[8 : 1];  
      initial begin  
            ram[0] = 16'd0;
			ram[1] = 16'd0;
     		ram[2] = 16'd0;
			ram[3] = 16'd12;
     		ram[4] = 16'd26;
			ram[5] = 16'd0;
     		ram[6] = 16'd0;
			ram[7] = 16'd0;
     		ram[8] = 16'd0;
			ram[9] = 16'd0;			
			ram[10] = 16'd0;
			ram[11] = 16'd0;
        end
			
    always @(posedge clk) begin  
           if (mem_write_en)  
                ram[mem_access_addr] <= mem_write_data;  
      end  
      assign mem_read_data = (mem_read==1'b1) ? ram[mem_access_addr]: 16'd0;   
 endmodule 