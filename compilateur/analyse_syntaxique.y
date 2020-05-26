%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "symboltable.h"
    #include "asm.h"

    int portee = 0;
    int index_temp = 100;
    FILE * ptr2 = NULL;
    int debut_test = -1;
%}

%union{
    char str[100];
    int nb;
}


%token tMAIN
%token tOP
%token tOB
%token tCB
%token tCP
%token tCONST
%token tSEP
%token tENDINST
%token tPRINTF
%token tINT
%token <nb> tNOMBRE 
%token <str>tVARIABLE

%token <nb> tIF
%token <nb> tELSE
%type <nb> If_seul

%token <nb> tWHILE

%type <nb> Expression 

%token tVIRGULE
%token <str> tTEXT
%left tMOINS tPLUS
%left tMUL tDIV
%left tEGAL

%start S
%%

S:Fonctions    {
    //print_table();
}

Fonctions:Fonction Fonctions 
         |Fonction    


Fonction:tINT tMAIN Args Bloc    

Args:tOP tCP 

Bloc:tOB {portee ++;} Instructions tCB {portee --;}

Instructions:Instruction Instructions
            |Instruction    

Instruction :Ligne tENDINST
            |If
            |While

Ligne       :Affectation
            |Declaration
            |AffectDecla
            |tPRINTF tOP ToPrint tCP

/*
Testing:    If Elses
            |If

            
If          :tIF Condition Bloc

Elses:      |tE

*/

If          :If_seul{
                        modify_inst_2($1, get_nextLine());
                    }
            |If_seul tELSE{
                            $2 = add_inst("JMP", index_temp - 1, -1, 0);
                            modify_inst_2($1, get_nextLine() - 1);
            }
            Bloc{
                modify_inst_1($2, get_nextLine() - 1);
            }

If_seul     :tIF tOP Expression tCP {
                $1 = add_inst("JMF", index_temp - 1, -1, 0);
                index_temp = 100;
            }
            Bloc{
                $$ = $1;
            }

While       :tWHILE{$1 = get_nextLine() - 1;} tOP Expression tCP{
                                            add_inst("JMF", index_temp - 1, -1, 0);
                                            index_temp = 100;

            }
            Bloc{
                add_inst("JMP", $1, -1, -1);
                printf("%d\n", get_nextLine());
                modify_inst_2(get_next_JMF($1), get_nextLine() - 1);
            }





ToPrint     :Expression{
                add_inst("PRI", index_temp - 1, -1, 0);
                index_temp = 100;
            }

Expression  :tOP Expression tCP                     {   
                                                        debut_test = get_nextLine();
                                                    }
            |Expression tPLUS Expression            {
                                                        index_temp --;
                                                        add_inst("ADD",  index_temp -1, index_temp -1, index_temp);
                                                    }

            |Expression tMOINS Expression           {
                                                        index_temp --;
                                                        add_inst("SOU",  index_temp -1, index_temp -1, index_temp);
                                                    }

            |Expression tMUL Expression             {
                                                        index_temp --;
                                                        add_inst("MUL",  index_temp -1, index_temp -1, index_temp);
                                                    }

            |Expression tDIV Expression             {
                                                        index_temp --;
                                                    }

            |tNOMBRE                                {
                                                        add_inst("AFC",  index_temp, $1, 0);
                                                        index_temp++; 
                                                    }
            |tVARIABLE                              {
                                                        
                                                        int addr = find_address($1);
                                                        add_inst("COP",  index_temp, addr, 0);
                                                        index_temp ++;
                                                    }

Affectation :tVARIABLE tEGAL Expression             {
                                                        symbolExist($1); 
                                                        int addr = find_address($1); 
                                                        add_inst("COP",  addr, 100, 0);
                                                        index_temp = 100;
                                                    }

Declaration :tINT PlusieurVar

AffectDecla :tCONST tINT tVARIABLE tEGAL Expression {   
                                                        add_symbole($3, 1, 1, portee);
                                                        int addr = find_address($3);  
                                                        index_temp = 100;
                                                        add_inst("COP",addr, 100, 0 );
                                                    }

            |tINT tVARIABLE tEGAL Expression        {
                                                        add_symbole($2, 0, 1, portee);
                                                        int addr = find_address($2); 
                                                        add_inst("COP",  addr, 100, 0);
                                                        index_temp = 100;
                                                    }

PlusieurVar:tVARIABLE {add_symbole($1, 0, 0, portee);}
           |tVARIABLE tVIRGULE PlusieurVar{add_symbole($1, 0, 0, portee);}


%%

int main(void){
    ptr2 = fopen("./asmTest.txt", "w");
    init_asm();
    yyparse();
    printf("Instruction : \n\n");
    print_tab();
    printf("\n\nDebug : \n\n");
    print_tab_debug();
    fclose(ptr2);
}

int yyerror(char *s){
    fprintf(stderr, "%s\n", s);
}

