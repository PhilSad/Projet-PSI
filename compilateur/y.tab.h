/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tMAIN = 258,
    tOP = 259,
    tOB = 260,
    tCB = 261,
    tCP = 262,
    tCONST = 263,
    tSEP = 264,
    tENDINST = 265,
    tPRINTF = 266,
    tINT = 267,
    tNOMBRE = 268,
    tVARIABLE = 269,
    tIF = 270,
    tELSE = 271,
    tWHILE = 272,
    tVIRGULE = 273,
    tTEXT = 274,
    tMOINS = 275,
    tPLUS = 276,
    tMUL = 277,
    tDIV = 278,
    tEGAL = 279
  };
#endif
/* Tokens.  */
#define tMAIN 258
#define tOP 259
#define tOB 260
#define tCB 261
#define tCP 262
#define tCONST 263
#define tSEP 264
#define tENDINST 265
#define tPRINTF 266
#define tINT 267
#define tNOMBRE 268
#define tVARIABLE 269
#define tIF 270
#define tELSE 271
#define tWHILE 272
#define tVIRGULE 273
#define tTEXT 274
#define tMOINS 275
#define tPLUS 276
#define tMUL 277
#define tDIV 278
#define tEGAL 279

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 13 "analyse_syntaxique.y" /* yacc.c:1909  */

    char str[100];
    int nb;

#line 107 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
