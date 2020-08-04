---
layout: post
title: The mathematical appartus of NNs
categories: Python  
tags: [Advanced Deep Learning with Python]
excerpt: Advanced Deep Learning with Python
---

# Linear Algebra
## Scalars: A single number 
## Vectors: A one-dimensional array of numbers. 
- We can visually represent *n*-dimensional vector as  the  coordinates of a point  in an *n*-dimensional
Euclidean space **R_n** (equivalent  to a  coordinate system). In this case, the  vector is 
referred to as Euclidean and each vector component  represents the coordinate along the  corresponding
axis. 
- However, the Euclidean vector is more than just a point and  we can also represent it  with
the following two properties:
- Magnitude (or length) is a generalization of the  Pythoagorean theorem for an *n*-dimensional space:
- Direction is the  angle  of the vector along each axis of the vector space. 

## Matrices: This is a two-dimensional array of  numbers. Each element is identified by two indices
(row and column). A matrix is usually denoted with a  bold capital letter.  Each matrix element is denoted 
with  the small  matrix  letter and a  subscript index; 
- We can represent  a vector as a single-column *nx1* matrix (referred to as a column matrix) 
or a  single-row  *1xn* matrix (referred to as a row matrix). 

## Tensors: For the purpose  of this book, we'll only consider tensors in the ML context. Here,
tensor is  a multi-dimensional array with the  following  properties: 
- Rank: Indicates the  number of array dimensions. For example, a tensor of rank 2  is a matrix,
a tensor of rank 1 is a vector, and a tensor of rank 0 is a scalar. 
- shape: the size of each dimension. 
- contemporary  DL libraries such as TensorFlow and Pytorch use tensors as their main data structures.

## Vector and matrix operation
- The dot (or  scalar) product takes two vectors and outputs a scalar  value. 
- The dot product acts as a kind of similarity measure between the  two vectors -
if the  angle  between  the  two vectors is small (the  vectors have similar directions), then
theri  dot product will be  higher because  of cosine. 
- Following this idea, we can define a  cosine similarity between two  vectors as follows:
![equ](https://latex.codecogs.com/gif.latex?\cos{\Theta}&space;=&space;\frac{a\cdot&space;b}{\left&space;|&space;a&space;\right&space;|\cdot&space;\left&space;|&space;b&space;\right&space;|})

- The cross (or  vector)  product takes two vectors and outputs another vector, which is  perpendicular  to both initial vectors. 
- The  output vector is perpendicular  to the input vectors, which also means that the  vector  
is normal to the  plane containing them. 
- The magnitude of the output vector is equal to the  area  of the parallelogram with the vector
a and b for sides.

- We can also define a vector through vector space, which is a collection of objects 
(in our case, vectors) that can be added together and multiplied by a scalar  value.
- The vector space will allow us to define a linear transformation as a function *f*,
which can transform each vector (point) of vector space **V**, into a vector (point) of 
another vector space **W**. 

- Matrix transpose: Here, we flip the matrix along its main diagonal. The transpose of an *mxn* 
matrix is an *nxm* matrix. 

# Introduction to  probability

- Let's start by introducing  the concept of a **statistical experiment**,
which has the  following properties:
- Consists of  multiple independent trials
-  the outcome of  each  trial is non-deterministic; that is, it's determined by chance.
- It has more than one possible  outcome. These outcomes are known as **events**.
- All the possible  outcomes of the experiment  are known in advance.  

- We'll define **probability** as the  likelihood that some event, **e**, would occur  and 
we'll  denote it with  **P(e)**. There are two ways we can approach probability:
-  Theoretical: The event we're interested in compared to the total number of possible  events.
All events are equally likely.
- Empirical: This is the  number of times an event we're interested in occurs compared to the total number of trials. 

# Probability  and sets 
- The collection of all possible  outcomes (events) of an experiement is called, **sample space**.We  can think of the  sample sapce as  a mathematical **set**. A single  outcome  of  the  set is called a **sample point**. An **event** is an outcome (sample point) or a  combination of outcomes  (subset) of the  sample space.  

```python
import numpy  as np

def sigmoid(inputs):
  sigmoid_scores = [1/float(1+np.exp(-x)) for x in inputs]
  return sigmoid_scores
```

