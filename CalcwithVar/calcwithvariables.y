%{
    #include "calcwithvariables.tab.h"
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(char* s);
    int vars[26];
%}


%token EOL
%token NUMBER ASSIGNMENT VAR PRINT ENDSTATEMENT
%token ADD SUB MUL DIV

%%
 calclist: /* nothing */
 | calclist exp EOL {}
 | calclist initialization EOL {}
 | calclist println EOL {}
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
 | VAR {$$ = vars[yylval - 'a']; printf("Var %c", $1);}
 ;

 initialization:
 | VAR ASSIGNMENT NUMBER ENDSTATEMENT {vars[$1 - 'a'] = $3; printf("Initialised %c as %d", $1, $3);}
 | VAR ASSIGNMENT exp ENDSTATEMENT {vars[$1 - 'a'] = $3; printf("Initialised %c", $1);}
 ;

 println: /*nothing */
 | println VAR ENDSTATEMENT {int val = vars[$2 - 'a']; printf("%d\n", val);}
 ;
%%


void yyerror(char *s)
{
  fprintf(stderr, "%s\n", s);
}
