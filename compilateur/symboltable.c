#include<stdio.h>
#include<stdlib.h>
#include<string.h>

struct var {
        char nom[20];
        int addrr;
        int constante;
        int init;
        int portee;
    };

struct var tableau[1024];
int index_tableau = 0;

int checkVariable (char * nom, int portee) {
    for (int i = 0; i < index_tableau; i++){
        if (!strcmp(tableau[i].nom, nom) && tableau[i].portee <= portee){
            return 0;
        }
    }
    return 1;
}

void add_symbole(char * nom, int constante, int init, int portee){
    int err;
    err = checkVariable(nom, portee);
    if(err == 1){
        struct var new_var;
        strcpy(new_var.nom, nom);
        new_var.addrr = index_tableau;
        new_var.constante = constante;
        new_var.portee = portee;
        new_var.init = init;

        tableau[index_tableau] = new_var;

    }
    else{
        printf("Erreur : Une variable de même nom existe déjà dans la portee");
        exit(1);
    }
    
    
    index_tableau++;
}

void deleteVariableOfDepth(int portee){
    for (int i = 0; i < index_tableau; i++){
        if (tableau[i].portee == portee){
            strcpy(tableau[i].nom, "");
        }
    }
}

void symbolExist (char * nom) {
    int exist = 0;
    for (int i = 0; i < index_tableau; i++){
        if (strcmp(tableau[i].nom, nom)){
            exist = 1;
        }
    }
    
    if (exist == 0){
        printf("Erreur : La viable %s n'a pas été déclaré avant d'être affectée", nom);
        exit(1);
    }
}

void print_table () {
    for(int i = 0; i< index_tableau; i++){
        printf("nom: %s, adresse: %d, isConst: %d, initial: %d,  portee: %d \n", tableau[i].nom, tableau[i].addrr, tableau[i].constante, tableau[i].init, tableau[i].portee);
    }
}


int find_address(char * nom){
    for(int i = 0; i< index_tableau; i++){
        if(!strcmp(nom, tableau[i].nom)){
            return tableau[i].addrr;
        }
    }
    printf("Variable non trouvée");
    return -1;
}