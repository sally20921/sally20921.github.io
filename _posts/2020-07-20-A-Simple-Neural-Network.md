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
