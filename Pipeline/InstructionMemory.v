module InstructionMemory(clk,pc,readdata);

input clk;
input  [31:0] pc;
reg [31:0] Imemory [0:1023];
output reg [31:0] readdata;

initial //for testing
	begin
		   Imemory[0] = 32'h01095820; //add $t3 $t0 $t1
         Imemory[1] = 32'hAC0B0000; //sw $t3 0($zero) //Hazard here
         Imemory[2] = 32'h01696022; //sub $t4 $t3 $t1 //Hazard here
         Imemory[3] = 32'h1188FFFE; //beq $t4 $t0 -2  //Hazard here
         Imemory[4] = 32'h01095020; //add $t2 $t0 $t1

	end


always @ (pc)
	
	begin	 
	readdata <= Imemory[pc>>2];
	end			
		
endmodule	
