
_main:

;MyProject.c,29 :: 		void main(){
;MyProject.c,30 :: 		trisa=255;
	MOVLW      255
	MOVWF      TRISA+0
;MyProject.c,31 :: 		adcon1=6;
	MOVLW      6
	MOVWF      ADCON1+0
;MyProject.c,32 :: 		loop2:
___main_loop2:
;MyProject.c,33 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.c,35 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,36 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,37 :: 		Lcd_Out(2,5,txt1);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,38 :: 		Lcd_Out(2,12,txt1);                // Write text in first row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,39 :: 		Lcd_Out(1,3,txt4);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,40 :: 		Lcd_Out(1,7,txt2);                // Write text in second row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,41 :: 		Lcd_Out(1,15,txt3);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,42 :: 		while(1){
L_main0:
;MyProject.c,44 :: 		while(f1<13){
L_main2:
	MOVLW      128
	XORWF      _f1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main71
	MOVLW      13
	SUBWF      _f1+0, 0
L__main71:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;MyProject.c,45 :: 		if(f1==xh1+10){xh1=f1;}
	MOVLW      10
	ADDWF      _xh1+0, 0
	MOVWF      R1+0
	MOVF       _xh1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       _f1+1, 0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main72
	MOVF       R1+0, 0
	XORWF      _f1+0, 0
L__main72:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	MOVF       _f1+0, 0
	MOVWF      _xh1+0
	MOVF       _f1+1, 0
	MOVWF      _xh1+1
L_main4:
;MyProject.c,46 :: 		if(f1==0){xh1=0;f1=1;}
	MOVLW      0
	XORWF      _f1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main73
	MOVLW      0
	XORWF      _f1+0, 0
L__main73:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
	CLRF       _xh1+0
	CLRF       _xh1+1
	MOVLW      1
	MOVWF      _f1+0
	MOVLW      0
	MOVWF      _f1+1
L_main5:
;MyProject.c,47 :: 		if(f1==1){xh1=0;}
	MOVLW      0
	XORWF      _f1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main74
	MOVLW      1
	XORWF      _f1+0, 0
L__main74:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
	CLRF       _xh1+0
	CLRF       _xh1+1
L_main6:
;MyProject.c,48 :: 		d1=f1-xh1;
	MOVF       _xh1+0, 0
	SUBWF      _f1+0, 0
	MOVWF      _d1+0
	MOVF       _xh1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _f1+1, 0
	MOVWF      _d1+1
;MyProject.c,49 :: 		xh2=f1/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _f1+0, 0
	MOVWF      R0+0
	MOVF       _f1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _xh2+0
	MOVF       R0+1, 0
	MOVWF      _xh2+1
;MyProject.c,50 :: 		Lcd_chr(2,3,sec[d1]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _d1+0, 0
	MOVWF      R0+0
	MOVF       _d1+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sec+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,51 :: 		Lcd_chr(2,2,sec1[xh2]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _xh2+0, 0
	MOVWF      R0+0
	MOVF       _xh2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sec1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,53 :: 		while(x<60){
L_main7:
	MOVLW      128
	XORWF      _x+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main75
	MOVLW      60
	SUBWF      _x+0, 0
L__main75:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;MyProject.c,54 :: 		x2=x-(x1*10);
	MOVF       _x1+0, 0
	MOVWF      R0+0
	MOVF       _x1+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	SUBWF      _x+0, 0
	MOVWF      _x2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _x+1, 0
	MOVWF      _x2+1
;MyProject.c,55 :: 		if(x<0){x=59;}
	MOVLW      128
	XORWF      _x+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main76
	MOVLW      0
	SUBWF      _x+0, 0
L__main76:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
	MOVLW      59
	MOVWF      _x+0
	MOVLW      0
	MOVWF      _x+1
L_main9:
;MyProject.c,56 :: 		if(x>59){x=0;}
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _x+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main77
	MOVF       _x+0, 0
	SUBLW      59
L__main77:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
	CLRF       _x+0
	CLRF       _x+1
L_main10:
;MyProject.c,57 :: 		x1=x/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _x1+0
	MOVF       R0+1, 0
	MOVWF      _x1+1
;MyProject.c,58 :: 		Lcd_chr(2,9,sec[x2]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _x2+0, 0
	MOVWF      R0+0
	MOVF       _x2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sec+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,59 :: 		Lcd_chr(2,8,sec1[x1]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _x1+0, 0
	MOVWF      R0+0
	MOVF       _x1+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sec1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,61 :: 		for (i=0;i<60;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main11:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main78
	MOVLW      60
	SUBWF      _i+0, 0
L__main78:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;MyProject.c,63 :: 		if(i==m+10){m=i;}
	MOVLW      10
	ADDWF      _m+0, 0
	MOVWF      R1+0
	MOVF       _m+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       _i+1, 0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main79
	MOVF       R1+0, 0
	XORWF      _i+0, 0
L__main79:
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	MOVF       _i+0, 0
	MOVWF      _m+0
	MOVF       _i+1, 0
	MOVWF      _m+1
L_main14:
;MyProject.c,64 :: 		if(i==0){m=i;}
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main80
	MOVLW      0
	XORWF      _i+0, 0
L__main80:
	BTFSS      STATUS+0, 2
	GOTO       L_main15
	MOVF       _i+0, 0
	MOVWF      _m+0
	MOVF       _i+1, 0
	MOVWF      _m+1
L_main15:
;MyProject.c,65 :: 		h=i-m;
	MOVF       _m+0, 0
	SUBWF      _i+0, 0
	MOVWF      _h+0
	MOVF       _m+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _i+1, 0
	MOVWF      _h+1
;MyProject.c,66 :: 		k=i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _k+0
	MOVF       R0+1, 0
	MOVWF      _k+1
;MyProject.c,67 :: 		Lcd_chr(2,14,sec1[k]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _sec1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,68 :: 		Lcd_chr(2,15,sec[h]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _h+0, 0
	MOVWF      R0+0
	MOVF       _h+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sec+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,69 :: 		for(mov=0;mov<10;mov++){delay_ms(100); if (porta.f0==1){delay_ms(400);goto loop1;}}
	CLRF       _mov+0
	CLRF       _mov+1
L_main16:
	MOVLW      128
	XORWF      _mov+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main81
	MOVLW      10
	SUBWF      _mov+0, 0
L__main81:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	BTFSS      PORTA+0, 0
	GOTO       L_main20
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	GOTO       ___main_loop1
L_main20:
	INCF       _mov+0, 1
	BTFSC      STATUS+0, 2
	INCF       _mov+1, 1
	GOTO       L_main16
L_main17:
;MyProject.c,61 :: 		for (i=0;i<60;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,71 :: 		}
	GOTO       L_main11
L_main12:
;MyProject.c,72 :: 		x++;}
	INCF       _x+0, 1
	BTFSC      STATUS+0, 2
	INCF       _x+1, 1
	GOTO       L_main7
L_main8:
;MyProject.c,73 :: 		}
	GOTO       L_main2
L_main3:
;MyProject.c,74 :: 		f1++;           }
	INCF       _f1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _f1+1, 1
	GOTO       L_main0
;MyProject.c,76 :: 		for(;;){loop1:
L_main22:
___main_loop1:
;MyProject.c,77 :: 		if (porta.f0==1){goto loop2;delay_ms(400);}
	BTFSS      PORTA+0, 0
	GOTO       L_main25
	GOTO       ___main_loop2
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	DECFSZ     R11+0, 1
	GOTO       L_main26
L_main25:
;MyProject.c,78 :: 		if (porta.f1==1){goto looph; delay_ms(400);}
	BTFSS      PORTA+0, 1
	GOTO       L_main27
	GOTO       ___main_looph
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	DECFSZ     R11+0, 1
	GOTO       L_main28
L_main27:
;MyProject.c,82 :: 		if(x==l+10){l=x;}
	MOVLW      10
	ADDWF      _l+0, 0
	MOVWF      R1+0
	MOVF       _l+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       _x+1, 0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main82
	MOVF       R1+0, 0
	XORWF      _x+0, 0
L__main82:
	BTFSS      STATUS+0, 2
	GOTO       L_main29
	MOVF       _x+0, 0
	MOVWF      _l+0
	MOVF       _x+1, 0
	MOVWF      _l+1
L_main29:
;MyProject.c,83 :: 		if(x==0){l=x;}
	MOVLW      0
	XORWF      _x+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main83
	MOVLW      0
	XORWF      _x+0, 0
L__main83:
	BTFSS      STATUS+0, 2
	GOTO       L_main30
	MOVF       _x+0, 0
	MOVWF      _l+0
	MOVF       _x+1, 0
	MOVWF      _l+1
L_main30:
;MyProject.c,84 :: 		x2=x-l;
	MOVF       _l+0, 0
	SUBWF      _x+0, 0
	MOVWF      _x2+0
	MOVF       _l+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _x+1, 0
	MOVWF      _x2+1
;MyProject.c,85 :: 		x1=x/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _x1+0
	MOVF       R0+1, 0
	MOVWF      _x1+1
;MyProject.c,86 :: 		Lcd_chr(2,9,sec[x2]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _x2+0, 0
	MOVWF      R0+0
	MOVF       _x2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sec+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,87 :: 		Lcd_chr(2,8,sec1[x1]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _x1+0, 0
	MOVWF      R0+0
	MOVF       _x1+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sec1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,90 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	DECFSZ     R11+0, 1
	GOTO       L_main31
	NOP
;MyProject.c,93 :: 		}
	GOTO       L_main22
;MyProject.c,95 :: 		for(;;){looph:
L_main32:
___main_looph:
;MyProject.c,96 :: 		if(f1==13){f1=1;}
	MOVLW      0
	XORWF      _f1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main84
	MOVLW      13
	XORWF      _f1+0, 0
L__main84:
	BTFSS      STATUS+0, 2
	GOTO       L_main35
	MOVLW      1
	MOVWF      _f1+0
	MOVLW      0
	MOVWF      _f1+1
L_main35:
;MyProject.c,97 :: 		if(f1<=0){f1=12;}
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _f1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main85
	MOVF       _f1+0, 0
	SUBLW      0
L__main85:
	BTFSS      STATUS+0, 0
	GOTO       L_main36
	MOVLW      12
	MOVWF      _f1+0
	MOVLW      0
	MOVWF      _f1+1
L_main36:
;MyProject.c,98 :: 		if(f1==xh1+10){xh1=f1;}
	MOVLW      10
	ADDWF      _xh1+0, 0
	MOVWF      R1+0
	MOVF       _xh1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       _f1+1, 0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main86
	MOVF       R1+0, 0
	XORWF      _f1+0, 0
L__main86:
	BTFSS      STATUS+0, 2
	GOTO       L_main37
	MOVF       _f1+0, 0
	MOVWF      _xh1+0
	MOVF       _f1+1, 0
	MOVWF      _xh1+1
L_main37:
;MyProject.c,99 :: 		if(f1==1){xh1=0;}
	MOVLW      0
	XORWF      _f1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main87
	MOVLW      1
	XORWF      _f1+0, 0
L__main87:
	BTFSS      STATUS+0, 2
	GOTO       L_main38
	CLRF       _xh1+0
	CLRF       _xh1+1
L_main38:
;MyProject.c,100 :: 		d1=f1-xh1;
	MOVF       _xh1+0, 0
	SUBWF      _f1+0, 0
	MOVWF      _d1+0
	MOVF       _xh1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _f1+1, 0
	MOVWF      _d1+1
;MyProject.c,101 :: 		xh2=f1/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _f1+0, 0
	MOVWF      R0+0
	MOVF       _f1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _xh2+0
	MOVF       R0+1, 0
	MOVWF      _xh2+1
;MyProject.c,102 :: 		Lcd_chr(2,3,sec[d1]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _d1+0, 0
	MOVWF      R0+0
	MOVF       _d1+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sec+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,103 :: 		Lcd_chr(2,2,sec1[xh2]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _xh2+0, 0
	MOVWF      R0+0
	MOVF       _xh2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sec1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,104 :: 		for(mov=0;mov<10;mov++){
	CLRF       _mov+0
	CLRF       _mov+1
L_main39:
	MOVLW      128
	XORWF      _mov+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main88
	MOVLW      10
	SUBWF      _mov+0, 0
L__main88:
	BTFSC      STATUS+0, 0
	GOTO       L_main40
;MyProject.c,105 :: 		if (porta.f3==1){f1--;delay_ms(300);}
	BTFSS      PORTA+0, 3
	GOTO       L_main42
	MOVLW      1
	SUBWF      _f1+0, 1
	BTFSS      STATUS+0, 0
	DECF       _f1+1, 1
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main43:
	DECFSZ     R13+0, 1
	GOTO       L_main43
	DECFSZ     R12+0, 1
	GOTO       L_main43
	DECFSZ     R11+0, 1
	GOTO       L_main43
	NOP
	NOP
L_main42:
;MyProject.c,106 :: 		if (porta.f0==1){goto loop2;delay_ms(300);}
	BTFSS      PORTA+0, 0
	GOTO       L_main44
	GOTO       ___main_loop2
L_main45:
	DECFSZ     R13+0, 1
	GOTO       L_main45
	DECFSZ     R12+0, 1
	GOTO       L_main45
	DECFSZ     R11+0, 1
	GOTO       L_main45
	NOP
	NOP
L_main44:
;MyProject.c,107 :: 		if(porta.f2==1){f1++;delay_ms(300);}
	BTFSS      PORTA+0, 2
	GOTO       L_main46
	INCF       _f1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _f1+1, 1
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main47:
	DECFSZ     R13+0, 1
	GOTO       L_main47
	DECFSZ     R12+0, 1
	GOTO       L_main47
	DECFSZ     R11+0, 1
	GOTO       L_main47
	NOP
	NOP
L_main46:
;MyProject.c,108 :: 		if (porta.f1==1){goto loopm;delay_ms(300);}
	BTFSS      PORTA+0, 1
	GOTO       L_main48
	GOTO       ___main_loopm
L_main49:
	DECFSZ     R13+0, 1
	GOTO       L_main49
	DECFSZ     R12+0, 1
	GOTO       L_main49
	DECFSZ     R11+0, 1
	GOTO       L_main49
	NOP
	NOP
L_main48:
;MyProject.c,109 :: 		delay_ms(20);}
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main50:
	DECFSZ     R13+0, 1
	GOTO       L_main50
	DECFSZ     R12+0, 1
	GOTO       L_main50
	NOP
	NOP
;MyProject.c,104 :: 		for(mov=0;mov<10;mov++){
	INCF       _mov+0, 1
	BTFSC      STATUS+0, 2
	INCF       _mov+1, 1
;MyProject.c,109 :: 		delay_ms(20);}
	GOTO       L_main39
L_main40:
;MyProject.c,110 :: 		Lcd_out(2,3," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,111 :: 		Lcd_out(2,2," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,112 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main51:
	DECFSZ     R13+0, 1
	GOTO       L_main51
	DECFSZ     R12+0, 1
	GOTO       L_main51
	DECFSZ     R11+0, 1
	GOTO       L_main51
	NOP
;MyProject.c,113 :: 		}
	GOTO       L_main32
;MyProject.c,114 :: 		for(;;){loopm:
L_main52:
___main_loopm:
;MyProject.c,115 :: 		if(x<0){x=59;}
	MOVLW      128
	XORWF      _x+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main89
	MOVLW      0
	SUBWF      _x+0, 0
L__main89:
	BTFSC      STATUS+0, 0
	GOTO       L_main55
	MOVLW      59
	MOVWF      _x+0
	MOVLW      0
	MOVWF      _x+1
L_main55:
;MyProject.c,116 :: 		if(x>59){x=0;}
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _x+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main90
	MOVF       _x+0, 0
	SUBLW      59
L__main90:
	BTFSC      STATUS+0, 0
	GOTO       L_main56
	CLRF       _x+0
	CLRF       _x+1
L_main56:
;MyProject.c,117 :: 		x2=x-(x1*10);
	MOVF       _x1+0, 0
	MOVWF      R0+0
	MOVF       _x1+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	SUBWF      _x+0, 0
	MOVWF      _x2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _x+1, 0
	MOVWF      _x2+1
;MyProject.c,118 :: 		x1=x/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _x1+0
	MOVF       R0+1, 0
	MOVWF      _x1+1
;MyProject.c,119 :: 		Lcd_chr(2,9,sec[x2]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _x2+0, 0
	MOVWF      R0+0
	MOVF       _x2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sec+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,120 :: 		Lcd_chr(2,8,sec1[x1]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _x1+0, 0
	MOVWF      R0+0
	MOVF       _x1+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sec1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,121 :: 		for(mov=0;mov<10;mov++){
	CLRF       _mov+0
	CLRF       _mov+1
L_main57:
	MOVLW      128
	XORWF      _mov+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main91
	MOVLW      10
	SUBWF      _mov+0, 0
L__main91:
	BTFSC      STATUS+0, 0
	GOTO       L_main58
;MyProject.c,122 :: 		if (porta.f3==1){x--;delay_ms(250);}
	BTFSS      PORTA+0, 3
	GOTO       L_main60
	MOVLW      1
	SUBWF      _x+0, 1
	BTFSS      STATUS+0, 0
	DECF       _x+1, 1
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main61:
	DECFSZ     R13+0, 1
	GOTO       L_main61
	DECFSZ     R12+0, 1
	GOTO       L_main61
	DECFSZ     R11+0, 1
	GOTO       L_main61
	NOP
	NOP
L_main60:
;MyProject.c,123 :: 		if (porta.f0==1){goto loop2;delay_ms(200);}
	BTFSS      PORTA+0, 0
	GOTO       L_main62
	GOTO       ___main_loop2
L_main63:
	DECFSZ     R13+0, 1
	GOTO       L_main63
	DECFSZ     R12+0, 1
	GOTO       L_main63
	DECFSZ     R11+0, 1
	GOTO       L_main63
L_main62:
;MyProject.c,124 :: 		if (porta.f1==1){goto looph;delay_ms(200);}
	BTFSS      PORTA+0, 1
	GOTO       L_main64
	GOTO       ___main_looph
L_main65:
	DECFSZ     R13+0, 1
	GOTO       L_main65
	DECFSZ     R12+0, 1
	GOTO       L_main65
	DECFSZ     R11+0, 1
	GOTO       L_main65
L_main64:
;MyProject.c,125 :: 		if(porta.f2==1){x++;delay_ms(250);}
	BTFSS      PORTA+0, 2
	GOTO       L_main66
	INCF       _x+0, 1
	BTFSC      STATUS+0, 2
	INCF       _x+1, 1
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main67:
	DECFSZ     R13+0, 1
	GOTO       L_main67
	DECFSZ     R12+0, 1
	GOTO       L_main67
	DECFSZ     R11+0, 1
	GOTO       L_main67
	NOP
	NOP
L_main66:
;MyProject.c,126 :: 		delay_ms(20);}
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main68:
	DECFSZ     R13+0, 1
	GOTO       L_main68
	DECFSZ     R12+0, 1
	GOTO       L_main68
	NOP
	NOP
;MyProject.c,121 :: 		for(mov=0;mov<10;mov++){
	INCF       _mov+0, 1
	BTFSC      STATUS+0, 2
	INCF       _mov+1, 1
;MyProject.c,126 :: 		delay_ms(20);}
	GOTO       L_main57
L_main58:
;MyProject.c,127 :: 		Lcd_out(2,9," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,128 :: 		Lcd_out(2,8," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,130 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main69:
	DECFSZ     R13+0, 1
	GOTO       L_main69
	DECFSZ     R12+0, 1
	GOTO       L_main69
	DECFSZ     R11+0, 1
	GOTO       L_main69
	NOP
;MyProject.c,131 :: 		}
	GOTO       L_main52
;MyProject.c,136 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
