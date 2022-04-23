---
layout: post
title:  "Numerical Python"
author: seri
categories: [ Python ]
image: assets/images/depth/1.jpg
tags: featured
---

<!--more-->

<h2> Introduction to Computing with Python </h2>

Three different environments are compared here for Python technical computing. 

<ul><li> The Python interpreter or the IPython console to run code interactively. Together with a text editor for writing code, this provides a light-weight development environment. </li>
<li> The Jupyter Notebook, which is a web application in which Python code can be witten and executed through a web browser. This environment is great for numerical computing, analysis and problem-solving, because it allows one to collect code, the output produced by the code, related technical documentation, and the analysis and interpretation, all in one document. </li>
<li> The Spyder Integrated Development Environment, which can be used to write and interactively run Python code. An IDE such as Spyder is a great tool for developing libraries and reusable Python modules. </li></ul>

<h3> Interpreter </h3>

The standard way to execute Python code is to run the program directly through the Python interpreter. On most systems, the Python interpreter is invoked using the `python` command. When a python source file is passed as an argument to this command, the Python code in the file is executed. 

It is common to have more than one version of Python installed on the same system. Each version of Python maintains its own set of libraries and provides its own interpreter command (so each Python environment can have different libraries installed). On many systems, specific versions of the Python interpreter are available.

In addition to executing Python script files, a Python interpreter can also be used as an interactive console (also known as a REPL: Read-Evaluate-Print-Loop). Entering `python` at the command prompt (without any Python files as argument) launches the Python interpreter in an interactive mode. 

<h3> IPython Console </h3>

Although the interactive command-line interface provided by the standard Python interpreter has been greatly improved in recent versions of Python 3, it is still in certain aspects rudimentary, and it does not by itself provide a satisfactory environment for interactive computing. IPython is an enhanced command-line REPL environment for Python, with additional features for interactive and exploratory computing. 

IPython provides improved command history browsing (also between sessions), an input and output caching system, improved auto-completion, more verbose and helpful exception tracebacks, and much more. Under the hood IPython is a client-server application, which separates the frontend (user interface) from the backend (kernel) that executes the Python code. This allows multiple types of user interfaces to communicate and work with the same kernel,l and a user-interface application can connect multiple kernels using IPython's powerful framework for parallel computing. 

Running the `ipython` command launches the IPython command prompt.

```bash
ipython
```
Note that each IPython installation corresponds to a specific version of Python, and if you have several versions of Python available in your system, you may also have several versions of IPython as well. On many systems, IPython for Python 2 is invoked with the command `ipython2` and for Python 3 with `ipython3`, although the exact setup varies from system to system. Note that here the "2" and "3" refer to the Python version, which is different from the version of IPython itself. 

<h3> Input and Output Caching </h3>

In the IPython console, the input prompt is denoted `In [1]:` and the corresponding output is denoted as `Out [1]:`, where the numbers within the square brackets are incremented for each new input and output. These inputs and outputs are called cells in IPython. Both the input and the output of previous cells can later be accessed through the `In` and `Out` variables that are automatically created in IPython. The `In` and `Out` variables are a list and a dictionary, respectively, that can be indexed with a cell nuumber. 

Input and output caching is often useful in interactive and exploratory computing, since the result of a computation can be accessed even if it was not explicitly assigned to a variable. 

Note that when a cell is executed, the value of the last statement in an input cell is by default displayed in the corresponding output cell, unless the statement is an assignment or if the value is Python null value `None`. The output can be suppressed by ending the statement with a semicolon; 

<h3> Autocompletion and Object Introspection </h3>




<h3> Documentation </h3>
<h3> Interaction with the System Shell </h3>
<h3> IPython Extensions </h3>
<h3> Jupyter </h3>
<h3> Spyder: An Integrated Development Environment </h3>

<h2> Vectors, Matrices, and Multidimensional Arrays </h2>

<h3> Importing the Modules </h3>
<h3> The NumPy Array Object </h3>
<h3> Creating Arrays </h3>
<h3> Arrays Created from Lists and Other Array-Like Objects </h3>
<h3> Arrays Filled with Constant Values </h3>
<h3> Meshgrid Arrays </h3>

<h3> Indexing and Slicing </h3>
<h3> Reshaping and Resizing </h3>
<h3> Vectorized Expressions </h3>
<h3> Matrix and Vector Operations </h3>

<h2> Symbolic Computing </h2>

<h3> Importing SymPy </h3>
<h3> Symbols </h3>
<h3> Expressions </h3>
<h3> Calculus </h3>
<h3> Linear Algebra </h3>

<h2> Plotting and Visualization </h2>
<h3> Importing Modules </h3>

<h2> Equation Solving </h2>
<h3> Linear Equation Systems </h3>
<h3> Eigenvalue Problems </h3>
<h3> Nonlinear Equations </h3>

<h2> Optimization </h2>
<h3> Classification of Optimization Problems </h3>
<h3> Univariate Optimization </h3>
<h3> Unconstrained Multivariate Optimization </h3>
<h3> Nonlinear Least Square Problems </h3>
<h3> Constrained Optimization </h3>
<h3> Linear Programming </h3>

<h2> Interpolation </h2>
<h3> Polynomials </h3>
<h3> Multivariate Interpolation </h3>


<h2> Sparse Matrices adn Graphs </h2>
<h3> Sparse Matrices in SciPy </h3>




















<picture><img src="{{site.baseurl}}/assets/images/disparity.png"></picture>

<h2> References </h2>
<ul><li><a=href=""> TheAILearner </a></li>
</ul>

