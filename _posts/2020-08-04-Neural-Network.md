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
![equ](https://latex.codecogs.com/gif.latex?f(s_i)&space;=&space;1/(1&plus;e^{-s^i}))

```python
import numpy  as np

def sigmoid(inputs):
  sigmoid_scores = [1/float(1+np.exp(-x)) for x in inputs]
  return sigmoid_scores
```

