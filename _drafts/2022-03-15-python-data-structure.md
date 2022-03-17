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

<h2> Flow control and iteration </h2>

Python programs consist of a sequence of statements. The interpreter executes each statement in order until there are no more statements. This is true if files run as the main program, as well as if they are loaded via `import`. All statements, including variable assignment, function definitions, class definitions, and module imports, have equal status. There are no special statements that have higher priority than any other, and every statement can be placed anywhere in a program. All the instructions/statements in the program are executed in sequence in general. However, there are two main ways of controlling the flow of program execution-conditional statements and loops.

The `if...else` and `elif` statements control the conditional execution of statements. The general format is t a series of `if` and `elif` statements followed by a final `else` statement:

```
x = 'one'
if x == 0:
 print('False')
elif x == 1:
 print('True')
else:
 print('Something else')
```

Note the use of the `==` operator to compare the two values. This returns `True` if both the values are equal; it returns `False` otherwise. Note also that setting `x` to a string will return `Something else` rather than generate a type error as may happen in languages that are not dynamically typed. Dynamically typed languages, however, such as Python, allow flexible assignment of objects with different types. 

The other way of controlling program flow is with loops. Python offers two ways of constructing looping, such as the `while` and `for` loop statements. A `while` loop repeats executing statements until a Boolean condition is true. A `for` loop provides a way of repeating the execution into the loop through a series of elements. Here is an example:

```python
x = 0
while x < 3: print(x); x+= 1
```

In this example, the `while` loop executes the statements until the condition `x < 3` is true. Let's consider another example that uses a *for* loop:

```python
words = ['cat','dog','elephant']
for w in words:
    print(w)
```
In this example, the *for* loop executes iterating for all the items over the list. 

<h2> Overview of data types and objects </h2>

Python contains various built-in data types. These include four numeric types (`int, float, complex, bool`), four sequence types (`str, list, tuple, range`), one mapping type (`dict`), and two set types. It is also possible to create user-defined objects, such as functions or classes. We will look at the string and the list data types in this chapter and the remaining built-in types in the next chapter. 

All data types in Python are objects. In fact, pretty much everything is an object in Python, including modules, classes, and functions, as well as literals such as strings and integers. Each object in Python has a type, a value, and an identity. When we write `greet="helloworld"`, we are creating an instance of a string object with the value "helloworld" and the identity of `greet`. The identity of an object acts as a pointer to the object's location in memory. The type of an object, also known as the object's class, describes the object's internal representation, as well as thet methods and operations it supports. Once an instance of an object is created, its identity and type cannot be changed. 

We can get the identity of an object by using the built-in function `id()`. This returns an identifying integer and on most systems, this refers to its memory location, although you should not rely on this in any of your code. 

Also, there are a number of wayus to compare objects; for example, see the following:

```
if a == b: # a and b have the same value
if a is b: # if a and b are the same object
if type(a) is type(b): # a and b are the same type 
```

An important distinction needs to be made between mutuable and immutable objects. Mutable objects such as lists can have their values changed. They have methods, such as `insert()` or `append()`, that change an objects's value. Immutable objects such as strings cannot have their values changed, so when we run their methods, they simply return a value rather than change the value of an underlying object. We can, of course, use this value by assigning it to a variable or using it as an argument in a function. For example, the `int` class is immutable-once an instance of it is created, its value cannot be changed, however, an identifier referencing this object be reassigned another value. 

<h3> Strings <h3>

Strings are immutable sequence objects, with each character representing an element in the sequence. As with all objects, we use methods to perform operations. Strings, being immutable, do not change the instance; each method simply returns a value. This value can be stored as another variable or given as an argument to a function or method. 

The following table is a list of some of the most commonly used string methods and their descriptions:

