%{
    #include "roman.tab.h"
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(char* s);
%}


%token EOL
%token I V X L C D M
%%


line:
| line number EOL { printf("%d\n", $2);}
;

number: thousands lessThanThousand {$$ = $1 + $2;}
| lessThanThousand {$$ = $1;}
;

thousands: M {$$ = $1;}
| thousands M {$$ = $1 + $2;}
;
lessThanThousand: nineHundreds {$$ = $1;}
| lessThanNineHundred {$$ = $1;}
;

nineHundreds: C M {$$ = $2 - $1;}
| C M lessThanHundred {$$ = $2 - $1 + $3;}
;

lessThanNineHundred: D lessThanFiveHundred {$$ = $1 + $2;}
| D {$$ = $1;}
| lessThanFiveHundred {$$ = $1;}
;

lessThanFiveHundred: fourHundreds {$$ = $1;}
| lessThanFourHundred {$$ = $1;}
;

fourHundreds: C D {$$ = $2 - $1;}
| C D lessThanHundred {$$ = $2 - $1 + $3;}
;

lessThanFourHundred: hundreds lessThanHundred {$$ = $2 + $1;}
| hundreds {$$ = $1;}
| lessThanHundred {$$ = $1;}
;

hundreds: C {$$ = $1;}
| C C {$$ = $1 + $2;}
| C C C {$$ = $1 + $2 + $3;}
;

lessThanHundred: nineties {$$ = $1;}
| lessThanNinety {$$ = $1;}
;

nineties: X C {$$ = $2 - $1;}
| X C lessThanTen {$$ = $2 - $1 + $3;}
;

lessThanNinety: L lessThanforty {$$ = $2 + $1;}
| L {$$ = $1;}
| lessThanforty {$$ = $1;}
| fortys {$$ = $1;}
;

fortys: X L {$$ = $2 - $1;}
| X L lessThanTen {$$ = $2 - $1 + $3;}
;

lessThanforty: tens lessThanTen {$$ = $2 + $1;}
| tens {$$ = $1;}
| lessThanTen {$$ = $1;}
;

tens: X {$$ = $1;}
| X X {$$ = $1 +$2;}
| X X X {$$ = $1 + $2 + $3;}
;

lessThanTen: I X {$$ = $2 - $1;}
| V {$$ = $1;}
| V units {$$ = $2 + $1;}
| I V {$$ = $2 - $1;}
| units {$$ = $1;}
;

units: I {$$ = $1;}
| I I {$$ = $1 + $2;}
| I I I {$$ = $1 + $2 + $3;}
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
  fprintf(stderr, "%s\n", s);
}
