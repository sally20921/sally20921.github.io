---
layout: post
title: The mathematical appartus of NNs
categories: Linear-Algebra 
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
- We  can transfer the set properties to events and their probabilities. We'll assume that the  events are independent - the  occurrence of one event doesn't  affect the  probability  of the occurrence of another. 
- The  intersection of two  events  is  a subset of the  outcomes, contained in  both events. The  probability  of the  intersection is  called  **joint probability**.
- The  probability  of the  occurrence of a single event P(A) is also known as **marginal  probability** (as opposed to joint probability).
-  Two events are  disjoint (or **mutually exclusive**) if they don't  share any outcomes. That is, their respective  sample space  subsets are  disjoint. 

# Information theory 
- Information theory attempts to determine the amount  of information an event has. 
- The higher the  probability of an event, the  less informative  the event is  considered. 
- Conversely, if the probability is lower, the event carries more informational content.  

# Differential calulus 
- In ML, we are often interested in how to approximate some target function by  adjusting the  parameters of ML algorithms. If we think  of the  ML algorithm itself as a mathematical function, we would like to know how that output of that function changes when we change  some of its parameters (weights). Thankfully, differential calculus deals with the  rate of change of a function with respect to  a variable  that the function depends on. 

# A short introduction to NNs
- A NN is a function that tries to approximate another target function, *g*. 
- The  goal is to find such parameters with the best  approximate, *g*. 
- This generic definition applies for both regression (approximating  the  exact value  of *g*), 
and classification (assigning  the input ot one of  multiple possible classes) tasks.

