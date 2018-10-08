%{
/*enum yyTokenType
{
	YEAR = 258,
  COUNTY = 259,
  SERIAL = 260
}*/
%}

%%

[0-9]{2,3}      {int yyear = atoi(yytext); printf("YEAR = %d\n", yyear);/*year*/}
C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW {printf("NEWCOUNTY = %s\n", yytext);/*County*/}
L|LK|TN|TS|W|WD {printf("OLDCOUNTY = %s\n", yytext);/*County*/}
[0-9]{1,6}      {int yserial = atoi(yytext); printf("SERIAL = %d\n", yserial); /*serial*/}
"-"             { }
[ \t]|[\n]      { }
%%

int main()
{
  yylex();
  return 0;
}
