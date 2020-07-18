

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
