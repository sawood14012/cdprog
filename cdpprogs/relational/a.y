%{
#include<stdio.h>
int res=0;
%}
%token id number
%%
stmt:expr {res=$$;}
;
expr:expr '<' expr {$$=$1<$3;}
    |expr '>' expr {$$=$1>$3;}
    |expr '<''=' expr {$$=($1<=$4);}
    |expr '>''=' expr {$$=($1>=$4);}
    |'(' expr ')' {$$=$2;}
    |expr '=''=' expr {$$=($1==$4);}
    |number
    |id
    ;
%%
void main()
{
printf("enter expr\n");
yyparse();
printf("valid=%d",res);
exit(0);
}

yyerror()
{
printf("invalid\n");
exit(0);
}
