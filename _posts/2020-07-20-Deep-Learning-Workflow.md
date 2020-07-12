---
layout: post
title: Deep Learning Workflow
categories: PyTorch
tags: [PyTorch]
excerpt: PyTorch Deep Learning Hands-On
---

# Ideation and Planning
 
# Design and Experimentation
## The Dataset and DataLoader Classes 
- A `dataset` class in PyTorch is a  high-level abstraction that handles everything required by the data loaders.
The custom `dataset` class defined  by the user needs to override the `__len__` function
and `__getitem__` function of the parent class. 
- The implementation of data  generation is inside the `__getitem__` function, where the class 
instance generates the data based on  the index passed by 'DataLoader`. 
- The `DataLoader` class accepts a dataset class that is inherited from `torch.utils.dtat.Dataset`.
`DataLoader` accepts `dataset` and does non-trivial operations such as  mini-batching,
multithreading, shuffling, and more, to fetch the  data from the dataset.
It accepts a `dataset` instance  from the  user and uses  the sampler strategy to sample
data as mini-batches. 
- PyTorch came up with  utility packages for all three types of datasets with  
pretrained models, preprocessed datasets, and utility functions to work with these
datasets. 

## Utility Packages
- The community made three different utility  packages for vision(`torchvision`), 
text(`torchtext`), and audio(`torchaudio`). 

```python
pip install torchvision
```

- torchvision is the most used utility package from PyTorch, and consists of datasets,
pretrained models, and transformation scripts prebuilt.  
torchvision has powerful APIs that  enable the user  to do the preprocessing  of data
easily, and it is especially helpful in the  prototying stage where the  dataset might not be
available. 
- The functionality  of torchvision has been divided into  three: preloaded, downloadable 
datasets for almost all sorts of computer vision problems; pretrained models for
popular computer vision architectures; and common transformation functions used in computer
vision problems. 
- torchvision uses Pillow (`PIL`) as the  default backend for loading the image. All the 
data provided by torchvision is inherited from the torch.utils.data.Dataset  class and 
hence `__len__` and `__getitem__` have been implemented for each of those. 
Both of those magic functions enable  all these datasets to be compatible with
DataLoader.
- Once the image  dataset is stored in the disk with the proper directory hierarchy,
`torchvision.ImageFolder` can assume the needed information from the directory 
structure itself, just like how we do it with  our custom script, and make loading
much easier  for the user. 
- `torchvision.models` module is packed with several popular  models that can be 
used out of the box. Setting `requires_grad` to `False` masks that  particular parameter 
from `autograd` and keeps the weights frozen.
- `torchvision.transforms` module is another major player, which has utility modules for
data preprocessing and data  augmentation. The `Compose` utility groups several 
transformations together to  make a single pipeline object. 

```python
pip install torchtext
```

- torchtext keeps its own API structure, which is entirely different from the torchvision
and torchaudio. torchtext  is a very powerful library that can do the required 
preprocessing tasks for a natural language preprocessing (NLP) dataset. 
But unlike torchvision, it doesn't have  pretrained networks available for download.

# Model Implementation
## Bottleneck and profiling  
## Training and validation
### Ignite
- Ignite is a  neural network training tool that abstracts away certain boilerplate
code in favor of clean and elegant  code.  Ignite's core is the `Engine` module.
This module is immensely powerful because: 1) It runs the model based on 
default/custom trainer or evaluator. 2) It  can accept handlers and metrics, 
and act  on them. 3) It can make triggers and execute callbacks. 

#### Engine 
`Engine`  accepts a trainer function that is essentially the typical loop
used to train a neural network algorithm. It includes looping over the epoch,
looping over the batches, zeroing  the existing gradient value, 
calling the model with batch, calculating  the loss, and updating  the gradient.

```python
for epoch in range(epochs):
 for x_batch, y_batch in dataset:
   optimizer.zero_grad()
   hyp = net(x_batch)
   loss = loss_fn(hyp, y_batch)
   loss.backward()
   optimizer.step()
```
- `Engine` can help you avoid the first two loops and will do it for you if you
define the function that needs to  do the rest of the code.

```python
def training_loop(trainer, batch)
 x_batch, y_batch = process_batch(batch)
 optimizer.zero_grad()
 hyp = net(x_batch)
 loss = loss_fn(hyp, y_batch)
 loss.backward()
 optimizer.step()
 
trainer = Engine(training_loop)
```

- Ignite has come up with some functions that are commonly used, such as 
supervised training  or supervised evaluation, and also gives the flexibility
to the user to define their own training  functions for instances like training
GANs, reinforcement learning (RL) algorithms, and so on. 
