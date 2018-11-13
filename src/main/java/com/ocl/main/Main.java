package com.ocl.main;

import com.ocl.parser.OCLParser;
import com.ocl.scanner.OCLScanner;
import java_cup.runtime.DefaultSymbolFactory;
import java_cup.runtime.Symbol;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Main {
    private static final String CALCULATOR_TEST_FILE = "src\\main\\resources\\calcuator.txt";
    private static final String OCL_TEST_FILE = "src\\main\\resources\\ocl.txt";

    public static void main(String[] args) {
        /*try {
            CalculatorParser p = new CalculatorParser(new CalculatorScanner(new FileInputStream(CALCULATOR_TEST_FILE)), new DefaultSymbolFactory());
            p.parse();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }*/
        try {
            OCLScanner scanner = new OCLScanner(new FileInputStream(OCL_TEST_FILE));
            while (scanner.next_token().sym != 0)  {
                System.out.println();
            }
            OCLParser p = new OCLParser(new OCLScanner(new FileInputStream(OCL_TEST_FILE)), new DefaultSymbolFactory());
            p.parse();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
