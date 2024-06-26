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

int main(int argc, char **argv) {
    FILE    *fd;

    if (argc == 2)
    {
        if (!(fd = fopen(argv[1], "r")))
        {
            perror("Error: ");
            return (-1);
        }
        yyset_in(fd);
        yylex();
        fclose(fd);
    }
    else
        printf("Usage: a.out filename\n");
    return (0);
}
