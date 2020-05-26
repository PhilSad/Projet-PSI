%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"

%}

tMAIN	"main"
tOP		"("
tCP		")"
tOB		"{"
tCB		"}"
tQUOTE "\""
tPLUS	"+"	
tMOINS	"-"
tMUL	"*"
tDIV	"/"
tEGAL	"="

tINT	"int"
tFLOAT	"float"
tSHORT	"short"
tCHAR	"char"

tIF     "if"
tELSE   "else"
tWHILE	"while"
tCONST "const"

tVARIABLE	[a-zA-Z][a-zA-Z0-9_]*
tTEXT	\".*\"

tNOMBRE [0-9]+

tSEP	[ \n\t]
tENDINST	";"
tPRINTF	"printf"	

tVIRGULE    ","

%%
{tTEXT} {strcpy(yylval.str, yytext); return tTEXT;}
{tVIRGULE} {return tVIRGULE;}
{tMAIN}    {return tMAIN;}
{tOP}    {return tOP;}
{tOB}    {return tOB;}
{tCB}    {return tCB;}
{tCP}    {return tCP;}
{tPLUS}    {return tPLUS;}
{tMOINS}    {return tMOINS;}
{tMUL}    {return tMUL;}
{tDIV}    {return tDIV;}
{tEGAL}    {return tEGAL;}
{tCONST}    {return tCONST;}
{tSEP}+    {}
{tENDINST}    {return tENDINST;}
{tPRINTF}    {return tPRINTF;}
{tINT}    {return tINT;}

{tIF}   {return tIF;}
{tELSE} {return tELSE;}
{tWHILE} {return tWHILE;}

{tNOMBRE}    {
    yylval.nb = atoi(yytext);
    return tNOMBRE;
}

{tVARIABLE}    {
    strcpy(yylval.str, yytext);
    return tVARIABLE;
}

%%

/*
int main() 
{    
    // The function that starts the analysis 
    yylex(); 
  
    return 0; 
} 
*/

int yywrap()		/* called at end of input */
{
	return 1;	/* terminate now */
}