`s.capitalize' returns a string with only the first character capitalized, the rest remaining lowercase. `s.count(substring,[start,end])` counts occurrences of a substring. `s.expandtabs([tabsize])` replaces tabs with spaces. `s.endswith(substring,[start,end])` returns `True` if a string ends with a specified substring. `s.find(substring,[start,end])` returns index of first presence of a substring. `s.isalnum()` returns `True` if all chars are alphanumeric of string `s`. `s.isalpha()` returns `True` if all chars are alphabetic of string `s`. `s.isdigit()` returns `True` if all chars are digits in the string. `s.split([separator],[maxsplit])` splits a string separated by whitespace or an optional separator. Returns a list. `s.join(t)` joins the strings in sequence `t`. `s.startswith(substring,[start,end])` returns `True` if the string starts with a specified substring. `s.strip([characters])` removes whitespaces or optional characters. `s.lstrip([characters])` returns a copy of the string with leading characters removed.  

Strings, like all sequence types, support indexing and slicing. We can retrieve any character from a string by using its index `s[i]`. We can retrieve a slice of a string by using `s[i:j]`, where `i` and `j` are start and end points of the slice. We can retrun an extended slice by using a stride, as in the following-`s[i:j:stride]`. The following ocode should make this clear: 

```
greet = "hello world"
greet[1]
> 'e'
greet[0:8]
> 'hello wo'
greet[0:8:2]
> 'hlow'
greet[0::2]
> 'hlowrd'
```

The first two examples are pretty straightforward, returning the character located at index 1 and the first seven characters of the string, respectively. Notice that indexing begins at 0. In the third example, we are using a stride of 2. This results in every second character being returned. In the final example, we omit the end index and the slice returns every second character in the entire string. 

You can use any expression, variable, or operator as an index as long as the value is an integer:

```
greet[1+2]
greet[len(greet)-1]
```
Another common operation is traversing through a string with a loop:

```
for i in enumerate(greet[0:5]):
 print(i)
```
Given that strings are immutable, a common question that arises is how we perform operations such as inserting values. Rather than chaning a string, we need to think of ways to build new string objects for the results we need. For example, if we wanted to insert a word into our greeting, we could assign a variable to the following:

```
greet[:5] + ' wonderful' + greet[5:]
> 'hello wonderful world'
```
As this code shows, we use the slice operator to split the string at index position 5 and use + to concatenate. Python never interprets the contents of a string as a number. If we need to perform mathematical operations on a string, we need to first convert them into a numeric type:

```
x = '3'; y = '2'
x+y # concatenation 
> '32'
int(3) + int(y) # addition
> 5
```

<h3> Lists </h3>

List is one of the most commonly used built-in dat structures, as they can store any number of different data types. They are simple representations of objects and are indexed by integers starting from zero, as we saw in the case of strings.

The following table contains the most commonly used list methods and their descriptions:

'list(s)' returns a list of sequence `s`. `s.append(x)` appends element `x` at the end of list `s`. `s.extend(x)` appends list `x` at the end of list `s`. `s.count(x)` returns the count of the occurrence of `x` in list `s`. `s.index(x,[start],[stop])` returns the smallest index `i`, where `s[i]==x`. We can include an optional start and stop index for lookup. `s.insert(i,x)` inserts `x` at index `i`. `s.pop(i)` returns the element `i` and removes it from the list `s`. `s.remove(x)` removes element `x` from the list `s`. `s.reverse()` reverses the order of list `s`. `s.sort(key,[reverse])` sorts list `s` with optional key and reverses it.

In Python, list implementation is different when compared to other languages. Python does not create multiple copies of a variable. For example, when we assign a value of one variable in another variable, both variables point to the same memory address where the value is stored. A copy would only be allocated if the variables change their values. This feature makes Python memory efficient, in the sense that it only creates multiple copies when it is required. 

This has important consequences for mutable compound objects such as lists. Consider the following code:

```
x = 1; y = 2; z = 3
list1 = [x,y,z]
list2 = list1
list2[1] = 4
list1
> [1, 4, 3]
```

In the preceding code, both the `list1` and `list2` variables are pointing to the same memory location. However, when we change the `y` through `list2` to `4`, we are actually changing the same `y` variable that `list1` is pointing to as well. 

An important feature of `list` is that it can contain nested structures; that is, list can contain other lists. For example, in the following code, list `items` contains three other lists: 

```
items = [['rice',2.4, 8],['flow',1.9, 5],['corn',4.7, 6]]
for item in items:
 print("Product: %s Price: %.2f Quality: %i" % (item[0], item[1], item[2]))
