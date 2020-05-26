yacc -d analyse_syntaxique.y
lex analyse_lexical_return.l
gcc y.tab.c lex.yy.c symboltable.c asm.c -o supergcc