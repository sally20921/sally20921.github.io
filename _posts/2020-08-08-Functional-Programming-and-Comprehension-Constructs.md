---
layout: post
title: Functional Programming and Comprehension Construct
categories: Python  
tags: [Intermediate Python Programming]
excerpt: Intermediate Python Programming
---

# Programming Styles
* Python supports multiple programming paradigms. The following programming styles are available:
 * Imperative/Procedural
 * Object Oriented 
 * Declarative/Functional 
 
* In the *imperative* style programming, statements are executed to  mutate the state. *Procedural* programming is a subset of imperative  that relies on using procedures to evaluate  these state changing computations.  In Python, procedures are akin to *functions*. State  for the  program is stored in local or gloabal data  structures and is manipulated by invoking functions. This is the same style that C uses. 
* In  *object oriented* programming, objects are the main methods of computation. In addition these objeccts hold program state, and allow mutation of that state through  invocation of their methods. Java is object oriented, as is C++/ Though C++ can also be  programmed in an imperative style as well = because it is a superset of C.
* In a  *declarative*  style of programming, the code describes *what* rather than the *how*. SQL, for example, is declarative because it describe  the relational algebra for the result of a query. Other examples of declarative programming are XSLT and *regular expressions*, because both describe  the result rather the mechanics of calculating  it.  
* In contrast,  it  is possible  to write Python code  in an imperative  style to join, select,  and filter rows of data. A SQL statemetn would describe teh result, while  the Python version would describe  the process  of computing  the result - the code that does looping  and filtering. Python is commonly used to  process XML and test  without resorting to  XSLT  or using regular  expressions. 
* *Functional* programming  is a  subset of declarative  programming that  achieves  the logic of  the  program by invoking  functions. Usually, in strict functional languages, *side effects* are kept to a minimum or eliminated. 
* Because functions are *first-class* in Python, it includes for many functional features. 

# Functional Constructs in Python
* Python functions  are first-class  functions. Languages that  have first-class functions, treat functions as data. Like data, functions can be passes into other  functions, or  returned from other functions. Python has a built-in type - *function*- that is used to represent an instance of a function. The  Java language, for example, does not  have support for first-class  functions (or methods). In Java, methods can only be invoked. Python in addition to allowing  functions to be  invoked, also allows for functinos to  be passed around - first-class functions. 
* A function exists in the  namespace it is defined in. 
* First-class functions  enable functional constructs in Python. These constructs were added to Python in version 1.4.  They include  *lambda*, *map*, *reduce*, and *filter*. 

##  lambda
* Lambda functions offer  a subset of  the  functionality of normal functions. However, they are  important in functional programming, and worth understanding. Simple one-liner functions are prime candidates for *lambda* expressions. Because of the differene in the appearance between *lambda* and normal functions, some programmers find *lambda* functions harder to understand and frown upon their use. 
* The *lambda* expression is  used to create one line anonymous functions in Python. 
```python
mul = lambda x, y: x*y 
```
* This creates a function *mul*, that  accepts two arguments, x and y, and returns their product. Note  that arguments come before the colon and there is an implicit  return of the  expression on the  right hand side of the colon.
* The *lambda* expression creates a new instance of a function - *mul*.
* This function is *callable* and can be invoked by adding parenthese to  the name 
* A *lambda* expression can have zero parameters. 
* *lambda* expressions support named or default parameters as well 
* In addition, variable parameters and variable keyword parameters are supported in *lambda* expressions. As such, these expressions are able to accept any number of arguments if they are so designed. 
* The biggest drawback to *lambda* expression is that they only support  a single *expression* in their body. This severly handicaps their utility. They are commonly used for  predicate  functions, simple converters, destructuring of objects, and enabling lazy evaluation.

## Higher-order functions 
*  Another functional programming  term is *higher-order function*. A higher-order function is a function that  accepts (first-class) functions as parameters, or return functions as results. This construct enables composition of functions, invoking arbitrary functions any number of times or generating new functions on the fly. Also, the  built-in functinal functions - map, filter and reduce - accept  a function as  a parameter. 

### map 
*  The built-in function map is a higher-order functino that takes two arguments. It accepts a function and an arbitrary  amount of sequences as arguments. If a single sequence is passed in, the  result of *map* is a new list containing the result  of the  function 
