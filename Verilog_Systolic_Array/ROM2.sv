module ROM2 #(parameter rows=12544, parameter cols=32, num_of_files=2, W=32,A=12) (input [A-1:0] AddressRow,input[A-1:0] file_number,input string files[0:(num_of_files-1)],
  output logic[W-1:0] Out);
	 
// (usually recommended) expression
//   need $readmemh or $readmemb to initialize all of the elements
// declare 2-dimensional array, W bits wide, 2**A words deep
  logic [W-1:0] buffer[0:(rows-1)][0:(num_of_files-1)];     
  //always #1ns InstOut = inst_rom[InstAddress];
 
  int bin;
  reg [W-1:0] read;
  reg [W-1:0] value;
  int p1;
  string inputs[0:(num_of_files-1)];
  always @*
    begin  
      Out = buffer[AddressRow][file_number];
    end 
  initial begin	
    // load from external text file
    for(int ds=0;ds<num_of_files;ds=ds+1) begin 
      inputs[ds]="";
    end 
   
inputs[0] = "C:/Users/rohon/Downloads/pointwise_input_row_0.txt";
inputs[1] = "C:/Users/rohon/Downloads/pointwise_input_row_1.txt";
inputs[2] = "C:/Users/rohon/Downloads/pointwise_input_row_2.txt";
inputs[3] = "C:/Users/rohon/Downloads/pointwise_input_row_3.txt";
inputs[4] = "C:/Users/rohon/Downloads/pointwise_input_row_4.txt";
inputs[5] = "C:/Users/rohon/Downloads/pointwise_input_row_5.txt";
inputs[6] = "C:/Users/rohon/Downloads/pointwise_input_row_6.txt";
inputs[7] = "C:/Users/rohon/Downloads/pointwise_input_row_7.txt";
inputs[8] = "C:/Users/rohon/Downloads/pointwise_input_row_8.txt";
inputs[9] = "C:/Users/rohon/Downloads/pointwise_input_row_9.txt";
inputs[10] = "C:/Users/rohon/Downloads/pointwise_input_row_10.txt";
inputs[11] = "C:/Users/rohon/Downloads/pointwise_input_row_11.txt";
inputs[12] = "C:/Users/rohon/Downloads/pointwise_input_row_12.txt";
inputs[13] = "C:/Users/rohon/Downloads/pointwise_input_row_13.txt";
inputs[14] = "C:/Users/rohon/Downloads/pointwise_input_row_14.txt";
inputs[15] = "C:/Users/rohon/Downloads/pointwise_input_row_15.txt";
inputs[16] = "C:/Users/rohon/Downloads/pointwise_input_row_16.txt";
inputs[17] = "C:/Users/rohon/Downloads/pointwise_input_row_17.txt";
inputs[18] = "C:/Users/rohon/Downloads/pointwise_input_row_18.txt";
inputs[19] = "C:/Users/rohon/Downloads/pointwise_input_row_19.txt";
inputs[20] = "C:/Users/rohon/Downloads/pointwise_input_row_20.txt";
inputs[21] = "C:/Users/rohon/Downloads/pointwise_input_row_21.txt";
inputs[22] = "C:/Users/rohon/Downloads/pointwise_input_row_22.txt";
inputs[23] = "C:/Users/rohon/Downloads/pointwise_input_row_23.txt";
inputs[24] = "C:/Users/rohon/Downloads/pointwise_input_row_24.txt";
inputs[25] = "C:/Users/rohon/Downloads/pointwise_input_row_25.txt";
inputs[26] = "C:/Users/rohon/Downloads/pointwise_input_row_26.txt";
inputs[27] = "C:/Users/rohon/Downloads/pointwise_input_row_27.txt";
inputs[28] = "C:/Users/rohon/Downloads/pointwise_input_row_28.txt";
inputs[29] = "C:/Users/rohon/Downloads/pointwise_input_row_29.txt";
inputs[30] = "C:/Users/rohon/Downloads/pointwise_input_row_30.txt";
inputs[31] = "C:/Users/rohon/Downloads/pointwise_input_row_31.txt";
inputs[32] = "C:/Users/rohon/Downloads/pointwise_input_row_32.txt";
inputs[33] = "C:/Users/rohon/Downloads/pointwise_input_row_33.txt";
inputs[34] = "C:/Users/rohon/Downloads/pointwise_input_row_34.txt";
inputs[35] = "C:/Users/rohon/Downloads/pointwise_input_row_35.txt";
inputs[36] = "C:/Users/rohon/Downloads/pointwise_input_row_36.txt";
inputs[37] = "C:/Users/rohon/Downloads/pointwise_input_row_37.txt";
inputs[38] = "C:/Users/rohon/Downloads/pointwise_input_row_38.txt";
inputs[39] = "C:/Users/rohon/Downloads/pointwise_input_row_39.txt";
inputs[40] = "C:/Users/rohon/Downloads/pointwise_input_row_40.txt";
inputs[41] = "C:/Users/rohon/Downloads/pointwise_input_row_41.txt";
inputs[42] = "C:/Users/rohon/Downloads/pointwise_input_row_42.txt";
inputs[43] = "C:/Users/rohon/Downloads/pointwise_input_row_43.txt";
inputs[44] = "C:/Users/rohon/Downloads/pointwise_input_row_44.txt";
inputs[45] = "C:/Users/rohon/Downloads/pointwise_input_row_45.txt";
inputs[46] = "C:/Users/rohon/Downloads/pointwise_input_row_46.txt";
inputs[47] = "C:/Users/rohon/Downloads/pointwise_input_row_47.txt";
inputs[48] = "C:/Users/rohon/Downloads/pointwise_input_row_48.txt";
inputs[49] = "C:/Users/rohon/Downloads/pointwise_input_row_49.txt";
inputs[50] = "C:/Users/rohon/Downloads/pointwise_input_row_50.txt";
inputs[51] = "C:/Users/rohon/Downloads/pointwise_input_row_51.txt";
inputs[52] = "C:/Users/rohon/Downloads/pointwise_input_row_52.txt";
inputs[53] = "C:/Users/rohon/Downloads/pointwise_input_row_53.txt";
inputs[54] = "C:/Users/rohon/Downloads/pointwise_input_row_54.txt";
inputs[55] = "C:/Users/rohon/Downloads/pointwise_input_row_55.txt";
inputs[56] = "C:/Users/rohon/Downloads/pointwise_input_row_56.txt";
inputs[57] = "C:/Users/rohon/Downloads/pointwise_input_row_57.txt";
inputs[58] = "C:/Users/rohon/Downloads/pointwise_input_row_58.txt";
inputs[59] = "C:/Users/rohon/Downloads/pointwise_input_row_59.txt";
inputs[60] = "C:/Users/rohon/Downloads/pointwise_input_row_60.txt";
inputs[61] = "C:/Users/rohon/Downloads/pointwise_input_row_61.txt";
inputs[62] = "C:/Users/rohon/Downloads/pointwise_input_row_62.txt";
inputs[63] = "C:/Users/rohon/Downloads/pointwise_input_row_63.txt";
inputs[64] = "C:/Users/rohon/Downloads/pointwise_input_row_64.txt";
inputs[65] = "C:/Users/rohon/Downloads/pointwise_input_row_65.txt";
inputs[66] = "C:/Users/rohon/Downloads/pointwise_input_row_66.txt";
inputs[67] = "C:/Users/rohon/Downloads/pointwise_input_row_67.txt";
inputs[68] = "C:/Users/rohon/Downloads/pointwise_input_row_68.txt";
inputs[69] = "C:/Users/rohon/Downloads/pointwise_input_row_69.txt";
inputs[70] = "C:/Users/rohon/Downloads/pointwise_input_row_70.txt";
inputs[71] = "C:/Users/rohon/Downloads/pointwise_input_row_71.txt";
inputs[72] = "C:/Users/rohon/Downloads/pointwise_input_row_72.txt";
inputs[73] = "C:/Users/rohon/Downloads/pointwise_input_row_73.txt";
inputs[74] = "C:/Users/rohon/Downloads/pointwise_input_row_74.txt";
inputs[75] = "C:/Users/rohon/Downloads/pointwise_input_row_75.txt";
inputs[76] = "C:/Users/rohon/Downloads/pointwise_input_row_76.txt";
inputs[77] = "C:/Users/rohon/Downloads/pointwise_input_row_77.txt";
inputs[78] = "C:/Users/rohon/Downloads/pointwise_input_row_78.txt";
inputs[79] = "C:/Users/rohon/Downloads/pointwise_input_row_79.txt";
inputs[80] = "C:/Users/rohon/Downloads/pointwise_input_row_80.txt";
inputs[81] = "C:/Users/rohon/Downloads/pointwise_input_row_81.txt";
inputs[82] = "C:/Users/rohon/Downloads/pointwise_input_row_82.txt";
inputs[83] = "C:/Users/rohon/Downloads/pointwise_input_row_83.txt";
inputs[84] = "C:/Users/rohon/Downloads/pointwise_input_row_84.txt";
inputs[85] = "C:/Users/rohon/Downloads/pointwise_input_row_85.txt";
inputs[86] = "C:/Users/rohon/Downloads/pointwise_input_row_86.txt";
inputs[87] = "C:/Users/rohon/Downloads/pointwise_input_row_87.txt";
inputs[88] = "C:/Users/rohon/Downloads/pointwise_input_row_88.txt";
inputs[89] = "C:/Users/rohon/Downloads/pointwise_input_row_89.txt";
inputs[90] = "C:/Users/rohon/Downloads/pointwise_input_row_90.txt";
inputs[91] = "C:/Users/rohon/Downloads/pointwise_input_row_91.txt";
inputs[92] = "C:/Users/rohon/Downloads/pointwise_input_row_92.txt";
inputs[93] = "C:/Users/rohon/Downloads/pointwise_input_row_93.txt";
inputs[94] = "C:/Users/rohon/Downloads/pointwise_input_row_94.txt";
inputs[95] = "C:/Users/rohon/Downloads/pointwise_input_row_95.txt";
inputs[96] = "C:/Users/rohon/Downloads/pointwise_input_row_96.txt";
inputs[97] = "C:/Users/rohon/Downloads/pointwise_input_row_97.txt";
inputs[98] = "C:/Users/rohon/Downloads/pointwise_input_row_98.txt";
inputs[99] = "C:/Users/rohon/Downloads/pointwise_input_row_99.txt";
inputs[100] = "C:/Users/rohon/Downloads/pointwise_input_row_100.txt";
inputs[101] = "C:/Users/rohon/Downloads/pointwise_input_row_101.txt";
inputs[102] = "C:/Users/rohon/Downloads/pointwise_input_row_102.txt";
inputs[103] = "C:/Users/rohon/Downloads/pointwise_input_row_103.txt";
inputs[104] = "C:/Users/rohon/Downloads/pointwise_input_row_104.txt";
inputs[105] = "C:/Users/rohon/Downloads/pointwise_input_row_105.txt";
inputs[106] = "C:/Users/rohon/Downloads/pointwise_input_row_106.txt";
inputs[107] = "C:/Users/rohon/Downloads/pointwise_input_row_107.txt";
inputs[108] = "C:/Users/rohon/Downloads/pointwise_input_row_108.txt";
inputs[109] = "C:/Users/rohon/Downloads/pointwise_input_row_109.txt";
inputs[110] = "C:/Users/rohon/Downloads/pointwise_input_row_110.txt";
inputs[111] = "C:/Users/rohon/Downloads/pointwise_input_row_111.txt";
inputs[112] = "C:/Users/rohon/Downloads/pointwise_input_row_112.txt";
inputs[113] = "C:/Users/rohon/Downloads/pointwise_input_row_113.txt";
inputs[114] = "C:/Users/rohon/Downloads/pointwise_input_row_114.txt";
inputs[115] = "C:/Users/rohon/Downloads/pointwise_input_row_115.txt";
inputs[116] = "C:/Users/rohon/Downloads/pointwise_input_row_116.txt";
inputs[117] = "C:/Users/rohon/Downloads/pointwise_input_row_117.txt";
inputs[118] = "C:/Users/rohon/Downloads/pointwise_input_row_118.txt";
inputs[119] = "C:/Users/rohon/Downloads/pointwise_input_row_119.txt";
inputs[120] = "C:/Users/rohon/Downloads/pointwise_input_row_120.txt";
inputs[121] = "C:/Users/rohon/Downloads/pointwise_input_row_121.txt";
inputs[122] = "C:/Users/rohon/Downloads/pointwise_input_row_122.txt";
inputs[123] = "C:/Users/rohon/Downloads/pointwise_input_row_123.txt";
inputs[124] = "C:/Users/rohon/Downloads/pointwise_input_row_124.txt";
inputs[125] = "C:/Users/rohon/Downloads/pointwise_input_row_125.txt";
inputs[126] = "C:/Users/rohon/Downloads/pointwise_input_row_126.txt";
inputs[127] = "C:/Users/rohon/Downloads/pointwise_input_row_127.txt";

