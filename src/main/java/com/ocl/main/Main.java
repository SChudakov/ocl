package com.ocl.main;

import com.ocl.parser.OCLParser;
import com.ocl.scanner.OCLScanner;
import java_cup.runtime.DefaultSymbolFactory;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("OCL accepts 1 argument which is " +
                    "a path to a file to be syntactically verified");
        } else {
            String filePath = args[0];

            try {
                OCLParser p = new OCLParser(new OCLScanner(new FileInputStream(filePath)), new DefaultSymbolFactory());
                p.parse();
                System.out.println("\n\nOCL FILE IS CORRECT\n");
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
