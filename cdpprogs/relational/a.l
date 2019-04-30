%{
#include"y.tab.h"
#include<stdio.h>
extern int yylval;
%}
%%
[a-z][a-zA-Z0-9]+ {return id;}
[0-9]+ {yylval=atoi(yytext);
            return number;}
[\t] {;}
[\n] {return 0;}
. {return yytext[0];}
%%