## Neurons 
- Now let's discuss the  basic building  blocks of a NN, namely neurons (or **units**).
- Units are mathematical functions that can be defined as follows: 
![equ](https://latex.codecogs.com/gif.latex?y&space;=&space;f(\sum^n_{i=1}x_iw_i&plus;b&space;))
- *y* is the  unit  output (single value)
- *f* is  the  non-linear differentiable activation function. The  activation function is the source  of  non-linearity in a NN - if the  NN was entirely linear,  it would only be able to approximate other linear  functions. 
- The argument of the  activation  function is the weigthed sum of  all the  unit  inputs and the  bias weight. 

## Layers as operations 
- The  next  level in the  NN organizational structure is the layers  of units, where we combine the  scalar outputs of multiple units in a single output vector. The  units in a layer are not connected to each other. This organizational structure makes sense for the following  reasons:
- We  can generalize multivariate regression to a layer, as opposed to only linear or  logistic regression for a  single unit. In other words, we can approximate multiple values with a  layer as  opposed to  a single value  with a unit. This happens in case  of classification output, where  each output unit represents  the  probability  the input belongs to a certain class. 
- A unit can convey  limited information because its output is  a scalar.  By combining the  unit outputs, instead of a single activation, we can now  consider the  vector in  its  entirety. In this way, we can convey a lot more  information, not only because  the  vector has multiple values, but  also becuase  the  relative  ratios  between  them carry additional meaning.  
- Becuase  the units in  a  layer have  no connections to  each other,  we  can parallelize  the  computation of their  outputs (thereby  increasing the computational speed). This ability is one of the major reasons for  the  success of DL in recent years. 
- In classical NNs (that is, NNs before DL, when they were just one of many ML algorithms), the primary type of layer is the  fully connected (FC) layer.  In this layer, every unit receives weighted input from all the compoments of the input vector, **x**. Let's assume that the  size of  the  input vector is *m* and that the  FC layer has *n* units and an activation function *f*, which is the same for all the units. Each of the  *n* units will have *m* weights: one for each of the *m* inputs. 
- We can represent the weights connecting the  input vector to the  units as *mxn* matrix **W**. In this case, the  output vector of the layer is the  result of matrix-vector multiplication. 
- However, we  can also combine multiple input samples in an input matrix (or **batch**),
which will be  passed through the  layer simultaneously. In this case, we have matrix-matrix multiplication  and the layer output is also a matrix. 
- Contemporary  DL is not limited to FC layers. We  have  amny  other types, such as convolutional, pooling, and so on. Some of the  layers have trainable weights (FC, convolutional), while  others don't (pooling). We  can also use the terms functions or operations interchangeably with the  layer. 
- For example, in  TensorFlow and PyTorch, the  FC layer we just described is a combination of two  sequential operations. First, we perform  the weighted sum of the weights and inputs and then  we  feed the result as an input to the  activation function operation. In practice, the basic building  block of a NN is not the  unit but  an operation that  takes one or more tensors as input and outputs one or more tensors

## NNs  
- In the  *Neurons* section, we  demonstrated that  a  neuron (also valid for a  layer) can only classify linearly separable classes. To overcome this limitation,  we have  to  combine  multiple layers  in a  NN. We'll define the NN as a directed  graph of operations ( or layers). The graph  nodes are operations, and the edges between them determine the data  flow. 
- If two operations are  connected, then the  output  tensor  of the first will serve as  input to the  second, which is  determined by  the  edge  direction. 
- A NN can have multiple  inputs and  outputs -  the input nodes only  have outgoing edges, while the outputs only have  incoming  edges. Based on this definition, we can identify two main types of NNs: 
- **Feed-forward**, which are represented by **acylic** graphs.
- **Recurrent(RNN)**, which are represented by  **cyclic** graphs. 

## Activation functions 
-  **Sigmoid**: Its output is bounded between 0 and 1  and  can be  interpreted  stochastically as the  probability of the neuron activating. Because of these  properties, the sigmoid was the  most popular  activation function for a  long time.  However, it also has some less desirable  properties, which led to its  decline in popularity. 
- **Hyerbolic tangent(tanh)**: The  principal difference with the sigmoid  is  that the tanh is in the (-1,1) range. 
- the **LU** (LU stands for  linear unit) family of functions. We'll  start with  the rectified linear  unit (**ReLU**), which was first successfully used in 2011.  As we can see, the  ReLU repeats its input when x>0 and stays 0 otherwise. This activation has several important  advantages  over sigmoid and tanh:
- Its derivative  helps prevent vanishing gradients. Strictly speaking, the derivative ReLU at value 0  is undefined, which makes the ReLU only semi-differentiable. But in practice, it works well enought.
- It's idempotent - if we pass a value through an aribitrary  number  of ReLU activations, it will not change. This is not  the  case  for  a sigmoid, where  the  value  is *squashed* on each pass. The  idempotence of ReLU makes it  theoretically possible  to create networks with more  layers  compared  to sigmoid.
- It creates sparse activations. It's  better to  achieve the  same  result  with a simpler data  representation than a complex one. 
- It's faster  to  compute  in  both the  forward and backward passes. 
- However, during training, the  network  weights can be updated in such a way that  some of the  ReLU  units in a  layer will always receive  inputs  smaller  than 0, which  in  turn will  cause them to  permanently output 0 as well.  This phenomenon  is known as **dying** ReLUs. To  solve  this, a number of ReLU modifications  have  been proposed. 
- **Leaky ReLU**: When the input  is  larger than 0, leaky ReLU repeats its input in the same  way as the regular  ReLU does. However, when x<0, the  leaky ReLU outpus *x* multiplied by  some constant instead of 0. 
- **Parametric ReLU(PReLU)** - this activation is the same  as the  leaky ReLU, but the parameter is  tunable  and  is  adjusted during training. 
- **Exponential linear units(ELU)**: When the  input is larger  than  0, ELU repeats its  input in the  same way as ReLU does.  However,  when x<0, the ELU output becomes the  exponential of x minus 1  multiplied by  alpha, where  alpha is a  tunable  parameter. 
- **softmax** : the  activation function of the  output layer  in classification problems. 
Let's assume that the  output  of the  final network  layer is a vector,  where  each of the  *n* components represents the probability that the input data  belongs to  one of *n* possible classes. Here, the softmax output for each of the vector components is as follows: 
![equ](https://latex.codecogs.com/gif.latex?f(z_i)&space;=&space;\frac{exp(z_i)}{\sum_{j=1}^n&space;exp(z_j)&space;})
- The donominator  in  this formula acts as a normalizer. The softmax output has some important properties:
- Every value f(z_i) is in the [0,1] range
- The total sum of values of **z** is equal to 1. 
- an added bonus is that the function is differentiable.
- In other words, we can interpret the softmax output as a probability distribution of a  discrete random variable.  
- However,  it also has  one more  subtle  property. Before we normalize the  data, we transform each vector component exponentially. In effect, the softmax increases the probability of the  higher scores compared to lower ones. 

# The  universla Approximation theorem
- The  universal approximation theorem was first proved in 1989 for a NN with sigmoid activation
functions and then in 1991  for NNs with arbitrary non-linear activation functions. It states that any contimuous function on compact subsets  of R_n can be approximated to an arbitrary degree of accuracy by a feedforward NN with  at least  one hidden layer with a finite  number of units and a non-linear activation. Although a NN with a single hidden layer won't perform well on many tasks, the theorem still tells us that there are no theoretical insurmountable limitations in terms of NNs. 

#  Training NNs
- In this  section,  we'll define training a NN as the process of adjusting  its parameters in a way that minimizes the cost function. The cost  function is some  performance measurement over a training  set that consists of multiple samples, represented as vectors. Each vector has an associated label (supervised  learning). Most commonly, the  cost function measures the difference between the  network output and the label. 

##  Gradient descent
- For  the  purposes of this section, we'll use a NN with a  single regression output and mean  square  error  (MSE) cost function.
- First,  gradient  descent  computes the  derivative (gradient) of cost function with respect to all  the network weights.  The  gradient  gives us  an indication of how cost function changes  with respect  to every weight. 
- Then, the  algorithm uses  this information to update the  weights in a way that  will minimize  cost function in future  occurrences of teh same input/target paris. The goal is to  gradually reach the global minimum of the  cost function.
- Let's  go  over  the  step-by-step execution  of gradient descent:
1. Initialize the  network weights with random values.
2. Repeat until the cost function falls below a certain threshold:
- Forward pass: compute the cost function for  all  the samples of the  training set using the  preceding formula.
- Backward pass: compute the derivative  of the  cost function with repect to  all teh network  weights using the chain rule 
3. Use these drivatives to  update each  of the network weights 
- Gradient descent updates  the  weights by accumulating the erro across all teh training samples. In practice, we  would use two of its  modifications:
- **Stochastic(or online) gradient descent (SGD)** updates  the weights after  every training  sample.
- **Mini-batch gradient descent** accumulates the  error for every *n* samples (one mini-batch) and performs one weight update. 

## cost functions 
- Beside MSE, there are also a few other loss functions  that are commonly used in regression problems. 
- **Mean absolute error(MAE)** is the mean of the  absolute  differences (not squared) between the network  output and the  target. One  advantage  of MAE  over MSE is that it  deals with outlier samples better. With MSE, if the difference of a  sample is  >1,  it increases exponentially. We'll get an outsized weight  of this sample compared to the  others, which may skew the results.  With MAE, the difference  is not exponential and this issue is  less  pronounced.  
- On the other  hand, the MAE gradient will have  the same value  until we reach the  minimum, where  it will  become 0 immediately. This makes it harder for the algorith, to anticipate how close the cost function minimum is. Compare this to  MSE, where  the slope gradually decreases as we get close to the  cost  minimum. This  makes MSE easier to optimize. In conclusion, unless  the  training data  is corrupted with outliers, it  is  usually recommended to use MSE over  MAE. 
- **cross-entropy** loss: This loss is  usually applied over the output of a  softmax  function. The  two  work  very well together. First, the softmax converts the network output into a  probability  distribution. Then, cross-entropy  measures the difference between the  network  output (Q)  and the true distribution (P), which is provided as a training label.  
- Another nice property is that the derivative of H(P, Q_softmax) is quite  straightforward.

## Backpropagation
- In this section, we'll discuss how to  update the network weights in order to minimize  the cost function. As we  demonstrated in the *Gradient descent* section, this means finding  the  derivative of the  cost function with respect to  each network weight. We already took a step in this direction with the help of the chain rule: 
- In  this section, we'll push the  envelope further and we'll learn how to  derive the NN function itself for all the network weights.  We'll do this by propagating the  error gradient backward through the network. 

## Weight Initialization
- One key component of training  deep networks is the random weight initialization. 
- This matters because some activation functions, such as sigmoid and ReLU, produce meaningful outputs and gradients if their inputs are within a certain range.
- A famous example is the vanishing gradient  problem. 
- One way to solve  this problem is to use *LU* activations. But  even so, it still makes  sense to use  better  weight initialization since it can speed up the training process. 

##  SGD improvements  
- We'll start with **momentum**, which extends vanilla SGD  by adjusting the current weight update with the values of  previous  weight updates. That  is, if  the  weight  update at step *t-1* was big,  it  will also  increase the  weight update of  step  *t*. We can explain momentum with  an  analogy. Think of  the  loss function surface as the  surface of  a hill.HOw, imagine that we  are  holding a ball at  the top of  the  hill(maximum). If we  drop the  ball,  thanks to  the  Earth's  gravity, it  will  start rolling  toward  the  bottom of the  hill (minimum). The  more  distance it travels, the  more its speed will  increase.  In other  words, it  will gain momentum (hence  the  name  of the  optimization). 
-  Let's  assume that we are  at step  *t*  of the training process:
1.  First,  we'll calculate  the current weight update value v_t by also including  the velocity  of the previous  update v_(t-1).
2.  Then, we  perform the actual weight  update
- An improvement over  the  basic momentum is the  **Nesterov momentum**. It  relies on the  observation that  the momentum from step *t-1* may not reflect  the conditions  at step  *t*. For example, let's  say that the gradient at  *t-1* is  steep and therefore the  momentum  is  high.  However, after the  *t-1* weight update, we  actually reach the  cost function  minimum and require only a minor weight update  at *t*.  Despite  that, we'll still get the  large  momentum  from  *t-1*,  which may lead the  adjusted weight  to  jump over the  minimum. Nesterov momentum  proposes a change  in  the  way we compute the  velocity of the weight update. We'll calculate v_t based  on  the  gradeint of  the cost function that's  computed  by  the potential  future  value  of the weight theta_j. If the  momentum at *t-1* is  incorrect with respect to *t*, the modified gradient will compensate for  this  error  in the  same update step. 
- Next, let's discuss the  Adam adaptive learning rate algorithm. It calculates  individual and adaptive learning rates for every  weight based  on previous weight updates. 
- First, we need to compute the first moment (or mean) and the second moment  (or variance) of the gradient. Here, beta_1 and beta_2 are hyperparameters with default  values of 0.9 and 0.999, respectively. m_t and v_t act as moving-average  values of the gradient, some what similar to momentum. They  are initialized with 0 during  the first  iteration.
- Since  m_t and v_t  start  as  0, they will have a bias toward 0 in the initial phase of the training. 
- Finally, we need to perfrom the weight  update  using  the following formula.

```python
import numpy  as np

def sigmoid(inputs):
  sigmoid_scores = [1/float(1+np.exp(-x)) for x in inputs]
  return sigmoid_scores
```

