%{
    #include "roman.tab.h"
%}

%%
"I" |
"V" |
"X" |
"L" |
"C" |
"D" |
"M"     {return yytext[0];}

\n      {return EOL;}
[ \t]   { /*ignore whitespace */ }
.       {printf("syntax error\n"); exit(0);}
%%
