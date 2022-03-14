---
layout: post
title:  ""
author: seri
categories: [ computer vision ]
image: assets/images/depth/1.jpg
tags: featured
---

<!--more-->

<h2> Installing Python </h2>

To install Python, we use the following method. Python is an interpreted language, and statements are executed line by line. A programmer can typically write down the series of commands in a source code file. For Python, the source code is stored in a file with a `.py` file extension. 

Python is a fully integrated and usually already installed on most of the Linux and Mac operating systems. Generally, the pre-installed Python version is 2.7. You can check the version installed on the system using the following commands:

```
import sys
print(sys.version)
```

You can also install a different versino of Python using the following commands on Linux:

```bash
sudo apt-get update
sudo apt-get install -y python3-pip
pip3 install <package name>
```
Python has to be installed on systems with Windows operating systems, as it is not pre-installed, unlike Linux/macOS. Any version of Python can be downloaded from this link: `https://www.python.org/downloads/`. You can download the software installer and run it-select Install for all users and then click on Next. You need to specify the location where you want to install the package, then click Next. After that, select the option `Add Python to environment variables' in the Customize Python dialog box, then just click Next again for final installation. When the installation is finished, you can confirm the installation by opening up Command Prompt and typing the following command:

```
python -V
```

The latest stable Python version is Python 3.7.0. The Python program can be executed by typing the following in the command line:

```
python <sourcecode_filename>.py
```
<h2> Understanding data structures and algorithms </h2>

Python has several built-in data structures, including lists, dictionaries, and sets, which we use to build customized objects. In addition, there are number of internal libraries, such as collections and math object, which allow us to create more advanced structures as well as perform calculations on those structures. Finally,  there are the external libraries such as those found in the SciPy packages. These allow us to perform a range of advanced data tasks such as logistic and linear regression, visualization, and mathematical calculations, such as operations on matrices and vectors. External libraries can be very useful for an out-of-the-box solution. However, we must also be aware that there is often a performance penalty compared to building customized objects from the ground up. By learning how to code these objects ourselves, we can target them to specific tasks, making them more efficient. This is not to exclude the role of external libraries and we will look at this in Chapter 12, "Design Techniques and Strategies". 

To begin, we will take an overview of some of the key language features that make Python such as great choice for data programming. 

<h2> The Python Environment </h2>

Python is one of the most popular and extensively used programming languages all over the world due to its readability and flexibility. A feature of the Python environment is its interactive console, allowing you to both use Python as a desktop-programmable calculator and also as an environment to write and test snippets of code. 

The `read`, `evaluate`, `print` loop of the console is a very convenient way to interact with a large code base, such as to run functions and methods or to create instances of classes. This is one of the major advantages of Python over compiled languages such as C/C++ or Java, where the `write`, `compile`, `test`, `recompile` cycle can increase development time considerably compared to Python's `read`,`evaluate`, `print` loop. Being able to type in expressions and get an immediate response can greatly speed up data science tasks. 

There are some excellent distributions of Python apart from the official CPython version. Two of the most popular available at: Anaconda and Canopy. Most distributions come with their own developer environments. Both Canopy and Anaconda include libraries for scientific, machine learning, and other data applications. Most distributions come with an editor. 

There are also a number of implementations of the Python console, apart from the CPython version. Most notable among these is teh IPython/Jupyter platform which is based on a web-based computational environment. 

<h2> Variables and Expressions </h2>

To solve a real-world problem through algorithm implementation, we first have to select the variables and then apply the operations on these variables. Variables are labels that are attached to the objects. Variables are not objects nor containers for objects; they only act as a pointer or a reference to the object. 

Here, we have created a variable, $a$, that points to a list object. We create another variable, $b$, that points to this same list object. When we append an element to this list object, this change is reflected in both $a$ and $b$. 

In Python, variable names are attached to different data types during the program execution; it is not required to first declare the datatype for teh variables. Each value is of a type (for example, a string or integer;) however, the variable name that points to this value does not have a specific type. More specifically, variables point to an object that can change their type depending on the kind of values assigned to them. Consider the following example:

```
a = 1
a = a + 0.1
```

In the preceding code example, the type of $a$ is changed from `int` to `float`, depending upon the value stored in the variable. 

<h2> Variable Scope </h2>

Scoping rules of variables inside functions are important. Whenever a function executes, a local environment (namespace) is created. This local namespace contains all the variables and parameter names that are assigned by the functions. Whenever a function is called, Python Interpreter first looks into the local namespace that is the function itself-if no match is found, then it looks at the global namespace. If the name is still not found, then it searches in the built-in namespace. If it is not found, then the interpreter would raise a `NameError` exception. Consider the following code:

```
a = 15; b = 25
def my_function():
 global a
 a = 11; b = 21

my_function()
print(a)
print(b)
```

In the preceding code, we define two `global` variables. We need to tell the interpreter, using the keyword `global`, that inside the function we are referring to a `global` variable. When we change this variable to `11`, these changes are reflected in the global scope. However, the `b` variable we set to `21` is local to the function, and any changes made to it inside the function are not reflected in the global scope. When we run the function and print `b`, we see that it retains its global value. 

In addition, let's consider another interesting example:

```
a = 10
def my_function():
 print(a) 
 a = a+1 

my_function()
```
The preceding code gives an error because assignment to a variable in a scope makes that variable a local variable to that scope. In the preceding example, in the `my_function()` assignment to the `a` variable, the compiler assumes `a` as a local variable, and that is why the earlier `print()` function tries to print a local variable `a`, which is not initialized as a local variable; thus, it gives an error. It can be resolved by accessing the outer scope variable by declaring it as `global`:

```
a = 10
def my_function():
 global a
 print(a)
 a = a+1 

my_function()
```

So, in Python, the variables that are referenced inside a function are global implicitly, and if the `a` variable is assigned a value anywhere inside the function's body, it is assumed to be a local variable unless explicitly declared as global. 

<h3> Flow Control and Iteration </h3>

Python programs consist of a sequence of statements. The interpreter executes each statement in order until there are no more statements. This is true if files run as the main program, as well as if they are loaded via `import`. All statements, including variable assignment, function definitions, class definitions, and module imports have equal status. There are no special statements that have higher priority than any other, and every statement can be placed anywhere in a program. All the instructions/statements in the program are executed in sequence in general. However, there are two main ways of controlling the flow of program execution-conditional statements and loops. 












<picture><img src="{{site.baseurl}}/assets/images/disparity.png"></picture>

<h2> References </h2>
<ul><li><a=href=""> TheAILearner </a></li>
</ul>

