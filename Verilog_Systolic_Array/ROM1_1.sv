
module ROM1_1 #(parameter rows=64, parameter cols=64, num_of_files=10, W=32,A=12) (input [A-1:0] file_channel_number,
  input       [A-1:0] AddressRow,input [A-1:0] AddressCol,
  output logic[W-1:0] Out);
	 
// (usually recommended) expression
//   need $readmemh or $readmemb to initialize all of the elements
// declare 2-dimensional array, W bits wide, 2**A words deep
  logic [W-1:0] buffer[0:(num_of_files-1)][0:(rows-1)][0:(cols-1)];     
  //always #1ns InstOut = inst_rom[InstAddress];
  //int i;
  //int j;
  //int k;
  int  bin;
  reg [W-1:0] read;
  reg [W-1:0] value;
  int p1;
  string weights[0:(num_of_files-1)];
 // string weights1;
  always @*
    begin  
     // $display("Reference:%0d , %0d , %0d",file_number,AddressRow,AddressCol);
    //  $display("Reference0: %0d , %0d , %0d and outweight=%d and time: %t",file_number,AddressRow,AddressCol,Out,$time);
      Out = buffer[file_channel_number][AddressRow][AddressCol];
    //  $display("Reference0: %0d , %0d , %0d and outweight=%d and time: %t",file_number,AddressRow,AddressCol,Out,$time);
      //#1;
      //Out = buffer[file_number][AddressRow][AddressCol];
    end 
  initial begin	
    // load from external text file
   // weights1="./pointwise_weight_load_iteration_s.txt";
    //weights[0]=weights1;
    //weights[0][4]=""+1;
             //"C:\Users\rohon\Downloads\depthwise_weight_load_iteration_0.txt"
    weights[0]="C:/Users/rohon/Downloads/depthwise_weight_load_iteration_0.txt";
    weights[1]="C:/Users/rohon/Downloads/depthwise_weight_load_iteration_1.txt";
   $display("this is weights txt:%s",weights[0]);
    for(int i=0;i<num_of_files;i=i+1) begin 
      for(int j=0;j<rows;j=j+1) begin 
        for(int k=0;k<cols;k=k+1) begin 
          buffer[i][j][k]='d0;
          //$display("this is k=%0d and this is buffer[%0d][%0d][%0d]=%0d",k,i,j,k,buffer[i][j][k]);
         // $display("k=%d ",k);
        end 
      end 
    end 
    for(int i1=0;i1<num_of_files;i1=i1+1) begin 
      bin=$fopen(weights[i1],"r");
      for(int j1=0;j1<rows;j1=j1+1) begin 
        for(int k1=0;k1<cols;k1=k1+1) begin 
          
          p1=$fscanf(bin,"%d\t",buffer[i1][j1][k1]);
         // $display("this is k=%0d and this is buffer[%0d][%0d][%0d]=%0d and time:%t",k1,i1,j1,k1,buffer[i1][j1][k1],$time);
          //$display("buffer[%d][%d][%d]=%d, and time : %t",i1,j1,k1,buffer[i1][j1][k1],$time);
          //$display("this is p1: %d",p1);
          //read=$fread(value,bin);
          //rom[j][k]=read;
        end 
      end
      $fclose(bin);
    end 
    
     /*for(int i1=0;i1<num_of_files;i1=i1+1) begin 
      bin=$fopen(weights[i1],"r");
      for(int j1=0;j1<rows;j1=j1+1) begin 
        for(int k1=0;k1<cols;k1=k1+1) begin 
          //p1=$fscanf(bin,"%d\t",buffer[i1][j1][k1]);
          $display("buffer5[%d][%d][%d]=%d, and time : %t",i1,j1,k1,buffer[i1][j1][k1],$time);

          //read=$fread(value,bin);
          //rom[j][k]=read;
        end 
      end
      //$fclose(bin);
    end */
    
    
    //$readmemb("machine_code.txt",rom);
  end 

endmodule