---
layout: post
title: A Simple Neural Network
categories: PyTorch
tags: [PyTorch]
excerpt: PyTorch Deep Learning Hands-On
---

# Dataset

- The data that you get from the  wild is never going to be clean, 
and you'll have to process it before throwing it at your network. 
Your network will be  able to  solve problems easily by finding the pattern 
if your data is clean and properly formatted. 

# Hyperparameters 

- We need to define the input  and output sizes on top of the  program. 
- Epoch is the  counter value for iterating  over the network. Normally, for each 
epoch, you run over the  whole dataset and then repeat that for each epoch. 
- The learning rate decides how fast we want our network to take feedback from the error 
on each iteration. A learning  rate  of zero means zero  information passing  to the network. 
A small learning rate  helps the  network  to take small steps climbing down the mountain, 
while  a large  learning rate  helps the  network  to take big steps. More technically, 
at each iteration, the  network makes a linear approximation over the approximation, and 
the  learning rate controls this approximation.  

# Autograd
- We are starting  with the most  important module in PyTorch, which is autograd, the  backbone of 
the PyTorch framework. It helps the user  to do automatic differentiation. 
- In forward-mode automatic differentiation, we find the  derivative of the  outer function first
and go  inside recursively until we explore all the  child nodes. 
- Reverse-mode automatic differentiation is the  exact  opposite and is being  used by the deep
learning community and frameworks. 
- Central to all neural networks in PyTorch is the autograd package. When the program executes, 
autograd writes each operation tot he tape-like data  structure and stores it  in memory. 
This helps PyTorch to  be dynamic. 
 
## Autograd attributes of a tensor 
 - Tensors, when becoming part of a graph, need to store information that  is needed for autograd
 for automatic differentiation. The tensors acts as a node in the computational graph and connects to 
 other nodes through functional module instances. Tensor instances mainly have  three attributes  
 for supporting autograd: `.grad`, `.data`, `grad_fn()`
 - Watch out for  letter  cases:  Function represents the  PyTorch `Function` module, while function 
 represents  Python functions.  
 - The `.grad` attribute stores the gradient at any point in time, and all the  backward calls 
 accumulate the current gradient  to the  `.grad` attribute. The `.data` attribute gives access 
 to the bare tensor object that has the  data in it. 
 - When we  create  the tensor, we  can specify whether we need that tensor to carry the gradient or not.
 Since we are  not changing  the  input in iterations, we don't need the input  tensor to have the  gradient computed.
 So, while wrapping the input tensor, we pass `False` as the `required_grad`  parameter and for  weights, 
 we pass `True`. 
- Tensors and `Function` instances  are interconected when they are in a graph, and together, 
they make the  acyclic computational graph.  Each tensor other than the tensor explicitly made by  the user
is connected to  a function. 

# The  Model Explanation
-  It  starts with looping through batches for each epoch and processing each batch
with  the model we are building now. 

## Building the  Graph
- The first  layer consists of a matrix multiplication and addition between the batched input  matrix,
weights and biases. 
- The second layer follows the same structure: matrix multiplication, bias addition, and sigmoid. 

## Softmax
- Normally, classification problems are  handled by the softmax layer and cross-entropy loss, 
which increases the  probability of one class over  another.  Since the probability of all the classes
should add up to one, increasing the probability  of one class reduces the probability of other classes,
which is a nice feature to  have.  

## Finding Error 

- We are  using the most  basic regression loss called the mean squared loss (MSE). 
Initially, we  find the difference between the prediction and output of each  element in the batch, 
then we  square  all thd differences and sum all of them together to get  a single value. 

## Backpropagation
- The powerful feature of the modern day framework, automatic differentiation, made backpropagation
a one-liner. The last node in our  graph was the loss result we just found. 
We need to take this loss and move back to  each neuron to find the contribution of each neuron. 
Backpropagation achieves this by finding the direction each parameter should move in, 
so that  the overall movement of the loss value climbs down the mountain. 
- Backpropagation helps us by taking the derivative of each neuron, with respect to the final loss and 
telling us the direction we have to  move in. 
- In PyTorch, all you have to  do is  call `backward` on the last  node, which will backpropagate
and update the '`grad` attributes with gradients. 
- We need to  update the weight of the  neuron based on this error factor. The process of updating  the 
error found is called optimization, and there  are  different strategies for optimization. 
- PyTorch has given us another module called `optim` for different optimization algorithm implementations.
- We  used the basic and most  popular optimization algorithm in called Stochastic gradient descent (SGD).
- PyTorch gives us more flexibility by separating backpropagation and optimization as different steps. 
- Backpropagation accumulateds the gradients in the '`.grad` attribute.  

