---
layout: post
title: Fast Array Operations with NumPy and Pandas
categories: Python  
tags: [Advanced Python Programming]
excerpt: Advanced Python Programming
---

# Getting started with NumPy

## Broadcasting
*  The  true power of NumPy lies in its fast mathematical  operations. The  approach used by NumPy is to avoid stepping  into the  Python interpreter by performing element-wise calculation using optimized C code. **Broadcasting** is a clever set of rules that enables fast array calculations for arrays of  similar shape. 
* Whenever  you do an arithmetic operation on two arrays, if the two operands have  the  same shape,  the  operation will be applied in an element-wise fasion. 
* If the shape of the  operands don't match, NumPy will attempt to match them using broadcasting rules. If one of the operands is a *scalar*, it will be applied to  every element of the  array.
* If the operand is another array, NumPy will try  to match the shapes starting  from the last axis. 
```python
a = np.array([[0,1,2],[3,4,5],[6,7,8],[9,10,11]])
idx1=   np.array([0,1])
idx2= np.array([2,3])
a[idx1,idx2]
```
