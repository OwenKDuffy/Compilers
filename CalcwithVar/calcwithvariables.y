%{
    #include "calcwithvariables.tab.h"
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(char* s);

%}


%token EOL

%token ADD SUB MUL DIV

%%
calclist: /* nothing */
 | calclist exp EOL { /*printf("PrintRoman of : %d\n", $2);*/ ($2 == 0) ? printf("Z\n") : printRoman($2); }
 ;

exp: factor
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;

factor: term
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; /*printf("%d div %d = %d\n", $1, $3, $$);*/}
 ;

term: number
 | '{' exp '}' { $$ = $2; }
 ;
%%
