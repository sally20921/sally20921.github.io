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
*  The built-in function map is a higher-order function that takes two arguments. It accepts a function and an arbitrary  amount of sequences as arguments. If a single sequence is passed in, the  result of *map* is a new list containing the result  of the  function applied to every item in the sequence. 

### reduce
* The built-in-function *reduce* is an other common functional construct. *reduce* accepts a  function and a sequence as parameters. It applies the  function begging  with  the first two items of the sequence and then applies the  function to the results of the previous application and the next  item from the sequence. This repeats until the sequence exhausts. 

### filter 
* The built-in-function *filter* is another functional construct.  This function accepts a *predicate function* and a sequence as a parameters. A predicate function accepts a single item and returns a boolean. 

# List Comprehensions 
* List  comprehensions allow for the creation of lists in one line of code. 
* List  comprehensions not only offer the functionality of *map*, but also that of *filter*. 
```python
pos = [num for num in nums if num>0]
```

## Nested list comprehensions
* List comprehensions may be nested as well. 
```python
matrix = [[x for x  in range(4)] for y in range(3)]
```

#  Generator Expressions
* A general theme of Python, as it  progressed from version 2 to  3,  is laziness. 
* Generator expressions look very similar  to list comprehensions, but  the brackets are replaced with parenthese. 

```python
# list comprehension
str = [str(num) for num in [0,1,2]]

# generator expression
strs_gen = (str(num) for num in [0,1,2])
```
* Generator expressions do not return a list, rather a generator object, which  follows the *iterator protocol*

## Generator (expressions) exhaust
* This leads to one  of the  first differences between a generator expression and a list comprehension. A list comprehension returns a list - which is *iterable* - it can be  iterated over  many  times. A generator expression can only  be  iterated over once. 

## Generators and generator expressions 
* Generator expressions offer a subset of functionality available in generators. 

# Dictionary Comprehensions 
* PEP274 introduced *Dictionary Comprehensions* and *Set  Comprehensions* in Python 2.7. These are analogous to  list comprehensions. To  create  a dict comprehensions, simply replace [] with  {} and provide a key:value mapping  for the accumulated object.

```python
str2int =  {str(num):num for  num in range(3)}
```

# Set Comprehensions 
* Simply replace [] with  {} in a list comprehension to  get a set instead. 

# Iteration in PYthon 
* Sequence-like  objects are  iterable in Python and ethe elements in them can be  accessed one at  a  time. Using the *for* statement, these objects can be iterated over. Looping works for lists, sets, dictionaries, and even strings. User defined classes may also be iterable by implementing the **__iter__** special method. 

## The Iterator Protocol
* Objects in Python have special methods or *dunder methods* (double underscore). 
