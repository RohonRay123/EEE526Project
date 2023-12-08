`timescale 1ns / 1ns
`include "MAC1.sv"

// Systolic Array top level module. 

module MMU3#(parameter depth=32, bit_width=32, acc_width=32, size=32)
(
	clk,
	control,
	data_arr,
	wt_arr,
	acc_out
    );
    reg [31:0] cycle_number;
	input clk;
	input control; 
	input [(bit_width*depth)-1:0] data_arr;
  input [(bit_width*size)-1:0] wt_arr;
	output reg [acc_width*size-1:0] acc_out;
  wire [(acc_width-1):0] sys_vert[0:depth][0:(size)];
  wire [(bit_width-1):0] sys_hor[0:depth][0:(size)];
  wire [(bit_width-1):0] sys_weight[0:depth][0:(size)];
  genvar i;
  genvar z;
	for(i=0;i<depth;i=i+1) begin
	   // assign sys_vert[0][i]=32'b0;
        assign sys_hor[i][0]=data_arr[(((i+1)*bit_width)-1) -: bit_width];
      //  assign sys_weight[0][i]=wt_arr[(((i+1)*bit_width)-1) -: bit_width];
	end
  for(z=0;z<size;z=z+1) begin
    	assign sys_vert[0][z]=32'b0;
        //assign sys_hor[i][0]=data_arr[(((i+1)*bit_width)-1) -: bit_width];
    assign sys_weight[0][z]=wt_arr[(((z+1)*bit_width)-1) -: bit_width];
	end

	genvar row;
	genvar col;
	generate
      for (row=0;row<=(depth-1);row=row+1) begin : row1
        for(col=0;col<=(size-1);col=col+1) begin : col1
          MAC1 MAC_instance(.clk(clk),.control(control),
            .acc_in(sys_vert[row][col]),.acc_out(sys_vert[row+1][col]),
            .data_in(sys_hor[row][col]),.wt_path_in(sys_weight[row][col]),.data_out(sys_hor[row][col+1]),
            .wt_path_out(sys_weight[row+1][col]));
	    end
	end
	endgenerate
    int looping;
	// Implement your logic below based on the MAC unit design in MAC.v
	always @(posedge clk) begin 
		if(control) begin 
		  acc_out<=1024'b0;
          //cycle_number<=32'b0;
		end 
		else begin
          for(looping=0;looping<size;looping=looping+1) begin
            acc_out[(((looping+1)*acc_width)-1)-:acc_width]<=sys_vert[depth][looping];
		  end
		end 
	end 
	endmodule 
	
//endmodule