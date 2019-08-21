# OCL

Lexical analyzer of OCL language based on Cup and JFlex

## Getting Started

The following sections will help you download and install a copy of this project on your local machine

### Prerequisites

Before starting install the `Java 8` as well the latest version of `Maven` and `Git`

### Installation

First navigate to the working directory you want the project to be in.
Then download the source code with

```
git clone https://github.com/SChudakov/ocl.git
```

After that navigate to the project directory with

```
cd ocl
```

and build the project with

```
mvn clean compile assembly:single
```

This will create `ocl.jar` archive in the `target` subdirectory of the project directory.

### Usage

The OCL parser accepts one command line parameter which is a path to a file to be syntactically verified.

Test parser functionality by running

Windows `java -jar target\ocl.jar src\main\resources\examples\ocl_example_1.txt` 

Linux / Darwin `java -jar target/ocl.jar src/main/resources/examples/ocl_example_1.txt` 


## Authors

* **Semen Chudakov** - [SChudakov](https://github.com/SChudakov)
* **Andrii Borziak** - [AndreaB330](https://github.com/AndreaB330)
* **Vadym Bezdushnyi** - [VadymBezdushnyi](https://github.com/VadymBezdushnyi)