%{
    #include "calcwithvariables.tab.h"
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(char* s);
    int vars[26];
%}


%token EOL
%token NUMBER ASSIGNMENT VAR PRINT
%token ADD SUB MUL DIV

%%
 calclist: /* nothing */
 | calclist exp EOL {}
 | calclist initialization EOL {}
 | calclist println {}
 ;

exp: factor
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;

factor: term
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;

term: NUMBER
 | '{' exp '}' { $$ = $2; }
 | VAR {$$ = vars[yylval - 'a'];}
 ;

 initialization:
 VAR ASSIGNMENT exp {vars[$1 - 'a'] = $3;}
 ;

 println: /*nothing */
 | println VAR EOL {int val = vars[$2 - 'a']; printf("%d\n", val);}
 ;
%%
