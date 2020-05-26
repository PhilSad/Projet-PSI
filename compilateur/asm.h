#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define ADD 1
#define MUL 2
#define SOU 3
#define DIV 4
#define COP 5
#define AFC 6
#define JMP 7
#define JMF 8
#define INF 9
#define SUP 10
#define EQU 11
#define PRI 12


typedef struct instruction {
    char* inst;
    int arg1;
    int arg2;
    int arg3;
} instruction;

instruction *instructionsTab;
int currentSize;

void init_asm();

int add_inst(char* inst, int arg1, int arg2, int arg3);
void modify_inst_1(int value, int line);
void modify_inst_2(int value, int line);

int get_nextLine();
void print_tab();
int get_next_JMF(int cur);
void print_tab_debug();
