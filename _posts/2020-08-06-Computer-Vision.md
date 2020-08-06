---
layout: post
title: Computer Vision
categories: Python  
tags: [Advanced Deep Learning with Python]
excerpt: Advanced Deep Learning with Python
---
# Understanding Convolutional Networks 
## Understanding CNNs 
- Depending on the  number of input dimensions, we have  1D, 2D or 3D convolutions.
- In CNNs, the function *f* is the input  of the convolution operation (also referred to as the
convolutional layer) A time series input is a 1D vector, an image input is a 2D matrix, and a 3D point cloud 
is a 3D tensor. The function *g*, on the other hand, is called a kernel (or filter). It has the same
number of dimensions as the  input  data and it is defined by a set of learnable weights. For example,
a filter of size  *n* for a 2D convolution is an *nxn* matrix. The convolution works as follows:
1. We slide the filter along all of the dimensions of the input tensor.
2. At every input position, we multiply each filter weight by its corresponding input tensor cell
at the given location. The input cells, which contribute to a single output cell, are called
**receptive fields**. We sum all ofthese values to produce the value of a single output cell.
- Unlike fully-connected layers, where each output units gathers information from all of the inputs, 
the activation of a convolution output cell is determined by the inputs in its receptive field.
This principle works best for hierarchically structured data such as images. For example, neighboring
pixels form meaningful shapes and objects, but a pixel at one end of the image is unlikely
to have a relationship with a pixel at another end. 
- The  filter  highlights some particular features in the receptive field. The output of the operation
is a tensor  (known as a feature map), which marks the locations where the feature is detected.
Since we apply the  same filter throughout the input tensor, the convolution is translation invariant.
That is, it can detect the same features, regardless of their location on the image. However, the convolution
is neither rotation invariant  (it is not  guaranteed to detect a feature if it's rotated), nor scale
invariant (it is not guaranteed to detect the same artifact in different scales). 

- The CNN convolution can have multiple filters, highlighting different features, which results
in multiple output feature maps (one for each  filter). It can also gather  input from multiple feature
maps, for example, the output of a previous convolution. The combination of feature maps (input or  output)
is called  a volume. In  this context, we can also refer to the feature maps as slices. 
Although the two terms refer to  the same thing, we  can think of the  slice  as part  of the volume,
where the  feature  map highlights its role as, well, a feature  map.
- As we mentioned earlier,  each volume (as well as the  filter) is represented by a tensor. For example, 
a red, green, and blue (RGB) image  is represented by a 3D tensor  of three 2D slices (one slice 
per  color channel). But in the context of CNNs, we add one more dimension for the  sample index
in the mini-batch. Here, a 1D  convolution would have 3D input and output tensors. Their axes 
can be  either NCW or  NWC order, where N is the index of the sample in the  mini-batch,
C is the  index of the depth slice  in the volume, and W is the vector size of each sample. 
- In the  same way, a 2D convolution will be represented by NCHW or NHWC tensors, where H and W  are  
the  height and width of the slices. 

## Introducing transfer learning 
- Let's say that  we want to train a model on a task that doesn't have readily available labeled training data
like ImageNet does. Labeling  training samples could be expensive, time-consuming, and error-prone.
-TL is the process of applying an existing trained ML model to a  new, but related problem. 
For  example, we can take a  network trained on ImageNet and repurpose it to classify grocery store items.
Alternatively, we could use a driving  simulator ame to  train a neural network to drive a 
simulated  car and then use the network  to drive a real car. TL is a  general ML concept  that's applicable
to all ML algorithms, but in this context, we'll talk about CNNs. Here's how it works.
- We start with  an existing pretrained network. The most common scenario is to take a pretrained network from ImageNet, 
but it could be any dataset.  TensorFlow and PyTorch both have popular ImageNet pretrained neural architectures 
that we can use. Alternatively, we can train our own network with a dataset of our choice.
- The  fully-connected layers at the end of  a CNN act  as translators between the  network's language  (the abstract
feature representations learned during training) and our language, which is the class of each sample.
You can think of TL as a translation into another language. We start  with the network's features, which
is the  output of the  last convolutional or pooling layer. Then we translate them into a different
set of classes of the  new task. We  can do this by removing the last fully-connected layer of an existing 
pretrained network and replacing it with another layer, which represents  the classes of the new problem. 
- However, we cannot do this mechanically and expect the  new network to work because  we still have  to 
train the  new layer with data  related to the  new task. Here, we have  two options:
- Use the original part of the network  as a feature extractor and only train the new layers:
In this scenario, we  feed the network a training  batch  of the  new data and propagate it 
forward to see the network's output. But in the backward pass, we lock the weights of the original network
and only update the weights of the new layers. This is recommended way to do things when we have
limited training  data  for the  new problem. By locking most of the  network weights, we  prevent 
overfitting on the  new data.
- Fine-tune the whole network: In this scenario, we'll train the whole network adn not just the newly
added layers at the end. IT is possible to update all of the network weights, but we can also
lock some of the  weights in the first layers. The idea here is taht the  initial layers detect
general features-not related to a specific task- and it  makes sense to reuse them. On the other hand,
the deeper  layers may detect task-specific features and it would be better to update them.
We can use this method when we have more training data  and don't need to worry about overfitting. 

###  Implementing transfer learning with PyTorch





























