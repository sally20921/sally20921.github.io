---
layout: post
title: Domain Adaptation
categories: Etc  
tags: [Domain Adaptation]
excerpt: https://people.eecs.berkeley.edu/~jhoffman/domainadapt/#motivation
---

# Task
## Multi-Class Classification
- each sample can belong to one of *C* classes. 
- The CNN will have  *C* output neurons that can be gathered in a vector *s* (scores).
- The target (ground truth) vector *t* will be  a one-hot vector with a positive  class and *C-1* negative  classes.

## Multi-Label Classification
- each sample can belong  to more than  one  class.
- The CNN will have *C* output neurons. 
- The target vector *t* can have more  than  a  positive  calss, so it will be  a vector of  0s and 1s with *C* dimensionality.

# Output Activation Functions
- these  functions  are transformations we apply to vectors comming  out from *CNN(s)* before the loss computation.
- calculated probabilities are used to predict the  target class in  logistic regression model

## Sigmoid
- It is also called the logistic function
- the output value in the range of -1 to 1
- used for binary classification in logistic regression model

![equ](https://latex.codecogs.com/gif.latex?f(s_i)&space;=&space;1/(1&plus;e^{-s^i}))

```python
import numpy  as np

def sigmoid(inputs):
  sigmoid_scores = [1/float(1+np.exp(-x)) for x in inputs]
  return sigmoid_scores
```

## Softmax
- They can be  interpreted as class probabilities.
- softmax function calculates the probabilities distribution of the  event over *n* different events.
- the  range will be 0 to  1, the  sum of all the  probabilities will be  equal to one
- returns the  probability  of each class and the target calss will have the  high probability
- used in multiple classification logistic regression model

![equ](https://latex.codecogs.com/gif.latex?f(s_i)&space;=&space;\frac{e^{s^i}}{\sum_j^C{e^{s_j}}})

```python
import numpy  as np

def softmas(inputs):
  return  np.exp(inputs)/float(sum(np.exp(inputs)))
```

# Losses
## Cross-Entropy Loss
- Usually an activation function is applied to the scores before the CE Loss computation
- Logistic Loss and Multinomial Logistic Loss are other names for Cross-Entropy Loss
- indicates the  distance  between  what the  model believes the output distribution should be,  and  what  the  original distribution really is. 
- cross entropy is a widely used alternative of  squared error
- it is  used as  a loss function in neural networks which have softmax activations in the  output layer  
- a combination  of  the entropy of  the  true  distribution *P*  and KL divergence between *P* and *Q*

![img](https://miro.medium.com/max/1400/1*ETtY7KCrzAlOmLeyDWE4Xg.png)
- **S(y)** is the output of your softmax function. L is the ground truth! It is easy to  remember that the  log  only applies to Softmax output because the one-hot encoded ground truth almost  always have  zero entries, and we cannot take log  of zero. 

### cross entropy loss in Deep Learning  
![img](https://miro.medium.com/max/1400/1*70OE3A8sQn4Yl3VPTmChkA.png)
- It sits  right  after softmax function, and it  takes the input from the  softmax function output and the true label.  
- Remember the goal for cross entropy loss is to compare how  well  the  probability distribution output by softmax matches teh  one-hot-encoded  ground truth label of the  data. 
- for  a classification task in neural networks, we are  usually dealing  with the  true distribution *P*  being a one-hot  encoded vector. 
- the  output layer of our neural network  will be  a  softmax layer, where all  outputs  have been  normalized  so they  sum to one.
- to  get the  predicted class, one would run an *np.argmax* over the output and as such, for  one-hot encoded vectors, the cross entropy collapses to:

![img](https://latex.codecogs.com/gif.latex?H(p,q)&space;=&space;-\log&space;q(x_i))
- The closer  Q  value gets to 1, the  lower  the loss would get. This is because the  KL divergence between P and Q is reducing for this index. 
- In PyTorch, the function to use is  **torch.nn.CrossEntropyLoss()**
- note that this  function  performs a softmax transformation of the input  before calculating cross entropy 
- as such, one should supply only the  logits (the  raw, pre-activated  output  layer  values) from your classifier network.
