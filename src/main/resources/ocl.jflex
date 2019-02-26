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
identifier = [A-Za-z_][A-Za-z_0-9]*

/*number literal*/
integer_literal = ([+-]?[1-9]\d*|0)

/*real number*/
real_literal = [0-9]+(\\.[0-9]+)?

/*boolean literal*/
boolean_literal = true | false


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

    "_"                { printString(); return symbol(OCLSymbol.UNDERSCORE); }

    "+"                { printString(); return symbol(OCLSymbol.PLUS); }
    "-"                { printString(); return symbol(OCLSymbol.MINUS); }
    "*"                { printString(); return symbol(OCLSymbol.STAR); }
    "/"                { printString(); return symbol(OCLSymbol.DIVISION); }

    ">"                { printString(); return symbol(OCLSymbol.GR); }
    ">="               { printString(); return symbol(OCLSymbol.GREQ); }
    "<"                { printString(); return symbol(OCLSymbol.LE); }
    "<="               { printString(); return symbol(OCLSymbol.LEQ); }
    "="                { printString(); return symbol(OCLSymbol.EQ); }
    "<>"               { printString(); return symbol(OCLSymbol.NEQ); }

    "and"              { printString(); return symbol(OCLSymbol.AND); }
    "or"               { printString(); return symbol(OCLSymbol.OR); }
    "not"              { printString(); return symbol(OCLSymbol.NOT); }
    "xor"              { printString(); return symbol(OCLSymbol.XOR); }

    "|"                { printString(); return symbol(OCLSymbol.OR_SYMBOL); }

    "."                { printString(); return symbol(OCLSymbol.DOT); }
    "->"               { printString(); return symbol(OCLSymbol.ARROW); }
    "::"               { printString(); return symbol(OCLSymbol.DOUBLECOLON); }
    ".."               { printString(); return symbol(OCLSymbol.DOUBLEDOT); }
    "@"                { printString(); return symbol(OCLSymbol.AT); }

    "^"                { printString(); return symbol(OCLSymbol.CUP); }
    "^^"               { printString(); return symbol(OCLSymbol.DOUBLE_CUP); }

    "?"               { printString(); return symbol(OCLSymbol.QUESTION_SIGN); }

    "implies"          { printString(); return symbol(OCLSymbol.IMPLIES); }

    "iterate"          { printString(); return symbol(OCLSymbol.ITERATE); }
    "forall"          { printString(); return symbol(OCLSymbol.FORALL); }
    "exists"          { printString(); return symbol(OCLSymbol.EXISTS); }

    "mod"              { printString(); return symbol(OCLSymbol.MOD); }
    "div"              { printString(); return symbol(OCLSymbol.DIV); }


    "context"          { printString(); return symbol(OCLSymbol.CONTEXT); }
    "inv"              { printString(); return symbol(OCLSymbol.INV); }
    "pre"              { printString(); return symbol(OCLSymbol.PRE); }
    "post"             { printString(); return symbol(OCLSymbol.POST); }

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

    "init"             { printString(); return symbol(OCLSymbol.INIT); }
    "derive"             { printString(); return symbol(OCLSymbol.DERIVE); }

    "static"             { printString(); return symbol(OCLSymbol.STATIC); }

    "true"             { printString(); return symbol(OCLSymbol.TRUE); }
    "false"             { printString(); return symbol(OCLSymbol.FALSE); }


    "Tuple"                  { printString(); return symbol(OCLSymbol.TUPLE); }
    "Set"                    { printString(); return symbol(OCLSymbol.SET); }
    "Bag"                    { printString(); return symbol(OCLSymbol.BAG); }
    "Sequence"               { printString(); return symbol(OCLSymbol.SEQUENCE); }
    "Collection"             { printString(); return symbol(OCLSymbol.COLLECTION); }
    "OrderedSet"             { printString(); return symbol(OCLSymbol.ORDERED_SET); }


    "OclAny"                 { printString(); return symbol(OCLSymbol.OCL_ANY); }
    "OclInvalid"             { printString(); return symbol(OCLSymbol.OCL_INVALID); }
    "OclMessage"             { printString(); return symbol(OCLSymbol.OCL_MESSAGE); }
    "OclVoid"                { printString(); return symbol(OCLSymbol.OCL_VOID); }


    "Boolean"                { printString(); return symbol(OCLSymbol.BOOLEAN); }
    "Integer"                { printString(); return symbol(OCLSymbol.INTEGER); }
    "Real"                   { printString(); return symbol(OCLSymbol.REAL); }
    "String"                 { printString(); return symbol(OCLSymbol.STRING); }
    "UnlimitedNatural"       { printString(); return symbol(OCLSymbol.UNLIMITED_NATURAL); }

    "self"                   { printString(); return symbol(OCLSymbol.SELF); }

    "null"                   { printString(); return symbol(OCLSymbol.NULL); }
    "invalid"                { printString(); return symbol(OCLSymbol.INVALID); }

    {identifier}             { printString(); return symbol(OCLSymbol.IDENTIFIER, yytext()); }

    {integer_literal}          { printString(); return symbol(OCLSymbol.INTEGER_LITERAL, Integer.valueOf(yytext()));}

    {real_literal}             { printString(); return symbol(OCLSymbol.REAL_LITERAL, Double.valueOf(yytext()));}

    {boolean_literal}          { printString(); return symbol(OCLSymbol.BOOLEAN_LITERAL, Boolean.valueOf(yytext()));}

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