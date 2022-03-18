---
layout: post
title:  ""
author: seri
categories: [ computer vision ]
image: assets/images/depth/1.jpg
tags: featured
---

<!--more-->

<h2> Introduction </h2>

<h2> Basic Packages, Functions, and Concepts </h2>

Before getting started on any practical recipes, we'll use this opening chapter to introduce several core mathematical concepts and structures and their Python representations. In particular, we'll look at basic numerical types, basic mathematical functions (trigonometric functions, the exponential function, and logarithms), and matrices. Matrices are fundamental in most computational applications because of the connection between matrices and solutions of systems of linear equations. We'll explore some of these applications in this chapter, but matrices will play an important role throughout this book. 

<h3> Technical Requirements </h3>

We will use features that were introduced in Python 3.6 at various points, including f-string. This means that you may need to change `python3.8`, which appears in any terminal commands to match your version of Python. This might be another version of Python, such as `python3.6` or `python3.7`, or a more general command such as `python3` or `python`. For the latter commands, you need to check that the version of Python is at least 3.6 by using the following command.

Python has built-in numerical types and basic mathematical functions that suffice for small applications that involved only small calculations. The NumPy package provides a higher performance array type and associated routines (including basic mathematical functions that operate efficiently on arrays). This package will be used in many of the recipes in this chapter and the remainder of this book. We will also make use of the SciPy package in the latter recipes of this chapter. Both can be installed using your preferred package manager, such as `pip`. 
By convention, we import these package under a shorter alias. We import `numpy` as `np` and `scipy` as `sp` using the following `import` statements:


```python
import numpy as np
import scipy as sp
```
These conventions are used in the official documentation for these packages, along with many tutorials and other materials that use these packages. 

<h3> Python Numerical Types </h3>

Python provides basic numerical types such as arbitrarily sized integers and floating-point numbers (double precision) as standard, but it also provides several additional types that are useful in specific applications where precision is especially important. Python also provides (built-in) support for complex numbers, which are useful for some more advanced mathematical applications. 

<h3> Decimal Type </h3>

For applications that require decimal digits with accurate arithmetic operations, use the `Decimal` type from the `decimal` module in the Python Standard Library. 

```python
from decimal import Decimal
num1 = Decimal('1.1')
num2 = Decimal('1.563')
num3 + num1  # Decimal('2.663')
```

Performing this calculation with float objects gives the result which includes a small error arising from the fact that certain numbers cannot be represented exactly using a finite sum of powers of 2. For example, 0.1 has a binary expansion which does not terminate. Any floating-point representation of this number will therefore carry a small error. Note that the argument to `Decimal` is given as a string rather than a float. 

The `Decimal` type is based on the IBM General Decimal Arithmetic Specification, which is an laternative specification for floating-point arithmetic that represents decimal numbers exactly by using powers of 10 rather than powers of 2. This means that it can be safely used for calculations in finance where the accumulation of rounding errors would have dire consequences. However, the `Decimal` format is less memory efficient, since it must store decimal digits rather than binary digits(bits), and are computationally more expensive than traditional floating-point numbers. 

The `decimal` package also provides a `Context` object, which allows fine-grained control over the  precision, display, and attributes of `Decimal` objects. fThe current (default) context can be accessed using the `getcontext` function from the `decimal` module. The `Context` object returned by `getcontext` has a number of attributes that can be modified. For example, we can set the precision for arithmetic operations:

```python
from decimal import getcontext
ctx = getcontext()
num = Decimal('1.1')
num**4 # Decimal('1.4641')
ctx.prec = 4 # set new precision
num**4 # Decimal('1.464')
```
When we set the precision to 4, rather than the default 28, we see that the fourth power of 1.1 is rounded to 4 significant figures. The context can even be set locally by using the `localcontext` function, which returns a context manager that restores the original environment at the end of the `with` block:

```python
from decimal import localcontext
num = Decimal("1.1")
with localcontext() as ctx:
 ctx.prec = 2
 num**4
num**4 
```

This means that the context can be freely modified inside the `with` block, and will be returned to the default at the end. 

<h3> Fraction Type </h3>

Alternatively, for working with applications taht require accurate representations of integer fractions, such as when working with proportions or probabilities, there is the `Fraction` type from the `fractions` module in the Python Standard Library. The usage is similar, except that we typically give the numerator and denominator of the fraction as arguments:
```python
from fractions import Fraction
num1 = Fraction(1,3)
num2 = Fraction(1,7)
num1 * num2 # Fraction(1,21)
```
The `Fraction` type simply stores two integers, the numerator and the denominator, and arithmetic is performed using the basic rules for addition and multiplication of fractions. 

<h3> Complex Type </h3>
































































<picture><img src="{{site.baseurl}}/assets/images/disparity.png"></picture>

<h2> References </h2>
<ul><li><a=href=""> TheAILearner </a></li>
</ul>

