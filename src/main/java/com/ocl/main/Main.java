package com.ocl.main;

import com.ocl.parser.OCLParser;
import com.ocl.scanner.OCLScanner;
import java_cup.runtime.DefaultSymbolFactory;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Main {
    private static final String OCL_TEST_FILE = "src\\main\\resources\\examples\\ocl_example_1.txt";

    public static void main(String[] args) {
        try {
            OCLParser p = new OCLParser(new OCLScanner(new FileInputStream(OCL_TEST_FILE)), new DefaultSymbolFactory());
            p.parse();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
