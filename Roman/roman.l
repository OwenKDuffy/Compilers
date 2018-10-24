%{
    #include "roman.tab.h"
    #include <stdio.h>
%}

%%
"I"     {yylval = 1; return NUMBER;}
"IV"    {yylval = 4; return NUMBER;}
"V"     {yylval = 5; return NUMBER;}
"IX"    {yylval = 9; return NUMBER;}
"X"     {yylval = 10; return NUMBER;}
"XL"    {yylval = 40; return NUMBER;}
"L"     {yylval = 50; return NUMBER;}
"XC"    {yylval = 90; return NUMBER;}
"C"     {yylval = 100; return NUMBER;}
"CD"    {yylval = 400; return NUMBER;}
"D"     {yylval = 500; return NUMBER;}
"CM"    {yylval = 900; return NUMBER;}
"M"     {yylval = 1000; return NUMBER;}

\n      {return EOL;}
[ \t]   { /*ignore whitespace */ }
.       {printf("syntax error\n"); exit(0);}
%%
