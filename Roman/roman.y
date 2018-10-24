%{
    #include "roman.tab.h"
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(char* s);
%}


%token EOL
%token NUMBER
%%

line: /*do nothing */
| line exp EOL { printf("%d\n", $2); }
;

exp: NUMBER
| exp NUMBER {$$ = $1 + $2;}
;

%%

int main()
{
    fflush(stdin);
    yyparse();
    return 0;
}

void yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
