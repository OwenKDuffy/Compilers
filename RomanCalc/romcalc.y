%{
    #include "romcalc.tab.h"
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(char* s);
    void printRoman(int i);
%}


%token EOL
%token Z I V X L C D M
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

number: thousands lessThanThousand {$$ = $1 + $2; }
| lessThanThousand {$$ = $1;}
| Z {$$ = $1;}
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
    /*fflush(stdin);*/
    yyparse();
    return 0;
}
void printRoman(int i)
{
    if(i < 0)
    {
        printf("-");
        printRoman(i * -1);
        return;
    }
    if(i >= 1000)
    {
        printf("%s", "M");
        printRoman(i - 1000);
        return;
    }
    else if(i >= 900)
    {
        printf("%s", "CM");
        printRoman(i - 900);
        return;
    }
    else if(i >= 500)
    {
        printf("%s", "D");
        printRoman(i - 500);
        return;
    }
    else if(i >= 400)
    {
        printf("%s", "CD");
        printRoman(i - 400);
        return;
    }
    else if(i >= 100)
    {
        printf("%s", "C");
        printRoman(i - 100);
        return;
    }
    else if(i >= 90)
    {
        printf("%s", "XC");
        printRoman(i - 90);
        return;
    }
    else if(i >= 50)
    {
        printf("%s", "L");
        printRoman(i - 50);
        return;
    }
    else if(i >= 40)
    {
        printf("%s", "XL");
        printRoman(i - 40);
        return;
    }
    else if(i >= 10)
    {
        printf("%s", "X");
        printRoman(i - 10);
        return;
    }
    else if(i >= 9)
    {
        printf("%s", "IX");
        printRoman(i - 9);
        return;
    }
    else if(i >= 5)
    {
        printf("%s", "V");
        printRoman(i - 5);
        return;
    }
    else if(i >= 4)
    {
        printf("%s", "IV");
        printRoman(i - 4);
        return;
    }
    else if(i >= 1)
    {
        printf("%s", "I");
        printRoman(i - 1);
        return;
    }
    else if(i == 0)
    {
        printf("\n");
        return;
    }
}

void yyerror(char *s)
{
  fprintf(stderr, "%s\n", s);
}
