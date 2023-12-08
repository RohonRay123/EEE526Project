module ROM2_1 #(parameter num_channels=2,parameter rows=12544, parameter cols=32, num_of_files=10, W=32,A=12) (input [A-1:0]file_channel_number, input [A-1:0] AddressRow,input[A-1:0] file_number,
  output logic[W-1:0] Out);
	 
// (usually recommended) expression
//   need $readmemh or $readmemb to initialize all of the elements
// declare 2-dimensional array, W bits wide, 2**A words deep
  logic [W-1:0] buffer[0:num_channels-1][0:(rows-1)][0:(num_of_files-1)];     
  //always #1ns InstOut = inst_rom[InstAddress];
 
  int bin;
  reg [W-1:0] read;
  reg [W-1:0] value;
  int p1;
  string inputs[0:(num_channels-1)][0:(num_of_files-1)];
  always @*
    begin  
      Out = buffer[file_channel_number][AddressRow][file_number];
    end 
  initial begin	
    // load from external text file
    for(int g=0;g<num_channels;g=g+1) begin
    for(int ds=0;ds<num_of_files;ds=ds+1) begin 
      inputs[g][ds]="";
    end 
    end 
    inputs[0][0]="C:/Users/rohon/Downloads/depthwise_input_row_0_iteration_0.txt";
    inputs[0][1]="C:/Users/rohon/Downloads/depthwise_input_row_1_iteration_0.txt";
    inputs[0][2]="C:/Users/rohon/Downloads/depthwise_input_row_2_iteration_0.txt";
    inputs[0][3]="C:/Users/rohon/Downloads/depthwise_input_row_3_iteration_0.txt";
    inputs[1][0]="C:/Users/rohon/Downloads/depthwise_input_row_0_iteration_1.txt";
    inputs[1][1]="C:/Users/rohon/Downloads/depthwise_input_row_1_iteration_1.txt";
    inputs[1][2]="C:/Users/rohon/Downloads/depthwise_input_row_2_iteration_1.txt";
    inputs[1][3]="C:/Users/rohon/Downloads/depthwise_input_row_3_iteration_1.txt";
    //"C:\Users\rohon\Downloads\depthwise_input_row_2_iteration_1.txt"
    for(int k=0;k<num_channels;k=k+1) begin
    for(int i=0;i<rows;i=i+1) begin 
      for(int j=0;j<num_of_files;j=j+1) begin 
        //for(k=0;k<cols;k=k+1) begin 
        buffer[k][i][j]='d0;
        //end 
      end 
    end 
    end 
    for(int k1=0;k1<num_channels;k1=k1+1) begin 
    for(int i1=0;i1<num_of_files;i1=i1+1) begin 
      bin=$fopen(inputs[k1][i1],"r");
      for(int j1=0;j1<rows;j1=j1+1) begin 
        //for(k=0;k<cols;k=k+1) begin 
        p1=$fscanf(bin,"%d\t",buffer[k1][j1][i1]);
          //read=$fread(value,bin);
          //rom[j][k]=read;
        //end 
      end
      $fclose(bin);
    end 
    end 
    
    //$readmemb("machine_code.txt",rom);
  end 

endmodule