## Parameter Update (Optimization) 
- The  parameter  update or  optimization step takes the gradient generated by backpropagation and 
updates the weights using some strategies to  reduce the contribution facotr from the parameter by a small step.
This step  is then repeated until we find a good set of parameters. 
- All the parameter tensors have the `.data` attribute and `.grad` attribute, 
which have tensor values and gradients respectively. Obviously, what  we need to do is take the gradient 
and subtract that from the data.  
- However,  it turns out that reducing the whole gradient from the parameter is not a  good idea.
The  amount of parameter updates decides how much the network learns from each example (each iteration),
and we don't  want our network to learn false information  if a particular  example we gave was an outlier.
- We want our network to be generalized,  learning a bit from all the examples and eventually becoming 
good at  generalizing any new examples. So, instead of reducing the whole gradient from the data, we use 
the learning rate  to decide  how much  the gradient should be used in a particular state. 

# The PyTorch Way 
- PyTorch gives access to almost all the functionality required for a deep learning project inbuilt. PyTorch is helpful for people who need to know the  low-level operations, but at the  same time, PyTorch  comes with  high-level APIs through  the `torch.nn` module. So, if the user doesn't want to  know what  is happening inside the black box, but  just needs to  build the model, PyTorch allows them to do so. 

## High-Level APIs
All the modules in PyTorch that  are  required to build a neural network are Python class instances that have the forward and backward functions. WHen you start executing your neural network, under the hood, you are  executing the forward function, which in turn  adds the  operations onto the tape. 

`net  =  FizBuzNet(input_size, hidden_size, output_size)`
`
class FizBuzNet(nn.Module):
 """
 2 layer network for predicting fiz or buz
 param: input_size->int
 param: output_size->int
 """
 def __init__(self, input_size, hidden_size, output_size):
  super(FizBuzNet, self-).__init__()
  self.hidden = nn.Linear(input_size, hidden_size)
  self.out = nn.Linear(hidden_size, output_size)
 
 def forward(self, batch):
  hidden = self.hidden(batch)
  activated = torch.sigmoid(hidden)
  out  = self.out(activated)
  return out 
`
- We have  defined the structure of FizBuzNet and wrapped it insdie a Python class inherited from `torch.nn.Module`. The `nn` module in PyTorch is the high-level API for  accessing all the popular layers in the deep learning world. 

### nn.Module
-  The high-level API that allows users to write  other high-level APIs is `nn.Module`.
When you initialize the `class` object, __init__() will be called, which in turn initializes the layers and returns the  object. `nn.Module` implements two major functions,
__call__ and backward(), and the user needs to override forward and __init__().
- Once the  layer-initialized object is returned, input data  can be  passed to the model by calling the model object itself. Usually, Python objects are not callable.  However,  `nn.Module` implements  the magic function __call__(), which in turn calls the forward function the user has defined. 
- The user has the  option to build the layers in the  __init__() definition, which takes care of the weight and bias creation we  have done in the  novice model by hand. In our following `FizBuzNet`, lines in __init__() create the linear layers. The linear layer is also called the fully connected or dense layer, which does the matrix multiplication between the weights and the input, and bias addition, internally. 

- Let's look at the  source code of `nn.Linear` from PyTorch, which should give us enough  understanding about how `nn.Module`works and how we can extend `nn.Module`  to  create  another custom module:
`
class Linear(torch.nn.Module):
 def __init__(self, in_features, out_features, bias):
  super(Linear, self).__init__()
  self.in_features = in_features
  self.out_features = out_features 
  self.weight =  torch.nn.Parameter(torch.Tensor(out_features, in_features))
  self.bias = torch.nn.Parameter(torch.Tensor(out_features))
 def forward(self, input):
  return  input.matmul(self.weight.t())+self.bias
`

- The `Parameter` class adds the weights and biases to the list of module parameters and 
will be  available when you call `model.parameters()`. The initializer saves all the arguments as object attributes. 

