1) Write a Lex program to validate Indian PAN numbers in the format [A-Z]{5}[0-9]{4}[A-Z]{1}. CODE:
%{
#include <iostream>
#include <string>
#include <vector>
using namespace std;
bool validate = false;
%}
%%
[A-Z]{5}[0-9]{4}[A-Z]{1} {validate = true; printf("PAN NUMBER IS VALID: %s\t",
yytext); }
. {}
"\n" {}
%%
int yywrap(){
return 1;
}
int main(void){
yylex();
if(!validate) printf("PAN NUMBER IS NOT VALID\n");
return 0;
}
OUTPUT:
VILASINI V 22BCE1278
2) Write a Lex program to read a CSV file and separate each row into individual tokens (fields), handling quoted strings correctly. Code:
%{
#include <stdio.h>
#include <string.h>
%}
%%
, {}
\n {printf("End of line\n");}
[^,\n]+ { printf("Token: %s\n", yytext);}
%%
int main() {
yylex();
return 0;
}
Output:
3) Write a Lex program to recognize numbers, operators, parentheses, and functions (sin, cos, log)
from a mathematical expression. Code:
%{
#include <stdio.h>
#include <string.h>
%}
%%
[0-9]+ { printf("Number: %s\n", yytext);}
"+"|"-"|"/"|"*" {printf("Operator: %s\n", yytext);}
"("|")"|"{"|"}"|"["|"]" {printf("Parenthesis: %s\n", yytext);}
"sin"|"cos"|"tan" {printf("Function: %s\n",yytext);}
. {}
%%
int main() {
yylex();
return 0;
}
VILASINI V 22BCE1278
4) Write a Lex program to recognize both integer and floating-point numbers, including negative
numbers and scientific notation. Code:
%{
#include <stdio.h>
#include <stdlib.h>
%}
DIGIT [0-9]
SIGN [+-]?
INT {SIGN}{DIGIT}+
FLOAT {SIGN}({DIGIT}+"."{DIGIT}*|{DIGIT}*"."{DIGIT}+)
SCI ({INT}|{FLOAT})[eE]{SIGN}?{DIGIT}+
%%
{SCI} { printf("Scientific notation: %s\n", yytext); }
{FLOAT} { printf("Floating-point: %s\n", yytext); }
{INT} { printf("Integer: %s\n", yytext); }
[ \t\n]+ { /* ignore whitespace */ }
. { printf("Invalid token: %s\n", yytext); }
%%
int main(void) {
printf("Enter numbers (Ctrl+D to stop):\n");
yylex();
return 0;
}
int yywrap(void) {
return 1;
}
OUTPUT:
VILASINI V 22BCE1278
5) Write a Lex program to validate dates in the formats DD/MM/YYYY and YYYY-MM-DD. Ensure the day and month values are in valid ranges
Code:
%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
[0-9]{2}[/][0-9]{2}[/][0-9]{4} {printf("Valid date (DD/MM/YYYY): %s\n",
yytext);}
[0-9]{4}[-][0-9]{2}[-][0-9]{2} {printf("Valid date (YYYY-MM-DD): %s\n",
yytext);}
. { printf("Invalid token: %s\n", yytext); }
%%
int main(void) {
printf("Enter Dates (Ctrl+D to stop):\n");
yylex();
return 0;
}
int yywrap(void) {
return 1;
}
Output:
06) Write a Lex program to recognize email id - Match valid email patterns
like user@example.com & Check that they contain a @ and a domain name
with .com, .org, etc.
Code:
VILASINI V 22BCE1278
%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.(com|org|net|edu|gov) {printf("Valid
email: %s\n", yytext);}
. { printf("Invalid token: %s\n", yytext); }
%%
int main(void) {
printf("Enter Email ID (Ctrl+D to stop):\n");
yylex();
return 0;
}
int yywrap(void) {
return 1;
}
Output:
07) Write a Lex program to recognize vehicle registration number. (Example:
TN10AB1234
Code:
%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4} {
printf("Vehicle Registration Number: %s\n", yytext);
}
VILASINI V 22BCE1278 . { printf("Invalid token: %s\n", yytext); }
%%
int main(void) {
printf("Enter Vehicle Number (Ctrl+D to stop):\n");
yylex();
return 0;
}
int yywrap(void) {
return 1;
}
Output:
08) Write a lex program to recognize Email + Phone + URL Extractor from a
Document. In one pass, detect all three types of patterns from mixed input.
Maintain separate counters for each category. Output them in sorted order.
Code:
%{
#include <stdio.h>
#include <string.h>
int email_count = 0;
int phone_count = 0;
int url_count = 0;
char emails[100][256];
char phones[100][256];
char urls[100][256];
%}
EMAIL [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}
PHONE (\+?[0-9]{1,3}[-. ]?)?([0-9]{3}[-. ]?[0-9]{3}[-. ]?[0-9]{4})
URL (https?:\/\/)?(www\.)?[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}([\/a-zA-Z0-9._%+-
]*)?
%%
{EMAIL} {
VILASINI V 22BCE1278
strcpy(emails[email_count++], yytext);
}
{PHONE} {
strcpy(phones[phone_count++], yytext);
}
{URL} {
strcpy(urls[url_count++], yytext);
}
[ \t\n]+ { }
. { }
%%
int main(void) {
yylex();
printf("\n=== Extracted Data ===\n");
printf("\nEmails (%d):\n", email_count);
for (int i = 0; i < email_count; i++)
printf(" %s\n", emails[i]);
printf("\nPhones (%d):\n", phone_count);
for (int i = 0; i < phone_count; i++)
printf(" %s\n", phones[i]);
printf("\nURLs (%d):\n", url_count);
for (int i = 0; i < url_count; i++)
printf(" %s\n", urls[i]);
return 0;
}
int yywrap(void) {
return 1;
}
