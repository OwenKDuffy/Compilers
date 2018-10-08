%{
%}


  YEAR = [0-9]{2,3}
  NEWCOUNTY = C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW
  OLDCOUNTY = L|LK|TN|TS|W|WD
  SERIALNO = [0-9]{1,6}


%%
  "-"         {/*do nothing*/}
  {YEAR}{NEWCOUNTY | OLDCOUNTY}{SERIALNO}  {int yyear = atoi(YEAR)
                if(yyear > 130 && (yyear % 10 <= 2)) //if year in form 1x1 or 1x2
                {
                  yyear /= 10;
                }
                else if(yyear >= 100) //if invalid three digit year
                {
                  printf("INVALID\n");
                }
                if(yyear > 87) // if before new millenium
                {
                  yyear += 1900;
                }
                else if(yyear < 18)
                {
                  yyear += 2000;
                }
                int yearsSince = (2018-yyear);
                printf("%d\n", yearsSince);
                }

%%

int main()
{
  yylex();
  return 0;
}