inputs[128] = "C:/Users/rohon/Downloads/pointwise_input_row_128.txt";
inputs[129] = "C:/Users/rohon/Downloads/pointwise_input_row_129.txt";
inputs[130] = "C:/Users/rohon/Downloads/pointwise_input_row_130.txt";
inputs[131] = "C:/Users/rohon/Downloads/pointwise_input_row_131.txt";
inputs[132] = "C:/Users/rohon/Downloads/pointwise_input_row_132.txt";
inputs[133] = "C:/Users/rohon/Downloads/pointwise_input_row_133.txt";
inputs[134] = "C:/Users/rohon/Downloads/pointwise_input_row_134.txt";
inputs[135] = "C:/Users/rohon/Downloads/pointwise_input_row_135.txt";
inputs[136] = "C:/Users/rohon/Downloads/pointwise_input_row_136.txt";
inputs[137] = "C:/Users/rohon/Downloads/pointwise_input_row_137.txt";
inputs[138] = "C:/Users/rohon/Downloads/pointwise_input_row_138.txt";
inputs[139] = "C:/Users/rohon/Downloads/pointwise_input_row_139.txt";
inputs[140] = "C:/Users/rohon/Downloads/pointwise_input_row_140.txt";
inputs[141] = "C:/Users/rohon/Downloads/pointwise_input_row_141.txt";
inputs[142] = "C:/Users/rohon/Downloads/pointwise_input_row_142.txt";
inputs[143] = "C:/Users/rohon/Downloads/pointwise_input_row_143.txt";
inputs[144] = "C:/Users/rohon/Downloads/pointwise_input_row_144.txt";
inputs[145] = "C:/Users/rohon/Downloads/pointwise_input_row_145.txt";
inputs[146] = "C:/Users/rohon/Downloads/pointwise_input_row_146.txt";
inputs[147] = "C:/Users/rohon/Downloads/pointwise_input_row_147.txt";
inputs[148] = "C:/Users/rohon/Downloads/pointwise_input_row_148.txt";
inputs[149] = "C:/Users/rohon/Downloads/pointwise_input_row_149.txt";
inputs[150] = "C:/Users/rohon/Downloads/pointwise_input_row_150.txt";
inputs[151] = "C:/Users/rohon/Downloads/pointwise_input_row_151.txt";
inputs[152] = "C:/Users/rohon/Downloads/pointwise_input_row_152.txt";
inputs[153] = "C:/Users/rohon/Downloads/pointwise_input_row_153.txt";
inputs[154] = "C:/Users/rohon/Downloads/pointwise_input_row_154.txt";
inputs[155] = "C:/Users/rohon/Downloads/pointwise_input_row_155.txt";
inputs[156] = "C:/Users/rohon/Downloads/pointwise_input_row_156.txt";
inputs[157] = "C:/Users/rohon/Downloads/pointwise_input_row_157.txt";
inputs[158] = "C:/Users/rohon/Downloads/pointwise_input_row_158.txt";
inputs[159] = "C:/Users/rohon/Downloads/pointwise_input_row_159.txt";
inputs[160] = "C:/Users/rohon/Downloads/pointwise_input_row_160.txt";
inputs[161] = "C:/Users/rohon/Downloads/pointwise_input_row_161.txt";
inputs[162] = "C:/Users/rohon/Downloads/pointwise_input_row_162.txt";
inputs[163] = "C:/Users/rohon/Downloads/pointwise_input_row_163.txt";
inputs[164] = "C:/Users/rohon/Downloads/pointwise_input_row_164.txt";
inputs[165] = "C:/Users/rohon/Downloads/pointwise_input_row_165.txt";
inputs[166] = "C:/Users/rohon/Downloads/pointwise_input_row_166.txt";
inputs[167] = "C:/Users/rohon/Downloads/pointwise_input_row_167.txt";
inputs[168] = "C:/Users/rohon/Downloads/pointwise_input_row_168.txt";
inputs[169] = "C:/Users/rohon/Downloads/pointwise_input_row_169.txt";
inputs[170] = "C:/Users/rohon/Downloads/pointwise_input_row_170.txt";
inputs[171] = "C:/Users/rohon/Downloads/pointwise_input_row_171.txt";
inputs[172] = "C:/Users/rohon/Downloads/pointwise_input_row_172.txt";
inputs[173] = "C:/Users/rohon/Downloads/pointwise_input_row_173.txt";
inputs[174] = "C:/Users/rohon/Downloads/pointwise_input_row_174.txt";
inputs[175] = "C:/Users/rohon/Downloads/pointwise_input_row_175.txt";
inputs[176] = "C:/Users/rohon/Downloads/pointwise_input_row_176.txt";
inputs[177] = "C:/Users/rohon/Downloads/pointwise_input_row_177.txt";
inputs[178] = "C:/Users/rohon/Downloads/pointwise_input_row_178.txt";
inputs[179] = "C:/Users/rohon/Downloads/pointwise_input_row_179.txt";
inputs[180] = "C:/Users/rohon/Downloads/pointwise_input_row_180.txt";
inputs[181] = "C:/Users/rohon/Downloads/pointwise_input_row_181.txt";
inputs[182] = "C:/Users/rohon/Downloads/pointwise_input_row_182.txt";
inputs[183] = "C:/Users/rohon/Downloads/pointwise_input_row_183.txt";
inputs[184] = "C:/Users/rohon/Downloads/pointwise_input_row_184.txt";
inputs[185] = "C:/Users/rohon/Downloads/pointwise_input_row_185.txt";
inputs[186] = "C:/Users/rohon/Downloads/pointwise_input_row_186.txt";
inputs[187] = "C:/Users/rohon/Downloads/pointwise_input_row_187.txt";
inputs[188] = "C:/Users/rohon/Downloads/pointwise_input_row_188.txt";
inputs[189] = "C:/Users/rohon/Downloads/pointwise_input_row_189.txt";
inputs[190] = "C:/Users/rohon/Downloads/pointwise_input_row_190.txt";
inputs[191] = "C:/Users/rohon/Downloads/pointwise_input_row_191.txt";
inputs[192] = "C:/Users/rohon/Downloads/pointwise_input_row_192.txt";
inputs[193] = "C:/Users/rohon/Downloads/pointwise_input_row_193.txt";
inputs[194] = "C:/Users/rohon/Downloads/pointwise_input_row_194.txt";
inputs[195] = "C:/Users/rohon/Downloads/pointwise_input_row_195.txt";
inputs[196] = "C:/Users/rohon/Downloads/pointwise_input_row_196.txt";
inputs[197] = "C:/Users/rohon/Downloads/pointwise_input_row_197.txt";
inputs[198] = "C:/Users/rohon/Downloads/pointwise_input_row_198.txt";
inputs[199] = "C:/Users/rohon/Downloads/pointwise_input_row_199.txt";
inputs[200] = "C:/Users/rohon/Downloads/pointwise_input_row_200.txt";
inputs[201] = "C:/Users/rohon/Downloads/pointwise_input_row_201.txt";
inputs[202] = "C:/Users/rohon/Downloads/pointwise_input_row_202.txt";
inputs[203] = "C:/Users/rohon/Downloads/pointwise_input_row_203.txt";
inputs[204] = "C:/Users/rohon/Downloads/pointwise_input_row_204.txt";
inputs[205] = "C:/Users/rohon/Downloads/pointwise_input_row_205.txt";
inputs[206] = "C:/Users/rohon/Downloads/pointwise_input_row_206.txt";
inputs[207] = "C:/Users/rohon/Downloads/pointwise_input_row_207.txt";
inputs[208] = "C:/Users/rohon/Downloads/pointwise_input_row_208.txt";
inputs[209] = "C:/Users/rohon/Downloads/pointwise_input_row_209.txt";
inputs[210] = "C:/Users/rohon/Downloads/pointwise_input_row_210.txt";
inputs[211] = "C:/Users/rohon/Downloads/pointwise_input_row_211.txt";
inputs[212] = "C:/Users/rohon/Downloads/pointwise_input_row_212.txt";
inputs[213] = "C:/Users/rohon/Downloads/pointwise_input_row_213.txt";
inputs[214] = "C:/Users/rohon/Downloads/pointwise_input_row_214.txt";
inputs[215] = "C:/Users/rohon/Downloads/pointwise_input_row_215.txt";
inputs[216] = "C:/Users/rohon/Downloads/pointwise_input_row_216.txt";
inputs[217] = "C:/Users/rohon/Downloads/pointwise_input_row_217.txt";
inputs[218] = "C:/Users/rohon/Downloads/pointwise_input_row_218.txt";
inputs[219] = "C:/Users/rohon/Downloads/pointwise_input_row_219.txt";
inputs[220] = "C:/Users/rohon/Downloads/pointwise_input_row_220.txt";
inputs[221] = "C:/Users/rohon/Downloads/pointwise_input_row_221.txt";
inputs[222] = "C:/Users/rohon/Downloads/pointwise_input_row_222.txt";
inputs[223] = "C:/Users/rohon/Downloads/pointwise_input_row_223.txt";
inputs[224] = "C:/Users/rohon/Downloads/pointwise_input_row_224.txt";
inputs[225] = "C:/Users/rohon/Downloads/pointwise_input_row_225.txt";
inputs[226] = "C:/Users/rohon/Downloads/pointwise_input_row_226.txt";
inputs[227] = "C:/Users/rohon/Downloads/pointwise_input_row_227.txt";
inputs[228] = "C:/Users/rohon/Downloads/pointwise_input_row_228.txt";
inputs[229] = "C:/Users/rohon/Downloads/pointwise_input_row_229.txt";
inputs[230] = "C:/Users/rohon/Downloads/pointwise_input_row_230.txt";
inputs[231] = "C:/Users/rohon/Downloads/pointwise_input_row_231.txt";
inputs[232] = "C:/Users/rohon/Downloads/pointwise_input_row_232.txt";
inputs[233] = "C:/Users/rohon/Downloads/pointwise_input_row_233.txt";
inputs[234] = "C:/Users/rohon/Downloads/pointwise_input_row_234.txt";
inputs[235] = "C:/Users/rohon/Downloads/pointwise_input_row_235.txt";
inputs[236] = "C:/Users/rohon/Downloads/pointwise_input_row_236.txt";
inputs[237] = "C:/Users/rohon/Downloads/pointwise_input_row_237.txt";
inputs[238] = "C:/Users/rohon/Downloads/pointwise_input_row_238.txt";
inputs[239] = "C:/Users/rohon/Downloads/pointwise_input_row_239.txt";
inputs[240] = "C:/Users/rohon/Downloads/pointwise_input_row_240.txt";
inputs[241] = "C:/Users/rohon/Downloads/pointwise_input_row_241.txt";
inputs[242] = "C:/Users/rohon/Downloads/pointwise_input_row_242.txt";
inputs[243] = "C:/Users/rohon/Downloads/pointwise_input_row_243.txt";
inputs[244] = "C:/Users/rohon/Downloads/pointwise_input_row_244.txt";
inputs[245] = "C:/Users/rohon/Downloads/pointwise_input_row_245.txt";
inputs[246] = "C:/Users/rohon/Downloads/pointwise_input_row_246.txt";
inputs[247] = "C:/Users/rohon/Downloads/pointwise_input_row_247.txt";
inputs[248] = "C:/Users/rohon/Downloads/pointwise_input_row_248.txt";
inputs[249] = "C:/Users/rohon/Downloads/pointwise_input_row_249.txt";
inputs[250] = "C:/Users/rohon/Downloads/pointwise_input_row_250.txt";
inputs[251] = "C:/Users/rohon/Downloads/pointwise_input_row_251.txt";
inputs[252] = "C:/Users/rohon/Downloads/pointwise_input_row_252.txt";
inputs[253] = "C:/Users/rohon/Downloads/pointwise_input_row_253.txt";
inputs[254] = "C:/Users/rohon/Downloads/pointwise_input_row_254.txt";
inputs[255] = "C:/Users/rohon/Downloads/pointwise_input_row_255.txt"; 
    for(int i=0;i<rows;i=i+1) begin 
      for(int j=0;j<num_of_files;j=j+1) begin 
        //for(k=0;k<cols;k=k+1) begin 
        buffer[i][j]='d0;
        //end 
      end 
    end 
    for(int i1=0;i1<num_of_files;i1=i1+1) begin 
    $display("This is i1: %0d",i1);
      bin=$fopen(inputs[i1],"r");
      for(int j1=0;j1<rows;j1=j1+1) begin 
	//$display("This is j1: %0d",j1);
        //for(k=0;k<cols;k=k+1) begin 
        p1=$fscanf(bin,"%d\t",buffer[j1][i1]);
          //read=$fread(value,bin);
          //rom[j][k]=read;
        //end 
      end
      $fclose(bin);
    end 
    
    //$readmemb("machine_code.txt",rom);
  end 

endmodule