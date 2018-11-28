%{
    #include "calcwithvariables.tab.h"
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(char* s);
    int yyparse();
    int vars[26];
%}



%token NUMBER ASSIGNMENT VAR PRINT ENDSTATEMENT
%token ADD SUB MUL DIV

%%
 calclist: /* nothing */
 | calclist statement {}
 ;

 statement:
 |  VAR ASSIGNMENT exp ENDSTATEMENT {vars[$1 - 'a'] = $3;}
 |  PRINT VAR ENDSTATEMENT  {printf("%d\n", vars[$2 - 'a']);}
;
exp: factor          {$$ = $1;}
 | exp ADD factor   { $$ = $1 + $3; }
 | exp SUB factor   { $$ = $1 - $3; }
 ;

factor: term        {$$ = $1;}
 | factor MUL term  { $$ = $1 * $3; }
 | factor DIV term  { $$ = $1 / $3; }
 ;

term: NUMBER        {$$ = $1;}
 | VAR              {$$ = vars[$1 - 'a']; }
 | SUB NUMBER       {$$ = $2 * -1;}
 ;


%%


void yyerror(char *s)
{
  fprintf(stderr, "%s\n", s);
  exit(0);
}

int main()
{
    yyparse();
    return(0);
}
