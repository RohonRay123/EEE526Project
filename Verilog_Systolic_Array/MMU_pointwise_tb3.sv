`timescale 1ns / 1ns

// sample testbench for a 4X4 Systolic Array

module test_TPU;

	// Inputs
  	
	reg clk;
	reg control;
  	//reg [((num_of_weights*32)-1):0] wt_arr;
	//parameter rows=64;
    parameter num_of_weights=256;	
     parameter cols=256;
    parameter size=256;
   parameter rows=256;
parameter depth=256;
parameter num_of_files_input=256;
  reg [((num_of_weights*32)-1):0] wt_arr;
  	parameter num_of_files_weights=1;
  	
  	parameter W=32;
  	parameter A=32;
  	
  	parameter bit_width=32;
  	parameter acc_width=32;
  	//parameter size=64;
  	parameter rows2=13000;
  //int y;
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
  logic [160:0] cycle_number;
  //logic [160:0] weightFiles[0:9];
  //ogic [160:0] ActivationFiles[0:9];
	// Outputs
 // wire [((32*size)-1):0] acc_out;
  wire [((32*size)-1):0] acc_out;
  wire [31:0] y0;
  wire [31:0] y1;
  wire [31:0] y2;
  wire [31:0] y3;
  wire [31:0] y[0:(size-1)];
 // wire [11:0] AddressRow;
	 assign y0=acc_out[((32*(0+1))-1)-:32];
  assign y1=acc_out[((32*(1+1))-1)-:32];
  assign y2=acc_out[((32*(2+1))-1)-:32];
  assign y3=acc_out[((32*(3+1))-1)-:32];
genvar k5;
 for(k5=0;k5<size;k5=k5+1) begin 
   assign y[k5]=acc_out[((32*(k5+1))-1)-:32];
  // always@* begin 
   //$display("this is y[%0d]=%0d at time: %t", k5,acc_out[((32*(k5+1))-1)-:32],$time);
   //end 
end 
	//$display ("This is the control signal: %b",control);
	// Instantiate the Unit Under Test (UUT)
  MMU3 #(.depth(depth),.bit_width(bit_width),.acc_width(acc_width),.size(size)) uut(
		.clk(clk), 
		.control(control), 
		.data_arr(data_arr), 
		.wt_arr(wt_arr), 
		.acc_out(acc_out)
	);
  
  ROM1 #(.rows(rows),.cols(cols),.num_of_files(num_of_files_weights),.W(W),.A(A)) uut_rom(.AddressRow(AddressRow),.AddressCol(AddressCol),.file_number( file_number_weights),.files(files_weights),.Out(OutWeight));
  ROM2 #(.rows(rows2),.cols(cols),.num_of_files(num_of_files_input),.W(W),.A(A)) uut_rom2(.AddressRow(AddressRow),.file_number(file_number_activation),.files( files_Activation),.Out(OutAct));
  
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
		#250 clk=!clk;
	//	initial begin 
           //for(y=0;y<64;y=y+1) begin 
         //$monitor("Acc_out[%d]=%0d and the time is: %t",y,acc_out[((32*(y+1))-1)-:32],$time);
  		  // end
      //    $monitor("Acc_out[%d]=%0d and the time is: %t",0,acc_out[((32*(0+1))-1)-:32],$time);
    //    end 
  
  initial begin
$monitor("This is the cycle_number:%0d, y0:%0d, y1=%0d, y2=%0d,y3=%0d,y4:%0d, y5=%0d, y6=%0d,y7=%0d,y08:%d, y09=%d, y10=%0d,y11=%0d,y12:%0d, y13=%0d, y14=%0d,y15=%0d,y16:%0d, y17=%0d, y18=%0d,y19=%0d,y20:%0d, y21=%0d, y22=%d,y23=%0d,y24:%0d, y25=%0d, y26=%0d,y27=%0d,y28:%0d, y29=%0d, y30=%0d,y31=%0d,y32:%0d, y33=%0d, y34=%0d,y35=%0d,y36:%0d, y37=%0d, y38=%0d,y39=%0d,y40:%0d, y41=%0d, y42=%0d,y43=%0d,y44:%0d, y45=%0d, y46=%d,y47=%0d,y48:%0d, y49=%0d, y50=%0d,y51=%0d,y52:%0d, y53=%0d, y54=%0d,y55=%0d,y56:%0d, y57=%0d, y58=%0d,y59=%0d,y60:%d, y61=%0d, y62=%0d,y63=%0d ",
cycle_number,y[0],y[1],y[2],y[3],y[4],y[5],y[6],y[7],y[8],y[9],y[10],y[11],y[12],y[13],y[14],y[15],y[16],y[17],y[18],y[19],y[20],y[21],y[22],y[23],y[24],y[25],y[26],y[27],
y[28],y[29],y[30],y[31],y[32],y[33],y[34],y[35],y[36],y[37],y[38],y[39],y[40],y[41],y[42],y[43],y[44],y[45],y[46],y[47],y[48],y[49],y[50],y[51],y[52],
y[53],y[54],y[55],y[56],y[57],y[58],y[59],y[60],y[61],y[62],y[63]);
//$monitor("This is y4:%d, y5=%d, y6=%d,y7=%d,time:%t",y[4],y[5],y[6],y[7],$time);
//$monitor("This is y8:%d, y9=%d, y10=%d,y11=%d,time:%t",y[8],y[9],y[10],y[11],$time);
//$monitor("This is y12:%d, y13=%d, y14=%d,y15=%d,time:%t",y[12],y[13],y[14],y[15],$time);
//$monitor("This is y16:%d, y17=%d, y18=%d,y19=%d,time:%t",y[16],y[17],y[18],y[19],$time);
//$monitor("This is y20:%d, y21=%d, y22=%d,y23=%d,time:%t",y[20],y[21],y[22],y[23],$time);
//$monitor("This is y24:%d, y25=%d, y26=%d,y27=%d,time:%t",y[24],y[25],y[26],y[27],$time);
//$monitor("This is y28:%d, y29=%d, y30=%d,y31=%d,time:%t",y[28],y[29],y[30],y[31],$time);
//$monitor("This is y32:%d, y33=%d, y34=%d,y35=%d,time:%t",y[31],y[33],y[34],y[35],$time);
//$monitor("This is y36:%d, y37=%d, y38=%d,y39=%d,time:%t",y[36],y[37],y[38],y[39],$time);
//$monitor("This is y40:%d, y41=%d, y42=%d,y43=%d,time:%t",y[40],y[41],y[42],y[43],$time);
//$monitor("This is y44:%d, y45=%d, y46=%d,y43=%d,time:%t",y[44],y[45],y[46],y[47],$time);
//$monitor("This is y48:%d, y49=%d, y50=%d,y51=%d,time:%t",y[48],y[49],y[50],y[51],$time);
//$monitor("This is y52:%d, y53=%d, y54=%d,y55=%d,time:%t",y[52],y[53],y[54],y[55],$time);
//$monitor("This is y56:%d, y57=%d, y58=%d,y59=%d,time:%t",y[56],y[57],y[58],y[59],$time);
//$monitor("This is y60:%d, y61=%d, y62=%d,y63=%d,time:%t",y[60],y[61],y[62],y[63],$time);
      
     end
		initial begin
		cycle_number=0;
		@(posedge clk);
		control=1;
          wt_arr='d0;
          $display("Starting weight loading");
          file_number_weights='d0;
          for(AddressCol=(num_of_weights-1);AddressCol>'d0;AddressCol=AddressCol-1) begin 
        //    $display("AdreessCol:%0d",AddressCol);
            for(AddressRow=0;AddressRow<num_of_weights;AddressRow=AddressRow+1) begin 
             // #2;
            //  wt_arr[(((AddressRow+1)*32)-1)-:32]=OutWeight;
              #2;
              wt_arr[(((AddressRow+1)*32)-1)-:32]=OutWeight;
             //$display("Reference1: %0d , %0d , %0d and outweight=%d and time: %t",file_number_weights,AddressRow,AddressCol,OutWeight,$time);
              wt_arr[(((AddressRow+1)*32)-1)-:32]=OutWeight;
              $display("Reference1: %0d , %0d , %0d and outweight=%0d and time: %t",file_number_weights,AddressRow,AddressCol, OutWeight,$time);
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
     //         $display("Reference1: %0d , %0d , %0d and outweight=%d and time: %t",file_number_weights,AddressRow,AddressCol,OutWeight,$time);
           // #2;
          end 
           @(posedge clk); 
           /// $display("weight_arr: %0d and the time:%t",uut.wt_arr, $time);  
          $display("Finish weight loading and time it took was :%t",$time);
       control=0;	
          
		@(posedge clk);
          $display("Starting input activation loading");
          for(AddressRow='d0;AddressRow<rows2;AddressRow=AddressRow+1) begin
            for( file_number_activation=0; file_number_activation<num_of_files_input; file_number_activation= file_number_activation+1) begin 
              #3;
              data_arr[((( file_number_activation+1)*32)-1)-:32]=OutAct;
            
            end
        //  $display("This is the AddressRow:%0d at time:%t", AddressRow,$time);
            control=0;
	    cycle_number=cycle_number+1;
            @(posedge clk);
        //      $display("data_arr[][]: %0d and the time:%t",uut.data_arr, $time); 
       end
          $display("Starting finish activation loading");
       #500000;   
         $finish;
     end
endmodule