%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(char* s);
}%


%union {
  struct ast *a;
  double d;
}

%token EOL
%token <char> NUMBER

decimal:


term : NUMBER { switch($1)
                {
                    case 'I':
                        $$ = 1;
                        break;
                    case 'V':
                        $$ = 5;
                        break;
                    case 'V':
                        $$ = 5;
                        break;
                    case 'V':
                        $$ = 5;
                        break;
                    case 'V':
                        $$ = 5;
                        break;
                    case 'V':
                        $$ = 5;
                        break;
                    case 'V':
                        $$ = 5;
                        break;
                }
            }
            ;