```

We can access the values of list using the bracket operators and since lists are mutable, they are copied in place. The following example demonstrates how we can use this to update elements; for example, here we are raising the price of flour by 20 percent:

```
item[1][1] = item[1][1] * 1.2
item[1][1]
> 2.28
```

We can create a list from expressions using a very commmon and intuitive method; that is, list comprehensions. It allows us to create a list through an expression directly into the list. Consider the following example, where a list is created using this expression:

```
l = [2,4,8,16]
[i**3 for i in l]
> [8,64,512,4096]
```

List comprehensions can be quite flexible; for example, consider the following code. It essentially shows two different ways to perform a function composition, where we apply one function to another. The following code prints out two lists representing the function composition of `f1` and `f2`, calculated first using a for loop and then using a list comprehension:

```
def f1(x):
 return x*2

def f2(x):
 return x*4

lst = []
for i in range(16):
 lst.append(f1(f2(i))
```

<h3> What Really Happens When You Run `hello_world.py` </h3>

Let's take a closer look at what Python does when you run `hello_world.py`. As it turns out, Python does a fair amount of work, even when it runs a simple program.

```
print('Hello Python world!')
```

When you run this code, you should see this output:

```
Hello Python world!
```

When you run the file `hello_world.py`, the ending `.py` indicates that the file is a Python program. Your editor then runs the file through the Python interpreter, which reads through the program and determines what each word in the program means. For example, when the interpreeter sees the word `print` followed by parentheses, it prints to the screen whatever is inside the parentheses. 

As you write programs, your editor highlights different parts of your program in different ways. For example, it recognizes that `print()` is the name of a function and displays that word in one color. It recognizes that `"Hello Python World!"` is not Python code and displays that phrase in a different color. This feature is called syntax highlighting and is quite useful as you start to write your own programs. 

<h3> Variables </h3>

Let's try using a variable in `hello_world.py`. Add a new line at the beginning of the file, and modify the second line:

```
message = "Hello Python World!"
print(message)
```

Run this program to see what happens. You should see the same output you saw previously:

```
Hello Python World!
```

We've added a variable named `message`. Every variable is connected to a value, which is the information associated with that variable. In this case the value is the `"Hello Python World!"` text.

Adding a variable makes a little more work for the Python interpreter. When it processes the first line, it associates the variable `message` with the `"Hello Python world!"` text. When it reaches the second line, it prints the value associated with `message` to the screen. 

Let's expand on this program by modifying `hello_world.py` to print a second message. Add a blank line to `hello_world.py` and then add two new lines of code:

```
message = "Hello Python world!"
print(message)

message = "Hello Python Crash Course world!"
print(message)
```
Now when you run `hello_world.py`, you should see two lines of output. 

You can change the value of a variable in your program at any time, and Python will always keep track of its current value. 

<h3> Naming and Using Variables </h3>

When you're using variables in Python, you need to adhere to a few rules and guidelines. Breaking some of these rules will cause errors; other guidelines just help you write code that's easier to read and understand. Be sure to keep the following variable rules in mind:

<ul><li> Variable names can contain only letters, numbers, and underscores. They can start with a letter or an underscore, but not with a number. For instance, you can call a variable `message_1` but not `1_message`. </li>
<li> Spaces are not allowed in variable names, but underscores can be used to separate words in variable names. </li>
<li> Avoid using Python keywords and function names as variable names; that is, do not use words that Python has reserved for a particular programmatic purpose, such as the word `print`. </li>
<li> Variable names should be short but descriptive. For example, `name` is better than `n`, `student_name` is better than `s_n`, and `name_length` is better than `length_of_persons_name`. </li>
<li> Be careful when using the lowercase letter `l` and the uppercase letter `O` because they could be confused with the numbers `1` and `0`. </li></ul>

It can take some practice to learn how to create good variable names, especially as your programs become more interesting and complicated. As you write more programs and start to read through other people's code, you'll get better at coming up with meaningful names.

The Python variables you're using at this point should be lowercase. You won't get errors if you use uppercase letters, but uppercase letters in variable names have special meanings that we'll discuss in later chapters. 

<h3> Avoiding Name Errors When Using Variables </h3>

Let's look at an error you're likely to make early on and learn how to fix it. 

We'll write some code that generates an error on purpose. Enter the following code, including the misspelled word message shown in bold:

```
message= "Hello Python Crash Course Reader!"
print(message) 
```
When an error occurs in your program, the Python interpreter does its best to help you figure out where the problem is. The interpreter provides a traceback when a program cannot run successfully. A traceback is a record of where the interpreter ran into trouble when trying to execute your code. Here's an example of the traceback that Python provides after you've accidentally misspelled a variable's name. 

```
NameError: name 'message' is not defined
```

Python can't identify the variable name provided. A name error usually means we either forgot to set a variable's value before using it, or we made a spelling mistake when entering the variable's name. 

Of course, in this example we omitted the letter `s` in the variable name `message` in the second line. The Python interpreter doesn't spellcheck your code, but it does ensure that variable names are spelled consistently. 

<h3> Variables Are Labels </h3>

Variables are often described as boxes you can store values in. This idea can be helpful the first few times you use a variable, but it isn't an accurater way to describe how variables are represented internally in Python. It's much better to think of variables as labels that you can assign to values. You can also say that a variable references a certain value. 

<h3> Strings </h3>

Because most programs define and gather some sort of data, and then do something useful with it, it helps to classify different types of data. The first data type we'll look at is the string. Strings are quite simple at first glance, but you can use them in many different ways. 

A string is a series of characters. Anything inside quotes is considered a string in Python, and you can use single or double quotes around your strings like this:

```
"This is a string."
'This is also a string.'
```
This flexibility allows you to use quotes and apostrophes within your strings: 

```
'I told my friend, "Python is my favorite language!"'
"The language 'Python' is named after Monty Python, not the snake."
"One of Python's strengths is its diverse and supportive community."
```
Let's explore some of the ways you can use strings. 

<h3> Changing Case in a String with Methods </h3>

One of the simplest tasks you can do with strings is change the case of the words in a string. Look at the following code, and try to detertmine what's happening:

```python
name  = "ada lovelace"
print(name.title())
```

In this example, the variable `name` refers to the lowercase string `"ada lovelace"`. The method `title()` appears after the variable in the `print()` call. A method is an action that Python can perform on a piece of data. The dot(.) after `name` in `name.title()` tells Python to make the `title()` method act on teh variable `name`. Every method is followed by a set of parentheses, because methods often need additional information to do their work. That information is provided inside the parentheses. The `title()` function doesn't need any additional information, so its parentheses are empty. 

The `title()` method changes each word to title case, where each word begins with a capital letter. This is useful because you'll often want to think of a name as a piece of information. For example, you might want your program to recognize the input values `Ada`, `ADA`, `ada` as the same name, and display all of them as `Ada`. 

Several other useful methods are available for dealing with case as well. For example, you can change a string to all uppercase or all lowercase letters like this:

```python
name = "Ada Lovelace"
print(name.upper())
print(name.lower())
```

This will display the following:

```
ADA LOVELACE
ada lovelace
```

The `lower()` method is particularly useful for storing data. Many times you won't want to trust the capitalization that your users provide, so you'll convert strings to lowercase before storing them. Then when you want to display the information, you'll use the case that makes the most sense for each string. 

<h3> Using Variables in Strings </h3>

In some situations, you'll want to use a variable's value inside a string. For example, you might want two variables to represent a first name and a last name respectively, and then want to combine those values to display someone's full name:

```
first_name = "ada"
last_name = "lovelace"
full_name = f"{first_name} {last_name}"
print(full_name)
```

To insert a variable's value into a string, place the letter `f` immediately before the opening quotation mark. Put braces around the name or names of any variable you wan to use inside the string. Python will replace each variable with its value when the string is displayed. 

These strings are called *f-strings*. The *f* is for format, because Python formats the strings by replacing the name of any variable in braces with its value. The output from the previous code is:

```
ada lovelace
```

You can do a lot with *f-strings*. For example, you can use f-strings to compose complete messages using the information associated with a variable, as shown here:

```python
first_name = "ada"
last_name = "lovelace"
full_name = f"{first_name} {last_name}"
print(f"Hello, {full_name.title()}!")
```
The full name is used in a sentence that greets the user, and the `title()` method changes the name to title case. This code returns a simple but nicely formatting greeting:

```
Hello, Ada Lovelace!
```
You can also use f-strings to compose a message, and then assign the entire message to a varaible:

```python
first_name = "ada"
last_name = "lovelace"
full_name = f"{first_name} {last_name}" 
message = f"Hello, {full_name.title()}!"
print(message)
```
This code displays the message `Hello, Ada Lovelace!` as well, but by assigning the message t o a variable we make the final `print()` call much simpler.

<span class="sidenote"> F-strings were first introduced in Python 3.6. If you're using Python 3.5 or earlier, you'll need to use the `format()` method rather than this `f` syntax. To use `format()`, list the variables you want to use in the string inside the parentheses following `format`. Each variable is referred to by a set of braces; the braces will be filled by the values listed in parentheses in the order provided:

```python
full_name = "{} {}".format(first_name, last_name)
```
</span>

<h3> Adding Whitespaces to Strings with Tabs or Newlines </h3>

In programming, whitespaces refers to any nonprinting character, such as spaces, tabs, and end-of-line symbols. You can use whitespace to organize your output so it's easier for users to read. 

To add a tab to your text, use the character combination `\t` as shown below:

```python
print("Python")
print(\tPython")
```

To add a newline in a string, use the character combination `\n`: 

```
print("Languages:\nPython\nC\nJavaScript")
```
You can also combine tabs and newlines in a single string. The string `\n\t` tells Python to move to a new line, and start the next line with a tab. The following example shows how you can use a one-line string to generate four lines of output:

```python
print("Languages:\n\tPython\n\tC\n\tJavaScript")
```
Newlines and tabs will be very useful in the next two chapters when you start to produce many lines of output from just a few lines of code. 

<h3> Stripping Whitespace </h3>

Extra whitespace can be confusing in your programs. To programmers `python` and `python ` look pretty much the same. But to a program, they are two different strings. Python detects the extra space in `python ` and considers it significant unless you tell it otherwise. 

It's important to think about whitespace, because often you'll want to compare two strings to determine whether they are the same. For example, one important instance might involve checking people's usernames when they log into a website. Extra whitespaces can be confusing in much simpler situations as well. Fortunately, Python makes it easy to eliminate extraneous whitespace from data that people enter. 

Python can look for extra whitespace on the right and left sides of a string. To ensure that no whitespace exists at the right end of a string, use the `rstrip()` method.

```python
favorite_language = 'python '
favorite_language.rstrip()
```

The value associated with `favoriate_language` contains extra whitespace at the end of the string. When you ask Python for this value in a terminal session, you can see the space at the end of value `favorite_language`. When the `rstrip()` method acts on the variable `favoriate_language`, this extra space is removed. However, it is only removed temporarily. If you ask for the value of `favorite_language` again, you can see that the string looks the same as when it was entered, including the extra whitespace. 

To remove the whitespace from the string permanently, you have to associate the stripped value with the variable name:

```python
favorite_language = "python "
favorite_language = favorite_language.rstrip()
```

To remove teh whitespace from the string, you strip the whitespace from the right side of the string and then associate this new value with the original variable, as shown above. Changing a variable's value is done often in programming. This is how a variable's value can be updated as a program is executed or in response to user input. 

You can also strip whitespace from the left side of a string using the `lstrip()` method, or from both sides at once using `strip()`:

```python
favorite_language = ' python '
favorite_language.strip()
```
Experimenting with these stripping functions can help you become familiar with manipulating strings. In the real world, these stripping functions are used most often to clean up user input before it's stored in a program.

<h3> Avoiding Syntax Errors with Strings </h3>

One kind of error that you might see with some regularity is a syntax error. A *syntax error* occurs when Python doesn't recognize a section of your program as valid Python code. For example, if you use an apostrophe within single quotes, you'll produce an error. This happens because Python interprets everything between the first single quote and the apostrophe as a string. It then tries to interpret the rest of the text as Python code, which causes errors. 

Here's how to use single and double quotes correctly. Save this program as `apostrophe.py` and then run it:

```python
message = "one of Python's strengths is its diverse community."
print(message)
```

The apostrophe appears inside a set of double quotes, so the Python interpreter has no trouble reading the string correctly. However, if you use single quotes, Python can't identify where the string should end. 

This syntax error indicates that the interpreter doesn't recognize something in the code as valid Python code. Errors can come from a variety of sources, and I'll point out some common ones as they arise. You might see syntax errors often as you learn to write proper Python code. Syntax errors are also the least specific kind of error, so they can be difficult and frustrating to identify and correct. If you get stuck on a particularly sutbborn error, see the suggestions in Appendix C. 

<h3> Numbers </h3>

Numbers are used quite often in programming to keep score in games, represent data in visualizations, store information in web applications, and so on. Python treats numbers in several different ways, depending on how they're being used. Let's first look at how Python manages integers, because they're the simplest to work with. 

<h4> Integers </h4>

You can add, subtract, multiply, and divide integers in Python. In a terminal session, Python simply returns the result of the operation. Python uses two multiplication symbols to represent exponents:

Python supports the order of operations too, so you can use multiple operations in one expression. You can also use parentheses to modify the order of operations so Python can evaluate your expression in the order you specify. 

The spacing in these examples has not effect on how Python evaluates the expressions; it simply helps you more quickly spot the operations that have priority when you're reading through the code. 

<h3> Floats </h3>

Python calls any number with a decimal point a lfoat. This term is used in most programming languages, and it refers to the fact that a decimal point can appear at any position in a number. Every programming language must be carefully designed to properly manage decimal numbers so numbers behave appropriately no matter where the decimal point appears. 

For the most part, you can use decimals without worrying about how they behave. Simply enter the numbers you want to use, and Python will most likely do what you expect. But be aware that you can sometimes get an arbitrary number of decimal places in your answer. 

This happens in all languages and is of little concern. Python tries to find a way to represent the result as precisely as possible, which is sometimes difficult given how computers have to represent numbers internally. Just ignore the extra decimal places for now; you'll learn ways to deal with the extra places you need to in the projects in Part 2.

<h3> Integers and Floats </h3>

When you divide any two numbers, even if they are integers that result in a whole number, you'll always get a float. If you mix an integer and a float in any other operation, you'll get a float as well:

```python
1+2.0
2*3.0
3.0**2
```
Python defaults to a float in any operation that uses a float, even if the output is a whole number.

<h3> Underscores in Numbers </h3>

When you're writing long numbers, you can group digits using underscores to make large numbers more readable:

```python
universe_age = 14_000_000_000
```

When you print a number that was defined using underscores, Python prints only the digits. Python ignores the underscores when storing these kinds of values. Even if you don't group the digits in threes, the values will still be unaffected. To Python, 1000 is the same as 1_000, which is the same as 10_00. This feature works for integers and floats, but it's only available in Python 3.6 and later.

<h3> Working with Fractions </h3>

Python can also handle fractions, but to do that, we'll need to use Python's `fractions` module. You can think of a module as a program written by someone else that you can use in your own programs. A module can include classes, functions, and even label definitions. It can be part of Python's standard library or distributed from a third-party location. In the latter case, you would have to install the module before you could use it. 
The `fractions` module is part of the standard library, meaning that it's already installed. It defines a class `Fraction`, which is what we'll use to enter fractions into our programs. Before we can use it, we'll need to import it, which is a way of telling Python that we want to use the class from this module. Let's see a quick example-we'll create a new label, `f`, which refers to teh fraction `3/4`:

```python
from fractions import Fraction
f = Fraction(3,4)
```

We first import the `Fraction` class from the `fractions` module. Next, we create an object of this class by passing the numerator and denominator as parameters. This creates a `Fraction` object for the fraction `3/4`. When we print the object, Python displays the fraction in the form `Fraction(numerator,denominator)`. 

The basic mathematical operations, including the comparison operations, are all valid for fractions. You can also combine a fraction, an integer, and a floating point number in a single expression:

```python
Fraction(3,4) + 1 + 1.5
```

When you have a floating point number in an expression, the result of the expression is returned as a floating point number. 

On the other hand, when you have only a fraction and an integer in the expression, the result is a fraction, even if the result has a denominator of 1. 

```
Fraction(3,4) + 1 + Fraction(1/4)
```
Now you know the basics of working with fractions in Python. Let's move on to a different kind of number. 

<h3> Complex Numbers </h3>

The numbers we've seen so far are the so-called real numbers. Python also supports complex numbers with the imaginary part identified by the letter `j` or `J` (as opposed to the letter `i` used in mathematical notation). For example, the complex number *2+3i* would be written in Python as `2+3j`:

```python
a = 2 + 3j
type(a)
> <class 'complex'>
```

As you can see, when we use the `type()` function on a complex number, Python tells us that this is an object of type `complex`. You can also define complex numbers using the `complex()` function: 

```python
a = complex(2,3)
```
Here, we pass the real and imaginary parts of the complex numbers as two arguments to the `complex()` function, and it returns a complex number. You can add and subtract complex numbers in the same way as real numbers. Multiplication and division of complex numbers are also carried out similarly. 

The modulus(%) and the floor division(//) operations are not valid for complex numbers. The real and imaginary parts of a complex number can be retrieved using its `real` and `imag` attributes, as follows:

```
z = 2 + 3j
z.real
> 2.0
z.imag
> 3.0
```

The conjugate of a complex number has the same real part but an imaginary part with an equal magnitude and an opposite sign. It can be obtained using the `conjugate()` method.

```python
z.conjugate()
```
Both the real and imaginary parts are floating point numbers. Using the real and imaginary parts, you can then calculate the magnitude of a complex number with the following formula, where `x` and `y` are the real and imaginary parts of the number, respectively: $\sqrt{x^2+y^2}$. In Python, this would look like the following:

```python
(z.real**2 + z.imag**2)**0.5
```

A simple way to find the magnitude of a complex number is with the `abs()` function. The `abs()` function returns the absolute value when called with a real number as its argument. For example, `abs(5)` and `abs(-5)` both return 5. However, for complex numbers, it returns the magnitude:

```python
abs(z)
```
The standard library's `cmath` module (`cmath` for complex math) provides access to a number of other specialized functions to work with complex numbers. 

<h3> Getting User Input </h3>


































































































































































































































<picture><img src="{{site.baseurl}}/assets/images/disparity.png"></picture>

<h2> References </h2>
<ul><li><a=href=""> TheAILearner </a></li>
</ul>

