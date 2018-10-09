%{
%}


YEAR          [0-9]{2,3}
NEWCOUNTY     T
COUNTIES      C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SOW|WH|WX|WW|WD
OLDCOUNTY     LK|TN|TS|W
SERIALNO      [0-9]{1,6}


%%


{YEAR}"-"{NEWCOUNTY}"-"{SERIALNO}  {
                                      char* arr;
                                      arr[0] = yytext[0];
                                      arr[1] = yytext[1];
                                      int year = atoi(arr);
                                      if(year >= 14 && (atoi(&yytext[2]) <= 2 && yytext > 0))
                                      {
                                        int yearsSince = 18 - year;
                                        printf("%d\n", yearsSince);
                                      }
                                      else
                                      {
                                        printf("INVALID\n");
                                      }
                                      return 0;
                                      }

{YEAR}"-"({OLDCOUNTY})"-"{SERIALNO}  {char* arr;
                                      arr[0] = yytext[0];
                                      arr[1] = yytext[1];
                                      int year = atoi(arr);
                                      if(year == 13 && (atoi(&yytext[2]) <= 2 && yytext > 0))
                                      {
                                        int yearsSince = 18 - year;
                                        printf("%d\n", yearsSince);
                                      }
                                      else if(year >= 87)
                                      {
                                        int yearsSince = 2018 - (1900 + year);
                                        printf("%d\n", yearsSince);
                                      }
                                      else if (year < 13)
                                      {
                                        int yearsSince = 18 - year;
                                        printf("%d\n", yearsSince);
                                      }
                                      else
                                      {
                                        printf("INVALID\n");
                                      }
                                      return 0;
}
{YEAR}"-"({COUNTIES})"-"{SERIALNO}  {char* arr;
                                      arr[0] = yytext[0];
                                      arr[1] = yytext[1];
                                      int year = atoi(arr);
                                      if(year >= 13 && (atoi(&yytext[2]) <= 2 && yytext > 0))
                                      {
                                        int yearsSince = 18 - year;
                                        printf("%d\n", yearsSince);
                                      }
                                      else if(year >= 87)
                                      {
                                        int yearsSince = 2018 - (1900 + year);
                                        printf("%d\n", yearsSince);
                                      }
                                      else if (year < 13)
                                      {
                                        int yearsSince = 18 - year;
                                        printf("%d\n", yearsSince);
                                      }
                                      else
                                      {
                                        printf("INVALID\n");
                                      }
                                      return 0;
}

.     {}
[ \t]|[\n]      { }

%%

int main()
{
	fflush(stdin);
  //printf("In Main");
  yylex();
  //printf("out Main");
  return 0;
}
