/* --------------------------Usercode Section------------------------ */
package com.ocl.scanner;
import java_cup.runtime.*;
import com.ocl.parser.OCLSymbol;

/* -----------------Options and Declarations Section----------------- */
%%
%class OCLScanner
%line
%column
%cupsym OCLSymbol
%cup
%public


%{
    StringBuffer string = new StringBuffer();
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
    private void printString() {
        System.out.print(yytext());
    }
%}

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]

Comment        = "--" {InputCharacter}* {LineTerminator}?

/*identifier*/
identifier = [a-z][A-Za-z_0-9]*

/*typename*/
typename = [A-Z][A-Za-z_0-9]*

/*number literal*/
integer = ([+-]?[1-9]\d*|0)

/*real number*/
real = [0-9]+(\\.[0-9]+)?

/*boolean constant*/
boolean = true | false


%state STRING_LITERAL

/* ------------------------Lexical Rules Section---------------------- */
%%

<YYINITIAL> {

    ","                { printString(); return symbol(OCLSymbol.COMA); }
    ";"                { printString(); return symbol(OCLSymbol.SEMICOLON); }
    ":"                { printString(); return symbol(OCLSymbol.COLON); }
    "("                { printString(); return symbol(OCLSymbol.LPAREN); }
    ")"                { printString(); return symbol(OCLSymbol.RPAREN); }
    "{"                { printString(); return symbol(OCLSymbol.LCURLY_BRACE); }
    "}"                { printString(); return symbol(OCLSymbol.RCURLY_BRACE); }
    "["                { printString(); return symbol(OCLSymbol.LSQUARE_BRACKET); }
    "]"                { printString(); return symbol(OCLSymbol.RSQUARE_BRACKET); }

    "+"                { printString(); return symbol(OCLSymbol.PLUS); }
    "-"                { printString(); return symbol(OCLSymbol.MINUS); }
    "*"                { printString(); return symbol(OCLSymbol.MULTIPLICATION); }
    "/"                { printString(); return symbol(OCLSymbol.DIVISION); }

    ">"                { printString(); return symbol(OCLSymbol.GR); }
    ">="               { printString(); return symbol(OCLSymbol.GREQ); }
    "<"                { printString(); return symbol(OCLSymbol.LE); }
    "<="               { printString(); return symbol(OCLSymbol.LEQ); }
    "="                { printString(); return symbol(OCLSymbol.EQ); }
    "<>"               { printString(); return symbol(OCLSymbol.NEQ); }

    "=="               { printString(); return symbol(OCLSymbol.EQEQ); }

    "and"              { printString(); return symbol(OCLSymbol.AND); }
    "or"               { printString(); return symbol(OCLSymbol.OR); }
    "not"              { printString(); return symbol(OCLSymbol.NOT); }
    "xor"              { printString(); return symbol(OCLSymbol.XOR); }

    "|"                { printString(); return symbol(OCLSymbol.OR_SYMBOL); }

    "."                { printString(); return symbol(OCLSymbol.DOT); }
    "->"               { printString(); return symbol(OCLSymbol.ARROW); }
    "::"               { printString(); return symbol(OCLSymbol.DOUBLECOLON); }
    "#"               { printString(); return symbol(OCLSymbol.HASHTAG); }
    ".."                { printString(); return symbol(OCLSymbol.DOUBLEDOT); }
    "@"                { printString(); return symbol(OCLSymbol.AT); }

    "@pre"             { printString(); return symbol(OCLSymbol.PRE_OPER); }
    "implies"          { printString(); return symbol(OCLSymbol.IMPLIES); }


    "context"          { printString(); return symbol(OCLSymbol.CONTEXT); }
    "inv"              { printString(); return symbol(OCLSymbol.INV); }
    "pre"              { printString(); return symbol(OCLSymbol.PRE); }
    "post"             { printString(); return symbol(OCLSymbol.POST); }

    "attr"             { printString(); return symbol(OCLSymbol.ATTR); }
    "body"             { printString(); return symbol(OCLSymbol.BODY); }

    "def"              { printString(); return symbol(OCLSymbol.DEF); }
    "let"              { printString(); return symbol(OCLSymbol.LET); }

    "if"               { printString(); return symbol(OCLSymbol.IF); }
    "then"             { printString(); return symbol(OCLSymbol.THEN); }
    "else"             { printString(); return symbol(OCLSymbol.ELSE); }
    "endif"            { printString(); return symbol(OCLSymbol.ENDIF); }

    "package"          { printString(); return symbol(OCLSymbol.PACKAGE); }
    "endpackage"       { printString(); return symbol(OCLSymbol.ENDPACKAGE); }

    "in"               { printString(); return symbol(OCLSymbol.IN); }
    "oper"             { printString(); return symbol(OCLSymbol.OPER); }

    {identifier}       { printString(); return symbol(OCLSymbol.IDENTIFIER, yytext()); }

    {typename}         { printString(); return symbol(OCLSymbol.TYPENAME, yytext()); }

    {integer}          { printString(); return symbol(OCLSymbol.INT, Integer.valueOf(yytext()));}

    {real}             { printString(); return symbol(OCLSymbol.REAL, Double.valueOf(yytext()));}

    {boolean}          { printString(); return symbol(OCLSymbol.BOOLEAN, Boolean.valueOf(yytext()));}

    {Comment}          { printString();  }

    {WhiteSpace}       { printString();  }

    \'                 { printString(); string.setLength(0); yybegin(STRING_LITERAL); }
}

<STRING_LITERAL> {
      \'                             { yybegin(YYINITIAL);
                                       return symbol(OCLSymbol.STRING_LITERAL,
                                       string.toString()); }
      [^\n\r\'\\]+                   { string.append( yytext() ); }
      \\t                            { string.append('\t'); }
      \\n                            { string.append('\n'); }

      \\r                            { string.append('\r'); }
      \\\'                           { string.append('\''); }
      \\                             { string.append('\\'); }
}

[^]                    { throw new Error("Illegal character <"+yytext()+">"); }