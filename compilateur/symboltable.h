
struct var {
        char nom[20];
        int addrr;
        int constante;
        int init;
        int portee;
    };

extern struct var tableau[1024];

extern int tab_t[1024];

void add_symbole(char * nom, int constante, int init, int portee);
void deleteVariableOfDepth(int portee);
int symbolExist (char * nom);
void print_table ();
int find_address(char * nom);