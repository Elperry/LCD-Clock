#line 1 "G:/protues projects/SAMPLES/h Clock/MyProject.c"

sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;


char txt1[] = ":";
char txt2[] = "Min";
char txt3[] = "SEC";
char txt4[] = "H";
int i,h,mov;
int x,x1,x2,xh1,xh2,f1,d1;
int k=0;
int m=0;
int l=0;
int sec[]={'0','1','2','3','4','5','6','7','8','9'};
 int sec1[]={'0','1','2','3','4','5'} ;

void main(){
 trisa=255;
 adcon1=6;
 loop2:
 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(2,5,txt1);
 Lcd_Out(2,12,txt1);
 Lcd_Out(1,3,txt4);
 Lcd_Out(1,7,txt2);
 Lcd_Out(1,15,txt3);
 while(1){

 while(f1<13){
 if(f1==xh1+10){xh1=f1;}
 if(f1==0){xh1=0;f1=1;}
 if(f1==1){xh1=0;}
 d1=f1-xh1;
 xh2=f1/10;
 Lcd_chr(2,3,sec[d1]);
 Lcd_chr(2,2,sec1[xh2]);

 while(x<60){
 x2=x-(x1*10);
 if(x<0){x=59;}
 if(x>59){x=0;}
 x1=x/10;
 Lcd_chr(2,9,sec[x2]);
 Lcd_chr(2,8,sec1[x1]);

 for (i=0;i<60;i++){

 if(i==m+10){m=i;}
 if(i==0){m=i;}
 h=i-m;
 k=i/10;
 Lcd_chr(2,14,sec1[k]);
 Lcd_chr(2,15,sec[h]);
 for(mov=0;mov<10;mov++){delay_ms(100); if (porta.f0==1){delay_ms(400);goto loop1;}}

 }
 x++;}
 }
 f1++; }

 for(;;){loop1:
 if (porta.f0==1){goto loop2;delay_ms(400);}
 if (porta.f1==1){goto looph; delay_ms(400);}



 if(x==l+10){l=x;}
 if(x==0){l=x;}
 x2=x-l;
 x1=x/10;
 Lcd_chr(2,9,sec[x2]);
 Lcd_chr(2,8,sec1[x1]);


 delay_ms(100);


 }

 for(;;){looph:
 if(f1==13){f1=1;}
 if(f1<=0){f1=12;}
 if(f1==xh1+10){xh1=f1;}
 if(f1==1){xh1=0;}
 d1=f1-xh1;
 xh2=f1/10;
 Lcd_chr(2,3,sec[d1]);
 Lcd_chr(2,2,sec1[xh2]);
 for(mov=0;mov<10;mov++){
 if (porta.f3==1){f1--;delay_ms(300);}
 if (porta.f0==1){goto loop2;delay_ms(300);}
 if(porta.f2==1){f1++;delay_ms(300);}
 if (porta.f1==1){goto loopm;delay_ms(300);}
 delay_ms(20);}
 Lcd_out(2,3," ");
 Lcd_out(2,2," ");
 delay_ms(100);
 }
 for(;;){loopm:
 if(x<0){x=59;}
 if(x>59){x=0;}
 x2=x-(x1*10);
 x1=x/10;
 Lcd_chr(2,9,sec[x2]);
 Lcd_chr(2,8,sec1[x1]);
 for(mov=0;mov<10;mov++){
 if (porta.f3==1){x--;delay_ms(250);}
 if (porta.f0==1){goto loop2;delay_ms(200);}
 if (porta.f1==1){goto looph;delay_ms(200);}
 if(porta.f2==1){x++;delay_ms(250);}
 delay_ms(20);}
 Lcd_out(2,9," ");
 Lcd_out(2,8," ");

 delay_ms(100);
 }




 }
