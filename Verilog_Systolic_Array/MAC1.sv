`timescale 1ns / 1ns

module MAC1 #(parameter bit_width=32, acc_width=32)(
     clk,
	 control,
	 acc_in,		//a
	 acc_out,	//a+b*c
	 data_in,	//b
	 wt_path_in,		//c
	 data_out,	
	 wt_path_out		
	 );
	 

	 
	input clk;
	input control; // control signal used to indidate if it is weight loading or not
	
	input [acc_width-1:0] acc_in; // accumulation in
	input [bit_width-1:0] data_in;  // data input or activation in
	input [bit_width-1:0] wt_path_in;   // weight data in
	output reg [acc_width-1:0] acc_out;  // accumulation out
	output reg [bit_width-1:0] data_out;    // activation out
	output  reg [bit_width-1:0] wt_path_out;		// weight data out
        //wire [acc_width-1:0] acc_out1;  // accumulation out
	wire [bit_width-1:0] data_out1;    // activation out
	wire [bit_width-1:0] wt_path_out1; 
	assign data_out1=data_out;
	assign wt_path_out1=wt_path_out;
  
  //	always begin 
    //  $display("This is weight: %d ",wt_path_in);
      
     // end 
	always @(posedge clk)
	begin 
		if(control==1'b1)
		begin
			data_out<= 32'b0;
			acc_out<= 32'b0;
			wt_path_out<=wt_path_in;
		end 
		else begin 
			//acc_out<=acc_in;
			data_out<=data_in;
          acc_out<=(data_in*wt_path_out)+(acc_in);
          //acc_out<=(data_in*wt_path_in)+(acc_in);
			//data_out<=data_in;
			//acc_out<=(datainfo_out*weight_out)+accumulation_out;
		end	
	end 


endmodule