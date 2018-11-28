%{
    #include "calcwithvariables.tab.h"
    #include <stdio.h>
%}

%%
":="    {return ASSIGNMENT;}
"print" {return PRINT;}
[0-9]+	{ yylval = atoi(yytext); return NUMBER; }
[a-z]   {yylval = yytext[0]; return VAR;}
"+"     {return ADD;}
"-"     {return SUB;}
"*"     {return MUL;}
"/"     {return DIV;}
";"     {return ENDSTATEMENT;}
"{" |
"}"     { return yytext[0]; }
[ \t\n]*   { /*ignore whitespace */ }
.       {printf("syntax error\n"); exit(0);}
%%