- There  are more  important functionalities of `nn.module` that we  will be  using in future chapters. 

`
apply()
`
- This is a function that helps us with  applying a custom function  to  all the  parameters of the model. It  is often used to make custom weignt  initialization, but generally, `model_name.apply(custom_function)`executes `custom_function` on each  model parameter.

`
cuda() and cpu()
`
`model.cpu()` converts all the parameters to CPU tensors, which is handy when you have  more  than  a few parameters  in your model and converting each of them separately is cumbersome. 
`
net.cpu() #convert all  parameters  to CPU tensors
net.cuda() #convert all  parameters to GPU tensors
`
- While  creating the  tensor itself, PyTorch allows you to  do this by passing  the tensro  type as an argument  to the  factory function. The ideal way to  make this decision is to test whether  CUDA is available or not with  PyTorch's inbuilt `cuda.is_available()` function and create tensors accordingly:
`
if torch.cuda.is_available():
 xtype =  torch.cuda.FloatTensor
 ytype =  torch.cuda.LongTensor
else: 
 xtype  =  torch.FloatTensor
 ytype  = torch.LongTensor 
 
x = torch.from_numpy(trX).type(xtype)
y = torch.from_numpy(trY).type(ytype)
`

`
train() and eval() 
`
These  functions tell PyTorch that the  model is running in training mode or  evaluation mode. This has some  effect only if you want to turn off  or on the modules such as `Dropout` or  `BatchNorm`

`
parameters()
`
- A call on `parameters()` returns all the  model parameters, which are useful in the  case of optimizers or if you want to  do experiments with parameters. 

`
net =  FizBUzNet(input_size, hidden_size, output_size)
#building graph
#backpropagation
#zeroing the  gradients

with torch.no_grad():
 for p in net.parameters():
  p -= p.grad*lr
`
`
zero_grad()
`
- This is a convenience function to make the  gradients zero. A single call on the model object  wil lzero the gradients of all the parameters. 

`
Other layers
`
- An important  layer that  comes with `nn.Module` is the sequential container, which provides an easy API to make a model object without having the user write the class structure  if the  structure of the model is sequential and straightforward. 

`
import torch.nn as nn

net = nn.Sequential(
      nn.Linear(i, h),
      nn.Sigmoid(),
      nn.Linear(h, o),
      nn.Sigmoid())
`

## The Functional Module
- The `nn.functional` module comes with operations we require  to connect the network nodes together. `F.linear` allows us to pass the weights and inuts and returns the  same value as if it were  a normal `matmul`. 

### Sigmoid Activation
-  Activation functions create non-linearity between the  layers of the neural network. This is essential because without non-linearity, the layers are just multiplying the input values with weights. Sigmoid activation is probably the most traditional activation function. It squashes the input to the range of [0,1].
- Usually, the output returned from the forward functinos are logits that represent probability distribution,  where the  correct class gets high value. 

## The Loss Function  
-  We call the  loss functino to find the error. PyTorch comes with all the popular loss functions inbuilt  in the  `nn` module. Loss functions accept the logits and the actual value, and apply the loss functionality on them to find the loss score. 

`
loss = nn.MSELoss()
output  = loss(hyp, y_)
output.backward()
`
- The node returned by `loss(hyp, y_)` will then be the leaf node  on which we  can call backward to  find the gradients.

## Optimizers
-  There are  different  strategies for weight updates. The  one  we  used is  the most basic gradient descent  method. 
- The  `optim` package is the  alternative  that PyTorch  provides to handle the weight updates efficiently. Additional  to that, the user can call `zero_grad` on the optimizer object once  it is  initialized with model parameters. 


`
optimizer = optim.SGD(net.parameters(), lr=lr)
`

The optimizer object now has the model parameters. The `optim` package  provides a convenient function called `step()`, which does the parameter update based on the  strategy defined by the optimizer: 

`python
for epoch in range(epochs):
 for batch in range(no_of_batches):
   start  = batch * batches
   end = start+batches
   x_ = x[start:end]
   y_ = y[start:end]
   hyp = net(x_)
   loss = loss_fn(hyp, y_)
   optimizer.zero_grad()
   loss.backward()
   optimizer.step() #update parameters
`
- after the update, the user is responsible for zeroing the gradients. 
