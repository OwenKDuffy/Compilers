%{
%}


YEAR          [0-9]{2,3}
NEWCOUNTY     C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW
OLDCOUNTY     L|LK|TN|TS|W|WD
SERIALNO      [0-9]{1,6}


%%


{YEAR}"-"({NEWCOUNTY}|{OLDCOUNTY})"-"{SERIALNO}  {int year = atoi({YEAR})/*printf("plate\n");*/}
.     {}
[ \t]|[\n]      { }

%%

int main()
{
  yylex();
  return 0;
}
