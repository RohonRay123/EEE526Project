`timescale 1ns / 1ns

// sample testbench for a 4X4 Systolic Array

module test_TPU1;

	// Inputs
  	
	reg clk;
	reg control;
  	//reg [((num_of_weights*32)-1):0] wt_arr;
	//parameter rows=64;
    parameter num_of_weights=256;	
     parameter cols=256;
    parameter size=256;
   parameter rows=256;
  parameter num_channels=2;
 parameter filter_size=2;
  parameter activation_size=28;
  parameter num_of_files_input1=activation_size-filter_size+1;
   parameter num_of_files_input=filter_size*filter_size;
  reg [((num_of_weights*32)-1):0] wt_arr;
  	parameter num_of_files_weights=1;
  	//parameter num_of_files_input=2;
  	parameter W=32;
  	parameter A=32;
  	parameter depth=rows;
  	parameter bit_width=32;
  	parameter acc_width=32;
    parameter clk_cycle=250;
  parameter loop_delay=(2*250*rows+1);
  	//parameter size=64;
  parameter rows2=rows+(num_of_files_input1*num_of_files_input1)+100;
  int y;
  logic [A-1:0] cycle_number;
  logic [A-1:0] file_channel_number;
  logic [A-1:0] AddressRow;
  logic [A-1:0] AddressCol;
  // logic [A-1:0] AddressRow;
  // logic [A-1:0] AddressRow;
  logic [A-1:0] file_number_weights;
  logic [A-1:0] file_number_activation;
  string files_weights[0:(num_of_files_weights-1)];
  string files_Activation[0:(num_of_files_input-1)];
  logic [W-1:0] OutWeight;
  logic [W-1:0] OutAct;
  reg [((depth*32)-1):0] data_arr;
  //logic [160:0] weightFiles[0:9];
  //ogic [160:0] ActivationFiles[0:9];
	// Outputs
 // wire [((32*size)-1):0] acc_out;
  wire [((32*size)-1):0] acc_out;
  wire [31:0] y0;
  wire [31:0] y1;
  wire [31:0] y2;
  wire [31:0] y3;
  
 // wire [11:0] AddressRow;
	 assign y0=acc_out[((32*(0+1))-1)-:32];
  assign y1=acc_out[((32*(1+1))-1)-:32];
  assign y2=acc_out[((32*(2+1))-1)-:32];
  assign y3=acc_out[((32*(3+1))-1)-:32];
	//$display ("This is the control signal: %b",control);
	// Instantiate the Unit Under Test (UUT)
  MMU3 #(.depth(depth),.bit_width(bit_width),.acc_width(acc_width),.size(size)) uut(
		.clk(clk), 
		.control(control), 
		.data_arr(data_arr), 
		.wt_arr(wt_arr), 
		.acc_out(acc_out)
	);
  //.num_of_files(num_channels)
  ROM1_1#(.rows(rows),.cols(cols),.num_of_files(num_channels),.W(W),.A(A)) uut_rom(.file_channel_number(file_channel_number),.AddressRow(AddressRow),.AddressCol(AddressCol),.Out(OutWeight));
  ROM2_1 #(.num_channels(num_channels),.rows(rows2),.cols(cols),.num_of_files(num_of_files_input),.W(W),.A(A)) uut_rom2(.file_channel_number(file_channel_number),.AddressRow(AddressRow),.file_number(file_number_activation),.Out(OutAct));
  
 // initial begin
     //  $monitor("This is y4:%d, y3=%d, y2=%d,y1=%d,control:%b ,cycle_number:%d, time:%t",y4,y3,y2,y1,control,$time);
       
       
    // end
	initial begin
		// Initialize Inputs
		clk = 0;
		control = 0;
		data_arr = 0;
		wt_arr = 'd0;
      	file_number_weights='d0;
        file_number_activation='d0;
      files_weights[0]="./pointwise_weight_load_iteration_0.txt";
      files_Activation[0]="./pointwise_input_row_0.txt";
      files_Activation[1]="./pointwise_input_row_1.txt";
    //files_Activation={"pointwise_input_row_0.txt","pointwise_input_row_1.txt"};
      //AddressCol='d31;
    //  files[0]="pointwise_weight_load_iteration_0.txt";
     // for(AddressRow=0;AddressRow<num_of_weights;AddressRow=AddressRow+1) begin 
      //  wt_arr[(((AddressRow+1)*32)-1)-:32]=Out;
        
     // end 
		// Wait 100 ns for global reset to finish
		#100;
       end
		// Add stimulus here
		always
          #(clk_cycle) clk=!clk;
		//initial begin 
           //for(y=0;y<64;y=y+1) begin 
        //  $monitor("This is y0=%0d and the time is: %t",y0,$time);
  		  // end
      //   $monitor("Acc_out[%d]=%0d and the time is: %t",0,acc_out[((32*(0+1))-1)-:32],$time);
      //  end 
  
  initial begin
       $monitor("This is y0:%d, y1=%d, y2=%d,y3=%d,control:%b ,cycle_number:%d, time:%t",y0,y1,y2,y3,control,cycle_number,$time);
      
     end
		initial begin
		@(posedge clk);
		control=1;
          wt_arr='d0;
          $display("Starting weight loading");
          file_number_weights='d0;
          cycle_number=0;
   for(file_channel_number=0;file_channel_number<num_channels;file_channel_number=file_channel_number+1) begin 
          
     for(AddressCol=(num_of_weights-1);AddressCol>'d0;AddressCol=AddressCol-1) begin 
        //    $display("AdreessCol:%0d",AddressCol);
            for(AddressRow=0;AddressRow<num_of_weights;AddressRow=AddressRow+1) begin 
             // #2;
            //  wt_arr[(((AddressRow+1)*32)-1)-:32]=OutWeight;
              #2;
              wt_arr[(((AddressRow+1)*32)-1)-:32]=OutWeight;
             //$display("Reference1: %0d , %0d , %0d and outweight=%d and time: %t",file_number_weights,AddressRow,AddressCol,OutWeight,$time);
              wt_arr[(((AddressRow+1)*32)-1)-:32]=OutWeight;
              $display("Reference1: %0d , %0d , %0d and outweight=%0d and time: %t",file_channel_number,AddressRow,AddressCol, OutWeight,$time);
            //#2;
          //    $display("This is outweigh value: %0d",OutWeight);
             //   $display("data_arr: %d and the time:%t",uut.wt_arr, $time);
       		end 
            @(posedge clk);   
       //     $display("weight_arr: %0d and the time:%t",uut.wt_arr, $time);
          end 
       //   $display("Reference1: %0d , %0d , %0d and outweight=%d and time: %t",0,0,0,wt_arr[31:0],$time);
          AddressCol='d0;
          for(AddressRow=0;AddressRow<num_of_weights;AddressRow=AddressRow+1) begin 
            #2;
            wt_arr[(((AddressRow+1)*32)-1)-:32]=OutWeight;
         //   $display("This is outweigh value: %0d",OutWeight);
          //  wt_arr[(((AddressRow+1)*32)-1)-:32]=OutWeight;
              $display("Reference1: %0d , %0d , %0d and outweight=%d and time: %t",file_number_weights,AddressRow,AddressCol,OutWeight,$time);
           // #2;
          end 
           @(posedge clk); 
           /// $display("weight_arr: %0d and the time:%t",uut.wt_arr, $time);  
          $display("Finish weight loading");
       control=0;	
          
		@(posedge clk);
          $display("Starting input activation loading");
          for(AddressRow='d0;AddressRow<rows2;AddressRow=AddressRow+1) begin
            for( file_number_activation=0; file_number_activation<num_of_files_input; file_number_activation= file_number_activation+1) begin 
              #3;
              data_arr[((( file_number_activation+1)*32)-1)-:32]=OutAct;
            //  $display("Reference6: file_number:%0d , AddressRow:%0d , and outACT=%d and time: %t", file_number_activation,AddressRow,OutAct,$time);
              //$display("data_arr[][]: %d and the time:%t",uut.data_arr, $time);
            end
            cycle_number=cycle_number+1;
            control=0;
            @(posedge clk);
        //      $display("data_arr[][]: %0d and the time:%t",uut.data_arr, $time); 
       end
          
          
     $display("Finished Activation Loading");
   //  #(loop_delay);
        
   end 
       #5000;   
          $display("We are done");
         $finish;
     end
endmodule