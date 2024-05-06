%{
#include <stdio.h>
%}

/*AC Tokens*/
%%
"//".*                       { printf("COMMENT\n"); }
"f"                          { printf("floatdcl "); }
"i"                          { printf("intdcl "); }
"p"                          { printf("print "); }
[a-e]|[g-h]|[j-o]|[q-z]      { printf("id "); }
"="                          { printf("assign "); }
"+"                          { printf("plus "); }
"-"			     { printf("minus "); }
[0-9]+                       { printf("inum "); }
[0-9]+"."[0-9]+              { printf("fnum "); }
" "                          { /*Any whitespace*/ }
%%

int main() {
    yylex();
    return 0;
}
