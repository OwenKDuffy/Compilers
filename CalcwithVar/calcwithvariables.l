%{
    #include "calcwithvariables.tab.h"
    #include <stdio.h>
%}

%%
"+"     {return ADD;}
"-"     {return SUB;}
"*"     {return MUL;}
"/"     {return DIV;}
":="    {return ASSIGNMENT;}
[0-9]+	{ yylval = atoi(yytext); return NUMBER; }
[a-z]   {yylval = yytext[0]; return VAR;}
print {return PRINT;}
";"     {return ENDSTATEMENT;}
"{" |
"}"     { return yytext[0]; }
\n      {return EOL;}
[ \t]*   { /*ignore whitespace */ }
.       {printf("syntax error\n"); exit(0);}
%%
