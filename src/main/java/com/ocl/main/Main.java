package com.ocl.main;

import com.ocl.parser.CalculatorParser;
import com.ocl.scanner.CalculatorScanner;
import java_cup.runtime.DefaultSymbolFactory;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Main {
    private static final String TEST_FILE = "C:\\Users\\Semen\\D\\workspace.java\\ocl\\src\\main\\resources\\calcuator.txt";

    public static void main(String[] args) {
        try {
            CalculatorParser p = new CalculatorParser(new CalculatorScanner(new FileInputStream(TEST_FILE)), new DefaultSymbolFactory());
            p.parse();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
