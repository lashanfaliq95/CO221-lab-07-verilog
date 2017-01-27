// testbed for 2-digit display

module testbed;
	
	//4-bit binary input
	reg [3:0] num;
	
	//output wires
	//a1,b1,c1,d1,e1,f1,g1 are the outputs from the seven segment display that denotes the most significant digit (left)
	//a2,b2,c2,d2,e2,f2,g2 are the outputs from the seven segment display taht denotes the least significant digit (right)	
	wire a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2;
	
	//instantiation of the module and port mapping
	binary_digit_display mydisplay(num,a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2);
	
	//monitor for changes
	initial
	begin
		$monitor("Number : %d\nSeven_seg_left  : a=%b b=%b c=%b d=%b e=%b f=%b g=%b\nSeven_seg_right : a=%b b=%b c=%b d=%b e=%b f=%b g=%b\n\n",num,a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2);
	end	
	
	//test different inputs
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



//your code goes here.
module binary_digit_display(num,a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2);


input 	[3:0] num;
output  a2,b2,c2,d2,e2,f2,g2,a1,b1,c1,d1,e1,f1,g1;
wire A,B,C,D,B0,B1,B2,B3,C3,C2,C1,C0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,W1,W2,W3,W4,W5,W6,W7,W8,W9,W10,W11,W12,W13,W14,W15,W16,W17,W18,W19,W20,W21,W22,W23,W24,W25,W26,W27,W28;

assign A=num[3];
assign B=num[2];
assign C=num[1];
assign D=num[0];

assign B3=0;
assign B1=0;
assign B2=0;

and n25(w22,A,B);
and n26(w21,A,C);
or n24(B0,w21,w22);

not na(w17,B3);
not nb(w18,B2);
not nc(w19,B1);
not nd(w20,B3);

and n1(w1,w17,B1);
and n2(w2,w17,B2,B0);
and n3(w3,w17,w18,w20);
and n4(w4,B3,w18,w19);
or n5(a1,w1,w2,w3,w4);

and n6(w5,w17,w18);
and n7(w6,w18,w19);
and n8(w7,w17,w19,w20);
and n9(w8,w17,B1,B0);
or n10(b1,w5,w6,w7,w8);

and n11(w9,w17,B2);
and n12(w10,w17,B0);
or n13(c1,w9,w10,w6);

and n14(w11,w17,w18,B1);
and n15(w12,w17,B2,w19,B0);
and n16(w13,w17,B1,w20);
or n17(d1,w3,w11,w12,w13,w4);

and n18(w14,w18,w19,w20);
or n19(e1,w14,w13);

and n20(w15,w17,B2,w19);
and n21(w16,w17,B2,w20);
or n22(f1,w15,w16,w14,w4);

or n23(g1,w15,w11,w4,w13);


//
not Na(W22,A);
not Nb(W23,B);
not Nc(W24,C);
not Nd(W21,D);

assign C0=D;

and N27(C3,A,W23,W24);

and N28(W25,A,W23);
and N29(W26,W23,W24);
or N30(C2,W25,W26);

and N31(W27,W22,C);
and N32(W28,A,B,W24);
or N33(C1,W27,W28);



not Na(W17,C3);
not Nb(W18,C2);
not Nc(W19,C1);
not Nd(W20,C0);

#include<stdio.h>
#include<string.h>
#include<stdlib.h>

typedef struct _ {
int batch;
int regNo[20];
char firstName[20];
char lastName[20];
float cGPA;
}student_t;

student_t addstudent();
void printstudent(char* a);
	 student_t sarray[1000];
int main(){
	while(1){
	puts("--------------------------------------------");
	puts("A VOLATILE STUDENT RECORD MAINTENANCE SYSTEM");
	puts("--------------------------------------------");
	puts("0.Quit");
	puts("1.Insert a Student Record");
	puts("2.Print a Student Record");
	puts("3.Print all Student Records");
	puts("4.Delete a Student Record");
	
	int input,n=0;

	char a[20];
	scanf("%d",&input);
	if(input==0){break;}
	else if(input==1){
		sarray[n]=addstudent();
		
		}
	else if(input==2){         
		printf("Enter the Registration Number:");
		scanf("%s",&a);
	 printstudent(a);
		}
	 n++;
}
	return 0;
	}

student_t addstudent(){
	student_t student1;
	printf("Enter the batch(11/12/13/14):");
		scanf("%d",&student1.batch);
		printf("Enter the registration number:");
		scanf("%d",&student1.regNo);
		printf("Enter the first name         :");
		scanf("%s",&student1.firstName);
		printf("Enter the last name          :");
		scanf("%s",&student1.lastName);
		printf("Enter the cumulative GPA      :");
		scanf("%f",&student1.cGPA);
	return student1;
	}
void printstudent(char* a){
	int n;
	char temp_arrray1[2],temp_arrray2[3];
  for(n=2;n<4;n++){
   temp_arrray1[n-2]=a[n];
  }
int batch=atoi(temp_arrray1);
   for(n=5;n<8;n++){
temp_arrray2[n-5]=a[n];
 }
 int regnum=atoi(temp_arrray2);
	for(n=0;n<1000;n++){

	if(batch==sarray[n].batch && regnum==sarray[n].regNo){
		printf("The student %s %s (E/%d/%d) has a cumulative GPA of %f",&sarray[n].firstName,&sarray[n].lastName,&sarray[n].batch,&sarray[n].regNo,&sarray[n].cGPA);
		}}
	
	}






