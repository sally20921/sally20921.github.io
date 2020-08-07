---
layout: post
title: Pure Python Optimization
categories: Python  
tags: [Advanced Python Programming]
excerpt: Advanced Python Programming
---

* As mentioned in the last chapter,  one of the  most effective  ways  of improving the performance of applications is through the use of better algorithms and data structures. The Python standard library provides a large variety  of ready-to-use algorithms and data structures that can be directly incorporated in your applications. 

* Even though many algorithms have  been around for quite  a while, they are  especially relevant in  today's world as we continuously produce,  consume, and analyze ever  increasing amount  of data. 

* More advanced use cases will also be covered by taking advantage  of third-party  libraries. 

# Lists and deques 
- Python lists are ordered collections of elements and in Python, are implemented as resizable arrays. An array is a basic data  structure that  consists of a  series of contiguous  memory locations,  and each location contains a reference  to a Python object.  
- List shine  in accessing, modifying, and appending elements. Accessing or modifying  an element involves fetching  the object reference  from the  appropriate  position of the underlying array and has complexity O(1). 

* In some cases, it is necessary  to efficiently perform insertion or removal of elements both at the  beginning and at the end of the collection. Python provides a data structure  with those properties in the collections.deque class. The  word **deque** stands for double-ended queue  because this data structure is designed to efficiently put and remove elements at the beginning  and at  the end of  the collection, as it is in the case  of queues. In Python, deques are implemented as doubly-linked lists. 

# Dictionaries  
- Dictionaries are extremely versatile and extensively used in the Python language. Dictionaries are implemented as hash maps and are  very good at element insertion, deletion, and access. All these operations have an average O(1) time complexity.

- In Python versions up to 3.5, dictionaries are unordered collections. Since Python 3.6, dictionaries are capable of maintaining their elements by order of insertion.

- A hash map is a data structure that associates a set of key-value pairs. The principle behind hash maps is to assign a specific index to each key so that its associated value can be stored in an array. The index can be obtained through the use of a *hash* function. Python implements hash functions for several data types. As a demonstration, the generic function to obtain hash code is **hash**. 
- Hash maps can be tricky to implement  because they  need to handle collisions tht happen when two different objects have the same hash code.  
- A dictionary  can be used to  efficiently count unique elemnets in a  list. In this example, we define the  *counter_dict* function that  takes a list  and returns a dictionary containing  the number of occurrences of each value in the list:


```python
def counter_dict(items):
  counter = {}
  for item in items:
    if item not in counter:
      counter[item] =  1
    else:
      counter[item] += 1
    return counter
```

# Comprehensions and generators
- In this section, we will explore a few simple strategies to  speed upd Python loops using comprehension and generators. In Python, comprehension and generator expressions are fairly optimized operations and should be preferred in place of explicit for-loops. Another reason touse this construct is readability; the  comprehension and generator syntax is more compact  and more intuitive.
```python
def loop():
 res = []
 for i in range(100000):
  res.append(i*i)
  return sum(res)
  
def comprehension():
  return sum([i*i for i in range(100000)])
  
def generator():
  return sum(i*i f or i in range(100000))
  
```
- just like lists, it is possible to use *dict* comprehension to build dictionaries slightly more compactly, as shown in the following code:
```python
def loop():
  res = {}
  for i in range(100000):
    res[i] = i
  return res
  
def comprehension():
  return {i: i for i in range(100000)}
  
```

# Fast  Array Operations with NumPy and Pandas

- NumPy is the *de facto* standard for scientific computing in Python. It extends Python with  a  flexible multidimensional array that allows fast and concise mathematical calculations. 

- The multidimensional array, *numpy.ndarray*, is internally based on C arrays. 
- **Pandas** is a tool that relies heavily  on NumPy and provides additional data structures and algorith,s targeted toward data analysis. 

## Getting started with NumPy
* The NumPy library revolves around its multidimensional array object, *numpy.ndarray*. NumPy arrays are collections of elements of the same data type; this fundamental restriction allows NumPy to pack the data in a way that  allows for high-performance  mathematical operations. 

### Creating arrays
* You can create NumPy arrays using the  *numpy.array* function.  It takes a list-like object  (or another  array) as input, and optionally, a string expressing its data type. 

```python
import  numpy as np
a = np.array([0,1,2])
```
- Every  NumPy array has an associated data  type that can be  accessed using the *dtype* attribute. 

```python
import  numpy as np
a = np.array([1,2,3], dtype='float32')
a.astype('float32')
```

- To create an array with two dimensions (an array of arrays), we can perform the initialization  using a nested sequence.
```python
import  numpy as np
a = np.array([[0,1,2],[3,4,5]])
```

* The array created in this way has two dimensions, which are called **axes** in NumPy's jargon. We can access the axes using the *ndarray.shape* attribute. Arrays can also be reshaped as long as the product of the shape dimensions is equal to the total number of elements in the array. (that is, the total number  of elements is conserved). For example, we can 
