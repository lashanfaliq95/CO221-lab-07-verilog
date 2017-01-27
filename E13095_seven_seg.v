//testbed for 7-segment display

module testbed;
	
	//input 4 bit BCD numver
	reg [3:0] num;
	//outputs for each segment in the 7-segment display
	wire a,b,c,d,e,f,g;
	//instantiation of the module and mapping of input outputs
	seven_seg_decoder myseg(num,a,b,c,d,e,f,g);
	
	//monitor chnages
	initial
	begin
		$monitor("Number : %d\nSeven_seg  : a=%b b=%b c=%b d=%b e=%b f=%b g=%b\n\n",num,a,b,c,d,e,f,g);
	end	
	
	//check different inputs
	initial
	begin
		num=4'd0;
		#5 num=4'd1;
		#5 num=4'd2;
		#5 num=4'd3;
		#5 num=4'd4;
		#5 num=4'd5;
		#5 num=4'd6;
		#5 num=4'd7;
		#5 num=4'd8;
		#5 num=4'd9;
		#5 num=4'd10;
		#5 num=4'd11;
		#5 num=4'd12;
		#5 num=4'd13;
		#5 num=4'd14;
		#5 num=4'd15;
	end

endmodule

//implement the module here


module seven_seg_decoder(num,a,b,c,d,e,f,g);

input 	[3:0] num;
output  a,b,c,d,e,f,g;
wire A,B,C,D,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20;

assign A=num[3];
assign B=num[2];
assign C=num[1];
assign D=num[0];

not na(w17,A);
not nb(w18,B);
not nc(w19,C);
not nd(w20,D);

and n1(w1,w17,C);
and n2(w2,w17,B,D);
and n3(w3,w17,w18,w20);
and n4(w4,A,w18,w19);
or n5(a,w1,w2,w3,w4);

and n6(w5,w17,w18);
and n7(w6,w18,w19);
and n8(w7,w17,w19,w20);
and n9(w8,w17,C,D);
or n10(b,w5,w6,w7,w8);

and n11(w9,w17,B);
and n12(w10,w17,D);
or n13(c,w9,w10,w6);

and n14(w11,w17,w18,C);
and n15(w12,w17,B,w19,D);
and n16(w13,w17,C,w20);
or n17(d,w3,w11,w12,w13,w4);

and n18(w14,w18,w19,w20);
or n19(e,w14,w13);

and n20(w15,w17,B,w19);
and n21(w16,w17,B,w20);
or n22(f,w15,w16,w14,w4);

or n23(g,w15,w11,w4,w13);



endmodule
